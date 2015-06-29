From: Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCHv7 05/15] input.h: add BUS_CEC type
Date: Mon, 29 Jun 2015 12:14:50 +0200
Message-ID: <1435572900-56998-6-git-send-email-hans.verkuil@cisco.com>
References: <1435572900-56998-1-git-send-email-hans.verkuil@cisco.com>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1435572900-56998-1-git-send-email-hans.verkuil@cisco.com>
Sender: linux-input-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, thomas@tommie-lie.de, sean@mess.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-samsung-soc@vger.kernel.org, lars@opdenkamp.eu, kamil@wypas.org
List-Id: linux-samsung-soc@vger.kernel.org

Inputs can come in over the HDMI CEC bus, so add a new type for this.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 include/uapi/linux/input.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 7430a3f..0af80b2 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -984,6 +984,7 @@ struct input_keymap_entry {
 #define BUS_GSC			0x1A
 #define BUS_ATARI		0x1B
 #define BUS_SPI			0x1C
+#define BUS_CEC			0x1D
 
 /*
  * MT_TOOL types
-- 
2.1.4

