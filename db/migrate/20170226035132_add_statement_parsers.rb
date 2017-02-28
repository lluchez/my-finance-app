class AddStatementParsers < ActiveRecord::Migration[5.0]
  def up
    # Adding new table: statement_parsers
    create_table :statement_parsers do |t|
      t.string :name, :null => false
      t.text   :description
      t.string :type

      # PlainText Parsers field
      t.string :plain_text_regex
      t.string :plain_text_date_format

      t.timestamps
    end
    add_index :statement_parsers, :name, unique: true

    # Editing the bank_accounts table (adding foreign key)
    add_column :bank_accounts, :statement_parser_id, :integer
    add_foreign_key :bank_accounts, :statement_parsers

    # Adding default parsers
    StatementParsers::PlainTextParser.create(
      :name => "Discover Credit Card Parser",
      :plain_text_regex => "(?<date>[A-Z][a-z]+ \d+)(?:\s+[A-Z][a-z]+\s+\d+\s+)(?<description>.*?)(?:\s+\$)?\s+(?<amount>\-?\d+(?:\.\d+)?)",
      :plain_text_date_format => "%b %-d")
    StatementParsers::PlainTextParser.create(
      :name => "Chase Credit Card Parser",
      :plain_text_regex => "(?<date>\d+\/\d+)?\s+(?<description>.*?)(?:\s+\$)?\s+(?<amount>\-?\d+(?:\.\d+)?)",
      :plain_text_date_format => "%m/%-d")
  end

  def down
    remove_foreign_key :bank_accounts, :statement_parsers
    remove_column :bank_accounts, :statement_parser_id
    drop_table :statement_parsers
  end
end
