From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v6 1/5] regulator: Document binding for initial and suspend modes
Date: Mon, 10 Nov 2014 14:43:51 +0100
Message-ID: <1415627035-3088-2-git-send-email-javier.martinez@collabora.co.uk>
References: <1415627035-3088-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415627035-3088-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Some regulators can run on different operating modes (opmodes). This
allows systems to choose the most efficient opmode for each regulator.

This patch builds on top of (291d761 regulator: Document binding for
regulator suspend state for PM state) adding a regulator-initial-mode
DT property to configure at startup the operating mode for regulators
that support changing its mode during normal operation and a property
regulator-mode to be used in the regulator-state-[mem/disk] nodes for
regulators that supports changing its operating mode when the system
enters in a suspend state.

The set of possible modes that a regulator can operate depends on the
hardware capabilities so a list of generic operating modes can't be
provided. Instead, each hardware binding should define the list of
valid operating modes for the regulators found on that device.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes in v6:
 - Remove assumptions about implementation details and don't overspecify.
   Suggested by Mark Brown.

Changes in v5: None

Changes in v4: None

Changes in v3:
 - Rebased on top of regulator suspend voltage series

 Documentation/devicetree/bindings/regulator/regulator.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index 4e7ed76..abb26b5 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -30,6 +30,13 @@ Optional properties:
 	- regulator-off-in-suspend: regulator should be off in suspend state.
 	- regulator-suspend-microvolt: regulator should be set to this voltage
 	  in suspend.
+	- regulator-mode: operating mode in the given suspend state.
+	  The set of possible operating modes depends on the capabilities of
+	  every hardware so the valid modes are documented on each regulator
+	  device tree binding document.
+- regulator-initial-mode: initial operating mode. The set of possible operating
+  modes depends on the capabilities of every hardware so each device binding
+  documentation explains which values the regulator supports.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.1.0
