From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 5/7] exynos/drm: fix ddc i2c device probe failure
Date: Tue, 22 Oct 2013 15:41:06 +0530
Message-ID: <1382436668-15813-6-git-send-email-rahul.sharma@samsung.com>
References: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:12552 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752370Ab3JVJvA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 05:51:00 -0400
In-reply-to: <1382436668-15813-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Exynos hdmi ddc is a I2C device and if we register hdmi ddc
driver with id_table as NULL, cause failure in probing.

id_table field should not be NULL for i2c_driver registeration.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_ddc.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_ddc.c b/drivers/gpu/drm/exynos/exynos_ddc.c
index 6a8c84e..54ead55 100644
--- a/drivers/gpu/drm/exynos/exynos_ddc.c
+++ b/drivers/gpu/drm/exynos/exynos_ddc.c
@@ -51,12 +51,17 @@ static struct of_device_id hdmiddc_match_types[] = {
 	}
 };
 
+static struct i2c_device_id ddc_idtable[] = {
+	{ },
+};
+
 struct i2c_driver ddc_driver = {
 	.driver = {
 		.name = "exynos-hdmiddc",
 		.owner = THIS_MODULE,
 		.of_match_table = hdmiddc_match_types,
 	},
+	.id_table	= ddc_idtable,
 	.probe		= s5p_ddc_probe,
 	.remove		= s5p_ddc_remove,
 	.command		= NULL,
-- 
1.7.10.4
