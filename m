From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] Odroid XU3 DTS: Hook up PWM and use it for LEDs
Date: Tue, 12 May 2015 10:37:12 +0900
Message-ID: <CAJKOXPcPGHcP26hLK0V0Rrr3ABB+HQAqQg4PpZN7ytsn2O78Qg@mail.gmail.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
	<CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>
	<84r3qmk2n6.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f49.google.com ([209.85.216.49]:45980 "EHLO
	mail-vn0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001AbbELBhN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 21:37:13 -0400
Received: by vnbg190 with SMTP id g190so10829312vnb.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2015 18:37:12 -0700 (PDT)
In-Reply-To: <84r3qmk2n6.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

2015-05-12 10:25 GMT+09:00 Peter Chubb <peter.chubb@nicta.com.au>:
>
> Krzysztof> The label for node is already specified in
> Krzysztof> exynos5420.dtsi. Don't duplicate it. Actually when
> Krzysztof> overriding nodes you should use label-convention: &pwm {
> Krzysztof> ...  };
>
> I wasn't sure whether I shouldn't have changed exynos5422.dtsi
> rather than here, and just leave the "status = 'okay'" part for this file.
>
> What do you think?  All exynos 54xx parts have the same PWM using the
> same pincontrol -- if it's enabled maybe it should be common?
>

You are actually overriding the node here, so I meant that instead of:

+       pwm: pwm@12dd0000 {
+               /*
+                * PWM 0 -- fan
+                * PWM 1 -- Green LED
+                * PWM 2 -- Blue LED
+                * PWM 3 -- on MIPI connector for backlight
+                */
+               pinctrl-0 = <&pwm0_out &pwm1_out &pwm2_out &pwm3_out>;
+               pinctrl-names = "default";
+               status = "okay";
+       };

do like:

+ &pwm {
+               /*
+                * PWM 0 -- fan
+                * PWM 1 -- Green LED
+                * PWM 2 -- Blue LED
+                * PWM 3 -- on MIPI connector for backlight
+                */
+               pinctrl-0 = <&pwm0_out &pwm1_out &pwm2_out &pwm3_out>;
+               pinctrl-names = "default";
+               status = "okay";
+       };

This does not require touching exynos5422.dtsi (there is no such file
:) ) or other DTSI.

As for generalizing this for other Exynos54xx boards - it depends if
the wires are the same. I don't know how it is connected on other
boards.
Additionally what is connected to the GPIOs of the SoC is not usually
a property of the SoC but the board. So in such case it could go to a
common-board-DTSI file for but rather not for the SoC DTSI. Also then
it would require testing on these common boards.

Best regards,
Krzysztof
