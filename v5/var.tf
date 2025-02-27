variable "user_names" {
  type = list(string)
  default = ["Neo", "Trinity", "Morpheus"]
}

variable "ai" {
  type = map(string)
  default = {
    Openai = "USA"
    Ted = "Japan"
    Deepseek = "China"
  }
}