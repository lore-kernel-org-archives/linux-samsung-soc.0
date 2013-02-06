From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RESEND][PATCH] ARM: EXYNOS: Add clocks for EXYNOS I2S and PCM I/F
Date: Wed, 6 Feb 2013 10:59:31 +0530
Message-ID: <CAK9yfHwZ6JOxtSEd1960v_Zb2QkpTQz7RG6NcSrJMCLzVWjJEg@mail.gmail.com>
References: <003201ce0429$c15e8350$441b89f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:60751 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750898Ab3BFF3c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 00:29:32 -0500
Received: by mail-ob0-f177.google.com with SMTP id wc18so1051429obb.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Feb 2013 21:29:31 -0800 (PST)
In-Reply-To: <003201ce0429$c15e8350$441b89f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangsu Park <sangsu4u.park@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, sbkim73@samsung.com, Tushar Behera <tushar.behera@linaro.org>

On 6 February 2013 10:51, Sangsu Park <sangsu4u.park@samsung.com> wrote:
> Audio Subsystem has own clocks for I2S0 and PCM0 in all EXYNOS series.
> This patch add clocks for I2S0 and PCM0 I/F.
>
> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile      |    1 +
>  arch/arm/mach-exynos/clock-audss.c |   64 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos/clock-audss.c
>
[snip]
> diff --git a/arch/arm/mach-exynos/clock-audss.c
> b/arch/arm/mach-exynos/clock-audss.c
> new file mode 100644
> index 0000000..8260185
> --- /dev/null
> +++ b/arch/arm/mach-exynos/clock-audss.c
> @@ -0,0 +1,64 @@
[snip]
> +static void __iomem *clk_audss_base = 0;
> +
> +static int exynos_clk_audss_ctrl(struct clk *clk, int enable)
> +{
> +       if (!clk_audss_base)
> +               return ENOMEM;

Return value should be negative (-ENOMEM).



-- 
With warm regards,
Sachin
