Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA37AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 07:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbiEWHcd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 03:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbiEWHcS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 03:32:18 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D7681BE9E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:29:50 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B2983F216
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 06:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653288180;
        bh=vwrCBboBSUi71sTM6C2LN/XO07fUICSkTIXBE5um3Qk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=gznVuK6wD+6u1AOsPfNtqkqoRzY38km/Wq5LVYqIUCkGSOFyzQ7mrE1VS/2ob1TGn
         GIr1ENTHT8yEoG0h0BdvH2PWaFqCmX6XyoAPGhLKJCkoDEonQLgaJoYqZGXDTJ10Xq
         JkKlXU3VOmANHr1TcTuBbDyhKYhqKGumCqQznqE+ODbLTr9IPaEiD5DuXQUNOKgnY+
         RoeZ0t7IPpPl4HmITKnSxIqLuk7VJ9v/i7Z4EUq3sO/QFfTgZttgNYAYEvQ6BwVU0A
         /3pNRaOUfDyT4moLLBshWhnJtTdNSN7avRJm6edqymOxUF5iwRnMu8ykCdlhmPUE8q
         DYf9zmF/pTYEQ==
Received: by mail-ej1-f69.google.com with SMTP id qb36-20020a1709077ea400b006f45e182187so5432450ejc.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 23:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwrCBboBSUi71sTM6C2LN/XO07fUICSkTIXBE5um3Qk=;
        b=MjILQa8LpRt0JzUfw/e/9JN001fUbQjqBQSh8Y+tl4CyyKza2hhV3m54fPsfIxi9yy
         R7oZdBjVUIKPeO7mlR7Ku3p5ToGuk7tKJWa4ZVjn3bFQSmay1d7kqLhnuUjXYcEdTlFE
         4I5H3n0lI1RJqY2rRJJ83fi0YnYqnZaLVqm+Jixh34IQkcKlkEF2eSzd3guJJ4Ft9by4
         5NAg8JuHSKQfxJv27FZEOUur/+IUMYjUNPLaNrnlrZ88IecOo/4Vl4ijh92yh/efV0o8
         /Mer3I1BXMy0FWvU0qZ0iS8ZL5l0sfh2Q8S/yPRbVo5He4ixGdZuJliQbIYpfJCKt3gu
         xTVg==
X-Gm-Message-State: AOAM530SB2/E9kfcGbYCcXp3FFuU3vbIfMnpVvX3CuXRq3HR0kP5HEkL
        8Vbvu87/xNG6PSYm+4i8X41MB/IHdNxtkxo5wGNd72l/WPveOkVizsgYl0sQSrOVfPcLBggkiI7
        p2U7pHFb2469qNRSgR+41nKedrzu9zvAN6CXBPRL88Vy/RiBB
X-Received: by 2002:a05:6402:348c:b0:42a:e4e5:c63a with SMTP id v12-20020a056402348c00b0042ae4e5c63amr22121912edc.419.1653288179907;
        Sun, 22 May 2022 23:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysxm5gNOCFjrnP3RneZZyc/ngyLMW6c9PUSzZD7D0FANITgMZnEr+yJGihPxqDk9DL1co0uA==
X-Received: by 2002:a05:6402:348c:b0:42a:e4e5:c63a with SMTP id v12-20020a056402348c00b0042ae4e5c63amr22121904edc.419.1653288179758;
        Sun, 22 May 2022 23:42:59 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0042617ba63a5sm7792416edy.47.2022.05.22.23.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:42:59 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 3/3] ARM: s3c: Kconfig.s3c64xx: Fix indentation
Date:   Mon, 23 May 2022 08:42:52 +0200
Message-Id: <20220523064252.11938-4-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220523064252.11938-1-juergh@canonical.com>
References: <20220523064252.11938-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/arm/mach-s3c/Kconfig.s3c64xx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index af01675d8769..bbaa8ff3367b 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -99,7 +99,7 @@ config S3C64XX_SETUP_SDHCI_GPIO
 config S3C64XX_SETUP_SPI
 	bool
 	help
-	 Common setup code for SPI GPIO configurations
+	  Common setup code for SPI GPIO configurations
 
 config S3C64XX_SETUP_USB_PHY
 	bool
@@ -109,7 +109,7 @@ config S3C64XX_SETUP_USB_PHY
 # S36400 Macchine support
 
 config MACH_SMDK6400
-       bool "SMDK6400"
+	bool "SMDK6400"
 	depends on ATAGS
 	select CPU_S3C6400
 	select S3C64XX_SETUP_SDHCI
@@ -200,7 +200,7 @@ config SMDK6410_SD_CH0
 	bool "Use channel 0 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON7 (channel 0) as the MMC/SD slot, as
+	  Select CON7 (channel 0) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -209,7 +209,7 @@ config SMDK6410_SD_CH1
 	bool "Use channel 1 only"
 	depends on MACH_SMDK6410
 	help
-          Select CON6 (channel 1) as the MMC/SD slot, as
+	  Select CON6 (channel 1) as the MMC/SD slot, as
 	  at least some SMDK6410 boards come with the
 	  resistors fitted so that the card detects for
 	  channels 0 and 1 are the same.
@@ -255,7 +255,7 @@ config MACH_NCP
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_I2C1
 	help
-          Machine support for the Samsung NCP
+	  Machine support for the Samsung NCP
 
 config MACH_HMT
 	bool "Airgoo HMT"
@@ -287,21 +287,21 @@ config MACH_SMARTQ
 	select SAMSUNG_DEV_PWM
 	select SAMSUNG_DEV_TS
 	help
-	    Shared machine support for SmartQ 5/7
+	  Shared machine support for SmartQ 5/7
 
 config MACH_SMARTQ5
 	bool "SmartQ 5"
 	depends on ATAGS
 	select MACH_SMARTQ
 	help
-	    Machine support for the SmartQ 5
+	  Machine support for the SmartQ 5
 
 config MACH_SMARTQ7
 	bool "SmartQ 7"
 	depends on ATAGS
 	select MACH_SMARTQ
 	help
-	    Machine support for the SmartQ 7
+	  Machine support for the SmartQ 7
 
 config MACH_WLF_CRAGG_6410
 	bool "Wolfson Cragganmore 6410"
-- 
2.32.0

