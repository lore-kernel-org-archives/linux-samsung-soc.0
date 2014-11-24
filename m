From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH] ASoC: Arndale: Add machine device tree binding documentation
 for Arndale board
Date: Mon, 24 Nov 2014 12:21:51 +0530
Message-ID: <1416811911-21026-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33231 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219AbaKXGwR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 01:52:17 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFJ00LMN733FD00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 15:52:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

Document the device tree binding for the Arndale board based machine driver.

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 .../devicetree/bindings/sound/arndale.txt          |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/arndale.txt

diff --git a/Documentation/devicetree/bindings/sound/arndale.txt b/Documentation/devicetree/bindings/sound/arndale.txt
new file mode 100644
index 0000000..0e76946
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/arndale.txt
@@ -0,0 +1,24 @@
+Audio Binding for Arndale boards
+
+Required properties:
+- compatible : Can be the following,
+			"samsung,arndale-rt5631"
+
+- samsung,audio-cpu: The phandle of the Samsung I2S controller
+- samsung,audio-codec: The phandle of the audio codec
+
+Optional:
+- samsung,model: The name of the sound-card
+
+Arndale Boards has many audio daughter cards, one of them is
+rt5631/alc5631. Below example shows audio bindings for rt5631/
+alc5631 based codec.
+
+Example:
+
+sound {
+		compatible = "samsung,arndale-rt5631";
+
+		samsung,audio-cpu = <&i2s0>
+		samsung,audio-codec = <&rt5631>;
+};
-- 
1.7.9.5
