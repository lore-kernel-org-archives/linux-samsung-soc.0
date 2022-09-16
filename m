Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAE3C6FA82
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Sep 2022 18:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiIPSTl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Sep 2022 14:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiIPSTg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:19:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50162AD0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:34 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id l10so22163827plb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=iVwjyCcXp6ZrjeyHZ78gIJ/nXiFxW/73tezVWfrv0ww=;
        b=AYphd68fMq6LKatqoxZeP56/0I2eauCQip6zuxgS7zWc2xhjKl1E0jmgtdqAawtgOs
         oCUm5bDVAJLPDiyvNp8w/egh/YbV3tJmGy+9oxgjWe3b0rnLAOwyeaMDN/EYQMvB8l0Z
         Q6Psy8WUZ7ozfFx/qo82I9evPcbQ5TGoEKZVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iVwjyCcXp6ZrjeyHZ78gIJ/nXiFxW/73tezVWfrv0ww=;
        b=kbI2WP8axEJpWB0Yl3yKIfIWpx9ELmYyXr2NdWO3pZL9UhgkuQY/krYoYQ4GC2G8Fv
         irgBAfM4GBa9sa2FexCtOvpwoTYT3AM4I3zTpgODYDjZnQt7os6FQQzFHqcuNfzxhMpj
         dP3gwOCVLHqBFV4UsJr2q6YgcKHk6DKQJFZcRADBLsC/vOf0oStIfas7wuPUeB2ZVPBu
         uZ2JhcKQr53PSh5LV/fx3btCwcGc56AMBY1SF4pK2VtQAuWOiQNY8Pu2htjd7gsFcdDv
         gY4OtMfVb1sIvID1L+UUefUXofsbjSL8qsHxqJtnd9RITu1enmrwvx0OGWdsf6NRWI6v
         z/Qw==
X-Gm-Message-State: ACrzQf2Xd9kFRJOZW9xR8PcBojIVSZ26I3eviOyQnzHHzhzDNCZ4xLnf
        X918juTdAFH4Tg2DCT+zcAibxA==
X-Google-Smtp-Source: AMsMyM7PiZr4e71/MYhlnvG68Ha1QTSMyIqwUrsWz5m1aYmb8efJitWyFnrK6gry+mbUKtkRGRnM8Q==
X-Received: by 2002:a17:902:f64a:b0:172:7576:2124 with SMTP id m10-20020a170902f64a00b0017275762124mr1008348plg.155.1663352374313;
        Fri, 16 Sep 2022 11:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
        by smtp.gmail.com with ESMTPSA id d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:19:33 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 10/11] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Fri, 16 Sep 2022 23:47:30 +0530
Message-Id: <20220916181731.89764-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v5, v4:
* none

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..8efcf4728e0b 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

