Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9B9C55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A46D2224F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4GSfpnk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgKMVgw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgKMVgu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:36:50 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CB9C08E861;
        Fri, 13 Nov 2020 13:27:18 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id me8so15723424ejb.10;
        Fri, 13 Nov 2020 13:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C/C9/YJZP9ayQdkhRB0cejZGeFOrxk14NYyovbBlnQc=;
        b=Q4GSfpnkFSVwMPCcg5kyXKR6El2N4kX+yJbfljuNQO1lumdiWUBRxbEveYrobZvLM9
         sFf2evfVXp6ftVMX4+y+0/UemR0qJUyl+ggiJbhMMK0E3LxfCXA90XiX4br/HjQYpHWg
         mlEQadi61EGX4c8DnDaVKInvk2Jm4OMUNZ91vU+U93qFdrvQss5jIsmnJMb5whynZ3yg
         iiQVA/KGSWEDiArzETELTR0yKlsUZaNqArJrilPqK8opbD5PVEC0CAvT534URUg9MYlC
         J1KmXX7TNQaTxxLVYlf5g+IrrU2z9zcdARgKIXQmbYz8TiJgl4JjgRqLsj8ML8+3sH1h
         AD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C/C9/YJZP9ayQdkhRB0cejZGeFOrxk14NYyovbBlnQc=;
        b=WCfB2YvtrZKFu3h2okBf4/dJW0suDvPyuJQhLj0SVFe7ZrD9PYs+uB2TKr6Wdfa8Oe
         tTUqiWEmh3jSHsoYn/lih1k5bdd1AcLV/SZcjxTLMyiEeOfJZi+Hj4cJ78ne9vZeegru
         0oaYsBzwqE6PAFjeGdVSlUvOOc+/e87eH3wnL25n9HCbkfMEwIKwYfVEeQAo84CJ05cp
         RH7muNfT0Uic9rjOwZtAVwyFumNlydU5ElFAi9sY9ucVbKurGnRn1mYqk1hsqpyR019o
         m5Sc/IhahxTM4zFW4PZbefikbZvB/0nhSyDCTK0usPRo3JvXab00FBgu1TbVSouVW+db
         Qf4g==
X-Gm-Message-State: AOAM530rwPVnm5yQ5bng6RPIIKMV9snAKqnqxJ3miZAdc2b1zQbLC7i6
        xSOg/r0qZJzOLjmlRctfQFk=
X-Google-Smtp-Source: ABdhPJxisjQ05EsdCUhb3tyQdXpiZyw7Q6gKKksjPMrSWBmHY+ULlPUydJY+r923BQQ8nsQttHhXkw==
X-Received: by 2002:a17:907:435b:: with SMTP id oc19mr4129402ejb.535.1605302836760;
        Fri, 13 Nov 2020 13:27:16 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id j9sm4594268ejf.105.2020.11.13.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:27:16 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH v3 3/5] ARM: defconfig: add stmpe adc driver for p4note
Date:   Fri, 13 Nov 2020 22:25:24 +0100
Message-Id: <20201113212525.13455-4-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113212525.13455-1-martin.juecker@gmail.com>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
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
index cf82c9d23a08..c8ae45e5ad72 100644
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
index a611b0c1e540..0c71d82dc837 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -557,6 +557,7 @@ CONFIG_MFD_RK808=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_SEC_CORE=y
 CONFIG_MFD_STMPE=y
+CONFIG_STMPE_I2C=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
 CONFIG_MFD_TPS65217=y
@@ -1024,6 +1025,7 @@ CONFIG_AT91_SAMA5D2_ADC=m
 CONFIG_BERLIN2_ADC=m
 CONFIG_CPCAP_ADC=m
 CONFIG_EXYNOS_ADC=m
+CONFIG_STMPE_ADC=m
 CONFIG_MESON_SARADC=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_STM32_ADC_CORE=m
-- 
2.25.1

