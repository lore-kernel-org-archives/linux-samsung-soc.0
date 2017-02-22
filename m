From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: disable fifo-almost-empty irq signal when
 necessary
Date: Wed, 22 Feb 2017 12:10:49 +0100
Message-ID: <35807d71-5c2c-03dc-70ee-7bd585725e19@samsung.com>
References: <CGME20170222101123eucas1p25482d192dd5d119aaf6ddc15a01c60c0@eucas1p2.samsung.com>
 <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1487758280-22801-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 2017-02-22 11:11, Andrzej Hajda wrote:
> Fifo-almost-empty irq signal should be disabled as soon as possible,
> to avoid unnecessary interrupt storm. The best moment is when there is
> no more data to feed fifo.
> This patch fixes system stalls caused by IRQ storm.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

With this patch TM2 board boots fine on linux-next from 21st Feb 2017
and maxcpus=1 in kernel command line.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> v2:
>      - removed doubled conditional
>
>   drivers/i2c/busses/i2c-exynos5.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index bea6071..00e81e3 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -502,8 +502,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>   		fifo_level = HSI2C_TX_FIFO_LVL(fifo_status);
>   
>   		len = i2c->variant->fifo_depth - fifo_level;
> -		if (len > (i2c->msg->len - i2c->msg_ptr))
> +		if (len > (i2c->msg->len - i2c->msg_ptr)) {
> +			u32 int_en = readl(i2c->regs + HSI2C_INT_ENABLE);
> +
> +			int_en &= ~HSI2C_INT_TX_ALMOSTEMPTY_EN;
> +			writel(int_en, i2c->regs + HSI2C_INT_ENABLE);
>   			len = i2c->msg->len - i2c->msg_ptr;
> +		}
>   
>   		while (len > 0) {
>   			byte = i2c->msg->buf[i2c->msg_ptr++];

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
