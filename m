From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
Date: Fri, 12 Nov 2010 19:08:52 +0900
Message-ID: <20101112100851.GA18511@linux-sh.org>
References: <1287406528-15324-1-git-send-email-sbkim73@samsung.com> <1287406528-15324-4-git-send-email-sbkim73@samsung.com> <053f01cb822a$2758a7f0$7609f7d0$%kim@samsung.com> <00a501cb824f$9942f300$cbc8d900$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:41811 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752891Ab0KLKJU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Nov 2010 05:09:20 -0500
Content-Disposition: inline
In-Reply-To: <00a501cb824f$9942f300$cbc8d900$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, akpm@linux-foundation.org, 'Jonghun Han' <jonghun.han@samsung.com>

On Fri, Nov 12, 2010 at 06:54:29PM +0900, Inki Dae wrote:
> @@ -1314,13 +1319,22 @@ static int __devinit s3c_fb_probe(struct
> platform_device *pdev)
>  	sfb->pdata = pd;
>  	sfb->variant = fbdrv->variant;
>  
> -	sfb->bus_clk = clk_get(dev, "lcd");
> -	if (IS_ERR(sfb->bus_clk)) {
> -		dev_err(dev, "failed to get bus clock\n");
> +	/* if sclk_name is NULL then it would use bus clock as default. */
> +	if (!pd->sclk_name)
> +		sfb->lcd_clk = clk_get(dev, "lcd");
> +	else
> +		sfb->lcd_clk = clk_get(dev, pd->sclk_name);
> +
No, this is totally pointless. Simply establish a clk lookup for the
configuration you are running on in your board code and always have
clk_get() operate on a fixed id. You can use this same scheme with any
optional clocks you have too, and reconfigure according to whether the
lookups for optional clocks succeeded or not.
