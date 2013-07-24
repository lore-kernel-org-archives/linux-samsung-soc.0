From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 1/4] ARM: dts: Hook up IRQ for PMIC on Arndale
Date: Wed, 24 Jul 2013 10:51:22 +0900
Message-ID: <0dec01ce8810$4c9dfe40$e5d9fac0$@org>
References: <1374063448-20517-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60019 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741Ab3GXBvX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 21:51:23 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF001BW3T753C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 10:51:22 +0900 (KST)
In-reply-to: <1374063448-20517-1-git-send-email-broonie@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, 'Mark Brown' <broonie@linaro.org>

Mark Brown wrote:
> 
> From: Mark Brown <broonie@linaro.org>
> 
> The out of tree code configures a pullup on the line indicating that it
> is an active low interrupt.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts
> b/arch/arm/boot/dts/exynos5250-arndale.dts
> index abc7272..dab40ae 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -11,6 +11,7 @@
> 
>  /dts-v1/;
>  #include "exynos5250.dtsi"
> +#include <dt-bindings/interrupt-controller/irq.h>
> 
>  / {
>  	model = "Insignal Arndale evaluation board based on EXYNOS5250";
> @@ -37,6 +38,8 @@
>  		s5m8767_pmic@66 {
>  			compatible = "samsung,s5m8767-pmic";
>  			reg = <0x66>;
> +			interrupt-parent = <&gpx3>;
> +			interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> 
>  			s5m8767,pmic-buck2-dvs-voltage = <1300000>;
>  			s5m8767,pmic-buck3-dvs-voltage = <1100000>;
> --
> 1.8.3.2

I'm fine on this whole series. Applied 1 to 4, thanks.

- Kukjin
