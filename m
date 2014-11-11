From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 1/4] ASoC: ALC5631/RT5631: Add device tree binding documentation
Date: Tue, 11 Nov 2014 14:28:21 +0530
Message-ID: <1415696304-12023-2-git-send-email-krishna.md@samsung.com>
References: <1415696304-12023-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8704 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751905AbaKKI67 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 03:58:59 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEV00G6VAAAC950@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Nov 2014 17:58:58 +0900 (KST)
In-reply-to: <1415696304-12023-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

Document the device tree binding for the ALC5631 codec and update vendor
specific prefix for the Realtek.

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 Documentation/devicetree/bindings/sound/rt5631.txt |   48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rt5631.txt

diff --git a/Documentation/devicetree/bindings/sound/rt5631.txt b/Documentation/devicetree/bindings/sound/rt5631.txt
new file mode 100644
index 0000000..92b986c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt5631.txt
@@ -0,0 +1,48 @@
+ALC5631/RT5631 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+  - compatible : "realtek,alc5631" or "realtek,rt5631"
+
+  - reg : the I2C address of the device.
+
+Pins on the device (for linking into audio routes):
+
+  * SPK_OUT_R_P
+  * SPK_OUT_R_N
+  * SPK_OUT_L_P
+  * SPK_OUT_L_N
+  * HP_OUT_L
+  * HP_OUT_R
+  * AUX_OUT2_LP
+  * AUX_OUT2_RN
+  * AUX_OUT1_LP
+  * AUX_OUT1_RN
+  * AUX_IN_L_JD
+  * AUX_IN_R_JD
+  * MONO_IN_P
+  * MONO_IN_N
+  * MIC1_P
+  * MIC1_N
+  * MIC2_P
+  * MIC2_N
+  * MONO_OUT_P
+  * MONO_OUT_N
+  * MICBIAS1
+  * MICBIAS2
+
+Example:
+
+alc5631: alc5631@1a {
+	compatible = "realtek,alc5631";
+	reg = <0x1a>;
+};
+
+or
+
+rt5631: rt5631@1a {
+	compatible = "realtek,rt5631";
+	reg = <0x1a>;
+};
-- 
1.7.9.5
