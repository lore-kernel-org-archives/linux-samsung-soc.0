From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 10/21] panel/hv070wsa-100: add DT bindings
Date: Wed, 12 Feb 2014 12:31:17 +0100
Message-ID: <1392204688-4591-11-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19962 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752635AbaBLLc3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:29 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

The patch adds bindings to BOE HV070-WSA WSVGA panel.
Bindings are compatible with simple panel bindings.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt

diff --git a/Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt b/Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt
new file mode 100644
index 0000000..bfc20ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/boe,hv070wsa-100.txt
@@ -0,0 +1,7 @@
+BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "boe,hv070wsa-100"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
-- 
1.8.3.2
