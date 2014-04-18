From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH] ARM: dts: disable MDMA1 node for smdk5420 board
Date: Fri, 18 Apr 2014 22:44:48 +0900
Message-ID: <001a01cf5b0c$5ddc7d60$19957820$%jun@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28311 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbaDRNou (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 09:44:50 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4800F3EBIPTL90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Apr 2014 22:44:49 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>

This change is similar to commit 3da355c(ARM: dts: Disable MDMA1 node
for arndale-octa board). If MDMA1 region is configured with secure mode,
it makes the boot failure with the following.

Unhandled fault: imprecise external abort (0x1406) at 0x00000000

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 6910485..9a48e3f 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -373,4 +373,10 @@
 			};
 		};
 	};
+
+	amba {
+		mdma1: mdma@11C10000 {
+			status = "disabled";
+		};
+	};
 };
-- 
1.7.0.4
