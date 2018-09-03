local util = require "lib/util"
local Element = {}

local methods = {}
local metatable = {}

function metatable.__index(element, key)
  return methods[key]
end

function methods:find_child_element(strategy, finder)
  local response = self.bridge:find_child_element(self.session_id, self.element_id, strategy, finder)
  local id = response.json()["value"]
  return Element.new(self, util.element_id_from(id))
end

function methods:find_child_elements(strategy, finder)
  local response = self.bridge:find_child_elements(self.session_id, self.element_id, strategy, finder)
  local elements = {}
  for i, id in ipairs(response.json()["value"]) do
    elements[i] = Element.new(self, util.element_id_from(id))
  end
  return elements
end

function methods:is_selected()
  local response = self.bridge:is_element_selected(self.session_id, self.element_id)
  return response.json()["value"]
end

function methods:get_attribute(name)
  local response = self.bridge:get_element_attribute(self.session_id, self.element_id, name)
  return response.json()["value"]
end

function methods:get_property(name)
  local response = self.bridge:get_element_property(self.session_id, self.element_id, name)
  return response.json()["value"]
end

function methods:get_css_value(property_name)
  local response = self.bridge:get_element_css_value(self.session_id, self.element_id, property_name)
  return response.json()["value"]
end

function methods:get_text()
  local response = self.bridge:get_element_text(self.session_id, self.element_id)
  return response.json()["value"]
end

function methods:get_tag_name()
  local response = self.bridge:get_element_tag_name(self.session_id, self.element_id)
  return response.json()["value"]
end

function methods:get_rect()
  local response = self.bridge:get_element_rect(self.session_id, self.element_id)
  return response.json()["value"]
end

function methods:is_enabled()
  local response = self.bridge:is_element_enabled(self.session_id, self.element_id)
  return response.json()["value"]
end

function methods:click()
  local response = self.bridge:element_click(self.session_id, self.element_id)
  return response
end

function methods:clear()
  local response = self.bridge:element_clear(self.session_id, self.element_id)
  return response
end

function methods:send_keys(keys)
  local response = self.bridge:element_send_keys(self.session_id, self.element_id, keys)
  return response
end

function methods:screenshot(filename)
  local response = self.bridge:take_element_screenshot(self.session_id, self.element_id)
  return response.json()["value"]
end


function Element.new(session, element_id)
  local element = {
    bridge = session.bridge,
    session_id = session.session_id,
    element_id = element_id
  }
  setmetatable(element, metatable)
  return element
end

return Element