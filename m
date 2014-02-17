From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Mon, 17 Feb 2014 08:40:43 +0530
Message-ID: <CAK9yfHyb7ij0soCmrJvw9OrW2mKdY1QBpnqLdzeRHqdvOGN61g@mail.gmail.com>
References: <1392385032-22015-1-git-send-email-rahul.sharma@samsung.com>
	<1392385032-22015-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:48923 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751105AbaBQDKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Feb 2014 22:10:44 -0500
Received: by mail-oa0-f53.google.com with SMTP id m1so17236104oag.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Feb 2014 19:10:44 -0800 (PST)
In-Reply-To: <1392385032-22015-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Pankaj Dubey <pankaj.dubey@samsung.com>

Hi Rahul,

On 14 February 2014 19:07, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> This patch add basic arch side support for exynos5260 SoC.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig             |    9 +++++++++
>  arch/arm/mach-exynos/common.c            |   11 +++++++++++
>  arch/arm/mach-exynos/include/mach/map.h  |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c   |    1 +
>  arch/arm/plat-samsung/include/plat/cpu.h |    8 ++++++++
>  5 files changed, 30 insertions(+)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 4c414af..5c96248 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -91,6 +91,15 @@ config SOC_EXYNOS5250
>         help
>           Enable EXYNOS5250 SoC support
>
> +config SOC_EXYNOS5260
> +       bool "SAMSUNG EXYNOS5260"
> +       default y
> +       depends on ARCH_EXYNOS5
> +       select AUTO_ZRELADDR
> +       select SAMSUNG_DMADEV
> +       help
> +         Enable EXYNOS5260 SoC support
> +

Per SoC entries are no longer needed with the patch at [1].

[1] http://www.spinics.net/lists/linux-samsung-soc/msg26253.html

-- 
With warm regards,
Sachin
