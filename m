From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 0/8] S3C2416: Enable armdiv and armclk
Date: Wed, 28 Sep 2011 12:17:33 +0200
Message-ID: <201109281217.33813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:59830 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157Ab1I1KRs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 06:17:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

To enable cpu frequency scaling on the S3C2416/2450 it is necessary
to define the arm-divider and armclock.

The layout of the clocks (i.e. msysclk -> armdiv -> armclk) is the
same on all three architectures (S3C2443/2416/2450) and only the
possible dividers for armdiv differ.
Therefore it is possible to move the armdiv and armclk to common
code with only the divider table definition remaining in the respective
clock.c-files.
The s3c2443_common_init_clocks method is modified to make it possible
to transmit the divider table to the common code.

As the armdiv is available in common code now, the fdiv function
pointer passed to s3c2443_common_init_clocks becomes obsolete and is
therefore removed as the fclk rate can be set by a clk_get_rate call.

It works as expected on S3C2416, is compile-tested on S3C2443
and checkpatch was happy.


Heiko Stuebner (8):
  S3C2416: Add armdiv_mask constant.
  S3C2443: Add infrastructure to transmit armdiv to common code
  S3C2443: Move clk_arm and clk_armdiv to common code.
  S3C2416: Add comment describing the armdiv/armclk.
  S3C2443: Add get_rate operation for clk_armdiv
  S3C2443: handle unset armdiv values gracefully.
  S3C2443: Accommodate cpufreq frequency scheme in armdiv
  S3C2443: use clk_get_rate to init fclk in common_setup_clocks

 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
 arch/arm/mach-s3c2416/clock.c                      |   21 ++--
 arch/arm/mach-s3c2443/clock.c                      |   98 +--------------
 arch/arm/plat-s3c24xx/include/plat/s3c2443.h       |    7 +-
 arch/arm/plat-s3c24xx/s3c2443-clock.c              |  134 +++++++++++++++++++-
 5 files changed, 152 insertions(+), 109 deletions(-)

-- 
1.7.5.4
