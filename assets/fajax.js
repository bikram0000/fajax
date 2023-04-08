class FajaxJs {
    FajaxJs() {
    }

    async sendRequest(baseUrl, params, body, headers, method) {

        var data = {
            params: params,
            body: body,
            base_url: baseUrl,
            headers: headers,
            method: method,
        }

        let promise = new Promise(function (resolve, reject) {
            $.ajax({
                type: "POST",
                url: "assets/packages/fajax/assets/php_script.php",
                data: JSON.stringify(data),
                headers: headers,
                success: function (response) {
                    resolve(response);
                },
                error: function (xhr, status, error) {
                    console.log(error);
                    reject(error);
                }
            });

        });
        return promise;

    }


}
window.FajaxJs = FajaxJs;