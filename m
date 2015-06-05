From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: max77843: Clear IRQ bits state before request IRQ
Date: Fri, 05 Jun 2015 13:53:56 +0900
Message-ID: <55712B64.3090205@samsung.com>
References: <1433478747-12254-1-git-send-email-jaewon02.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48188 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752339AbbFEEx7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jun 2015 00:53:59 -0400
In-reply-to: <1433478747-12254-1-git-send-email-jaewon02.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Hi Jaewon,

On 06/05/2015 01:32 PM, Jaewon Kim wrote:
> IRQ signal before driver probe is needless because driver sends
> current state after platform booting done.
> So, this patch clears MUIC IRQ bits before request IRQ.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/extcon/extcon-max77843.c |    9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> index d78a64d..11e09d1 100644
> --- a/drivers/extcon/extcon-max77843.c
> +++ b/drivers/extcon/extcon-max77843.c
> @@ -781,6 +781,15 @@ static int max77843_muic_probe(struct platform_device *pdev)
>  	/* Support virtual irq domain for max77843 MUIC device */
>  	INIT_WORK(&info->irq_work, max77843_muic_irq_work);
>  
> +	/* Clear IRQ bits before request IRQs */
> +	ret = regmap_bulk_read(max77843->regmap_muic,
> +			MAX77843_MUIC_REG_INT1, info->status,
> +			MAX77843_MUIC_IRQ_NUM);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
> +		goto err_muic_irq;
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(max77843_muic_irqs); i++) {
>  		struct max77843_muic_irq *muic_irq = &max77843_muic_irqs[i];
>  		unsigned int virq = 0;
> 

Applied it.

Thanks,
Chanwoo Choi
