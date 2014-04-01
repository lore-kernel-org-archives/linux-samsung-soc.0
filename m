From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] pata_samsung_cf: fix ata_host_activate() failure handling
Date: Tue, 01 Apr 2014 10:18:46 +0900
Message-ID: <000801cf4d48$54c45210$fe4cf630$%han@samsung.com>
References: <6050762.sdUI3gZZlK@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-reply-to: <6050762.sdUI3gZZlK@amdc1032>
Content-language: ko
Sender: linux-ide-owner@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Tejun Heo' <tj@kernel.org>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-ide@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, April 01, 2014 2:53 AM, Tejun Heo wrote:
> 
> Add missing clk_disable() call to ata_host_activate() failure path.
> 
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/ata/pata_samsung_cf.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> Index: b/drivers/ata/pata_samsung_cf.c
> ===================================================================
> --- a/drivers/ata/pata_samsung_cf.c	2014-03-14 16:45:04.344724378 +0100
> +++ b/drivers/ata/pata_samsung_cf.c	2014-03-31 18:31:58.083631437 +0200
> @@ -594,9 +594,13 @@ static int __init pata_s3c_probe(struct
> 
>  	platform_set_drvdata(pdev, host);
> 
> -	return ata_host_activate(host, info->irq,
> -			info->irq ? pata_s3c_irq : NULL,
> -			0, &pata_s3c_sht);
> +	ret = ata_host_activate(host, info->irq,
> +				info->irq ? pata_s3c_irq : NULL,
> +				0, &pata_s3c_sht);
> +	if (ret)
> +		goto stop_clk;
> +
> +	return 0;
> 
>  stop_clk:
>  	clk_disable(info->clk);
> 
> --

