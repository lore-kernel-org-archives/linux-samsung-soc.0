Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54891C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjCLS00 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjCLS0I (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:26:08 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE9212053
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:19:54 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id da10so40255878edb.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678645110;
        h=cc:to:subject:date:from:in-reply-to:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=THHnNubc2+UuqNjcDLN8j6le5gzsAvvJJbRATCHsptA=;
        b=KdLNWvheQNnDkdC6K6DcEkMXgyWm3H6ZMt4UmeMZGwVCuiBxLAQ2AXsLS7hjnxHd3a
         NAaz8XjQG0wGPhE2Df5gWsHZCKMdrTSYNh0rtxVGyxquWDTdUNIwLEmfUcZ5srDlWJL5
         LtujHh75zoeJV509Zm4/usxgT4p8J4O/8TX+M9uSO2Z7MdHGPePiyaD3dBCShOzsQ2Es
         QV9IZ9Io0Fe8ouIsoCOp63pV968IC/UjfFeGpeYWZj4MynyYz0avGie7aqWs9eTb16Gi
         Q1ywPbnc83UkZJvVGPlXjrSyrL/cwA/f0Vn5Rwuek//BNYqMwqfrN+hQTX30hMW8Nk9L
         aKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678645110;
        h=cc:to:subject:date:from:in-reply-to:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THHnNubc2+UuqNjcDLN8j6le5gzsAvvJJbRATCHsptA=;
        b=RcSxWNIw0IBi2xomWl8GNM1am9vbhFXeKHMT8Hi1rvV+kThcMaMlPvbZaFCRn4NIDp
         dfkIyu/zKXH5kHlHnRG4Yf6U3u9So7kbj1/D5Eb025XvbOwmr8dGNMNWGue1XWL5v9Jx
         JPLRycberT+VjakGdt9mLs5XIS/eaUtOfoxubkZ6WlHQ4hfrjPImtW21iKXIOTds31Db
         wOHdKruqOvUf1puHYkXSAdeG0SKKai7FF5PtRdNJ5iNPNQvqbM0Dpa7LYlOVpIxp27dK
         60bWpZjCa730nFE5sUujmMC3N9QA9XRGJRPCCoFqbRTmppc8j8UfHjpkbz8FiC8Wc4GD
         zW+Q==
X-Gm-Message-State: AO0yUKU3h6l2wstYoeoOdez+ZvusNXnIPjqo6HjH1bgLpoD1Y42jPQj0
        K0l2wqIumHBQebdJ11jc/Wp3Mo4VwuWacpa6
X-Google-Smtp-Source: AK7set9Moi9Os6nCqNL55kt6YnIJSreULqN4bxUrc5pY0nx+g0T81URh3NySuPbcHUvZFzE4qkpFyQ==
X-Received: by 2002:a2e:990e:0:b0:292:f882:95ee with SMTP id v14-20020a2e990e000000b00292f88295eemr2286603lji.9.1678644649172;
        Sun, 12 Mar 2023 11:10:49 -0700 (PDT)
Received: from 0001-dt-bindings-exynos-dw-mshc-common-add-exynos7885-var.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id a9-20020a2eb549000000b002934d555783sm727843ljn.6.2023.03.12.11.10.48
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:10:48 -0700 (PDT)
Message-Id: <1678644516.665314-1-sleirsgoevy@gmail.com>
In-Reply-To: <1678644516.665314-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 20:58:50 +0300
Subject: [PATCH v5 1/3] dt-bindings: exynos-dw-mshc-common: add exynos7885
 variants
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some Samsung Exynos boards using the arm64 architecture have DW MMC
controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
systems the 64-bit FIFO registers must be accessed in two 32-bit halves.

Add two new compatible strings, "samsung,exynos7885-dw-mshc" and
"samsung,exynos7885-dw-mshc-smu" respectively, to denote exynos7885
boards that need this quirk. But it's very possible that all
"samsung,exynos7-dw-mshc" boards are actually affected.
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index fdaa18481..3eebaed2c 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -22,6 +22,8 @@ properties:
       - samsung,exynos5420-dw-mshc-smu
       - samsung,exynos7-dw-mshc
       - samsung,exynos7-dw-mshc-smu
+      - samsung,exynos7885-dw-mshc
+      - samsung,exynos7885-dw-mshc-smu
       - axis,artpec8-dw-mshc
 
   reg:
-- 
2.38.3


