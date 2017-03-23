From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/2] pinctrl: samsung: Use devres version of
 gpiochip_add_data
Date: Thu, 23 Mar 2017 20:51:57 +0200
Message-ID: <20170323185157.xsw4u7zkrbk75ta6@kozik-lap>
References: <1490202935-4708-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1490202935-4708-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490202935-4708-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Mar 22, 2017 at 05:15:35PM +0000, Charles Keepax wrote:
> Use devm_gpiochip_add_data to simplify the error path in
> samsung_gpiolib_register.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> 
> No changes since v2.
> 
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
