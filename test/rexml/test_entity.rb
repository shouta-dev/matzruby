require "test/unit/testcase"

require 'rexml/document'

class EntityTester < Test::Unit::TestCase
  def test_entity_string_limit
    template = '<!DOCTYPE bomb [ <!ENTITY a "^" > ]> <bomb>$</bomb>'
    len      = 5120 # 5k per entity
    template.sub!(/\^/, "B" * len)

    # 10k is OK
    entities = '&a;' * 2 # 5k entity * 2 = 10k
    xmldoc = REXML::Document.new(template.sub(/\$/, entities))
    assert_equal(len * 2, xmldoc.root.text.bytesize)

    # above 10k explodes
    entities = '&a;' * 3 # 5k entity * 2 = 15k
    xmldoc = REXML::Document.new(template.sub(/\$/, entities))
    assert_raises(RuntimeError) do
      xmldoc.root.text
    end
  end
end
