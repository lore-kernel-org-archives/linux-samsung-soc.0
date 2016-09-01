From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 5/6] ARM: dts: s3c2416: Use macros for pinctrl configuration
Date: Thu, 01 Sep 2016 12:59:41 +0200
Message-ID: <1608454.1ZuTJsprje@amdc1976>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
 <1472721715-2833-6-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51565 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754787AbcIAK7x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 06:59:53 -0400
In-reply-to: <1472721715-2833-6-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, javier@osg.samsung.com, Linus Walleij <linus.walleij@linaro.org>


Hi,

On Thursday, September 01, 2016 11:21:54 AM Krzysztof Kozlowski wrote:
> Usage of DTS macros instead of hard-coded numbers makes code easier
> to read.  One does not have to remember which value means pull-up/down
> or specific driver strength.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/s3c2416-pinctrl.dtsi | 38 ++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
> index 527e3193817f..6274359fb323 100644
> --- a/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/s3c2416-pinctrl.dtsi
> @@ -8,6 +8,8 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <dt-bindings/pinctrl/samsung.h>
> +
>  &pinctrl_0 {
>  	/*
>  	 * Pin banks
> @@ -83,91 +85,91 @@
>  
>  	uart0_data: uart0-data {
>  		samsung,pins = "gph-0", "gph-1";
> -		samsung,pin-function = <2>;
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;

Shouldn't macros that are also used by s3c* be named as
SAMSUNG_PIN_FUNC_2 etc. (s3c* SoCs are not Exynos)?

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
