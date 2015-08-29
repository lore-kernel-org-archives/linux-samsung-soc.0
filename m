From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable big.LITTLE CPUidle support
Date: Sat, 29 Aug 2015 11:33:10 +0200
Message-ID: <55E17C56.4080200@osg.samsung.com>
References: <1440749769-10135-1-git-send-email-javier@osg.samsung.com>
 <55E174F3.1030202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60990 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752473AbbH2JdQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Aug 2015 05:33:16 -0400
In-Reply-To: <55E174F3.1030202@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Krzysztof,

On 08/29/2015 11:01 AM, Krzysztof Kozlowski wrote:
> W dniu 28.08.2015 o 17:16, Javier Martinez Canillas pisze:
>> Some Exynos big.LITTLE boards (i.e: Exynos5420 and Exynos5800 based
>> Chromebooks) have proper firmware that allow the big.LITTLE CPUidle
>> driver to work correctly, so enable support for this.
>>
>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>
>> ---
>> Kukjin and Krzysztof,
>>
>> As you know there are other boards like the Exynos5422 based Odroid XU{3,4}
>> whose firmware is broken due leaving CCI in secure mode which means that the
>> kernel MCPM support can't properly manage CCI.
>>
>> So if you pick this patch, it should be tested in kernelci before appearing
>> in linux-next to prevent any boot issues.
>>
>> But if that happens, I believe that is better to do a fix / workaround in
>> those broken platforms since nothing prevents users to enable this option
>> anyways. For example the CCI device node could be disabled in the DTS.
>>
>>  arch/arm/configs/exynos_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
> 
> On Odroid XU3L (next-20150828, Hardkernel u-boot) boot hangs just after:
>

Thanks for testing, I was expecting that is just that I don't have a
Odroid XU{3,4} board for test here, I guess I should get one.
 
> [    2.568650] dwmmc_exynos 12200000.mmc: num-slots property not found,
> assuming 1 slot is available
> 
> ... so no. NACK :). First the boards, firmware, bootloader or kernel

Agreed with the nack :)

> code have to be fixed.
>

Or disable CCI, could you please test the following patch [0] so I
can post it properly?
 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America

[0]:
>From 0fc5649b8d939ccfb7d3be1aa09df5e1f89a5a82 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javier@osg.samsung.com>
Date: Sat, 29 Aug 2015 11:21:39 +0200
Subject: [RFT PATCH] ARM: dts: Disable CCI support for Odroid XU{3,4} boards

The Exynos5422 based Odroid XU{3,4} boards have a broken firmware that
leaves CCI in secure mode which means that the kernel MCPM support can
not properly manage CCI. This causes the machine to hang when entering
into low power states for example triggered by the b.L CPUidle driver.

The patch is based on commit 25217fef3551 ("ARM: dts: disable CCI on
exynos5420 based arndale-octa")

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index dd8bc86d9de4..1e076458fab6 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -525,3 +525,7 @@
 	vdd33-supply = <&ldo9_reg>;
 	vdd10-supply = <&ldo11_reg>;
 };
+
+&cci {
+	status = "disabled";
+};
-- 
2.4.3
