From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/4] ARM: S3C24XX: cleanup debug macro/earlyprintk
Date: Thu, 24 Apr 2014 12:23:14 +0200
Message-ID: <1544889.hRy2JpKRQe@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:50962 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754234AbaDXKVL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Apr 2014 06:21:11 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Russell King <linux@arm.linux.org.uk>

This series tries to simplify the s3c24xx debug macro, removing dependencies
on mach/ includes, static mappings and finally moving it into include/debug.

The one slightly invasive change is the need for the developer to select
the uart type by himself, which gets rid of the debug macro trying to
determine the uart type itself.

But as usage of the debug-uart is not the common case - especially in a
multiplatform scenario - I didn't worry to much.

Based on 3.15-rc1 and tested on a S3C2442 Openmoko Freerunner (GTA02)


Heiko Stuebner (4):
  ARM: compressed/head.S: remove s3c24xx special case
  ARM: S3C24XX: trim down debug uart handling
  ARM: S3C24XX: use generic DEBUG_UART_PHY/_VIRT in debug macro
  ARM: S3C24XX: move debug-macro.S into the common space

 arch/arm/Kconfig.debug                           |  36 +++++++-
 arch/arm/boot/compressed/head.S                  |   5 --
 arch/arm/include/debug/s3c24xx.S                 |  46 +++++++++++
 arch/arm/mach-s3c24xx/Kconfig                    |  28 -------
 arch/arm/mach-s3c24xx/include/mach/debug-macro.S | 101 -----------------------
 5 files changed, 80 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm/include/debug/s3c24xx.S
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/debug-macro.S

-- 
1.9.0
