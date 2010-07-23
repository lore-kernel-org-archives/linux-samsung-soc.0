From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/8] Samsung S5P SoC camera interface driver
Date: Fri, 23 Jul 2010 18:21:15 +0200
Message-ID: <1279902083-21250-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32690 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752727Ab0GWQVh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 12:21:37 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L6000A8LQRZKM20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:35 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L60002K6QRYKK@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Jul 2010 17:21:35 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hello,

This is a third version of my patch series adding support for camera interface,
video output and video processing IP contained in Samsung's S3C/S5P SoCs.

Changes since v1:
- support for multiple SoC variants through the platform device name overriding
  (S5PC100 and SPV210 version definitions included)

Changes since v2:
- reworked register definition, minor synchronization fixes, whitespace cleanup
- removed support for FIFO mode output to the lcd controller due to
  hardware limitations (removed fifo link and platform data setup code
  and v4l2_subdevice in s3c-fb driver)


The following patch series contains:

[PATCH v3 1/8] ARM: Samsung: Add register definitions for Samsung S5P SoC camera interface
[PATCH v3 2/8] v4l: Add driver for Samsung S3C/S5P SoC video postprocessor
[PATCH v3 3/8] ARM: Samsung: Add platform definitions and helpers for FIMC driver
[PATCH v3 4/8] ARM: Samsung: Add common Aquila and GONI code
[PATCH v3 5/8] ARM: s5pv210: enable FIMC on Aquila
[PATCH v3 6/8] ARM: s5pv210: enable FIMC on Goni
[PATCH v3 7/8] ARM: S5PC100: enable FIMC on SMDKC100
[PATCH v3 8/8] ARM: s5pv210: Override FIMC driver name on Aquila board


Best regards,
--
Sylwester Nawrocki
Linux Platform Group
Samsung Poland R&D Center
