Return-Path: <SRS0=vFf2=EG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C19C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97130206F9
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STKiTcQz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgJaSAN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Oct 2020 14:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgJaSAM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Oct 2020 14:00:12 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A38C0617A6;
        Sat, 31 Oct 2020 11:00:12 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w14so9875573wrs.9;
        Sat, 31 Oct 2020 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PkB/W6j34m8MxpDuONFe4eaEhdd4FhVEPHJhHjdot74=;
        b=STKiTcQzFtg3J1q03UcmL6y7QLWrZK8aeUUvQDiDMR3r4nz9kOu3eQBrXvtDPrAi/D
         bHDl/sJieLmR9Y/ZMLnLcFkC3zWbFeusV0T1UY7TdiuAnvHBbFf6V4KjM2ImpjYIhZ2Y
         yTXXLmmH5vIyJRnDqu7tJuV2yO9uW7BiBLdDKLG5XMNIhrTJOaXbnvWX/KCb+RyZi7rj
         R3ZG0a4gk1vC85d/KFiZeGlWOKdDxnfgzlTSpvI+fYge/39Zu5XEH37uKp9+qyzRC0J1
         bIfmzywGP2K3T3BSI+kZWip6xtTlhns9dFCgMYJK6ySfb8J//S7W+Zvjz3d3ueWQalhu
         2dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkB/W6j34m8MxpDuONFe4eaEhdd4FhVEPHJhHjdot74=;
        b=hX4Sfx0nkuUip/tJlJHBiFu9Q2dvThA93WSqG06bccWfMDKRFaN9Uce99D0J7d+8DQ
         ocoqAu5tF03A274hPiS8a1y0ujxIRjoFHDBDW2+cjaZnTrg4KeW74lwOPHuYPVR7z7DJ
         TEutXLt/XqG2oINBe59j+xaqkIesq+rZZet98vB1Hh32lsjreYvSgL5Yi5vk1ysxH44o
         wAcSABHHbyQRUgzUu4CLvkg+tJ6uoBZfV+obegaNQAzKmzAPGdaTdhLmzgSbA/Ck0dPy
         3BGWsVKeRSc+GMKD8bparr1ZArWpylKl2FWiCDW/PCbRePAIIl8TrP43xdLx83x6mQgA
         LD8A==
X-Gm-Message-State: AOAM533UbcEZB2xjVXqyfPSWJ0azgspuSmA3I31BhcWraSlLo9+K3iDu
        SLuwf3KwyQmMPIIMiCasTUg=
X-Google-Smtp-Source: ABdhPJy7k9fiIj8SZMuZ8Yx564QLYZgdvGWNVsji8zQ67d6kQnSH//L/ebyfJw07wimyJhD49sWcww==
X-Received: by 2002:adf:db03:: with SMTP id s3mr11100191wri.152.1604167211469;
        Sat, 31 Oct 2020 11:00:11 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id k22sm2262796wmi.34.2020.10.31.11.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 11:00:10 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH 3/5] ARM: defconfig: add stmpe adc driver for p4note
Date:   Sat, 31 Oct 2020 18:58:35 +0100
Message-Id: <20201031175836.47745-4-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201031175836.47745-1-martin.juecker@gmail.com>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
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

