class BanReservedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @words = YAML.safe_load(File.read(File.join(Rails.root, 'config/ban.yml')))['ban']

    return unless (@words + @words.map(&:pluralize)).include?(value)

    record.errors[attribute] <<
      'IDが不正です:申し訳ありませんがそのIDはご利用になれません。他のIDをお試しください。'
  end
end