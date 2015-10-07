From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] mfd: dt-bindings: Document pulled down WRSTBI pin on
 S2MPS1X
Date: Wed, 07 Oct 2015 09:44:40 +0900
Message-ID: <1444178681-16188-2-git-send-email-k.kozlowski@samsung.com>
References: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30608 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752797AbbJGApF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Oct 2015 20:45:05 -0400
In-reply-to: <1444178681-16188-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Inki Dae <inki.dae@samsung.com>

Document a new Device Tree property 'samsung,s2mps11-wrstbi-ground'
indicating that WRSTBI pin of S2MPS13 PMIC is pulled down so
corresponding buck warm reset function should be disabled.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changs since v1:
None.
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 90eaef393325..890f0b0e1643 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -19,6 +19,9 @@ Optional properties:
   connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
   register to turn off the power. Usually the ACOKB is pulled up to VBATT so
   when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
+- samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC is pulled
+  down. When the system is suspended it will always go down thus triggerring
+  unwanted buck warm reset (setting buck voltages to default values).
 
 Optional nodes:
 - clocks: s2mps11, s2mps13 and s5m8767 provide three(AP/CP/BT) buffered 32.768
-- 
1.9.1
