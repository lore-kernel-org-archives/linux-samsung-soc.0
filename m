From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/3] ARM: Exynos: fix SDHCI caps for UniversalC210 and
 NURI boards
Date: Tue, 06 Mar 2012 02:15:59 -0800
Message-ID: <4F55E3DF.4050407@samsung.com>
References: <1330591221-31458-1-git-send-email-m.szyprowski@samsung.com> <1330591221-31458-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:50778 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756807Ab2CFKQD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 05:16:03 -0500
Received: by dadp12 with SMTP id p12so6484088dad.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 02:16:03 -0800 (PST)
In-Reply-To: <1330591221-31458-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On 03/01/12 00:40, Marek Szyprowski wrote:
> Add a new quirk (introduced in 6e8201f57c935 "mmc: core: add the capability
> for broken voltage" to indicate that MMC core should ignore voltage change
> errors reported by the regulators core. This is required to get SDHCI
> working on these boards again after commit ceb6143b2df81c ("mmc: sdhci:
> fix vmmc handling").
>
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/mach-nuri.c           |    2 ++
>   arch/arm/mach-exynos/mach-universal_c210.c |    1 +
>   2 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
> index a6b9162..8c0479f 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -112,6 +112,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc0_data __initdata = {
>   	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
>   				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
>   				MMC_CAP_DISABLE | MMC_CAP_ERASE),
> +	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
>   	.cd_type		= S3C_SDHCI_CD_PERMANENT,
>   };
>
> @@ -151,6 +152,7 @@ static struct s3c_sdhci_platdata nuri_hsmmc2_data __initdata = {
>   	.host_caps		= MMC_CAP_4_BIT_DATA |
>   				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
>   				MMC_CAP_DISABLE,
> +	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
>   	.ext_cd_gpio		= EXYNOS4_GPX3(3),	/* XEINT_27 */
>   	.ext_cd_gpio_invert	= 1,
>   	.cd_type		= S3C_SDHCI_CD_GPIO,
> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
> index 6017a21..908624c 100644
> --- a/arch/arm/mach-exynos/mach-universal_c210.c
> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
> @@ -745,6 +745,7 @@ static struct s3c_sdhci_platdata universal_hsmmc0_data __initdata = {
>   	.host_caps		= (MMC_CAP_8_BIT_DATA | MMC_CAP_4_BIT_DATA |
>   				MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED |
>   				MMC_CAP_DISABLE),
> +	.host_caps2		= MMC_CAP2_BROKEN_VOLTAGE,
>   	.cd_type		= S3C_SDHCI_CD_PERMANENT,
>   };
>

Hi Marek,

If possible, please adding cover letter for patch set(series), I think 
these are just independent patches though. Anyway, will apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
