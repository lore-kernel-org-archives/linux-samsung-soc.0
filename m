From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add missing definition for IRQ_I2S0
Date: Thu, 05 Apr 2012 16:13:58 -0700
Message-ID: <4F7E2736.4090001@samsung.com>
References: <1332825106-10898-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48987 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752550Ab2DEXN6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 19:13:58 -0400
Received: by pbcun15 with SMTP id un15so2044038pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 16:13:58 -0700 (PDT)
In-Reply-To: <1332825106-10898-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Tushar Behera wrote:
> This fixes following build error when sound support is selected
> on EXYNOS4 platform.
>
> sound/soc/samsung/idma.c: In function =E2=80=98idma_close=E2=80=99:
> sound/soc/samsung/idma.c:327:11: error: =E2=80=98IRQ_I2S0=E2=80=99 un=
declared (first use in this function)
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos/include/mach/irqs.h |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach=
-exynos/include/mach/irqs.h
> index 9bee853..591e785 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -212,6 +212,8 @@
>   #define IRQ_MFC				EXYNOS4_IRQ_MFC
>   #define IRQ_SDO				EXYNOS4_IRQ_SDO
>
> +#define IRQ_I2S0			EXYNOS4_IRQ_I2S0
> +
>   #define IRQ_ADC				EXYNOS4_IRQ_ADC0
>   #define IRQ_TC				EXYNOS4_IRQ_PEN0
>
OK, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
