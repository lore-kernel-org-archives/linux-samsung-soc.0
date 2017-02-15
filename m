From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] pinctrl: samsung: Remove unused local variable
Date: Wed, 15 Feb 2017 19:43:03 +0200
Message-ID: <20170215174303.2547hgentg6pldgo@kozik-lap>
References: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486980666-7143-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486980666-7143-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 13, 2017 at 10:11:06AM +0000, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

"The local variable drvdata is not used in samsung_gpio_set_direction()"?

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index f291cbf..eb08f30 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -566,13 +566,11 @@ static int samsung_gpio_set_direction(struct gpio_chip *gc,
>  {
>  	const struct samsung_pin_bank_type *type;
>  	struct samsung_pin_bank *bank;
> -	struct samsung_pinctrl_drv_data *drvdata;
>  	void __iomem *reg;
>  	u32 data, mask, shift;
>  
>  	bank = gpiochip_get_data(gc);
>  	type = bank->type;
> -	drvdata = bank->drvdata;
>  
>  	reg = bank->pctl_base + bank->pctl_offset
>  			+ type->reg_offset[PINCFG_TYPE_FUNC];
> -- 
> 2.1.4
> 
