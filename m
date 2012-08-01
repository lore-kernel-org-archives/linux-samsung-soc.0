From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/2] ARM: EXYNOS: Add Gscaler device from DT
Date: Wed, 01 Aug 2012 15:40:01 +0900
Message-ID: <033301cd6fb0$7ac4af90$704e0eb0$%kim@samsung.com>
References: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
 <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13547 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753710Ab2HAGkE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Aug 2012 02:40:04 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M82003GND5ZV1B0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 15:40:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8200BGID6PPB30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Aug 2012 15:40:02 +0900 (KST)
In-reply-to: <1342789723-3949-3-git-send-email-shaik.ameer@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com

Shaik Ameer Basha wrote:
> 
> This patch adds,
> - 4 Gscaler devices to the DT device list
> - Gscaler specific entries to the machine file
> - binding documentation for Gscaler entries
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  .../devicetree/bindings/media/exynos5-gsc.txt      |   32
> ++++++++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   28
+++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    3 ++
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 +++++
>  4 files changed, 71 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/exynos5-
> gsc.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> new file mode 100644
> index 0000000..1cb4ea0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> @@ -0,0 +1,32 @@
> +* Samsung Exynos5 Gscaler device
> +
> +Gscaler is used for scaling and color space conversion on EXYNOS5 SoCs.
> +
> +Required properties:
> +- compatible: should be "samsung,exynos5250-gsc"

IMO, should be "samsung,exynos5-gsc" because upcoming EXYNOS5 SoCs can use
same gscaler driver.

> +- reg: should contain Gscaler physical address location and length.
> +- interrupts: should contain Gscaler interrupt number
> +
> +Example:
> +
> +gsc_0:  gsc@0x13e00000 {
> +	compatible = "samsung,exynos5250-gsc";

+	compatible = "samsung,exynos5-gsc";

> +	reg = <0x13e00000 0x1000>;
> +	interrupts = <0 85 0>;
> +};
> +

[...]


> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index c72b675..217e470 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -121,6 +121,9 @@
>  #define EXYNOS4_PA_SYSMMU_MFC_L		0x13620000
>  #define EXYNOS4_PA_SYSMMU_MFC_R		0x13630000
> 
> +/* x = 0...3 */
> +#define EXYNOS5_PA_GSC(x)		(0x13e00000 + ((x) * 0x10000))

I think, separated definitions would be nice because the number of channel
can be changed on other upcoming EXYNOS5 SoCs.

+#define EXYNOS5_PA_GSC0			0x13E00000
+#define EXYNOS5_PA_GSC1			0x13E10000
+#define EXYNOS5_PA_GSC2			0x13E20000
+#define EXYNOS5_PA_GSC3			0x13E30000

[...]

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
