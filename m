From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/2] ARM: S3C64XX: SmartQ: add suspend support
Date: Wed,  6 Oct 2010 01:09:49 +0200
Message-ID: <cover.1286319272.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33889 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756046Ab0JEXJ7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:09:59 -0400
Received: by eyb6 with SMTP id 6so2663757eyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:09:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

These patches add suspend support to the SmartQ (and other S3C64XX) boards.

Currently the LCD needs re-initializing when waking up, otherwise it'll just
display a WSOD.

This was tested on a SmartQ 7.

Maurus Cuelenaere (2):
  ARM: S3C64XX: Add suspend support
  ARM: S3C64XX: Add wakeup sources to SmartQ boards

 arch/arm/mach-s3c64xx/mach-smartq5.c |    1 +
 arch/arm/mach-s3c64xx/mach-smartq7.c |    1 +
 arch/arm/mach-s3c64xx/pm.c           |    3 +++
 3 files changed, 5 insertions(+), 0 deletions(-)

-- 
1.7.2.3
