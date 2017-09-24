From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add power button for Odroid XU3/4
Date: Mon, 25 Sep 2017 01:22:40 +0530
Message-ID: <CANAwSgREuPj5czY_Pg6NL4vxDHaWx32=4LhMWWY-=HqtCZv4zA@mail.gmail.com>
References: <CGME20170912115804eucas1p1959db12366143b87d14725e227520854@eucas1p1.samsung.com>
 <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33969 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752758AbdIXTxB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Sep 2017 15:53:01 -0400
Received: by mail-oi0-f66.google.com with SMTP id v188so2518198oia.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Sep 2017 12:53:01 -0700 (PDT)
In-Reply-To: <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Brian Kim <brian.kim@hardkernel.com>

Hi Marek/Krzysztof,

On 12 September 2017 at 17:27, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Brian Kim <brian.kim@hardkernel.com>
>
> The power button (SW2) on Odroid XU3/4 is connected to the PWRON pin
> of the S2MPS11 PMIC.
>
> The S2MPS11 datasheet says that ONOB pin operates as 'PWRON key active
> low signal'. In fact, S2MPS11 PMIC acts as a 16ms debouce filter and
> signal inverter, thus effectively repeating PWRON (active high) to ONOB
> pin (active low).
>
> ONOB PMIC pin is then connected to XEINT3 SoC pin, so we get the state
> of the power button on the gpx0-3 GPIO.
>
> This patch adds device-tree bindings for the power button of Odroid
> XU3/4 boards.
>
> Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
> [mszyprow: extended commit message, added comments and fixed minor
>  issues in the dts]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
>
> v2: fixed minor issues pointed by Krzysztof Kozlowski:
> - added comments to dts
> - extended commit message
> - removed useless interrupts property
> - used proper macros for gpios
> - removed gpio prefix
>
> v1: initial submission
> https://patchwork.kernel.org/patch/9605023/

[snip]

Is their another way to reset the S2MPS11 PMIC during software reboot.
what I mean is the clear all the previously programmed output voltage
in the internal registers.
the reason I am asking this all the peripherals attached to the board
do not reset to initial states.
for example scdard/emmc and usb ports do not reset when we performer reboot.

What would be the correct way to so reset of S2MPS11 PMIC during
software reboot.

Best Regards
-Anand
