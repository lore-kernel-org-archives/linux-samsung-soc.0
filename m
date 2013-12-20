From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Rename Exynos5250 ChromeOS common file
 to have exynos prefix
Date: Sat, 21 Dec 2013 08:09:36 +0900
Message-ID: <52B4CE30.6030205@samsung.com>
References: <1385381710-5212-1-git-send-email-broonie@kernel.org> <1385381710-5212-3-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:44337 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463Ab3LTXJm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 18:09:42 -0500
Received: by mail-pa0-f41.google.com with SMTP id lf10so3259232pab.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2013 15:09:42 -0800 (PST)
In-Reply-To: <1385381710-5212-3-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@linaro.org>

On 11/25/13 21:15, Mark Brown wrote:
> From: Mark Brown<broonie@linaro.org>
>
> Make it easier to notice the common file for ChromeOS devices based on
> the Exynos5250 by giving it the exynos5250 prefix that the boards have.
>
> Signed-off-by: Mark Brown<broonie@linaro.org>
> Acked-by: Tomasz Figa<t.figa@samsung.com>
> ---
>   arch/arm/boot/dts/{cros5250-common.dtsi =>  exynos5250-cros-common.dtsi} | 0
>   arch/arm/boot/dts/exynos5250-snow.dts                                   | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename arch/arm/boot/dts/{cros5250-common.dtsi =>  exynos5250-cros-common.dtsi} (100%)
>
> diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/exynos5250-cros-common.dtsi
> similarity index 100%
> rename from arch/arm/boot/dts/cros5250-common.dtsi
> rename to arch/arm/boot/dts/exynos5250-cros-common.dtsi
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index fd711e245e8d..7e2669c6f7f5 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -10,7 +10,7 @@
>
>   /dts-v1/;
>   #include "exynos5250.dtsi"
> -#include "cros5250-common.dtsi"
> +#include "exynos5250-cros-common.dtsi"
>
>   / {
>   	model = "Google Snow";

+ Doug and Olof.

Doug and Olof,

I need your ack on this. How do you think?

Thanks,
Kukjin
