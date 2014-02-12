From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFC PATCH v2 01/21] drm_mipi_dsi: add flags to DSI messages
Date: Wed, 12 Feb 2014 12:31:08 +0100
Message-ID: <1392204688-4591-2-git-send-email-a.hajda@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24978 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751878AbaBLLcI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 06:32:08 -0500
In-reply-to: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Sean Paul <seanpaul@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>

This patch adds flags field to mipi_dsi_msg structure and two flags:
- MIPI_DSI_MSG_REQ_ACK - request ACK from peripheral for given message,
- MIPI_DSI_MSG_USE_LPM - use Low Power Mode to transmit message.
The first flag is usually helpful during DSI diagnostic, the second
flag is required by some peripherals during configuration phase.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 include/drm/drm_mipi_dsi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index d32628a..7209df1 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -17,6 +17,11 @@
 struct mipi_dsi_host;
 struct mipi_dsi_device;
 
+/* request ACK from peripheral */
+#define MIPI_DSI_MSG_REQ_ACK	BIT(0)
+/* use Low Power Mode to transmit message */
+#define MIPI_DSI_MSG_USE_LPM	BIT(1)
+
 /**
  * struct mipi_dsi_msg - read/write DSI buffer
  * @channel: virtual channel id
@@ -29,6 +34,7 @@ struct mipi_dsi_device;
 struct mipi_dsi_msg {
 	u8 channel;
 	u8 type;
+	u16 flags;
 
 	size_t tx_len;
 	const void *tx_buf;
-- 
1.8.3.2
