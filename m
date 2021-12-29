Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40D7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 12:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239185AbhL2MrQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 07:47:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39810
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238917AbhL2MrN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 07:47:13 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C78F9402EE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 12:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640782031;
        bh=b8unpukURFoj9tYv6hEHKZIOPqKdbI+UT8tS2dxzJ3A=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=R4ZIwpfuxfIM8Fel1C+ZHbPMbz/8dB64avjBxLCwqNhsguXVTn8rbVU2Vuci4ic93
         1xr6BuQMSIy3gMMjX8Gg+POP09tLBICqyiguX3eD8FZZp4eb7OmWN5hR/nfcqUKDNz
         Z6U/zv36ahIqJF2vvcPfLOkji6gVN5sKgD6WCaAJowVB6Gmt5cH+nrK7wMMVqiMhZI
         7LB+oUFscOiXd8JGDbD7u9qR60LJbRndTM0m3F/Fy+Sc4qPkqJcUe9Oyzya+1uTsy+
         SlnBKhwYdO4ZBdAqJVGi/vQtTGRTKPbHqAzegSBIBJPgeDW1r6kD5eQkauamA69bu5
         nFVLQWRtBeSkA==
Received: by mail-lj1-f197.google.com with SMTP id bn28-20020a05651c179c00b002222b4cc6d8so7202624ljb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 04:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8unpukURFoj9tYv6hEHKZIOPqKdbI+UT8tS2dxzJ3A=;
        b=KC8LQYZmGrYcqTIHM5DYcMPryGjQ3L0xx4SPJQOJmOVPDOVLK7m1qRkGsMhFf6S48u
         yW8bzDjgTwMAiY1g5kJ+L6zIPRMx2Fws/KD+IsJPTMGI7e1l2TijyqJeOaruqkeS4gBW
         LqgmLPsBu/Td36fwaoOAVf9EATnqWdf51J/RVN37zl9W4rniVQUSzHBD3ympB7JR6S2Q
         5gdhqbj4bNayws/pDVPqUDX7LDgWuA7G85gPNnu5Bicd4FBC2r9EpR+VXlsEo30P+An1
         eWKADzGpFBndwpsuxe7FNkoFk1D5DRco1MtAagQCrvKjkwhS/tTQmJh4HLcSdxljbvTl
         E2QA==
X-Gm-Message-State: AOAM530E+0MJvwd/9J5bHHLOvaF2Q8WRAydWBxnk/F5a8pZokfa9x8gT
        Hxvwn7kiNh2O2LIpGC/By0H+Y2IuOt1z2E86l9lwLFWOmbfwcsiBjBtfQ1wml1S5ei1KQ217jeJ
        uIx3vjbJn+pV5fHLE1P90LFtfQy+L4IrZJAei5sqcB6yLqrZM
X-Received: by 2002:a2e:574b:: with SMTP id r11mr16745443ljd.489.1640782027278;
        Wed, 29 Dec 2021 04:47:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLiHFDic96sN498wDn0DRNBEIHxbIVncu3lh3X6e7AC89ghZepVCvnmS0/L/+JzAFD33udSA==
X-Received: by 2002:a2e:574b:: with SMTP id r11mr16745428ljd.489.1640782027109;
        Wed, 29 Dec 2021 04:47:07 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm711158ljn.73.2021.12.29.04.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:47:06 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 5/5] MAINTAINERS: mfd: cover MAX77843 by Maxim PMIC/MUIC for Exynos boards entry
Date:   Wed, 29 Dec 2021 13:46:31 +0100
Message-Id: <20211229124631.21576-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
References: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MAX77843 is used in Exynos5433-based TM2 boards and shares some
parts of code with MAX77693 (regulator and haptic motor drivers).
Include all MAX77843 drivers in the entry for Maxim PMIC/MUIC drivers
for Exynos boards, so they will receive some dedicated review coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5f2758531bc..d1f8f312f322 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11693,8 +11693,10 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
+F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
 F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	Documentation/devicetree/bindings/mfd/max14577.txt
+F:	drivers/*/*max77843.c
 F:	drivers/*/max14577*.c
 F:	drivers/*/max77686*.c
 F:	drivers/*/max77693*.c
-- 
2.32.0

