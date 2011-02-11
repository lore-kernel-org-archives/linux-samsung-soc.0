From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 1/3] ARM: S5PV210: Enable I2C0 bus on GONI board
Date: Fri, 11 Feb 2011 18:27:51 +0100
Message-ID: <1297445273-3829-2-git-send-email-s.nawrocki@samsung.com>
References: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54941 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757158Ab1BKR17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Feb 2011 12:27:59 -0500
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LGG00AXUR6KOC@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:56 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGG0042UR6KIE@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Feb 2011 17:27:56 +0000 (GMT)
In-reply-to: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Add I2C0 bus platform device for camera sensors.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <@samsung.com>
---
 arch/arm/mach-s5pv210/mach-goni.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index db16d72..7a7cf6a 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -773,6 +773,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_i2c_gpio5,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
+	&s3c_device_i2c0,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
@@ -809,6 +810,9 @@ static void __init goni_machine_init(void)
 	/* Radio: call before I2C 1 registeration */
 	goni_radio_init();
 
+	/* I2C0 */
+	s3c_i2c0_set_platdata(NULL);
+
 	/* I2C1 */
 	s3c_i2c1_set_platdata(NULL);
 	i2c_register_board_info(1, i2c1_devs, ARRAY_SIZE(i2c1_devs));
-- 
1.7.4
