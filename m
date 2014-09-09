From: kgene@kernel.org
Subject: RE: [PATCH v2 5/7] arm64: dts: Add initial device tree support for
 EXYNOS7
Date: Tue, 09 Sep 2014 12:28:37 +0900
Message-ID: <02f801cfcbde$24a40160$6dec0420$@kernel.org>
References: <1409672143-8574-1-git-send-email-ch.naveen@samsung.com>
 <1409672143-8574-6-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13063 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753171AbaIID2j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 23:28:39 -0400
In-reply-to: <1409672143-8574-6-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, t.figa@samsung.com

Naveen Krishna Chatradhi wrote:
> 
> Add initial device tree nodes for EXYNOS7 SoC and board dts file
> to support Espresso board based on Exynos7 SoC.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/boot/dts/Makefile                    |    1 +
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |   31 +++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi         |  168 +++++++++++++++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi

[...]

> diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> new file mode 100644
> index 0000000..e593af55
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
> @@ -0,0 +1,168 @@
> +/*
> + * SAMSUNG EXYNOS7 SoC device tree source
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <dt-bindings/clock/exynos7-clk.h>
> +
> +/ {
> +	compatible = "samsung,exynos7";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;

+	#address-cells = <1>; ?

Hmm...I can't see any 64-bit address here.

> +	#size-cells = <2>;
> +

[...]

> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0x18000000>;
> +
> +		chipid@10000000 {
> +			compatible = "samsung,exynos4210-chipid";
> +			reg = <0x10000000 0x100>;
> +		};

Maybe this is not required? There is no check chipid in arm/arm64.

[...]

> +		timer {
> +			compatible = "arm,armv8-timer";
> +			interrupts = <1 13 0xff01>,
> +				     <1 14 0xff01>,
> +				     <1 11 0xff01>,
> +				     <1 10 0xff01>;

clock-frequency ?

[...]

- Kukjin
