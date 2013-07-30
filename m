From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 1/6] clk/exynos5250: Fix HDMI clock number in documentation
Date: Tue, 30 Jul 2013 14:00:06 -0700
Message-ID: <20130730210006.5270.42195@quantum>
References: <1374728857-4208-1-git-send-email-rahul.sharma@samsung.com>
 <1374728857-4208-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:36820 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756991Ab3G3VAM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 17:00:12 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so790408pbb.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 14:00:11 -0700 (PDT)
In-Reply-To: <1374728857-4208-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Arun Kumar K <arun.kk@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Quoting Rahul Sharma (2013-07-24 22:07:32)
> From: Arun Kumar K <arun.kk@samsung.com>
> 
> This patch corrects the HDMI clock number given wrongly
> in the documentation.
> 
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

You can drop this patch as it is fixed in the clk-next branch already by
commit "of/documentation: Fix a typo in exynos5250-clock.txt", 07c2ae9c.

Regards,
Mike

> ---
>  Documentation/devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> index 781a627..1a05761 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -154,7 +154,7 @@ clock which they consume.
>    dsim0                        341
>    dp                   342
>    mixer                        343
> -  hdmi                 345
> +  hdmi                 344
>  
>  Example 1: An example of a clock controller node is listed below.
>  
> -- 
> 1.7.10.4
