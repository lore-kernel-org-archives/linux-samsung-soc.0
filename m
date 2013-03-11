From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] ARM: dts: add pin state information in client nodes
 for Exynos5 platforms
Date: Mon, 11 Mar 2013 10:02:24 -0700
Message-ID: <CAD=FV=Vrv1bvF0rbNkAvbX0dkJ1GxrRUUBNvHmLcWd45omRBag@mail.gmail.com>
References: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
	<1362573398-15126-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:49385 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086Ab3CKRC0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 13:02:26 -0400
Received: by mail-lb0-f180.google.com with SMTP id q12so3245451lbc.25
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Mar 2013 10:02:24 -0700 (PDT)
In-Reply-To: <1362573398-15126-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree-discuss@lists.ozlabs.org, Kukjin Kim <kgene.kim@samsung.com>, patches@linaro.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

Thomas,

Thank you for doing this!  :)

On Wed, Mar 6, 2013 at 4:36 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:>

> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 17dd951..434e440 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -35,9 +50,8 @@
>          */
>         dwmmc3@12230000 {
>                 slot@0 {
> -                       gpios = <&gpc4 0 2 0 0>, <&gpc4 1 2 3 0>,
> -                               <&gpc4 3 2 3 0>, <&gpc4 4 2 3 0>,
> -                               <&gpc4 5 2 3 0>, <&gpc4 6 2 3 0>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;

nit: Move comment about EMI to the "pinctrl@11400000" that you added
earlier in this file.  ...then move the pinctrl-names and pinctrl-0 to
"cros5250.dtsi".  This is not major and could be done in a follow-up
patch.


I done basic testing of this patch series on exynos5250-snow atop
linux-next 20130307.  By series I mean these patchwork IDs:

2224531 New          mmc: sdhci-s3c: let device core setup the default
pin configuration
2224621 New          spi: s3c64xx: let device core setup the default
pin configuration
2224731 New          input: samsung-keypad: let device core setup the
default pin configuration
2224801 New          ASoC: samsung: let device core setup the default
pin configuration
2224851 New          mmc: dwmmc: let device core setup the default pin
configuration
2225141 New          [1/2] ARM: dts: add pin state information in
client nodes for Exynos4 platforms
2225151 New          [2/2] ARM: dts: add pin state information in
client nodes for Exynos5 platforms

Tested-by: Doug Anderson <dianders@chromium.org>


This patch looks good to me with or without the above nit fix.

Reviewed-by: Doug Anderson <dianders@chromium.org>
