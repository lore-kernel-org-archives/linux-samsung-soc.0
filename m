From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 20/20] MAINTAINERS: add ARM/S5PC100 and ARM/S5PC110
 architectures
Date: Fri, 20 Nov 2009 14:42:52 +0100
Message-ID: <1258724572-19176-21-git-send-email-m.szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36715 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753355AbZKTNnG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 08:43:06 -0500
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTE005KLU3QPC@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:02 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KTE00C3QU3QFQ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Nov 2009 13:43:02 +0000 (GMT)
In-reply-to: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

Add entries for the ARM S5PC100 and ARM S5PC110 architectures that are
currently being maintained by ourself.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 MAINTAINERS |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81d68d5..de7daad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -877,6 +877,22 @@ W:	http://www.fluff.org/ben/linux/
 S:	Maintained
 F:	arch/arm/mach-s3c6410/
 
+ARM/S5PC100 ARM ARCHITECTURE
+M:	Kyungmin Park <kyungmin.park@samsung.com>
+M:	Marek Szyprowski <m.szyprowski@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-s5pc100/
+
+ARM/S5PC110 ARM ARCHITECTURE
+M:	Kyungmin Park <kyungmin.park@samsung.com>
+M:	Marek Szyprowski <m.szyprowski@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm/mach-s5pc110/
+
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.6.4
