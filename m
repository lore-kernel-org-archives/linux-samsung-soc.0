Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3B2C04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  9 Aug 2023 03:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjHIDpg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 23:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjHIDpf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 23:45:35 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375B0173A;
        Tue,  8 Aug 2023 20:45:34 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RLG8B1Qrsz9tDG;
        Wed,  9 Aug 2023 11:42:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:45:29 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <harry.wentland@amd.com>,
        <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <inki.dae@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <bskeggs@redhat.com>,
        <kherbst@redhat.com>, <lyude@redhat.com>, <kraxel@redhat.com>,
        <gurchetansingh@chromium.org>, <olvaffe@gmail.com>,
        <paulo.miguel.almeida.rodenas@gmail.com>, <wenjing.liu@amd.com>,
        <haoping.liu@amd.com>, <Charlene.Liu@amd.com>,
        <chiahsuan.chung@amd.com>, <george.shen@amd.com>,
        <sancchen@amd.com>, <tony.tascioglu@amd.com>,
        <jaehyun.chung@amd.com>, <tales.aparecida@gmail.com>,
        <drv@mailo.com>, <aurabindo.pillai@amd.com>,
        <quic_vpolimer@quicinc.com>, <jiasheng@iscas.ac.cn>,
        <noralf@tronnes.org>, <jose.exposito89@gmail.com>,
        <javierm@redhat.com>, <mairacanal@riseup.net>,
        <davidgow@google.com>, <arthurgrillo@riseup.net>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>,
        <virtualization@lists.linux-foundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 4/7] drm/radeon: Remove unnecessary NULL values
Date:   Wed, 9 Aug 2023 11:44:42 +0800
Message-ID: <20230809034445.434902-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/radeon/radeon_agp.c             | 2 +-
 drivers/gpu/drm/radeon/radeon_combios.c         | 6 +++---
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/radeon/radeon_agp.c
index d124600b5f58..a3d749e350f9 100644
--- a/drivers/gpu/drm/radeon/radeon_agp.c
+++ b/drivers/gpu/drm/radeon/radeon_agp.c
@@ -130,7 +130,7 @@ static struct radeon_agpmode_quirk radeon_agpmode_quirk_list[] = {
 struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct radeon_agp_head *head = NULL;
+	struct radeon_agp_head *head;
 
 	head = kzalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index 795c3667f6d6..2620efc7c675 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -863,7 +863,7 @@ struct radeon_encoder_primary_dac *radeon_combios_get_primary_dac_info(struct
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t dac_info;
 	uint8_t rev, bg, dac;
-	struct radeon_encoder_primary_dac *p_dac = NULL;
+	struct radeon_encoder_primary_dac *p_dac;
 	int found = 0;
 
 	p_dac = kzalloc(sizeof(struct radeon_encoder_primary_dac),
@@ -1014,7 +1014,7 @@ struct radeon_encoder_tv_dac *radeon_combios_get_tv_dac_info(struct
 	struct radeon_device *rdev = dev->dev_private;
 	uint16_t dac_info;
 	uint8_t rev, bg, dac;
-	struct radeon_encoder_tv_dac *tv_dac = NULL;
+	struct radeon_encoder_tv_dac *tv_dac;
 	int found = 0;
 
 	tv_dac = kzalloc(sizeof(struct radeon_encoder_tv_dac), GFP_KERNEL);
@@ -1100,7 +1100,7 @@ static struct radeon_encoder_lvds *radeon_legacy_get_lvds_info_from_regs(struct
 									 radeon_device
 									 *rdev)
 {
-	struct radeon_encoder_lvds *lvds = NULL;
+	struct radeon_encoder_lvds *lvds;
 	uint32_t fp_vert_stretch, fp_horz_stretch;
 	uint32_t ppll_div_sel, ppll_val;
 	uint32_t lvds_ss_gen_cntl = RREG32(RADEON_LVDS_SS_GEN_CNTL);
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index 601d35d34eab..c4350ac2b3d2 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -1692,7 +1692,7 @@ static struct radeon_encoder_int_tmds *radeon_legacy_get_tmds_info(struct radeon
 {
 	struct drm_device *dev = encoder->base.dev;
 	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder_int_tmds *tmds = NULL;
+	struct radeon_encoder_int_tmds *tmds;
 	bool ret;
 
 	tmds = kzalloc(sizeof(struct radeon_encoder_int_tmds), GFP_KERNEL);
@@ -1715,7 +1715,7 @@ static struct radeon_encoder_ext_tmds *radeon_legacy_get_ext_tmds_info(struct ra
 {
 	struct drm_device *dev = encoder->base.dev;
 	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder_ext_tmds *tmds = NULL;
+	struct radeon_encoder_ext_tmds *tmds;
 	bool ret;
 
 	if (rdev->is_atom_bios)
-- 
2.34.1

