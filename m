Return-Path: <SRS0=oj0V=D7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2BFC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD10A22257
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAIIvH/E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762098AbgJXOpC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 24 Oct 2020 10:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762092AbgJXOpB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:45:01 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A99FC0613D2;
        Sat, 24 Oct 2020 07:45:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c194so5465207wme.2;
        Sat, 24 Oct 2020 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkB/W6j34m8MxpDuONFe4eaEhdd4FhVEPHJhHjdot74=;
        b=fAIIvH/Em2YtPcqL4aCtWxK0kOjy2QWlXniujLqIvNBHtTWwA6YqiSp2amB1kFGKYs
         tx4gCvGcLZgNWzwc3wg5HvmB8MozYzZ23/Fds00qrC57NZkAor+pVepAVPqqI4qpu4vS
         0IuqkyGxdOURhDBypIn6mKFIQcbTBrT/MY3qVQm3bZE6rVDoRp4yGTU25ryQhWLiN92c
         oKtLQ883U+GFM9sXgyeCDjtJ/k1zRcc96sf8gVQsL5qGY6vejTB0vZOjYnQBAvAIY0pl
         OX7ugPUvTAeRoS1lCi4mBEtsftdOha/kwdzSC7cpNJMekqUKz8oWTxv8wc/qa65A/qzw
         PRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkB/W6j34m8MxpDuONFe4eaEhdd4FhVEPHJhHjdot74=;
        b=nwNdVhzSftjfRehGE33pKoGKOjvKYxP0LdT9xFUm4l3FvkDJJ9jbE4wIFwmG+aByK0
         qHfPF2fZAFzLweVJiCjmxXoHcB/OqEFNHkZykPAapD97+OJsl5AhUa+6VebBedKOSeqg
         wMeLUPuvHD5ij7wD2lr+wHjvuO74NpoJA5seytGPaERChUhLKY+EkXADWGIIcFWXJaDy
         CFD5xbyOaOgb41c2lwWhsGT6Eg8e2oegAnEo4h3xiUWSTyh4Q2ZyJg8sKf6cpWxbsFxx
         KdXjpdhirh8qyMVOvOQzcDDBJaE9cekbmP/WMJzMDahgcgJo+CeMllc2uvjkaybR11PQ
         +2hQ==
X-Gm-Message-State: AOAM533tmgo/dyKIqHpthKt3tJltG+U4jAucjCFURr2bfUwMBJXUYXym
        yAszrQDU0RSXJp4IEEyvfK8u2DA2u4FngOBY
X-Google-Smtp-Source: ABdhPJzhbfm84Nrtjk3Sxu8lRJ1E6jesmnP4jgxcxV7lK+BK1UXeXE/BTi3mJGf4hNBu2hZP8tFh1A==
X-Received: by 2002:a1c:f002:: with SMTP id a2mr7762964wmb.129.1603550700311;
        Sat, 24 Oct 2020 07:45:00 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id g83sm9963908wmf.15.2020.10.24.07.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:44:59 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 3/5] ARM: defconfig: add stmpe adc driver for p4note
Date:   Sat, 24 Oct 2020 16:44:19 +0200
Message-Id: <20201024144421.34435-4-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024144421.34435-1-martin.juecker@gmail.com>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable the stmpe adc driver for the p4note device family.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/configs/exynos_defconfig   | 3 +++
 arch/arm/configs/multi_v7_defconfig | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 6e8b5ff0859c..c9581e603a32 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -175,6 +175,8 @@ CONFIG_MFD_MAX77693=y
 CONFIG_MFD_MAX8997=y
 CONFIG_MFD_MAX8998=y
 CONFIG_MFD_SEC_CORE=y
+CONFIG_MFD_STMPE=y
+CONFIG_STMPE_I2C=y
 CONFIG_MFD_TPS65090=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
@@ -319,6 +321,7 @@ CONFIG_EXTCON_MAX77693=y
 CONFIG_EXTCON_MAX8997=y
 CONFIG_IIO=y
 CONFIG_EXYNOS_ADC=y
+CONFIG_STMPE_ADC=y
 CONFIG_CM36651=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e9e76e32f10f..b3a03e530b57 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -554,6 +554,7 @@ CONFIG_MFD_RK808=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_STMPE=y
+CONFIG_STMPE_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS65217=y
@@ -1020,6 +1021,7 @@ CONFIG_AT91_SAMA5D2_ADC=m
 CONFIG_BERLIN2_ADC=m
 CONFIG_CPCAP_ADC=m
 CONFIG_EXYNOS_ADC=m
+CONFIG_STMPE_ADC=m
 CONFIG_MESON_SARADC=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_STM32_ADC_CORE=m
-- 
2.25.1

