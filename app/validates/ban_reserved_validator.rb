class BanReservedValidator < ActiveModel::EachValidator
# https://bitarts.jp/blog/archives/004363.html

  def validate_each(record, attribute, value)
    @words = YAML.load(File.read(File.join(Rails.root, "config/ban.yml")))['ban']
    if (@words + @words.map {|w| w.pluralize}).include?(value)
      record.errors[attribute] <<
        "IDが不正です:申し訳ありませんがそのIDはご利用になれません。他のIDをお試しください。"
    end
  end
end