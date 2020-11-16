Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C080C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE6E721527
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT7WLPG3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388157AbgKPRxP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 12:53:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:59172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388155AbgKPRxO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:53:14 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DFCC12227F;
        Mon, 16 Nov 2020 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605549194;
        bh=bQ2MzMKcYQ+8bK//MFkMkC019hY2+gnZ279dUo0eK84=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cT7WLPG3HS1njwwx9F5NI4hMdviPiBZWNzlu0oO5ZlOgHGgIFR3b4z+uYtjX7TQr5
         yX7vYzzqdF2hI4f2j9bxnqY1q695DgIbRUEkhLMzrDmBU/ZGhS020QKu4YErQZTV08
         tHBxy0UZ2Gji+2Q2rt8oXM3Ft4f06NKMzaPqaPSE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile tests
Date:   Mon, 16 Nov 2020 18:53:01 +0100
Message-Id: <20201116175301.402787-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116175301.402787-1-krzk@kernel.org>
References: <20201116175301.402787-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Ingenic DRM uses Common Clock Framework thus it cannot be built on
platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/ingenic/ingenic-drm-drv.o: in function `ingenic_drm_bind.isra.0':
    ingenic-drm-drv.c:(.text+0x1600): undefined reference to `clk_get_parent'
    /usr/bin/mips-linux-gnu-ld: ingenic-drm-drv.c:(.text+0x16b0): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/ingenic/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ingenic/Kconfig b/drivers/gpu/drm/ingenic/Kconfig
index 477d5387e43e..3b57f8be007c 100644
--- a/drivers/gpu/drm/ingenic/Kconfig
+++ b/drivers/gpu/drm/ingenic/Kconfig
@@ -4,6 +4,7 @@ config DRM_INGENIC
 	depends on DRM
 	depends on CMA
 	depends on OF
+	depends on COMMON_CLK
 	select DRM_BRIDGE
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
-- 
2.25.1

