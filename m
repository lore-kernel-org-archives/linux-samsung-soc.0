Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79BDCD98CD
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344323AbjJJWvA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344327AbjJJWua (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 18:50:30 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B251A1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:16 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso63413535e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978214; x=1697583014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8meY4ujs++mlEMDCBMyLTigrPdJt2G7ihVPbm8apfRA=;
        b=PLxmRHczcbsNwPjUcY51WwgStUOpijp3hkmgJ9oekzZlnvdEkpKpDKz0rD0tQfifR2
         lt1YyFmq3zFGotTvk/9RiPpESiWSCqY+twuDEbc081Ganm5ofIFePO/AcW26e+CbJkuR
         eStSzuit3IpQYhDRmFgFY3qrfKLKDnCbTr9vfq3WIgVfXmNCLYvleBChMLgxCPYNDXqe
         xXYhSwlsusPzSHp5S7GEPQ0GJJLWEmCx/B7RWgc1RFGOm5tQFcq4cxeTpKiPPch5vIv8
         AZs2V9oV0CB8iViCFs+QzDKQg+/DYrwFPnc1LyVwiMTxe+v8YduMlOdnFbHLWCPYI83p
         ixVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978214; x=1697583014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8meY4ujs++mlEMDCBMyLTigrPdJt2G7ihVPbm8apfRA=;
        b=PDjQmCAs7byldBAFs47gsH3k5mh3ZuwXY6nnOD6lNZNp9Y8iCGH6n0p5o04ZAegOHR
         QEm9SWkLk712FU6Yv4rks604i4ag6K8eaLdFCxfcJmBK711e6JegMw4xyaG1JSaJA6DR
         /g3xVPtB053ho4WpSJcT3w15/WOAM5ETqf0vi3xqKkOOWrLW64ygNKx3EP6AeUlRLNir
         HRQPmpSJkjNHGQWhulvy4cG+5U7372zu5Gh+DcNjGEEzgOpvQoCO82s+eMa1cZjI+1UG
         dDxindnmQCxJ5HYCfhqWgzrmpWCfU4OXbqDscQHXfGB4nxP3ZZ9LO4JdwBp8Eke1QXLA
         juRQ==
X-Gm-Message-State: AOJu0YwcbgrbXx4tuJeoC+l47lB9nNzMa+So6LiukT8Lm3S8goYbaLIq
        rPPjRbwamucavWcPSuJgdt95Qg==
X-Google-Smtp-Source: AGHT+IHVgNRfg9MJFj2fa8ZrT5Dql+nbZeDpWThiGHWgaXBzyVYZ59F732rF5W+8jo4YKOodKbt5oQ==
X-Received: by 2002:a5d:680d:0:b0:319:83e4:bbbf with SMTP id w13-20020a5d680d000000b0031983e4bbbfmr18331182wru.20.1696978214311;
        Tue, 10 Oct 2023 15:50:14 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:13 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 19/20] arm64: defconfig: Enable Google Tensor SoC
Date:   Tue, 10 Oct 2023 23:49:27 +0100
Message-ID: <20231010224928.2296997-20-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the Google Tensor SoC to the arm64 defconfig

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5315789f4868..8a34603b1822 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -41,6 +41,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE_TENSOR=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
-- 
2.42.0.609.gbb76f46606-goog

