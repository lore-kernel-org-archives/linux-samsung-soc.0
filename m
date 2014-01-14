From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH -next] clk: exynos-audss: remove redundant dev_err call in
 exynos_audss_clk_probe()
Date: Tue, 14 Jan 2014 11:18:38 +0900
Message-ID: <000301cf10ce$efbe3080$cf3a9180$%han@samsung.com>
References: <CAPgLHd9A8QjVk8ThLbP8vv8wMmJ-DovvR+=uadTXWyTFJok_JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23507 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751364AbaANCSr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jan 2014 21:18:47 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZD00M0WD339YE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jan 2014 11:18:39 +0900 (KST)
In-reply-to: <CAPgLHd9A8QjVk8ThLbP8vv8wMmJ-DovvR+=uadTXWyTFJok_JQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wei Yongjun' <weiyj.lk@gmail.com>, 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'Mike Turquette' <mturquette@linaro.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Grant Likely' <grant.likely@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Wei Yongjun' <yongjun_wei@trendmicro.com.cn>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, January 14, 2014 11:06 AM, Wei Yongjun wrote:
> 
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

It looks good. This error message is redundant; thus it
should be removed.

Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 884187f..01ef381 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -94,10 +94,8 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
> 
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	reg_base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(reg_base)) {
> -		dev_err(&pdev->dev, "failed to map audss registers\n");
> +	if (IS_ERR(reg_base))
>  		return PTR_ERR(reg_base);
> -	}
> 
>  	clk_table = devm_kzalloc(&pdev->dev,
>  				sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
> 
> --
