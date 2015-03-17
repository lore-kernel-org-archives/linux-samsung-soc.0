From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: exynos5800-peach-pi: suspend/resume (still) broken
Date: Tue, 17 Mar 2015 10:35:29 -0700
Message-ID: <CAMAWPa_r04tAXAXosmLk+DfwvQV0qpD+=8O7T_pwFTAozcjOgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:34743 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753562AbbCQRfa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 13:35:30 -0400
Received: by wegp1 with SMTP id p1so13292549weg.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2015 10:35:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

I've tried suspend/resume on peach-pi using v4.0-rc4, next/master and
samsung/for-next, and it doesn't seem to work on any of them.

The first problem was the exynos DRM driver is faulting so I had to set CONFIG_\
DRM_EXYNOS=n for testing in mainline, this is fixed in -next.

Note that RTC wake from "suspend to idle" seems to work, which
suggests that the RTC wake alarms are working fine.  I tried with both
the s3c and the max77802 RTC drivers (e.g. rtcwake -d rtc0 -m freeze
-s4)

However, trying suspend to RAM (rtcwake -d rtc0 -m mem -s4), it never
resumes, and adding "no_console_suspend" doesn't give anything useful.

Anyone else having better luck with suspend/resume on peach-pi?

I also tried on exynos5422-odroid-xu3, but that doesn't seem to have
any working RTC drivers. :(

Kevin
