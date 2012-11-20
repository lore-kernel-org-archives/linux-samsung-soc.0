From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: Exynos5: Remove i2c0 resource information and setting
 of device names
Date: Tue, 20 Nov 2012 18:45:03 +0900
Message-ID: <0c4d01cdc703$b7431ab0$25c95010$@org>
References: <1353071486-29905-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10040 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799Ab2KTJpM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 04:45:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDS003TR5R11NU0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:45:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDS00IT95R33810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Nov 2012 18:45:03 +0900 (KST)
In-reply-to: <1353071486-29905-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Thomas Abraham wrote:
> 
> All Exynos5 based platforms support only device tree based boot and so the
> unused non-dt code that sets i2c0 resource information and device names
> for
> sdhci and i2c platform devices are removed.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c |   17 -----------------
>  1 files changed, 0 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index d067ce7..1efcc6f 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -336,23 +336,6 @@ static void __init exynos4_map_io(void)
>  static void __init exynos5_map_io(void)
>  {
>  	iotable_init(exynos5_iodesc, ARRAY_SIZE(exynos5_iodesc));
> -
> -	s3c_device_i2c0.resource[0].start = EXYNOS5_PA_IIC(0);
> -	s3c_device_i2c0.resource[0].end   = EXYNOS5_PA_IIC(0) + SZ_4K - 1;
> -	s3c_device_i2c0.resource[1].start = EXYNOS5_IRQ_IIC;
> -	s3c_device_i2c0.resource[1].end   = EXYNOS5_IRQ_IIC;
> -
> -	s3c_sdhci_setname(0, "exynos4-sdhci");
> -	s3c_sdhci_setname(1, "exynos4-sdhci");
> -	s3c_sdhci_setname(2, "exynos4-sdhci");
> -	s3c_sdhci_setname(3, "exynos4-sdhci");
> -
> -	/* The I2C bus controllers are directly compatible with s3c2440 */
> -	s3c_i2c0_setname("s3c2440-i2c");
> -	s3c_i2c1_setname("s3c2440-i2c");
> -	s3c_i2c2_setname("s3c2440-i2c");
> -
> -	s3c64xx_spi_setname("exynos4210-spi");
>  }
> 
>  static void __init exynos4_init_clocks(int xtal)
> --
> 1.6.6.rc2

Applied, thanks.

K-Gene <kgene@kernel.org>
