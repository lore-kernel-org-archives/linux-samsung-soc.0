From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/6] ARM: SAMSUNG: Fix platform data setup for I2C adapter 0
Date: Wed, 25 Jan 2012 15:23:27 +0100
Message-ID: <1327501407-1927-7-git-send-email-s.nawrocki@samsung.com>
References: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20544 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036Ab2AYOXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 09:23:55 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYC002PBYNR9Q60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYC0001UYNRPP@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
In-reply-to: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The common static default_i2c_data structure gets bus_num set by each
s3c_i2c?_set_platdata() call, except for s3c_i2c0_set_platdata(). Thus
if for instance s3c_i2c1_set_platdata() is called prior to
s3c_i2c0_set_platdata() the I2C0 controller has bus_num set to wrong value
of 1, i.e. the one from previous set_platdata call. Fix this by also setting
bus_num for I2C0.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/devs.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 145580a..eed8de3 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -496,8 +496,10 @@ void __init s3c_i2c0_set_platdata(struct s3c2410_platform_i2c *pd)
 {
 	struct s3c2410_platform_i2c *npd;
 
-	if (!pd)
+	if (!pd) {
 		pd = &default_i2c_data;
+		pd->bus_num = 0;
+	}
 
 	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
 			       &s3c_device_i2c0);
-- 
1.7.8.3
