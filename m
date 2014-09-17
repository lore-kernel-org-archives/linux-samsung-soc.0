From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 0/2] s3c RTC fix for Exynos Chromebooks
Date: Wed, 17 Sep 2014 13:50:31 +0200
Message-ID: <1410954633-27025-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:40138 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754313AbaIQLur (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 07:50:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Daniel Drake <drake@endlessm.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello Kukjin,

commit 546b117fdf17 ("rtc: s3c: add support for RTC of Exynos3250 SoC")
added an "rtc_src" DT property for the Samsung's S3C Real Time Clock
controller that specifies the 32.768 kHz clock that uses the RTC as
its source clock but this breaks the s3c RTC on Exynos Chromebooks
because the rtc device node does not define the "rtc_src" clock.

It was working before only because the source clock was not disabled
by the kernel since the CCF didn't know about it. But once the clock
is known, the CCF disables the clock and does not work so define the
"rtc_src" clock to make the s3c-rtc driver obtain it and kept enabled.

This series makes the s3c RTC to claim its source clock on the Snow
and Peach boards but other Samsung boards will have the same issue.

The following patches are meant to be for the 3.18 rc cycle once
3.18-rc1 is released.

Javier Martinez Canillas (2):
  ARM: dts: Add rtc_src clk for s3c-rtc on exynos Peach boards
  ARM: dts: Add rtc_src clk for s3c-rtc on exynos5250-snow

 arch/arm/boot/dts/exynos5250-snow.dts      | 5 ++++-
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 ++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

Best regards,
Javier
