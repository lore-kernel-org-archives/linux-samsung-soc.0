From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: [PATCH 1/2] drm: Include ddc adapter pointer in struct drm_connector
Date: Tue, 25 Jun 2019 11:46:35 +0200
Message-ID: <04382593e44ac3f69cd63adfe0dd0660dc32a722.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561452052.git.andrzej.p@collabora.com>
References: <cover.1561452052.git.andrzej.p@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kernel@collabora.com, m.szyprowski@samsung.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add generic code which creates symbolic links in sysfs, pointing to ddc
interface used by a particular video output. For example:

ls -l /sys/class/drm/card0-HDMI-A-1/i2c-2
lrwxrwxrwx 1 root root 0 Jun 24 10:42 /sys/class/drm/card0-HDMI-A-1/i2c-2 \
	-> ../../../../soc/13880000.i2c/i2c-2

This makes it easy for user to associate a display with its ddc adapter
and use e.g. ddcutil to control the chosen monitor.

This patch adds an i2c_adapter pointer to struct drm_connector. Particular
drivers can then use it instead of using their own private instance. If a
connector contains a ddc, then create a symbolic link in sysfs.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_sysfs.c |  9 +++++++++
 include/drm/drm_connector.h | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index ad10810bc972..627f8ebfc87a 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -294,6 +294,10 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	/* Let userspace know we have a new connector */
 	drm_sysfs_hotplug_event(dev);
 
+	if (connector->ddc)
+		return sysfs_create_link(&connector->kdev->kobj,
+				 &connector->ddc->dev.kobj,
+				 connector->ddc->dev.kobj.name);
 	return 0;
 }
 
@@ -301,6 +305,11 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
 {
 	if (!connector->kdev)
 		return;
+
+	if (connector->ddc)
+		sysfs_remove_link(&connector->kdev->kobj,
+				  connector->ddc->dev.kobj.name);
+
 	DRM_DEBUG("removing \"%s\" from sysfs\n",
 		  connector->name);
 
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ca745d9feaf5..1ad3d1d54ba7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -23,6 +23,7 @@
 #ifndef __DRM_CONNECTOR_H__
 #define __DRM_CONNECTOR_H__
 
+#include <linux/i2c.h>
 #include <linux/list.h>
 #include <linux/llist.h>
 #include <linux/ctype.h>
@@ -1308,6 +1309,16 @@ struct drm_connector {
 	 * [0]: progressive, [1]: interlaced
 	 */
 	int audio_latency[2];
+
+	/**
+	 * @ddc: associated ddc adapter.
+	 * A connector usually has its associated ddc adapter. If a driver uses
+	 * this field, then an appropriate symbolic link is created in connector
+	 * sysfs directory to make it easy for the user to tell which i2c
+	 * adapter is for a particular display.
+	 */
+	struct i2c_adapter *ddc;
+
 	/**
 	 * @null_edid_counter: track sinks that give us all zeros for the EDID.
 	 * Needed to workaround some HW bugs where we get all 0s
-- 
2.17.1
