Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38962C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Feb 2022 14:04:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239369AbiBFOEO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Feb 2022 09:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiBFOEN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 09:04:13 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D843CC06173B
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 06:04:12 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 375A3405B2
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644155898;
        bh=lowbJ9HbAqgBRMehsHM/qhZ+cS05q8+wNRQlqfDefTM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Bfwu4Td2Wszi8SDOx35SNxw393NLFZA0XOCYZisncnHva0IM8SA62xUb2s7ejUbAG
         t3o/p9wRX32Y8uQQlx+ulGkNCgcmrGJoLfsBBNDUIj0Gc/+LcBrc+Iqk3tkVdbQt0r
         RJEjlnHhIrlgX8W8zf/JDlntATtsdYV40Gxon+gWfB4EZRVsos8nYxN+KMRbxkezFX
         bUX+eqzWwtMJKl7cYqQcMVCMLBr+fqhkM2x8gs/Ci0ezPr5Ezgw3kTkRPhxmcpp1I9
         XTDe7ALDqClwNxwKMmFqmTQfloDLqKKrva1GQLiPgbv9mc5n+RyFF0bNUiGatef+Tj
         JVWCy309OPdYg==
Received: by mail-wm1-f69.google.com with SMTP id r8-20020a7bc088000000b0037bbf779d26so820416wmh.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 05:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lowbJ9HbAqgBRMehsHM/qhZ+cS05q8+wNRQlqfDefTM=;
        b=uGqK9+TEtEL1taxRzupLHHr6ghChAgKG6LYQrwnmp8WNk3/A/1Kgfj0M6vErL8xYOt
         cdVRdQPIYZfojOoM/VRaZC3mEUYmu3ynOf7HS1WxeiljoLizm5Yt2RZX4gCGjlDh3uan
         QehJydvcfO/woZmztDL6I9wW98gpNkUGtLF0NSF76W5WlG6KG6vIBxa8nYooUu0XPxUb
         07h6yOz4gMmSDHvgSlWq0n/yY/JqyNqidLVgiszHr4ZDnGNWVrbeuDXY5QJ4tknR+IZ9
         2Y5JgFmO4pUrXecbhkBkXvkQclnKM0AzwETk5clpTYtwPHQfLJfcrfmysuwpYW9WTqkV
         Izsw==
X-Gm-Message-State: AOAM531HzfuX1W2152fx6quyZPUe2FjRpwAdDonXU9aPYz1AW49Fbb8L
        NM6wH2q1ghdb5ylmkttIpzQQCloX6ERHfJstbOIZAqqeA/bK9zr/dNCadIVzPlz5EpyWD3FpbUf
        50p8r3Cyuvaj48HyGCJAetuTcE4fLjTuoirt1kTDSHWLkgk2V
X-Received: by 2002:a05:600c:218:: with SMTP id 24mr7316478wmi.95.1644155897618;
        Sun, 06 Feb 2022 05:58:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFbHkfXy9mwKBU3YQJK1xswUXUcJeL2qs8UreyNLnbIswkcL4WL2NExoBBoPLmzdhlDF7SCw==
X-Received: by 2002:a05:600c:218:: with SMTP id 24mr7316471wmi.95.1644155897470;
        Sun, 06 Feb 2022 05:58:17 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e9sm8296888wrg.60.2022.02.06.05.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/8] dt-bindings: memory: lpddr3: deprecate manufacturer ID
Date:   Sun,  6 Feb 2022 14:58:04 +0100
Message-Id: <20220206135807.211767-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The memory manufacturer should be described in vendor part of
compatible, so there is no need to duplicate it in a separate property.
Similarly is done in LPDDR2 bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
index d6787b5190ee..3bcba15098ea 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
@@ -40,7 +40,9 @@ properties:
   manufacturer-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
-      Manufacturer ID value read from Mode Register 5.
+      Manufacturer ID value read from Mode Register 5.  The property is
+      deprecated, manufacturer should be derived from the compatible.
+    deprecated: true
 
   revision-id:
     $ref: /schemas/types.yaml#/definitions/uint32-array
-- 
2.32.0

