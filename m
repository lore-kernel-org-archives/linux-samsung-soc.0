From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v10 0/6] Add Maxim 77802 RTC support
Date: Fri, 19 Sep 2014 17:14:06 -0700
Message-ID: <CAD=FV=VHVWVtgOoB83cJ9XKAcyBmHwSawh2EWEZViqcQrTpQjA@mail.gmail.com>
References: <1411122377-10426-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f180.google.com ([209.85.220.180]:52050 "EHLO
	mail-vc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756538AbaITAOH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 20:14:07 -0400
Received: by mail-vc0-f180.google.com with SMTP id hq11so2578275vcb.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Sep 2014 17:14:06 -0700 (PDT)
In-Reply-To: <1411122377-10426-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Javier,

On Fri, Sep 19, 2014 at 3:26 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Andrew,
>
> This series add support for the Real Time clock present in
> the Maxim 77802 Power Managment IC. The version number is
> quite high because it previously was part of a bigger series
> [0] that aimed to add support for all the devices in the
> max77802 PMIC. But now that the max77802 dependencies were
> already merged for 3.17, the series were split but I kept
> the version numbering.
>
> While working on the max77802 rtc support a lot of feedback
> was given and the issues pointed out also apply to a driver
> for a similar PMIC RTC (max77686). So patches 01/06 to 05/06
> in the series are cleanups for the max77686 driver and patch
> 06/06 adds the support for the max77802 RTC.
>
> This version address the issues pointed out on the previous
> version [1] and changelog are present on each patch when is
> applicable.
>
> The series were tested on an Exynos5250 Snow (max77686) and
> Exynos5420 Peach Pit (max77802) machines and applies cleanly
> to both 3.17-rc1 and today's linux-next (20140919).
>
> NOTE: The patches from the previous version [1] were already
> present in the -mm tree [2] so I didn't know if I should had
> sent this as a delta or as a new revision. I decided to do
> the later but please let me know if you expected the former.

My records show that Andrew has already accepted most of these.  They
may not show up in linuxnext yet, but that doesn't mean Andrew hasn't
taken them (I think).


> Doug Anderson (1):
>   rtc: max77686: Allow the max77686 rtc to wakeup the system

    http://ozlabs.org/~akpm/mmots/broken-out/rtc-max77686-allow-the-max77686-rtc-to-wakeup-the-system.patch

> Javier Martinez Canillas (5):
>   rtc: max77686: Remove dead code for SMPL and WTSR.

    http://ozlabs.org/~akpm/mmots/broken-out/rtc-max77686-remove-dead-code-for-smpl-and-wtsr.patch

>   rtc: max77686: Fail to probe if no RTC regmap irqchip is set

    http://ozlabs.org/~akpm/mmots/broken-out/rtc-max77686-fail-to-probe-if-no-rtc-regmap-irqchip-is-set.patch

>   rtc: max77686: Remove unneded info log

    http://ozlabs.org/~akpm/mmots/broken-out/rtc-max77686-remove-unneded-info-log.patch

>   rtc: max77686: Use ffs() to calculate tm_wday

This one hasn't been accepted...

>   rtc: Add driver for Maxim 77802 PMIC Real-Time-Clock

    http://ozlabs.org/~akpm/mmots/broken-out/rtc-add-driver-for-maxim-77802-pmic-real-time-clock.patch


-Doug
