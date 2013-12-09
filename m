From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/2] i2c: exynos5: configure fifo_depth based on HSI2C
 module version
Date: Mon, 09 Dec 2013 17:31:07 +0100
Message-ID: <1739891.MYO4PRtJOt@amdc1227>
References: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:29831 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932737Ab3LIQbT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 11:31:19 -0500
In-reply-to: <1385100851-32254-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, hs@denx.de, khali@linux-fr.org, ben-linux@fluff.org, naveenkrishna.ch@gmail.com

Hi Naveen,

On Friday 22 of November 2013 11:44:11 Naveen Krishna Chatradhi wrote:
> fifo_depth of the HSI2C is not constant
> Exynos5420 and Exynos5250 supports fifo_depth of 64bytes
> Exynos5260 supports fifo_depth of 16bytes
> 
> This patch configures the fifo_depth based on HSI2C modules version.
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c |   29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index cbb49e2..19277d8 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -77,12 +77,6 @@
>  #define HSI2C_RXFIFO_TRIGGER_LEVEL(x)		((x) << 4)
>  #define HSI2C_TXFIFO_TRIGGER_LEVEL(x)		((x) << 16)
>  
> -/* As per user manual FIFO max depth is 64bytes */
> -#define HSI2C_FIFO_MAX				0x40
> -/* default trigger levels for Tx and Rx FIFOs */
> -#define HSI2C_DEF_TXFIFO_LVL			(HSI2C_FIFO_MAX - 0x30)
> -#define HSI2C_DEF_RXFIFO_LVL			(HSI2C_FIFO_MAX - 0x10)
> -
>  /* I2C_TRAILING_CTL Register bits */
>  #define HSI2C_TRAILING_COUNT			(0xf)
>  
> @@ -187,6 +181,9 @@ struct exynos5_i2c {
>  
>  	/* Version of HS-I2C Hardware */
>  	unsigned int		version;
> +
> +	/* FIFO depth */
> +	unsigned int		fifo_depth;
>  };
>  
>  enum hsi2c_version {
> @@ -437,7 +434,7 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>  		fifo_status = readl(i2c->regs + HSI2C_FIFO_STATUS);
>  		fifo_level = HSI2C_TX_FIFO_LVL(fifo_status);
>  
> -		len = HSI2C_FIFO_MAX - fifo_level;
> +		len = i2c->fifo_depth - fifo_level;
>  		if (len > (i2c->msg->len - i2c->msg_ptr))
>  			len = i2c->msg->len - i2c->msg_ptr;
>  
> @@ -505,6 +502,7 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  	u32 i2c_auto_conf = 0;
>  	u32 fifo_ctl;
>  	unsigned long flags;
> +	unsigned short trig_lvl;
>  
>  	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
>  	i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
> @@ -515,13 +513,19 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  
>  		i2c_auto_conf = HSI2C_READ_WRITE;
>  
> -		fifo_ctl |= HSI2C_RXFIFO_TRIGGER_LEVEL(HSI2C_DEF_TXFIFO_LVL);
> +		trig_lvl = (i2c->msg->len > i2c->fifo_depth) ?
> +			(i2c->fifo_depth * 3/4) : i2c->msg->len;

This patch changes the fifo trigger level calculation (it's dependent now
on message length), not just maximum fifo size, as the description says.
It should be split into two separate patches, explaining why both changes
are necessary.

Best regards,
Tomasz
