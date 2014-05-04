From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: Keep LDO4 always ON on Arndale board
Date: Sun, 4 May 2014 21:04:11 +0530
Message-ID: <CAK9yfHwfVhGeiJE2Qc2ZyEum64N2ndACog7BcciZAG3pmUcnoQ@mail.gmail.com>
References: <1398056599-327-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:47389 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbaEDPeL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 May 2014 11:34:11 -0400
Received: by mail-oa0-f41.google.com with SMTP id m1so4916156oag.28
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 May 2014 08:34:11 -0700 (PDT)
In-Reply-To: <1398056599-327-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 21 April 2014 10:33, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> LDO4 regulator was getting disabled preventing the system from
> going into low power states. Keep it always on to fix it.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index 090f983..cde19c8 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -107,6 +107,7 @@
>                                         regulator-name = "VDD_IOPERI_1.8V";
>                                         regulator-min-microvolt = <1800000>;
>                                         regulator-max-microvolt = <1800000>;
> +                                       regulator-always-on;
>                                         op_mode = <1>;
>                                 };

Ping Kukjin. This is actually a fix patch and should go into rc.


-- 
With warm regards,
Sachin
