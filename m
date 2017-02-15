From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/4] pinctrl: samsung: Register pinctrl before GPIO
Date: Wed, 15 Feb 2017 19:36:22 +0200
Message-ID: <20170215173622.plyut5et35lgd47e@kozik-lap>
References: <1486980666-7143-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486980666-7143-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486980666-7143-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Feb 13, 2017 at 10:11:04AM +0000, Charles Keepax wrote:
> If we request a GPIO hog, then gpiochip_add_data will attempt to request
> some of its own GPIOs. The driver also uses gpiochip_generic_request
> which means that for any GPIO request to succeed the pinctrl needs to be
> registered. Currently however the driver registers the GPIO and then the
> pinctrl meaning all GPIO hog requests will fail, which then in turn causes
> the whole driver to fail probe. Fix this up by ensuring we register the
> pinctrl first.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 32 +++++++++++++++----------------

I think the code makes sense altough the description describes
theoretical issue - we do not use GPIO hogs. Of course out of tree DTS
could use them... so maybe mention that this is not an existing case?

For the code itself:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index d79eada..1134bc3 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -893,6 +893,19 @@ static int samsung_pinctrl_register(struct platform_device *pdev,
>  	return 0;
>  }
>  
