# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

require_relative 'seedusers'
seedusers()  # also delete_all companies & projects in here

require_relative 'seedattributes'
seedattributes()

require_relative 'seedfeedbacks'
seedfeedbacks()

require_relative 'seedcompanies'
seedcompanies()

require_relative 'seedprojects'
seedprojects()

require_relative 'seedpattributes'
seedpattributes()

require_relative 'seedpfeedbacks'
seedpfeedbacks()

require_relative 'seedideas'
seedideas()

require_relative 'seedvotes'
seedvotes()

require_relative 'seedjobs'
seedjobs()

require_relative 'seedthanks'
seedthanks()