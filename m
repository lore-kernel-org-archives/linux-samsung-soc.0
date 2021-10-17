Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994CBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 10:12:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74F5A61244
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 17 Oct 2021 10:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241739AbhJQKOm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 17 Oct 2021 06:14:42 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58822
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234709AbhJQKOm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 06:14:42 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 458DE3FFF9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634465552;
        bh=elX2pBDZzaz8eqhk96ts7Ds6K1T0utB9mlEa7CNLq5A=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=qaLcUjsCHb0vV5hyc5l3Ni4x3iRL3/wAAdFcPle1yuSxs3nYDmtvK7HHs7zlWrDi7
         XrCsyX/2Zxxirt6iolNcSZPL0Gk0kQ4/QdwEHD6/9UFu7GJ2qTN+M88tJEOi2/rzbQ
         rB/dneZYL+1IGG/miRkVx7XTlo2my5TR41eP2JWn7XyRAV69z6GY1qEl/Vgz68bqID
         GPxWgWrfv3/cZtW20Gr2LuKdRjbBMCCYrGDkersD2kByFIZHFwHCOkOBR2TcQ6XOXg
         QSEobttKZZaB0y6glsiXkACpkJ2B6jYrl4kunavo5XOJWWi7Xr/1D021ILlmkVPakU
         NwCpVK0S0EmaQ==
Received: by mail-lj1-f200.google.com with SMTP id 132-20020a2e058a000000b00210aeaca823so263409ljf.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 03:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=elX2pBDZzaz8eqhk96ts7Ds6K1T0utB9mlEa7CNLq5A=;
        b=UJB5EtwK2b0qhzfEDvqKkbKtkfw+508qIwrBTSDOBAfH3X8iN5WiZn1UsSM6+1NdYl
         OR/MJVtLpQovi1dFqMgNlccv4Uz7Xas2IUcu2z2ZOWchoj1tMCa22v4YyxaPxqTJWPWQ
         yd1US2/ICAjyKCEdQnWa9zm+CvkfmVwdaBF8tTYnDJZUWE+FBLmVbMVGA+28ERuMsFfu
         qmOpzib2nrIB2H/+5eAydlp0UyQ92gLemw7EuJzolooRjI2PtdJMV2p6guiqMbF1hX9/
         XE0PBn5GyjnjhNz6BWKKcRHILnqF4U/htn5SQXtCOSpA5M9qSNqS682Bkco4W2wNBCHy
         HjCA==
X-Gm-Message-State: AOAM53393//mbAeXvHnV+PGSn/iL0kOIB4qnWaYkDubKEJvV5SeJWrat
        YVgivJiwhyvmubM9wC99HzkxyrgFwkEENsuHEBHzICX1CQaIfgK60B6kqB9K1NtJ0sJhklckPb5
        YzezibkFrZz+rk73OPoT5AHCO97veeVxvbLQQgzwTMuN/lZnd
X-Received: by 2002:a05:6512:988:: with SMTP id w8mr21250566lft.361.1634465551541;
        Sun, 17 Oct 2021 03:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3IsWFOQ9rmXJOqYrT0Qx7hM86wCCMZBN6puet5W+1YsvKevv/Kz/o+HT5Me2RmPCBTDHTTg==
X-Received: by 2002:a05:6512:988:: with SMTP id w8mr21250548lft.361.1634465551358;
        Sun, 17 Oct 2021 03:12:31 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o26sm1263077ljg.92.2021.10.17.03.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 03:12:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 1/3] arm64: dts: exynos: add 'chassis-type' property
Date:   Sun, 17 Oct 2021 12:12:26 +0200
Message-Id: <20211017101228.19478-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

A new 'chassis-type' root node property has recently been approved for
the device-tree specification.

Add this property for end-user devices (such as laptops,
smartphones and tablets) based on Samsung Exynos ARM64 SoCs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts  | 1 +
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
index fdd0796b29d4..aca01709fd29 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
@@ -13,6 +13,7 @@
 / {
 	model = "Samsung TM2 board";
 	compatible = "samsung,tm2", "samsung,exynos5433";
+	chassis-type = "handset";
 };
 
 &cmu_disp {
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
index 089fc7a1af67..22d26460f3dd 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts
@@ -13,6 +13,7 @@
 / {
 	model = "Samsung TM2E board";
 	compatible = "samsung,tm2e", "samsung,exynos5433";
+	chassis-type = "handset";
 };
 
 &cmu_disp {
-- 
2.30.2

