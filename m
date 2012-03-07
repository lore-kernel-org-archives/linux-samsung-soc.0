From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix compilation error with mach-exynos4-dt
 board
Date: Wed, 07 Mar 2012 05:02:55 -0800
Message-ID: <4F575C7F.6010002@samsung.com>
References: <1331097626-5369-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:39881 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145Ab2CGNC7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 08:02:59 -0500
Received: by dadp12 with SMTP id p12so7878952dad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 05:02:59 -0800 (PST)
In-Reply-To: <1331097626-5369-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On 03/06/12 21:20, Tushar Behera wrote:
> Commit 84499abd19d4 ("ARM: EXYNOS: add support uart for EXYNOS4 and E=
XYNOS5")
> renames S5P_PA_UARTn to EXYNOS4_PA_UARTn. Hence we need to do
> similar modification in mach-exynos4-dt.c to fix compilation error.
>
> arch/arm/mach-exynos/mach-exynos4-dt.c:40:2: error: =E2=80=98S5P_PA_U=
ART0=E2=80=99
> undeclared here (not in a function)
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos/mach-exynos4-dt.c |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-e=
xynos/mach-exynos4-dt.c
> index e6b02fd..8245f1c 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -37,13 +37,13 @@
>    * data from the device tree.
>    */
>   static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __in=
itconst =3D {
> -	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART0,
> +	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART0,
>   				"exynos4210-uart.0", NULL),
> -	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART1,
> +	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART1,
>   				"exynos4210-uart.1", NULL),
> -	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART2,
> +	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART2,
>   				"exynos4210-uart.2", NULL),
> -	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART3,
> +	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART3,
>   				"exynos4210-uart.3", NULL),
>   	OF_DEV_AUXDATA("samsung,exynos4210-sdhci", EXYNOS4_PA_HSMMC(0),
>   				"exynos4-sdhci.0", NULL),

Applied, thanks.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
