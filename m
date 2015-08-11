From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v2 1/3] mfd: documentation: dt: Document grounded ACOKB pin on S2MPS11
Date: Tue, 11 Aug 2015 19:09:04 +0900
Message-ID: <1439287746-14034-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1439287746-14034-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:36288 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933911AbbHKKKQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 06:10:16 -0400
In-Reply-To: <1439287746-14034-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anand Moon <linux.amoon@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Document a new Device Tree property 'samsung,s2mps11-acokb-ground'
indicating that ACOKB pin of S2MPS11 PMIC is connected to the ground so
the PMIC must manually set PWRHOLD bit in CTRL1 register to turn off the
power.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Lee Jones <lee.jones@linaro.org>

---

Changes since v1:
1. Split bindings documentation to separate patch (suggested by Lee).
2. Add Javier's reviewed-by and Lee's acked-by.
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 57a045016fca..90eaef393325 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -15,6 +15,10 @@ Optional properties:
 - interrupt-parent: Specifies the phandle of the interrupt controller to which
   the interrupts from s2mps11 are delivered to.
 - interrupts: Interrupt specifiers for interrupt sources.
+- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
+  connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
+  register to turn off the power. Usually the ACOKB is pulled up to VBATT so
+  when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
 
 Optional nodes:
 - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
-- 
2.1.4
