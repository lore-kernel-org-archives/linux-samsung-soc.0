Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1596C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:36:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9529561090
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:36:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344437AbhIXNiV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:38:21 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38016
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346703AbhIXNh7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:37:59 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4EB85402CF
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490585;
        bh=S6Kt/t1TSGyeiJtJgoFpkmvIPh9xU6Dr0xsilHYx1x4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=YVu1wkd3juuiuIsSYlHezkrgIfTumH6d03suWRQzi/Ldjf8fNK6Ys9pQO8QW8cmMi
         P8tI4YKBIP6m9zZ3UaCg1OFzzV0vJqzN5v7LTIeVs6j6HpwcF5ZRKLs3DlnhrBuvUy
         BRm0z3vjHV3mS/8lIdklSgzfArHwSri1eYW5z2nr2kFkRQ+cDFOZtYhS3oS7A7GR9L
         kPJjk60gP1P7cp+wr44lwhqxW2PUUQwq21M4if6Pt4UlfifuW9GpbluP1o9TzEqjMT
         0kxM/ehz4TYcC7p08L2pJqJnpjoFArPC11DZuvcpOBtspd1f1JVjVAZcuKJyzZ6PzX
         lFNZB/D2bCeTA==
Received: by mail-wr1-f71.google.com with SMTP id c15-20020a5d4ccf000000b0015dff622f39so8049063wrt.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6Kt/t1TSGyeiJtJgoFpkmvIPh9xU6Dr0xsilHYx1x4=;
        b=ysGWcKdRN9YpNp317gYmOKZuxNfH5jG0z1LltzBxPi0Snvz34BxJ0BSFwPqm4G5dY8
         ynxj0chuvUEm0AxwxO1dt0hM5VgcxyKnl8PaNQsMKa5u3nsvcik8e/BavWJFEWC5E/o0
         c6IyMlhEZZEgRBdDWVsvoGfx8ghq6zXiHzScRTGdTyrbMIq+ZZ/9gOgIIWUpafBOwh1g
         qlHOzVa85tvV886QATEaZkg5D2IiDbTVOMCPhMUK7vlP6mtvZRnKhVNbdnpehLYmqpfD
         j2yfJgsLnl4Rbgk73F80T6ELI/7nUtZK+wv033AW0GIxMl44xjq1uSrKDiV0qGZYKW3s
         p6ow==
X-Gm-Message-State: AOAM531jo7Fr4iyzBatLT3f2O/EBAF7zQUXDQQ+xx40hKxYm08/yQ0/S
        Uid7BIPh/JVAcnpJZovksvb1Iyv5SEFFeNBjnoOyUC/LV4EP7zBF2shQgepF81ae1guVp5qqn9u
        g+DEjE7IJTgNzfdJnGgYYR5841bhEqkBhJpxq9EFowGG8v6za
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr2117099wml.167.1632490584120;
        Fri, 24 Sep 2021 06:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI1yh/i/veV4CX3x/B+5KadPo5GhYE/87Z36LyePhdH5qhrHtk2EOcRVEL6+fCnuWBNcRmpA==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr2117071wml.167.1632490583780;
        Fri, 24 Sep 2021 06:36:23 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d70sm8377400wmd.3.2021.09.24.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:36:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: exynos: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:35:49 +0200
Message-Id: <20210924133550.112488-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e17790fe35a7..1df19ccc310b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -615,7 +615,10 @@ config I2C_EXYNOS5
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	default y if ARCH_EXYNOS
 	help
-	  High-speed I2C controller on Exynos5 and newer Samsung SoCs.
+	  High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
+	  Exynos5250, Exynos5260, Exynos5410, Exynos542x, Exynos5800,
+	  Exynos5433 and Exynos7.
+	  Choose Y here only if you build for such Samsung SoC.
 
 config I2C_GPIO
 	tristate "GPIO-based bitbanging I2C"
-- 
2.30.2

