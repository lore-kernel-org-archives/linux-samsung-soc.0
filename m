Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417F3C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:16:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238961AbhLQQP7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238965AbhLQQP7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 11:15:59 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9325C061759
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:15:58 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id v15so4245295ljc.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lozW7GxWM/hgMQmsVnQbuh522f/jVKcFkLAm0cqTn1o=;
        b=r9cXOsQblzjc6ewE9l00CYiqf+T767vl2gLXA3XyBTwPf2WKv7ifRS1JVu5vYAM6IW
         FmsYFW+VvCfClHkhf4THZDhvSsRKQkQICSQej2fEisOJdci/NeYLAHTQe++zYs4lQpd2
         ZvNIrbfaf5A2jUtpG+IUaSb9dAi2hFMFdNZ4+8XaSMlMlawMQ1rcPjq3bf2TehoOei4n
         3/WdhDF7fw2GRtzZdTp0LWho2FxPQjy30gjSu/+7tmiTOyuLCGOYoz0E+PqF8KuDoQGV
         rQTfkXlbSmdhFYBZHSpjIfUtE/X64pl2AHvd5kplrQH74Jdu6WwKEHJN1T8Kicyt2S5f
         NRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lozW7GxWM/hgMQmsVnQbuh522f/jVKcFkLAm0cqTn1o=;
        b=ydXpL7vXryS3WBe/XcI7iQIOzYSRySLo0giD777I9OZyxD8QbpP1mtq2/hgeu7z4vr
         d2W7wkH3tuwZcy1kqJPNzJV5PYBK1GXPSI6elSYALZZxh0MqrFY8Ehv8vjclmj/81AOT
         L821co30Cl5MYNEzn7O97flQDlaNI0qUpgIlDy1JwKUMEpldFtaT8bqbAkFYcjglM0lM
         R6X4PzC4FCYBUSswN7tgGP6n0fz5/6WQs275ZoL70PZCL6tp7XLesiecvxB4b8zCyUgx
         0YdgmvreVXdUdmLN6Nky0U3CSOyXmJsP2RISkP3Wm/i4Dxu86kXHPu8M1wV028jhHZkQ
         wFMg==
X-Gm-Message-State: AOAM5320Cs/Vy02U6+ZPy3ais5/wI4o5ePXxPqDqcvhtZSwaWlVrICJ7
        Ej9pbFAelw6SLsY9Cn6fMFa8WQ==
X-Google-Smtp-Source: ABdhPJzlMt2w+xKuQB4LERlzLOFM8bOe6w7cYpxc2nTdKuq6Oj/Myef8Cqb3omSWrzIki1R8qm995g==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr3369766ljn.354.1639757757038;
        Fri, 17 Dec 2021 08:15:57 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id l6sm41150lfg.47.2021.12.17.08.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:56 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Fri, 17 Dec 2021 18:15:46 +0200
Message-Id: <20211217161549.24836-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217161549.24836-1-semen.protsenko@linaro.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add binding for the WinLink E850-96 board, which is based on Samsung
Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v4:
  - (none)

Changes in v3:
  - (none)

Changes in v2:
  - Moved Exynos850/E850-96 binding before Exynos Auto V9 entry
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d88571202713..052cd94113d4 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -205,6 +205,12 @@ properties:
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
 
+      - description: Exynos850 based boards
+        items:
+          - enum:
+              - winlink,e850-96                 # WinLink E850-96
+          - const: samsung,exynos850
+
       - description: Exynos Auto v9 based boards
         items:
           - enum:
-- 
2.30.2

