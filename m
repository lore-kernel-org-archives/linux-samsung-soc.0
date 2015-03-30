From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH V2 2/2] ARM: dts: exynos5422-odroidxu3: add 'rtc_src'
 clock to rtc node
Date: Mon, 30 Mar 2015 16:43:50 +0200
Message-ID: <CAJKOXPeg7AAiY+MP0sRfP2k0iqQ3x8L0X-eDv-LZFscTK0+KeA@mail.gmail.com>
References: <55195AA4.9060205@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f45.google.com ([209.85.213.45]:33124 "EHLO
	mail-yh0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777AbbC3Onu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 10:43:50 -0400
Received: by yhpt93 with SMTP id t93so58169737yhp.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 07:43:50 -0700 (PDT)
In-Reply-To: <55195AA4.9060205@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

2015-03-30 16:16 GMT+02:00 Markus Reichl <m.reichl@fivetechno.de>:
> The Exynos5422 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
>
> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
> It is based in v4.0-rc2.
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> ---
> Changes since v1:
> 1. Dropped Documentation.
> 2. Split into 2 parts.
> ---
>
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> index a519c86..ac663ec 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> @@ -11,6 +11,7 @@
>  */
>
>  /dts-v1/;
> +#include <dt-bindings/clock/samsung,s2mps11.h>
>  #include "exynos5800.dtsi"
>
>  / {
> @@ -44,7 +45,7 @@
>         hsi2c_4: i2c@12CA0000 {
>                 status = "okay";
>
> -               s2mps11_pmic@66 {
> +               s2mps11: s2mps11_pmic@66 {

Why this is needed? This phandle is not used later.

Rest looks fine.

Best regards,
Krzysztof
