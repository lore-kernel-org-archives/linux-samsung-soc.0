Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F68C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F50F60FE6
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Sep 2021 09:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237649AbhISJc5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Sep 2021 05:32:57 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36458
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235817AbhISJcv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Sep 2021 05:32:51 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2FD5A3F4B9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632043886;
        bh=kQQ3DII0goGULsKC3IpaIdAzj47jj9Kr+j3EHg4ikV4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=na/6ARgKSk4/gNsBLxTVV1GLpyaJDj6P6Z8Z3qM4BF0i81EiHJIPji7GHgLIDAPPC
         oimtHcGxbtykZ8xeNzO1APDOHWXgpvOUR+kMJTEVb3UoBc8KP8BS3HoM4PoNz9YnD+
         ng0FKOyMEdeC2RU64GZuSTgNzxcISM7vHmaFV60RNWV94c78p0BYIxHjNfhKLcAauZ
         bMTX/IcdiJPD1ZVIE0M//YoAu2HnYPW9N/IRZwsQT32QVCr9isDBf29TXbtn4qSz6Q
         EmpWVrUH6kLTXIGgflZ2JovkGMHTVd4o8EAiUbgwpqB6bK4NmcqREJrX72Pd8QuSed
         CgKcWSlw3GWfQ==
Received: by mail-ed1-f71.google.com with SMTP id q17-20020a50c351000000b003d81427d25cso6618697edb.15
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Sep 2021 02:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQQ3DII0goGULsKC3IpaIdAzj47jj9Kr+j3EHg4ikV4=;
        b=Y1GAyPatu5QoTghcR5RZX9jl7763c4Gh/WwHAyMgSVrkPdaisLh5jy3fnHl2wN9YVQ
         kA4XEpgoFRj0Qivr6lxFfXjsxNVQgDxlrLNQNcHV7gtqbPy61acupdz8HmC7AI4+0mnl
         S7Oyuc92BZVqyO5JPl9jq+3k1GuffY9zPWxCSEJJ+qXyVTC5NpF2+oAGhG9FXizloXBR
         R+pKcmsNp/jj8nP3LS0s8n2+O03O/Us3j5oRE1928GcrleoFkwEalSbDfzvSffwOIABK
         POsH3zZ2bj6+LxoQ3RKt3QM+i5bnfm8blY3n7t5w82rfKjGIQZiWnE/oVcqiRZmu7ZuC
         6u2w==
X-Gm-Message-State: AOAM533VBVLResIXYAn6zyLy7/XHWtu5mh2MhQh4zANbgqEUSQ8UTCDP
        IBd4oTdSz9mgzN0syjTqBRQpn3lN93/XDr3K+fUlIPfaid33etFiClUPWhJMhIlBXB7nDmHtswp
        7x4wOML2xQEgjuhyE7Os5Jfy1AXCaU9rIyiTxZwHqK1YNm8w8
X-Received: by 2002:a17:906:9742:: with SMTP id o2mr22771114ejy.532.1632043885747;
        Sun, 19 Sep 2021 02:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEFAa7c6Av7U5U1PtRddqgYSD610UFSt0vKxt2koSA5G3bvhYKyXN1L5uDJ1+O+zIJYe7yrQ==
X-Received: by 2002:a17:906:9742:: with SMTP id o2mr22771093ejy.532.1632043885610;
        Sun, 19 Sep 2021 02:31:25 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id p24sm514111edq.27.2021.09.19.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 02:31:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 3/3] soc: samsung: exynos-chipid: do not enforce built-in
Date:   Sun, 19 Sep 2021 11:31:14 +0200
Message-Id: <20210919093114.35987-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
References: <20210919093114.35987-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

After converting the Exynos ChipID and ASV driver to a module, allow to
actually choose it to be a module, while being a default built-in.  The
side effect is that driver could be now entirely disabled even for
kernel with ARCH_EXYNOS, but this is not a critical issue because driver
is not necessary for the proper platform boot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/mach-exynos/Kconfig | 1 -
 drivers/soc/samsung/Kconfig  | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 5a48abac6af4..30f930e20599 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -13,7 +13,6 @@ menuconfig ARCH_EXYNOS
 	select ARM_GIC
 	select EXYNOS_IRQ_COMBINER
 	select COMMON_CLK_SAMSUNG
-	select EXYNOS_CHIPID
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU
 	select EXYNOS_SROM
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index fe139f26d093..e2cedef1e8d1 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -13,8 +13,9 @@ config EXYNOS_ASV_ARM
 	depends on EXYNOS_CHIPID
 
 config EXYNOS_CHIPID
-	tristate "Exynos ChipID controller and ASV driver" if COMPILE_TEST
+	tristate "Exynos ChipID controller and ASV driver"
 	depends on ARCH_EXYNOS || COMPILE_TEST
+	default ARCH_EXYNOS
 	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
 	select MFD_SYSCON
 	select SOC_BUS
-- 
2.30.2

