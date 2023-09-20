terraform {
  cloud {
    organization = "kubelancer-org"

    workspaces {
      name = "gitHub-action-demo"
    }
  }
}