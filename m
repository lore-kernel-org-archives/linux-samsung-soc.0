From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: ARM: EXYNOS: implement pm_power_off for EXYNOS5440
Date: Sat, 28 Sep 2013 14:55:40 +0530
Message-ID: <CAK9yfHwUrHoq5G37mRJ_20FfX+pR9kKFqVzqULE_M3=PoiHPkw@mail.gmail.com>
References: <006e01cebc08$995a8650$cc0f92f0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:64512 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753048Ab3I1JZl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Sep 2013 05:25:41 -0400
Received: by mail-oa0-f49.google.com with SMTP id i4so2704342oah.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 28 Sep 2013 02:25:40 -0700 (PDT)
In-Reply-To: <006e01cebc08$995a8650$cc0f92f0$%lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jungseok Lee <jays.lee@samsung.com>
Cc: ??? <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 28 September 2013 10:37, Jungseok Lee <jays.lee@samsung.com> wrote:
>
> +static void exynos5440_power_off(void)
> +{
> +       struct device_node *np;
> +       void __iomem *addr;
> +
> +       np = of_find_compatible_node(NULL, NULL, "samsung,exynos5440-clock");
> +
> +       addr = of_iomap(np, 0) + 0x14;
> +
> +       __raw_writel(0x1, addr);

Probably the magic numbers could be defined as macros or atleast a
comment to that effect would be useful.

-- 
With warm regards,
Sachin
