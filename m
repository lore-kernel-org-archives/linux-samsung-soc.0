From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: Add Exynos5800 dt file
Date: Fri, 02 May 2014 19:03:24 +0200
Message-ID: <5363CFDC.4060109@gmail.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com> <1399035821-25096-3-git-send-email-arun.kk@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f44.google.com ([209.85.192.44]:55066 "EHLO
	mail-qg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753118AbaEBRD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 13:03:27 -0400
In-Reply-To: <1399035821-25096-3-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

Hi Arun,

On 02.05.2014 15:03, Arun Kumar K wrote:
> Most of the nodes of exynos5420 remains same for exynos5800.
> So the exynos5420.dtsi is included in exynos5800 and the changed
> node properties will be overriden.
>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5800.dtsi |   24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 arch/arm/boot/dts/exynos5800.dtsi
>
> diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
> new file mode 100644
> index 0000000..6979fc7
> --- /dev/null
> +++ b/arch/arm/boot/dts/exynos5800.dtsi
> @@ -0,0 +1,24 @@
> +/*
> + * SAMSUNG EXYNOS5800 SoC device tree source
> + *
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * SAMSUNG EXYNOS5800 SoC device nodes are listed in this file.
> + * EXYNOS5800 based board files can include this file and provide
> + * values for board specfic bindings.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include "exynos5420.dtsi"
> +
> +/ {
> +	compatible = "samsung,exynos5800", "samsung,exynos5";
> +};
> +
> +&clock {
> +	compatible = "samsung,exynos5800-clock";
> +};
>

Looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
