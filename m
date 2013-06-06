From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 10/13] ARM: dts: Add initial device tree support for
 Exynos5420
Date: Thu, 6 Jun 2013 17:34:11 +0100
Message-ID: <20130606163411.GA23311@e106331-lin.cambridge.arm.com>
References: <1370516488-25860-1-git-send-email-chander.kashyap@linaro.org>
 <1370516488-25860-10-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:36464 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751340Ab3FFQes (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 12:34:48 -0400
Content-Disposition: inline
In-Reply-To: <1370516488-25860-10-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "t.figa@samsung.com" <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>

Hi,

> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> new file mode 100644
> index 0000000..b14e775
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -0,0 +1,40 @@
> +/*
> + * SAMSUNG SMDK5420 board device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +/dts-v1/;
> +/include/ "exynos5420.dtsi"
> +
> +/ {
> +	model = "Samsung SMDK5420 board based on EXYNOS5420";
> +	compatible = "samsung,smdk5420", "samsung,exynos5420";
> +
> +	memory {
> +		reg =	<0x20000000 0x10000000
> +			 0x30000000 0x10000000
> +			 0x40000000 0x10000000
> +			 0x50000000 0x10000000
> +			 0x60000000 0x10000000
> +			 0x70000000 0x10000000
> +			 0x80000000 0x10000000
> +			 0x90000000 0x10000000>;
> +	};

This looks a little odd. As these are continguous, you can describe them as one
bank:

	memory {
		reg = <0x20000000 0x80000000>;
	};

Mark.
