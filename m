From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Odroid XU3 -- Hook up PWM and use it for LEDs
Date: Tue, 12 May 2015 11:32:16 +0900
Message-ID: <CAJKOXPfhZzDtsGBLR6pW6oLgn0ri4Xj0OgVT6c1a8gjHt=6dZg@mail.gmail.com>
References: <84vbfyk4w4.wl-peter.chubb@nicta.com.au>
	<CAJKOXPcjPOWNqBbyHLjw-1SS2GLtscgVjKFcz3EzYQKEJ5O8uQ@mail.gmail.com>
	<84r3qmk2n6.wl-peter.chubb@nicta.com.au>
	<CAJKOXPcPGHcP26hLK0V0Rrr3ABB+HQAqQg4PpZN7ytsn2O78Qg@mail.gmail.com>
	<84pp66k1aa.wl-peter.chubb@nicta.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f46.google.com ([209.85.216.46]:33541 "EHLO
	mail-vn0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbbELCcR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 May 2015 22:32:17 -0400
Received: by vnbf1 with SMTP id f1so10936541vnb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2015 19:32:16 -0700 (PDT)
In-Reply-To: <84pp66k1aa.wl-peter.chubb@nicta.com.au>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, kgene@kernel.org, linux-samsung-soc@vger.kernel.org

2015-05-12 9:29 GMT+09:00 Peter Chubb <peter.chubb@nicta.com.au>:
>
> PWM output wasn't working because it wasn't hooked up to its pincontrol.
> This patch:
>    -- hooks up PWM to its pincontrol, and documents what
>       the outputs are on the XU3
>    -- switches the LEDs that are on PWM outputs to use PWM
>       rather than GPIO.
>
> The main effect is that the brightness of the LEDs can be controlled, and
> user-mode fan control is enabled via /sys/class/pwm
>
> Signed-off-by: Peter Chubb <peter.chubb@nicta.com.au>

The patch looks good (although a tested-by from someone would be nice):
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

The subject should be something like
 - ARM: dts: exynos5422-odroidxu3: Hook up PWM and use it for LEDs
 - ARM: dts: Hook up PWM and use it for LEDs in exynos5422-odroidxu3

but that can be fixed when applying, so no need to resend.

Best regards,
Krzysztof
