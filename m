From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add power button for Odroid XU3/4
Date: Mon, 18 Sep 2017 09:37:15 +0530
Message-ID: <CANAwSgTRx3y3ehAY0W9dQ8hPR_AyvH0vr0dZKiZ5a_iYVHHX0g@mail.gmail.com>
References: <CGME20170912115804eucas1p1959db12366143b87d14725e227520854@eucas1p1.samsung.com>
 <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34132 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdIREHg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 00:07:36 -0400
Received: by mail-io0-f195.google.com with SMTP id g32so7979447ioj.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Sep 2017 21:07:36 -0700 (PDT)
In-Reply-To: <1505217474-14725-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Brian Kim <brian.kim@hardkernel.com>

Hi Marek,

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
>

Please add my

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Best Regards
-Anand Moon
