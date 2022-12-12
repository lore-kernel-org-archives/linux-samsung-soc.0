Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E39DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbiLLOzX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:55:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiLLOzW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:55:22 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A30337
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id m4so12339945pls.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOete+/cDIPb7SHD7JQ+FV6lea22kcASfLRxjQgXkuU=;
        b=osnTVlUH9FvnBWkSTEZ8YnbhCKxVFasFUu8IqZ7WSUZfh1aA6bpTnJqkLyZRz3E77R
         ExpkoAn2Y0a5mmEutqqMksV74nXXAL7cmdrQIpgQDJjrFqNilB9Ft2T7WV0KtOHIZYXY
         49TvknntItq99dN+4OwtNOv/qvyyOjy3Rd4Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOete+/cDIPb7SHD7JQ+FV6lea22kcASfLRxjQgXkuU=;
        b=tOYLavDrOZ5D5MO7H8T6evx5lJJYIrqRtcGoCU//OlDkoSzyQ/5TmAmiiljkVNBDtf
         Md2sb1bsXsvWpuSGkzAeFe1upYILJyxJoJ5lmmaopLA7zpItD4k4BCrmPHkn3d8wTrSC
         2sl2sIIF0JxH1q9Bd3nLzsYFz4Hn5U/oAub/rrZhHAaLnvRd9pQrtVZc8nOcdvgtt8HY
         81KOS49MT8qUGeW4hNAypbrpJGmuP0/BdLV+e0OtZsGA9IajNQ1yBRmJruh2ob/3BhL6
         Lc93RiDfXVSrqhSESESyOATGK2QV112rrafzmCisgBHOcI7ZS56qLFx3taklZoz5+05E
         ed8Q==
X-Gm-Message-State: ANoB5pmjMm7inJmDbSgWuQfcXidCXOly+9+9JJp13XwZKcSB9HwJa9kG
        0T3sZZckW9non6+6tl5vi4q//A==
X-Google-Smtp-Source: AA0mqf64O+JwryeZ4HIgcewJKQ/FQ9AOe6MuQOsueYEOV7CvaQyiGRGuwSN19o4rN9ZTYOZBmVBWEA==
X-Received: by 2002:a17:902:6a8c:b0:185:441e:4cef with SMTP id n12-20020a1709026a8c00b00185441e4cefmr15104152plk.31.1670856921060;
        Mon, 12 Dec 2022 06:55:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 06:55:20 -0800 (PST)
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
Subject: [PATCH v10 0/3] drm: exynos: dsi: Restore the bridge chain
Date:   Mon, 12 Dec 2022 20:25:05 +0530
Message-Id: <20221212145508.15096-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Split the Exynos DSI bridge chain update patches from Samsung DSIM
bridge driver for easy to apply.

Changes for v10:
- collect Marek.V Review tag

Any inputs?
Jagan.

Jagan Teki (1):
  drm: panel: Enable prepare_prev_first flag for samsung-s6e panels

Marek Szyprowski (2):
  drm/bridge: tc358764: Enable pre_enable_prev_first flag
  drm: exynos: dsi: Restore proper bridge chain order

 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 8 ++++++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 5 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.25.1

