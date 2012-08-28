From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix incorrect help text
Date: Tue, 28 Aug 2012 16:20:55 -0700
Message-ID: <503D5257.8050101@samsung.com>
References: <1346141274-5244-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:65127 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783Ab2H1XU6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 19:20:58 -0400
Received: by pbbrr13 with SMTP id rr13so60857pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 16:20:58 -0700 (PDT)
In-Reply-To: <1346141274-5244-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 08/28/12 01:07, Sachin Kamat wrote:
> Changed Exynos4 ->  Exynos5.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/Kconfig |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index b5b4c8c..9369ff7 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -418,8 +418,8 @@ config MACH_EXYNOS5_DT
>   	select USE_OF
>   	select ARM_AMBA
>   	help
> -	  Machine support for Samsung Exynos4 machine with device tree enabled.
> -	  Select this if a fdt blob is available for the EXYNOS4 SoC based board.
> +	  Machine support for Samsung Exynos5 machine with device tree enabled.
> +	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
>
>   if ARCH_EXYNOS4
>
Yes, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
