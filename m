From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 0/4] S3C2416: Enable IIS and HSSPI clocks
Date: Sun, 28 Aug 2011 20:06:31 +0200
Message-ID: <201108282006.31667.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34574 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751653Ab1H1SGu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Aug 2011 14:06:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

S3C2416/2450 (probably S3C2443 too) can use the newer style
kernel-drivers made for S3C64xx and above for their I2S and
HS-SPI controllers.

So as a first step in this direction, these patches add their
respective clocks.

The I2S clocks were simply moved from S3C2443 to s3c2443-clock.c
as they are identical on all 3 platforms.

The same is true for the HSSPI pclk which is added to s3c2443-clock.c,
as it was not defined at all yet.

The HSSPI sclk is different between 2443 and 2416 and is therefore
added to mach-s3c2416/clock.c

Changes since v1:
 fix missing static
 cleanup hsspi clk-sources
 remove collision between hsspi pclk and sclk on s3c2443

Heiko Stuebner (4):
  S3C2443: Move i2s clock definitions to common code
  S3C2443: Define constant for HSSPI pclk
  S3C2416: Add HSSPI clock sourced from EPLL
  S3C2443: Add hsspi-clock from pclk and rename unused S3C2443 hsspi
    sclk

 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
 arch/arm/mach-s3c2416/clock.c                      |   28 ++++++++++
 arch/arm/mach-s3c2443/clock.c                      |   55 +------------------
 arch/arm/plat-s3c24xx/s3c2443-clock.c              |   58 ++++++++++++++++++++
 4 files changed, 88 insertions(+), 54 deletions(-)

-- 
1.7.2.3
