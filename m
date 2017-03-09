From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Thu, 09 Mar 2017 14:57:08 +0100
Message-ID: <2666bc34-b25d-d5f0-b13d-7f13248d1cda@samsung.com>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
 <2fb11816-85e7-14f6-7b61-5d3eba6096aa@osg.samsung.com>
 <7f287a39-a8a4-1b9d-2d9a-36e849bd726b@samsung.com>
 <20935f7d-a41c-2987-daea-50e4c3aa4ab6@samsung.com>
 <1a9ff664-9321-70db-3a69-8adc0e04dca5@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1a9ff664-9321-70db-3a69-8adc0e04dca5@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andi Shyti <andi.shyti@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09.03.2017 14:13, Javier Martinez Canillas wrote:
> (...)
> Sure, would something like the following work for you?
>
> >From cba9f00ee7c419cee5ff980b583d92092d3ceaac Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javier@osg.samsung.com>
> Date: Thu, 9 Mar 2017 10:06:21 -0300
> Subject: [PATCH] i2c: exynos5: Avoid transaction timeouts due TRANSFER_DONE_AUTO not set
>
> After commit 7999eecb7e56 ("i2c: exynos5: fix arbitration lost handling"),
> some I2C transactions are failing because the TRANSFER_DONE_AUTO field is
> not set in the I2C_TRANS_STATUS register so the i2c->status value is left
> to -EINVAL causing the i2c->msg_complete completion to never be signaled.
>
> For example, when reading the time of an I2C rtc on an Exynos5800 machine:
>
> $ cat /sys/class/rtc/rtc0/time
> [   25.924594] exynos5-hsi2c 12e10000.i2c: rx timeout
> [   65.028365] max77686-rtc max77802-rtc: Fail to read time reg(-22)
> cat: /sys/class/rtc/rtc0/time: Invalid argument
>
> The Exynos5422 manual states clearly that most I2C_TRANS_STATUS reg bits
> (including TRANSFER_DONE_AUTO) are cleared after the register is read. So
> reading has side effects and should only be done if HSI2C_INT_I2C was set.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Looks OK, you can add Fixes tag and my Reviewed-by: Andrzej Hajda
<a.hajda@samsung.com>.

Regards
Andrzej


> ---
>  drivers/i2c/busses/i2c-exynos5.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index cbd93ce0661f..736a82472101 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -457,7 +457,6 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>  
>  	int_status = readl(i2c->regs + HSI2C_INT_STATUS);
>  	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
> -	trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
>  
>  	/* handle interrupt related to the transfer status */
>  	if (i2c->variant->hw == HSI2C_EXYNOS7) {
> @@ -482,11 +481,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>  			goto stop;
>  		}
>  
> +		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
>  		if ((trans_status & HSI2C_MASTER_ST_MASK) == HSI2C_MASTER_ST_LOSE) {
>  			i2c->state = -EAGAIN;
>  			goto stop;
>  		}
>  	} else if (int_status & HSI2C_INT_I2C) {
> +		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
>  		if (trans_status & HSI2C_NO_DEV_ACK) {
>  			dev_dbg(i2c->dev, "No ACK from device\n");
>  			i2c->state = -ENXIO;
