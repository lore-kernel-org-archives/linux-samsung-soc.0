From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 2/3] ARM:exynos5:dts: Bindings for clock definitions are added.
Date: Wed, 09 Jan 2013 18:24:40 +0530
Message-ID: <1357736081-19390-3-git-send-email-prasanna.ps@samsung.com>
References: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28916 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757478Ab3AIMvg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 07:51:36 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGC00LZ6ZPZONA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:51:35 +0900 (KST)
Received: from user-ubuntu.sisodomain.com ([107.108.83.235])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGC00CPHZLNZ970@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:51:35 +0900 (KST)
In-reply-to: <1357736081-19390-1-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, jhbird.choi@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

The details of "samsung,exynos-pd-clks" property is added.

Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
---
 .../bindings/arm/exynos/power_domain.txt           |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
index 5216b41..dc1e89bd 100644
--- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
@@ -12,6 +12,12 @@ Required Properties:
 Node of a device using power domains must have a samsung,power-domain property
 defined with a phandle to respective power domain.
 
+Optional Properties:
+samsung,exynos-pd-clks: After suspend-resume of system ,the clock sources of
+	few devices forming part of power domain need to be saved as they get
+	modified during power domain On->Off operation.Such clock defintions
+	are added via "samsung,exynos-pd-clks" property as strings.
+
 Example:
 
 	lcd0: power-domain-lcd0 {
@@ -26,3 +32,11 @@ Example of the node using power domain:
 		samsung,power-domain = <&lcd0>;
 		/* ... */
 	};
+
+Example of the node using power domain clock defintions:
+
+	node {
+		/* ... */
+		samsung,exynos-pd-clks = "aclk_333";
+		/* ... */
+	};
-- 
1.7.5.4
