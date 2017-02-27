From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Calculate GPIO base for pinctrl_add_gpio_range
Date: Mon, 27 Feb 2017 11:13:59 +0900
Message-ID: <CA+Ln22FJ=Kg_HmfjhDst4fNeUoA8jh=QVsF-rUVeXgPrzunJ+w@mail.gmail.com>
References: <20170223172313.GF2742@localhost.localdomain> <1487872490-27643-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1487872490-27643-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Charles,

2017-02-24 2:54 GMT+09:00 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>:
> As the pinctrl is now added before the GPIOs are registered we need to
> manually calculate what the GPIO base will be, otherwise the base for
> each gpio_range will be set to zero. Fortunately the driver
> already assigns a GPIO base, in samsung_gpiolib_register, and uses the
> same calculation it does for the pin_base. Meaning the two will always
> be the same and allowing us to reuse the pinbase and avoid the issue.

Please see my comment inline.

>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>
> Ok I might have spoken to soon there looks like there is a simple
> way to fix this up, at least in this case. It would be much more
> of an issue if the driver allocated its GPIO base dynamically.
>
> Thanks,
> Charles
>
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index ddc8d6b..864d8b4d 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -882,7 +882,7 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
>                 pin_bank->grange.id = bank;
>                 pin_bank->grange.pin_base = drvdata->pin_base
>                                                 + pin_bank->pin_base;
> -               pin_bank->grange.base = pin_bank->gpio_chip.base;
> +               pin_bank->grange.base = pin_bank->grange.pin_base;

If we are not reading the base from the GPIO bank anymore, maybe it
could make sense to actually make samsung_gpiolib_register() use
bank->grange.base as gc->base? This way we would avoid explicitly
numbering two times.

Best regards,
Tomasz
