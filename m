From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 1/2] clk: s2mps11: Fix possible NULL pointer dereference
Date: Mon, 24 Mar 2014 17:07:05 -0700
Message-ID: <20140325000705.32624.49820@quantum>
References: <1395404297-12133-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:55367 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750875AbaCYAHO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Mar 2014 20:07:14 -0400
Received: by mail-pd0-f175.google.com with SMTP id x10so6004781pdj.34
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Mar 2014 17:07:13 -0700 (PDT)
In-Reply-To: <1395404297-12133-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org

Quoting Krzysztof Kozlowski (2014-03-21 05:18:17)
> If parent device does not have of_node set the s2mps11_clk_parse_dt()
> returned NULL. This NULL was later passed to of_clk_add_provider() which
> dereferenced it in pr_debug() call.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I've taken both of these patches into clk-next.

Thanks!
Mike

> Cc: <stable@vger.kernel.org>
> ---
>  drivers/clk/clk-s2mps11.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 00a3abe103a5..27c83e45eaed 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -130,7 +130,7 @@ static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev)
>         int i;
>  
>         if (!iodev->dev->of_node)
> -               return NULL;
> +               return ERR_PTR(-EINVAL);
>  
>         clk_np = of_find_node_by_name(iodev->dev->of_node, "clocks");
>         if (!clk_np) {
> -- 
> 1.7.9.5
> 
