Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D51C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbiLLScD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 13:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbiLLSbE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 13:31:04 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1E918383
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:32 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id t2so9964719ply.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xGy/dr3xnTd09Wes74zcnkCLJRPoRcwYVdKIhaAdf0A=;
        b=V9X4I7SjtEdIVDQyYAMTthUD+608KYuUl9DeFjZoiMuuWKPEt/ip0ooj8Rba4UXK/r
         f7+Pu2OQW7Z+j6ikuqr5QgP8XhJ/z9bw2XHfeiTpDFP0/RpdjhsoQX9TADEq4/u6Wk/U
         pfWgtA8qLd0VBa84jzYsaLOMNl4Vrj76ziqgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGy/dr3xnTd09Wes74zcnkCLJRPoRcwYVdKIhaAdf0A=;
        b=exDnDcn5ed6bu5MnjnEnVtoan24QiV1bBN2uIOcyUcq9V9jM4JGLTAwNSmccWoTjw0
         4WiV2+usYNCYBUPoQ5G6LRRGUR+h15FIK9/6OuFPso/MwCzrLr+Dvq5LkldsxbtBJ+Sz
         WJq0bCShzVN28kDOcFNJxSmvb2ajMnADo1AGawHCqWkoB0MXkh4PwTV9P1OjgXAlu3m5
         3TtZcOUH1BJA99k9dLgL0LvqU2aDRGtisyVLWGX+nEGWfEw7v2VQIc/y87dQXOkycYOO
         xgerYZPRZ/dW3sjJ1xFjPMB45Q5lyYaB5E48kJbgWNrwu1Rp0DLXYx2GBnKKY/Bpa8PQ
         dkeg==
X-Gm-Message-State: ANoB5plYdvWQVxjR4/PLQgAhh+wLRfdv6JRpBLCFITAk2qgcZA6uznbA
        chEdeuOkr5Aw3rtHGhssoISizw==
X-Google-Smtp-Source: AA0mqf6OZzcjGTfX6opHHMfOYHHuCamR/qjSp70OHckx4mGgPamOxz1KFTWDF91icXWcdNWynYAN8g==
X-Received: by 2002:a17:90a:c791:b0:216:ed9:cadc with SMTP id gn17-20020a17090ac79100b002160ed9cadcmr17032498pjb.21.1670869771618;
        Mon, 12 Dec 2022 10:29:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:29:30 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain 
Date:   Mon, 12 Dec 2022 23:59:20 +0530
Message-Id: <20221212182923.29155-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Split the Exynos DSI bridge chain update patches from Samsung DSIM
bridge driver for easy to apply.

Changes for v11:
- enable bridge.pre_enable_prev_first
Changes for v10:
- collect Marek.V Review tag

Any inputs?
Jagan.

Jagan Teki (2):
  drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
  drm: exynos: dsi: Restore proper bridge chain order

Marek Szyprowski (1):
  drm/bridge: tc358764: Enable pre_enable_prev_first flag

 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 9 +++++++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 5 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.25.1

