Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DCDC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 16:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354120AbiBGQzn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 11:55:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382256AbiBGQlN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 11:41:13 -0500
X-Greylist: delayed 324 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 08:41:12 PST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898FFC0401D5
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 08:41:12 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id EA81F2B00137;
        Mon,  7 Feb 2022 11:35:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 07 Feb 2022 11:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=1SGLDDvT9aYX5Q4yTBAo0kI1LCc9lg
        3fqbdaIZNH59U=; b=vUGRVq6w+kT7h3rMBtL57GtHJYL8E2SSUwaEzWcHpaddKi
        Zb7nJ9ThGQ75na/JHudkcP+CHBYZEU3WVR9mvsUNrjOkuvmOVbu9jsyUefGTApe2
        LXgyGs88Vvns0oIrZjPUqBk/7n+Q0j+ddzq6I3YgJO4qmc5Ju5NGlpHGQxRil+6w
        OrDCcq5iWNEa0+YYQD8u3vm19WQkhE3ZMC3nK1dkZflEk0/5VwrFew+tKqWrUrke
        rrbAWJunS6lkJW48htP87FBonSB9vRXgBd6ROZJZ7dStOCmVCHEM1v8pwWoldwwD
        Uh5qPXESIKPl6gza+rmF/I1ObAjhA7z3Sn2XsBxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1SGLDD
        vT9aYX5Q4yTBAo0kI1LCc9lg3fqbdaIZNH59U=; b=fkGFKOx+QchCRN9F2gQ/f9
        249sVbTag7soZUqY1zgVOFaEDAXekuMaRAAG0XsYD2Kk/UIG2eE9FeUdl1+OxbvW
        IPVbkyuXFbspWWh4fQ080PJaaFWYLyIPPvmQ7hdeNuWiiY0mp998A32kzL1s6QUG
        PoEMwa7fNMvSXxDbXJ963NXara1pb3/EXTLa3Socnyr663AY2T9jkpmr/+kT2qK/
        QqKbNAjeh4ejqrS9Dn6t1ngSAI2QknowVp4Fht2PHtiaKmFrr7VnD7/YAOscJjyp
        oYFfYM88nI3GLaWhAq6YBCLSQ+kBrh3GapaOycvh/B3wJj3WLrAa+T70zrvYwHTg
        ==
X-ME-Sender: <xms:YkoBYoo0yK4FFIbWE5xhTRJF9CTJM-pF11nib-kax6N2ky6_rrvaWw>
    <xme:YkoBYup2oK0Z2hZzVOk2iuUeOmbiEjHGHQ5wGtaefLMovH79ik7l3yLim3HVLQagW
    4WEF2JOf3va23pSUgQ>
X-ME-Received: <xmr:YkoBYtM1QZtwYIhfRDA2I1KsB77431xYJ0MTfuDKMd8UHEpROiSVnlkL7XDvAFjf3SpEMVSYc_JcQejchdsHOp1b7lUFdkoNJ4pPMgs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YkoBYv7oho4-fVuju5bdR0tyJwC1hJjQcXCvd42sO0gE4BkAxeYXgg>
    <xmx:YkoBYn4sMS-NDCwdefPoxDJoCiedmjRr7EG8kKklVwd0mIbbyAT09g>
    <xmx:YkoBYvjB9w4d0G2EZNWQ27hudL3rp1xRu-edV9FoVUXXUFh6YyLrmQ>
    <xmx:YkoBYrqL8TdqQLEurbc5oZWNpxVm2Yd6HdPz81JsTuM7zAgvfdO7SIHjCmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:45 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH 10/23] drm/exynos: plane: Remove redundant zpos initialisation
Date:   Mon,  7 Feb 2022 17:35:02 +0100
Message-Id: <20220207163515.1038648-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The exynos KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in exynos_drm_plane_reset(). However, the helpers have
been adjusted to set it properly at reset, so this is not needed
anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index df76bdee7dca..3615cf329e32 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -122,7 +122,6 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 
 static void exynos_drm_plane_reset(struct drm_plane *plane)
 {
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state;
 
 	if (plane->state) {
@@ -133,10 +132,8 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 	}
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
-	if (exynos_state) {
+	if (exynos_state)
 		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
-		plane->state->zpos = exynos_plane->config->zpos;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.34.1

