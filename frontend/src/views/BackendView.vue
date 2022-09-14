<template>
  <div class="backend">
    <h1>This message is from the backend!</h1>
    <div class="response">
      {{ msg.message }}
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "PingItem",
  data() {
    return {
      base_url: "http://localhost:5335",
      msg: "",
    };
  },
  methods: {
    getMessage() {
      axios.get(this.base_url + "/")
        .then((res) => {
          this.msg = res.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  created() {
    this.getMessage();
  },
};
</script>

<style>
@media (min-width: 1024px) {
  .backend {
    display: flex-col;
    align-items: center;
  }
}

.backend h1 {
  color: white;
}

.response {
  font-weight: bold;
  font-size: x-large;
  color: teal;
}
</style>
