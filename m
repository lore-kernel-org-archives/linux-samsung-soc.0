From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: exynos5422-odroidxu3: add 'rtc_src' clock
 to rtc node
Date: Mon, 30 Mar 2015 14:17:24 +0200
Message-ID: <CAJKOXPffPgs1XUxkDTgL7aq7jZaWvrKjnLrjFfKGjuxDw_C=LA@mail.gmail.com>
References: <55192A48.3070201@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f43.google.com ([209.85.213.43]:34916 "EHLO
	mail-yh0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750938AbbC3MRZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Mar 2015 08:17:25 -0400
Received: by yhfw71 with SMTP id w71so5558550yhf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Mar 2015 05:17:24 -0700 (PDT)
In-Reply-To: <55192A48.3070201@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>
Cc: linux-samsung-soc@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

2015-03-30 12:49 GMT+02:00 Markus Reichl <m.reichl@fivetechno.de>:
>
> The Exynos5422 SoC has a s3c6410 RTC where the source clock
> is now a mandatory property.
>
> This patch fixes probe failure of s3c-rtc on Odroid-XU3 boards.
> It is based in v4.0-rc2.


Could you split this into separate patches:
1. Add S2MPS related changes clocks (this is a separate feature),
changes in documentation (if such are needed but I doubt it).
2. Fix S3C RTC.

>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../devicetree/bindings/clock/samsung,s2mps11.txt  | 67 ++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 12 ++--
>  include/dt-bindings/clock/samsung,s2mps11.h        | 23 ++++++++
>  3 files changed, 98 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
>  create mode 100644 include/dt-bindings/clock/samsung,s2mps11.h
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
> new file mode 100644
> index 0000000..46c61ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
> @@ -0,0 +1,67 @@
> +Binding for Samsung S2MPS11 32k clock generator block
> +
> +This is a part of device tree bindings of S2MPS11 multi-function device.
> +More information can be found in bindings/mfd/s2mps11.txt file.

This whole information is already present in bindings/mfd/s2mps11.txt
file. I don't think it is good to duplicate documentation. It will
double the effort of maintaining it and this way we can even introduce
incompatible differences in docs.

> +
> +The S2MPS11 contains three 32.768khz clock outputs that can be controlled
> +(gated/ungated) over I2C.
> +
> +Following properties should be present in main device node of the MFD chip.
> +
> +Required properties:
> +- #clock-cells: From common clock binding; shall be set to 1.
> +
> +Optional properties:
> +- clock-output-names: From common clock binding.
> +
> +Each clock is assigned an identifier and client nodes can use this identifier
> +to specify the clock which they consume. Following indices are allowed:
> +     - 0: 32khz_ap clock,
> +     - 1: 32khz_cp clock.
> +     - 2: 32khz_bt clock
> +
> +Clocks are defined as preprocessor macros in dt-bindings/clock/samsung,s2mps11.h
> +header and can be used in device tree sources.
> +
> +Example: Node of the MFD chip
> +
> +       s2mps11: s2mps11@66 {
> +               compatible = "samsung,s2mps11";
> +               interrupt-parent = <&wakeup_eint>;
> +               interrupts = <26 0>;
> +               reg = <0x66>;
> +               #clock-cells = <1>;
> +
> +               /* ... */
> +       };
> +
> +Example: Clock consumer node
> +
> +       foo@0 {
> +               compatible = "bar,foo";
> +               /* ... */
> +               clock-names = "my-clock";
> +               clocks = <&s2mps11 S2MPS11_CLK_32K_AP>;
> +       };
> +
> +Presently (19.3.2015) the above said is not correct yet.

I don't get it...  You are describing some kind of future here?

Best regards,
Krzysztof
