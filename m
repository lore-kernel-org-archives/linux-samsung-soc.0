From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_node_name_eq for node name comparisons
Date: Wed, 5 Dec 2018 21:25:17 -0800
Message-ID: <CA+Ln22Gj=1PovdRT9HCun4vkZmHfGh2t6ouOTrFqSZHiNvK1Zw@mail.gmail.com>
References: <20181205195050.4759-20-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-20-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2018=E5=B9=B412=E6=9C=885=E6=97=A5(=E6=B0=B4) 11:51 Rob Herring <robh@kerne=
l.org>:
>
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index ee6ee2338606..de0477bb469d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1071,7 +1071,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl=
_drv_data *d,
>                         continue;
>                 bank =3D d->pin_banks;
>                 for (i =3D 0; i < d->nr_banks; ++i, ++bank) {
> -                       if (!strcmp(bank->name, np->name)) {
> +                       if (of_node_name_eq(np, bank->name)) {
>                                 bank->of_node =3D np;
>                                 break;
>                         }
> --
> 2.19.1
>

Reviewed-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
