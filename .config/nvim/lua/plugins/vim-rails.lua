vim.g.rails_projections = {
  ["spec/factories/*.rb"] = {
    command = "factory",
    affinity = "collection",
    alternate = "app/models/{singular}.rb",
    related = "app/models/{singular}.rb",
    test = "spec/models/{singular}_test.rb",
    template = "FactoryBot.define do\n  factory :{singular} do\n  end\nend",
    keywords = "factory sequence association trait transient"
  },
  ["app/models/*.rb"] = {
    alternate = "spec/factories/{plural}.rb",
    related = "spec/factories/{plural}.rb",
  }
}
