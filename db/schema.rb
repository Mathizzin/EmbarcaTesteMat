# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_240_117_015_246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cidades', force: :cascade do |t|
    t.string 'nome'
    t.bigint 'estado_id'
    t.float 'populacao'
    t.index ['estado_id'], name: 'index_cidades_on_estado_id'
  end

  create_table 'estados', force: :cascade do |t|
    t.string 'nome'
    t.string 'sigla'
    t.string 'regiao'
  end

  add_foreign_key 'cidades', 'estados'
end
