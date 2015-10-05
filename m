From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/6] ARM: s3cxxxx: Use PWM lookup table
Date: Mon,  5 Oct 2015 14:47:11 +0200
Message-ID: <1444049237-29878-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:34091 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751672AbbJEMrU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Oct 2015 08:47:20 -0400
Received: by wicfx3 with SMTP id fx3so118064308wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Oct 2015 05:47:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Back when the PWM framework was introduced the concept of PWM lookup
tables was added to allow board code to register a table of PWM devices
and their association with consumers. The goal is to allow drivers to
use a unified method to request PWM devices. At the same time, since no
boards were exposing these tables, fallback code was kept in drivers to
allow old code to remain functional. In order to get rid of the legacy
fallback code, legacy users need to be updated to register PWM lookup
tables.

This series converts all s3c24xx and s3c64xx boards that hook up a pwm-
backlight device to use the new PWM lookup tables. All patches have been
compile-tested, but I don't have access to any of these boards, so I
couldn't verify that they really work.

Thierry

Thierry Reding (6):
  ARM: s3c24xx: h1940: Use PWM lookup table
  ARM: s3c24xx: rx1950: Use PWM lookup table
  ARM: s3c64xx: smdk6410: Use PWM lookup table
  ARM: s3c64xx: crag6410: Use PWM lookup table
  ARM: s3c64xx: hmt: Use PWM lookup table
  ARM: s3c64xx: smartq: Use PWM lookup table

 arch/arm/mach-s3c24xx/mach-h1940.c    | 10 +++++++---
 arch/arm/mach-s3c24xx/mach-rx1950.c   |  8 ++++++--
 arch/arm/mach-s3c64xx/dev-backlight.c |  4 ----
 arch/arm/mach-s3c64xx/mach-crag6410.c |  9 +++++++--
 arch/arm/mach-s3c64xx/mach-hmt.c      |  9 +++++++--
 arch/arm/mach-s3c64xx/mach-smartq.c   |  9 +++++++--
 arch/arm/mach-s3c64xx/mach-smdk6410.c |  8 +++++++-
 7 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.5.0
