Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46ACC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6611A22370
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 17:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zS+S3MTA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733304AbgKPRxM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 12:53:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731169AbgKPRxL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:53:11 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F8C620B80;
        Mon, 16 Nov 2020 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605549191;
        bh=gXkAVVfhKlBRZeGN1vo60mFg/83uv/RSUw/Yb5OPKmY=;
        h=From:To:Cc:Subject:Date:From;
        b=zS+S3MTAc9DFNrksaWP1zBb5BRJE13H9luLS1j5ItIX2MKb+QZ5+gwqiNjgftgjPK
         7tr0KIBrS4UwRykX5AHx/Z5phP3NsFKwGNkpd4CBdWxKwNeq37Z8vAqOlxH1u0EzAG
         Uw9+pl86xWkAIKHhn4rasoIZqm7vt01SwD5Tu4RA=
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
Subject: [PATCH 1/2] drm/exynos: depend on COMMON_CLK to fix compile tests
Date:   Mon, 16 Nov 2020 18:53:00 +0100
Message-Id: <20201116175301.402787-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos DRM uses Common Clock Framework thus it cannot be built on
platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/exynos/exynos_mixer.o: in function `mixer_bind':
    exynos_mixer.c:(.text+0x958): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/exynos/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6417f374b923..951d5f708e92 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC Exynos Series"
-	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	depends on OF && DRM && COMMON_CLK
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST
 	depends on MMU
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-- 
2.25.1

