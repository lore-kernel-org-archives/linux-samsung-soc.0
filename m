From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix compilation error.
Date: Wed, 07 Mar 2012 05:06:09 -0800
Message-ID: <4F575D41.8030301@samsung.com>
References: <1331100559-28849-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:57548 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755314Ab2CGNGN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 08:06:13 -0500
Received: by obbuo6 with SMTP id uo6so6889009obb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Mar 2012 05:06:13 -0800 (PST)
In-Reply-To: <1331100559-28849-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 03/06/12 22:09, Sachin Kamat wrote:
> Commit 734b5bb7375 ("Merge branch 'next/soc-exynos5250-arch-wip' into=
 for-next")
> on for-next branch of Kukjin's tree gives the following build errors:
>
> arch/arm/mach-exynos/clock-exynos4.c:1328:2: error: =E2=80=98clk_sclk=
_mmc0=E2=80=99
> undeclared here (not in a function)
> arch/arm/mach-exynos/clock-exynos4.c:1329:2: error: =E2=80=98clk_sclk=
_mmc1=E2=80=99
> undeclared here (not in a function)
> arch/arm/mach-exynos/clock-exynos4.c:1330:2: error: =E2=80=98clk_sclk=
_mmc2=E2=80=99
> undeclared here (not in a function)
> arch/arm/mach-exynos/clock-exynos4.c:1331:2: error: =E2=80=98clk_sclk=
_mmc3=E2=80=99
> undeclared here (not in a function)
>
> This commit fixes the same.
>
> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
> ---
>   arch/arm/mach-exynos/clock-exynos4.c |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/clock-exynos4.c b/arch/arm/mach-exy=
nos/clock-exynos4.c
> index d72a1fe..bcb59e7 100644
> --- a/arch/arm/mach-exynos/clock-exynos4.c
> +++ b/arch/arm/mach-exynos/clock-exynos4.c
> @@ -1325,10 +1325,10 @@ static struct clk_lookup exynos4_clk_lookup[]=
 =3D {
>   	CLKDEV_INIT("exynos4210-uart.1", "clk_uart_baud0",&exynos4_clk_scl=
k_uart1.clk),
>   	CLKDEV_INIT("exynos4210-uart.2", "clk_uart_baud0",&exynos4_clk_scl=
k_uart2.clk),
>   	CLKDEV_INIT("exynos4210-uart.3", "clk_uart_baud0",&exynos4_clk_scl=
k_uart3.clk),
> -	CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2",&clk_sclk_mmc0.clk),
> -	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2",&clk_sclk_mmc1.clk),
> -	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2",&clk_sclk_mmc2.clk),
> -	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",&clk_sclk_mmc3.clk),
> +	CLKDEV_INIT("exynos4-sdhci.0", "mmc_busclk.2",&exynos4_clk_sclk_mmc=
0.clk),
> +	CLKDEV_INIT("exynos4-sdhci.1", "mmc_busclk.2",&exynos4_clk_sclk_mmc=
1.clk),
> +	CLKDEV_INIT("exynos4-sdhci.2", "mmc_busclk.2",&exynos4_clk_sclk_mmc=
2.clk),
> +	CLKDEV_INIT("exynos4-sdhci.3", "mmc_busclk.2",&exynos4_clk_sclk_mmc=
3.clk),
>   	CLKDEV_INIT("dma-pl330.0", "apb_pclk",&exynos4_clk_pdma0),
>   	CLKDEV_INIT("dma-pl330.1", "apb_pclk",&exynos4_clk_pdma1),
>   	CLKDEV_INIT("s3c64xx-spi.0", "spi_busclk0",&exynos4_clk_sclk_spi0.=
clk),

Yes, should be fixed. will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
