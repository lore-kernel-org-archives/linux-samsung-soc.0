From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/5] ARM: S3C64XX: SmartQ related patches
Date: Fri, 13 Aug 2010 21:17:49 +0200
Message-ID: <4c659a5f.487e0e0a.6fff.ffffcd84@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:42912 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754460Ab0HMTRx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Aug 2010 15:17:53 -0400
Received: by eyg5 with SMTP id 5so443699eyg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Aug 2010 12:17:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, akpm@linux-foundation.org

These patches add further peripheral support to the SmartQ boards.
This was based on 320b2b8de12698082609ebbc1a17165727f4c893.

Maurus Cuelenaere (4):
  ARM: S3C64XX: Move SmartQ LCD control platform definition to shared
    file
  ARM: S3C64XX: Set wifi and iNAND as permanently connected SD devices
    on SmartQ boards
  ARM: S3C64XX: Add audio support to SmartQ
  ARM: S3C64XX: Add wifi RF kill support for SmartQ boards

Patrick Georgi (1):
  ARM: S3C64XX: Framebuffer fix for SmartQ5

 arch/arm/mach-s3c64xx/Kconfig        |    7 ++
 arch/arm/mach-s3c64xx/Makefile       |    3 +
 arch/arm/mach-s3c64xx/mach-smartq.c  |   78 +++++++++++--------
 arch/arm/mach-s3c64xx/mach-smartq5.c |   36 +--------
 arch/arm/mach-s3c64xx/mach-smartq7.c |   28 -------
 arch/arm/mach-s3c64xx/smartq-wifi.c  |  135 ++++++++++++++++++++++++++++++++++
 6 files changed, 194 insertions(+), 93 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/smartq-wifi.c
