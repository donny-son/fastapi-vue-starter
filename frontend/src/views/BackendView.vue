<template>
  <div class="backend">
    <h1>This message is from the backend!</h1>
    <div class="details">
      <p>{{ msg.message }}</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "PingItem",
  data() {
    return {
      msg: "",
    };
  },
  methods: {
    getMessage() {
      axios.get("http://localhost:5335/")
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
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}

.details {
  flex: 1;
  margin-left: 1rem;
}
</style>
