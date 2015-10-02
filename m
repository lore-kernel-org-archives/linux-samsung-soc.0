From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/3] mfd: dt-bindings: Document pulled down WRSTBI pin on
 S2MPS1X
Date: Fri, 02 Oct 2015 17:25:50 +0900
Message-ID: <1443774351-28766-2-git-send-email-k.kozlowski@samsung.com>
References: <1443774351-28766-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1443774351-28766-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Document a new Device Tree property 'samsung,s2mps11-wrstbi-ground'
indicating that WRSTBI pin of S2MPS13 PMIC is pulled down so
corresponding buck warm reset function should be disabled.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
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
