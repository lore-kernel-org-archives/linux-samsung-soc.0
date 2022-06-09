Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2552CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 08:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiFIIYg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiFIIYf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 04:24:35 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413701116E5
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 01:24:34 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BB3FF3F194
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1654763072;
        bh=SFJ97el+kYEC87Qtf60Q+pyhpNssxYYRxUciLiN5a3M=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Zjw/vPxXdpQjfu/7U1ZvBLDR7ZTIYj2plvu1r0N+DfrzuUHmhwSwQOmJlyFAbOHLp
         nXJCY9lgqKQ9chbbnz0CvmCdprjsQjzhZnuh24LQ23jdLWtuNi7DaMxgq0n7A031HX
         YQ1s7Jy0sm1zDW51GZx/O0Q8P4y+g76B0nsQGHQ/VW/Exp62hMgntJBviiwd88KyAV
         ddfSaaa4ZdjWlcTkgPs4dM2ReTvLdQk7uVhZSfp4UzVGBMq1ft3RnhfblrcCp1uATB
         ZgRYJYLlohGZ9+wgAwLAMtdYqCug6htQyDg5VARyQNMF6Y611jKjCZhUXjfuXrmnWq
         1vTVbV5uVNekA==
Received: by mail-ej1-f69.google.com with SMTP id hy20-20020a1709068a7400b00703779e6f2fso10671028ejc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2022 01:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFJ97el+kYEC87Qtf60Q+pyhpNssxYYRxUciLiN5a3M=;
        b=LZrVe5MuTMMec+oRzEgGS2QoPEhA8FeZ4qG+TZRgwFy0fBIPwlUvE4I9Daiu3z4dh2
         FAML6xSwmn8YucIvxjiiIUi/KmWqqFJRpPQ8cmiVU/3eGfvE5mD0h8umTSMfZaqpv9Ph
         kPlwUYHphYfwhHxXiITBgdpYDIFnqKPc9nLd+Y9HMmKA+699lRzF6f6Z3S/VrHbsNzRy
         sUVuQYGy4sRepsAo4oXZEom5nccqpjJA/tT0KkBCx2UMSTnZSfgX2bwJPTTpAFNsSrfx
         850bzomLFng+JJyConc91ZqqqvFZUd6zkqfXwLaRzapIZi9W/rW7gLZG3lTUyMgRVCeE
         7Jsg==
X-Gm-Message-State: AOAM532CANXxXSCc1O3W1f0TDYliAlXUvKuqztuZM3uttKn3Vs+n0Jk4
        l1SXDV3WJ3eevlyk51i0zJSzz6P7lmA7MfK1FasidIYij4xabKJcejgn2U7sXw0nmscBdu7xp8z
        55VFumiWDYe6CDFB+o+qzUW8+I8tEEbbeT/Q2s2GS+M0rGAFN
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id nb13-20020a1709071c8d00b006f20eb21cd6mr34017560ejc.568.1654763072458;
        Thu, 09 Jun 2022 01:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/io4UIarrO6pbgqaHyxPgZ4V1VbyhRGpi8ULkQkP44WTBqh4iY5Er0cx64gIopQmMFamZVg==
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id nb13-20020a1709071c8d00b006f20eb21cd6mr34017543ejc.568.1654763072210;
        Thu, 09 Jun 2022 01:24:32 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id v9-20020a170906380900b00711d546f8a8sm4664834ejc.139.2022.06.09.01.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 01:24:31 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
To:     krzysztof.kozlowski@linaro.org, linux@armlinux.org.uk,
        alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 1/3 v3] ARM: s3c: Kconfig: Fix indentation
Date:   Thu,  9 Jun 2022 10:21:52 +0200
Message-Id: <20220609082154.115301-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220609082154.115301-1-juerg.haefliger@canonical.com>
References: <63eabd40-761e-3b4e-c1be-43a12516e1b0@linaro.org>
 <20220609082154.115301-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm/mach-s3c/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index 54548c051402..a64143574546 100644
--- a/arch/arm/mach-s3c/Kconfig
+++ b/arch/arm/mach-s3c/Kconfig
@@ -43,12 +43,12 @@ config SAMSUNG_ATAGS
 	def_bool n
 	depends on ATAGS
 	help
-	   This option enables ATAGS based boot support code for
-	   Samsung platforms, including static platform devices, legacy
-	   clock, timer and interrupt initialization, etc.
+	  This option enables ATAGS based boot support code for
+	  Samsung platforms, including static platform devices, legacy
+	  clock, timer and interrupt initialization, etc.
 
-	   Platforms that support only DT based boot need not to select
-	   this option.
+	  Platforms that support only DT based boot need not to select
+	  this option.
 
 if SAMSUNG_ATAGS
 
@@ -102,7 +102,7 @@ config S3C_DEV_HSMMC3
 config S3C_DEV_HWMON
 	bool
 	help
-	    Compile in platform device definitions for HWMON
+	  Compile in platform device definitions for HWMON
 
 config S3C_DEV_I2C1
 	bool
@@ -194,7 +194,7 @@ config S3C64XX_DEV_SPI0
 config SAMSUNG_DEV_TS
 	bool
 	help
-	    Common in platform device definitions for touchscreen device
+	  Common in platform device definitions for touchscreen device
 
 config SAMSUNG_DEV_KEYPAD
 	bool
-- 
2.32.0

