From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v3 0/5] S3C2443/S3C2416: Implement support for ADC
Date: Mon, 10 Oct 2011 21:46:51 +0200
Message-ID: <201110102146.51694.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:57943 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752486Ab1JJTq7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 15:46:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The adc blocks of S3C2443 and S3C2416/2450 differ in some regards
from previous (S3C2410, etc) and later (S3C64XX, S5P) SoCs.

This patch series adds support for these ADC implementations.

Each patch was compile tested. But as I have only access to S3C2416
hardware, real life testing happened only there.

Changes since v2:
Drop the quirks and follow the proposal of Kukjin Kim introducing
additional cpu types for S3C2443 and S3C2416.
S3C2443 becomes TYPE_ADCV11, as it's older than the S3C2416 implementation
and S3C2416/2450 becomes TYPE_ADCV12.

Changes since v1:
added a wrap for a line over 80 and moved the adc_setname call
to the s3c24XX.c files where all the other names are set.

Heiko Stuebner (5):
  S3C2443/S3C2416: Add adc registers
  s3c-adc: Fix mux bit modification in s3c_adc_select
  S3C24XX: Allow overriding of adc device name
  s3c-adc: Add support for S3C2443
  s3c-adc: Add support for S3C2416/S3C2450

 arch/arm/mach-s3c2416/s3c2416.c               |    3 ++
 arch/arm/mach-s3c2443/s3c2443.c               |    3 ++
 arch/arm/plat-samsung/adc.c                   |   43 ++++++++++++++++++------
 arch/arm/plat-samsung/include/plat/adc-core.h |    2 +-
 arch/arm/plat-samsung/include/plat/regs-adc.h |    3 ++
 5 files changed, 42 insertions(+), 12 deletions(-)

-- 
1.7.2.3
