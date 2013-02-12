From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 0/3] ARM: S3C24XX: integrate special s3c2412 eint handling
Date: Tue, 12 Feb 2013 01:02:03 +0100
Message-ID: <201302120102.03511.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:38286 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760234Ab3BLACM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 19:02:12 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This series is meant to go on top of the recent basic integration of the
s3c2412, s3c2440 and s3c2442 and implements the last necessary change by
making the overrides of the eints 0 to 3 on the s3c2412 unnecessary.

After this everything is handled using the new structure.


Heiko Stuebner (3):
  ARM: S3C24XX: include first 4 bits of the eint register in irq mapping
  ARM: S3C24XX: add soc_is_s3c2412 option
  ARM: S3C24XX: handle s3c2412 eints using new infrastructure

 arch/arm/mach-s3c24xx/include/mach/irqs.h |   58 +++++++------
 arch/arm/mach-s3c24xx/irq.c               |  127 +++++++++--------------------
 arch/arm/plat-samsung/include/plat/cpu.h  |   10 +++
 drivers/gpio/gpio-samsung.c               |    5 +-
 4 files changed, 83 insertions(+), 117 deletions(-)

-- 
1.7.2.3
