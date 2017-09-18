From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH 0/2] dwc3 on XU3 and XU4
Date: Mon, 18 Sep 2017 16:49:20 +0530
Message-ID: <CANAwSgRuDMsbFW4UTFcc4zgefLLxA-SC0cPjBBjtT8=h_+-kjA@mail.gmail.com>
References: <CGME20170918100229eucas1p24733d7108dfbcf16a59476c1efd7d56a@eucas1p2.samsung.com>
 <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36419 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753139AbdIRLTl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Sep 2017 07:19:41 -0400
In-Reply-To: <1505728934-6200-1-git-send-email-andrzej.p@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hi Andrzej,

On 18 September 2017 at 15:32, Andrzej Pietrasiewicz
<andrzej.p@samsung.com> wrote:
> Hi all,
>
> this short series addresses two issues.
>
> The first issue is devices not enumerating when connected to an Odroid XU4,
> to its 3.0 root hub. The interplay between refactoring certain parts of
> dwc3's code and handling the SUSPHY quirk results in the said problem.
> Please see: https://patchwork.kernel.org/patch/9535235/
> Actually using the quirk solves it.
>
> The second issue is devices not enumerating and/or wrongly enumerating
> as high speed instead of super speed on an Odroid XU3. There was a patch
> series from Vivek Gautam in circulation, but it got lost somehow.
> Please see:
>
> https://lkml.org/lkml/2014/9/2/166
> https://lkml.org/lkml/2015/2/2/257
>
> I adapted his patch so that it does not use a hacky solution to force
> additional initialization in order for calibration to happen.
> Instead I used the .reset() in phy_ops. I could have used the .set_mode(),
> but the calibration must happen only after dwc3_host_init() but
> phy_set_mode() is called either after of before it. With this patch
> enumeration happens correctly and a super speed device is recognized as such.
>
> Rebased onto v4.13. It also applies cleanly to Felipe's testing/next.
>
> Andrzej Pietrasiewicz (1):
>   ARM: dts: exynos: Add dwc3 SUSPHY quirk
>
> Vivek Gautam (1):
>   phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800
>
>  arch/arm/boot/dts/exynos54xx.dtsi        |   2 +
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 183 +++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/core.c                  |   8 +-
>  3 files changed, 191 insertions(+), 2 deletions(-)
>

Thanks for rending this patch series.

I would like to suggestion some more pointer to this issue.
Both the usb 2.0 phy and usb 3.0 tune and calibrate are missing in the
current driver.
Lately I have searched on this topic on github so accidentally landed on.

[0] https://github.com/wanam/Adam-Kernel-GalaxyS6-G920F/blob/master/drivers/usb/phy/phy-samsung-usb3-cal.c
[1] https://github.com/wanam/Adam-Kernel-GalaxyS6-G920F/blob/master/drivers/usb/phy/phy-samsung-usb2-cal.c

I have tried to mapped few of the change and was able to partially
stabilize the driver.

But few of the changes are mixed with other platform soc probably Exynos 5433.

Would it be possible for you to look into into this new approach to
fix and stabilize this driver.

Best Regards
-Anand Moon
