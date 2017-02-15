From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] pinctrl: samsung: Use devres version of
 gpiochip_add_data
Date: Wed, 15 Feb 2017 19:39:57 +0200
Message-ID: <20170215173957.megtayq4k4w4qziu@kozik-lap>
References: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486980666-7143-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486980666-7143-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 13, 2017 at 10:11:05AM +0000, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Empty? Please say WHY we want to use devres version of
gpiochip_add_data (e.g. for simplification of error paths).

Best regards,
Krzysztof


> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 1134bc3..f291cbf 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -936,20 +936,15 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
>  		gc->of_node = bank->of_node;
>  		gc->label = bank->name;
>  
> -		ret = gpiochip_add_data(gc, bank);
> +		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
>  							gc->label, ret);
> -			goto fail;
> +			return ret;
>  		}
>  	}
>  
>  	return 0;
> -
> -fail:
> -	for (--i, --bank; i >= 0; --i, --bank)
> -		gpiochip_remove(&bank->gpio_chip);
> -	return ret;
>  }
>  
>  /* retrieve the soc specific data */
> -- 
> 2.1.4
> 
