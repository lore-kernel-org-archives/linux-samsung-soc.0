From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos/hdmi: constify global variables
Date: Mon, 02 Nov 2015 14:16:40 +0100
Message-ID: <1446470205-15606-3-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24838 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752532AbbKBNR6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:17:58 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600KBOVLWUJ90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:17:57 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

These variables should not be modified.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index d720b77..3b92d87 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -511,15 +511,15 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
 	},
 };
 
-static const char *hdmi_clk_gates4[] = {
+static const char * const hdmi_clk_gates4[] = {
 	"hdmi", "sclk_hdmi"
 };
 
-static const char *hdmi_clk_muxes4[] = {
+static const char * const hdmi_clk_muxes4[] = {
 	"sclk_pixel", "sclk_hdmiphy", "mout_hdmi"
 };
 
-static struct hdmi_driver_data exynos5420_hdmi_driver_data = {
+static const struct hdmi_driver_data exynos5420_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
 	.phy_confs	= hdmiphy_5420_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_5420_configs),
@@ -528,7 +528,7 @@ static struct hdmi_driver_data exynos5420_hdmi_driver_data = {
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
-static struct hdmi_driver_data exynos4212_hdmi_driver_data = {
+static const struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.type		= HDMI_TYPE14,
 	.phy_confs	= hdmiphy_v14_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v14_configs),
@@ -537,7 +537,7 @@ static struct hdmi_driver_data exynos4212_hdmi_driver_data = {
 	.clk_muxes	= INIT_ARRAY_SPEC(hdmi_clk_muxes4),
 };
 
-static struct hdmi_driver_data exynos4210_hdmi_driver_data = {
+static const struct hdmi_driver_data exynos4210_hdmi_driver_data = {
 	.type		= HDMI_TYPE13,
 	.phy_confs	= hdmiphy_v13_configs,
 	.phy_conf_count	= ARRAY_SIZE(hdmiphy_v13_configs),
-- 
1.9.1
