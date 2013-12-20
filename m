From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: [PATCH] ARM: dts: add clock provider for mshc node for Exynos4412 SOC
Date: Fri, 20 Dec 2013 21:34:37 +0900
Message-ID: <000201cefd7f$d8b7c840$8a2758c0$%jun@samsung.com>
References: <1358764755-21470-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16881 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756837Ab3LTMej (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Dec 2013 07:34:39 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY30012BUXQE560@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Dec 2013 21:34:38 +0900 (KST)
In-reply-to: <1358764755-21470-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jh80.chung@samsung.com

Clock lookup information is required as driver can manipulate
clock rate properly.

Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
---
 arch/arm/boot/dts/exynos4412.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index ec1b166..9cbe59a 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -41,5 +41,7 @@
 		interrupts = <0 77 0>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		clocks = <&clock 301>, <&clock 149>;
+		clock-name = "biu", "ciu";
 	};
 };
-- 
1.7.0.4
