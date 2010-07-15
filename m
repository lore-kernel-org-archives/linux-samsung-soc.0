From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2] Samsung S5P SoC camera interface driver
Date: Thu, 15 Jul 2010 11:10:31 +0200
Message-ID: <1279185041-6004-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26293 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834Ab0GOJKy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jul 2010 05:10:54 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L5L0058NDI0PV60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:49 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L5L00MUSDHY4J@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:46 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hello,

This is a second version of my patch series adding support for
camera interface, video output and video processing contained 
in Samsung's S3C/S5P SoCs.

The first version can be found at:
 http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg01698.html

Changes since v1:
- support for multiple SoC variants through the platform device name overriding
  (S5PC100 and SPV210 version definitions included)


Kernel tree
-----------------

This patch series has been prepared in assumption that the following
patches for s3c-fb driver have been applied:

http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg02000.html 
[PATCH v4 0/19] Various s3c-fb updates


Patches
-----------------

The following patch series contains:

[PATCH 01/10 v2] ARM: Samsung: Add FIMC register and platform definitions
[PATCH 02/10 v2] ARM: Samsung: Add FIMC resource definition and FIMC driver platform helpers
[PATCH 03/10 v2] ARM: Samsung: Add platform definitions for local FIMC/FIMD fifo path
[PATCH 04/10 v2] v4l: Add Samsung FIMC (video postprocessor) driver
[PATCH 05/10 v2] s3c-fb: Add v4l2 subdevice to support framebuffer local fifo input path
[PATCH 06/10 v2] ARM: S5PV210: Add fifo link definitions for FIMC and framebuffer
[PATCH 07/10 v2] ARM: S5PV210: add common Aquila & GONI code
[PATCH 08/10 v2] ARM: S5PV210: enable FIMC on Aquila
[PATCH 09/10 v2] ARM: s5pv210: enable FIMC on Goni
[PATCH 10/10 v2] ARM: S5PC100: enable FIMC on SMDKC100


Best regards,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
