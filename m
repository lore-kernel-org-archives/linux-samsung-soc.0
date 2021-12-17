Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D377C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbhLQBq0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbhLQBqY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:46:24 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1119C06175B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:22 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id b19so893614ljr.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VcLGSgV6/NSps52EShuns7K7yBcmStDgIhJiXXEDqLA=;
        b=DmYHqFLGBjjHzA36/wA8dhtzvkCIhDKoDDxGNC54ODGq9kbmNcLc7uhhsKwca3WzhQ
         9UVcNINeXxYsC/C/126muLfE0kPsd0wmyCrgbpNRwKolaO7CYhkJAKQ8C8aeE+F8YNk2
         mdJZoeeI7GYYTLFE6L9wwBUxLRp3d5DjG6XVhAIGyBRIhiaydpgYPpAiIkD8FYSHKPIC
         VNk3SQF0w140bS+TeG1qxtLVt4DXb386Xak3YJ75YV0vmnWN7Ezjkh82YOFMp3zhzqSz
         J1G/z5S6HTMt4XGpqoRGq3kvbiTjRdGN+pSaAEtVL4piPljsMdUbgWK10o+siLsCZpBD
         dt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VcLGSgV6/NSps52EShuns7K7yBcmStDgIhJiXXEDqLA=;
        b=Mi+e9YNqo6fyTpAfnntNT81l14+AIKR6xZGbtB8KVmTDiDYcTlsN/lGNVhq+FugNa6
         IYPVjAiKRaRn1m1jSX4grMm0zwm04YI1WeDhuPsJrR3qdSUO0VBgdKGLu5ktow4GgDUO
         f6N0kJdCy9vZ+jAyDf256sHWBP1FqP4j/1OAaThLQcz97iwtfXBQqc9d/h7pF0ZaX5m2
         ArV8i9aTNyr6FxImsLNfQffm7bj+9XKNECzd39V76b0ti0FdGe5x1suGrrT5zwIjr6St
         fLjl+IYdFkOPquDeYuCBAMoJsGf3fmtI29Vj7hoy3nfqGKl1/daUXi4Z4mHOK8u9cQuj
         F8MA==
X-Gm-Message-State: AOAM530ssGe/ObS+Htf3QGSfcZmDtI/W3zLR4lXo563zK2G9xFwf7n3W
        lBN3XKXdQLmxPYGy2ucAThYnpQ==
X-Google-Smtp-Source: ABdhPJzq55H+PxOli9A5MPidjCbrvGksaEn8lXcFujTLV0gKbSPpqogVMOILGkXbr9q/jnnGd/+JgQ==
X-Received: by 2002:a2e:9017:: with SMTP id h23mr742594ljg.13.1639705581030;
        Thu, 16 Dec 2021 17:46:21 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m9sm1428853ljp.79.2021.12.16.17.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:20 -0800 (PST)
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
Subject: [PATCH v3 4/7] dt-bindings: arm: samsung: Document E850-96 board binding
Date:   Fri, 17 Dec 2021 03:46:10 +0200
Message-Id: <20211217014613.15203-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217014613.15203-1-semen.protsenko@linaro.org>
References: <20211217014613.15203-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add binding for the WinLink E850-96 board, which is based on Samsung
Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

