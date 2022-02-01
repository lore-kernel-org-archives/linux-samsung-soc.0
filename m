Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5815C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Feb 2022 11:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbiBALsf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Feb 2022 06:48:35 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38438
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237444AbiBALse (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 06:48:34 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AE67C3FFDA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Feb 2022 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643716112;
        bh=o1EGYrWsRqx/bd/p11jiwzAPNZIWt1CcXa2YB+SDcqU=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SWSrXVTQq0L6ixpRvgggDNLQXCpJvj0wMDBjexJAF1yGWDPMCxPAa8EZ0EjczDRy5
         d07Y9d794sbqTCo2xpDGbx883TUyzY7Uji7ur3MykbmsUz5il5L0vhSHBLA/dSe3Ud
         3eFpjLI/xAC2L36NF3qFlkUcg7vM8fxKXeCBjkanK4U7HChR8n9LJLvfanBP3zQb1R
         /IgM+2A88dVkO58KTMI7CRhE8ZwrRUjj+L7pE8izUfrH5HibUsgVI6+JQTwjh29cNj
         mEUZ5NQXKjsBV0LcrprAN2sFSprAw33N9Oh+5lyhJV2XN3v9FN/ZQ6tWi42Lz8OqzV
         YakTx4ToEN1KQ==
Received: by mail-ed1-f69.google.com with SMTP id w23-20020a50d797000000b00406d33c039dso8550145edi.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Feb 2022 03:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o1EGYrWsRqx/bd/p11jiwzAPNZIWt1CcXa2YB+SDcqU=;
        b=jZxWdJUlQ505a2LrvCvFbMZ22P9IHMjDbIEtybh+tMrOcOn3VH6E/087D1XXJ4cg7m
         KOM6o/jII5+xdtXLG5Hqsstb70oq11snvXhV1WW7+1D9V6kUc2hP28r38XUkx/SHLEI2
         fkL1ufizI2b4/ichJ5/LSlSbLbM/WxEUeU55qEywmz+Zzw0nLpoRJktOdoyIuBBc8WuP
         Ux4op58b3EhKjX3ssNweR9hyXh/l8Qrlxo8ESMdlgdzN7nJRtLPwtnHAkMe7K6q7ABsY
         B7lFfIrw5taFaFTnhN6mB4iOvH3sVkJTUZ5ureZk76iC5X2v0uVbqqvhDM+r9HFv1+Rl
         Mucg==
X-Gm-Message-State: AOAM531sD2XQ7TD1qqy2BOq0vUQyeAuqoalHSPqUZu6pEpOiCLL70eno
        QtT7ptbKhnR5oUE1Gg1ehEsaguyMhEWo12k6SX6haU5q1UwoHuvcmJ4XosfHYNQVQDzc4LLU3Nt
        KBSnRHIzZgACQdGarw2KfahwV094DFwNwAWKT++oKWPhaCjs/
X-Received: by 2002:a05:6402:c8f:: with SMTP id cm15mr11990023edb.142.1643716109126;
        Tue, 01 Feb 2022 03:48:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwraRAjhC9I6DY9xAnWWXt1339RlIYhSluQ5JrwhO0g6NxEHo1NIp7ivDOtxHqLqCBE3vpCHQ==
X-Received: by 2002:a05:6402:c8f:: with SMTP id cm15mr11990002edb.142.1643716108971;
        Tue, 01 Feb 2022 03:48:28 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bo19sm17954484edb.56.2022.02.01.03.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 03:48:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: memory: lpddr3: adjust IO width to spec
Date:   Tue,  1 Feb 2022 12:47:46 +0100
Message-Id: <20220201114749.88500-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
References: <20220201114749.88500-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

According to JEDEC Standard No. 209-3 (table 3.4.1 "Mode Register
Assignment and Definition in LPDDR3 SDRAM"), the LPDDR3 supports only
16- and 32-bit IO width.  Drop the unsupported others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml           | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index c8577186324a..0c8353c11767 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -34,10 +34,8 @@ properties:
     description: |
       IO bus width in bits of SDRAM chip.
     enum:
-      - 64
       - 32
       - 16
-      - 8
 
   manufacturer-id:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.32.0

