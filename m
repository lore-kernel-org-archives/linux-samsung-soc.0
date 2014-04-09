From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v7 2/3] ARM: dts: add dts files for exynos5260 SoC
Date: Wed, 09 Apr 2014 12:29:31 +0200
Message-ID: <5345210B.5070807@samsung.com>
References: <1396519224-18712-1-git-send-email-rahul.sharma@samsung.com>
 <1396519224-18712-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62716 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaDIK3h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 06:29:37 -0400
In-reply-to: <1396519224-18712-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Arun Kumar K <arun.kk@samsung.com>

Hi Rahul,

On 03.04.2014 12:00, Rahul Sharma wrote:
> The patch adds the dts files for exynos5260.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5260-pinctrl.dtsi |  574 +++++++++++++++++++++++++++++
>   arch/arm/boot/dts/exynos5260.dtsi         |  304 +++++++++++++++
>   2 files changed, 878 insertions(+)
>   create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/exynos5260.dtsi

[snip]

> diff --git a/arch/arm/boot/dts/exynos5260.dtsi b/arch/arm/boot/dts/exynos5260.dtsi
> new file mode 100644
> index 0000000..188a2ac
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5260.dtsi
> @@ -0,0 +1,304 @@
> +/*
> + * SAMSUNG EXYNOS5260 SoC device tree source
> + *
> + * Copyright (c) 2013 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include "skeleton.dtsi"
> +
> +#include <dt-bindings/clock/exynos5260-clk.h>
> +
> +/ {
> +	compatible = "samsung,exynos5260";

Since Sachin's patches, "samsung,exynos5" compatible should be also 
added, before the more specific ones.

Best regards,
Tomasz
