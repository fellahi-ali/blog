module Yegor
  module Filters
    def keywords(page)
      list = page['keywords']
      if list.nil?
        list = []
      end
      if list.length > 20
        fail "too many keywords in [#{page['title']}]"
      end
      if list.length > 1 && list.length < 5
        fail "too few keywords in [#{page['title']}]: #{list.length}"
      end
      list.compact.sort.uniq
    end

    def description(page)
      text = page['description']
      if text.nil?
        text = ''
      end
      if text.length < 100
        fail "too short description in [#{page['title']}]"
      end
      if text.length > 200
        fail "too long description in [#{page['title']}]"
      end
      text
    end
  end
end

Liquid::Template.register_filter(Yegor::Filters)
