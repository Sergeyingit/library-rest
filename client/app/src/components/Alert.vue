<template>
    <div>
        <b-alert variant="success" show v-if="status==='success'">{{ message }}</b-alert>
        <b-alert variant="danger" show v-else-if="status==='error'">{{ message }}</b-alert>
        <br>
    </div>
</template>

<script>
export default {
    props: ['message', 'status'],
};
</script>