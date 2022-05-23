Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1846BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 07:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiEWHkU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 03:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiEWHkT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 03:40:19 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92951D308
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 00:40:17 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4DAC63FD7D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1653288178;
        bh=yEO41M4QEwl2GHy1OyiRTroQlrDw56y+j0EhDtN4chM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=oBlKs4eaIoVGZRneocVzF8NraXtRtVAiN5nMZ0ti3oWOLc821vr7WhiyKoLV1Fd+F
         x91qasJk4fsp/N+E/kujl4tiuXXuK//GUk5gGzJ69hYI+xlF5IGx46Sr6YN2jeX/uf
         4jYF3lyWgPSQVwr0OwV+u34oDAsVN5BRjsIJNYtI4XispWZU3saQtONw8D2qgoNcCo
         I3NKvfZyEuJU9i7ajatMc3ikBBU3Tv6SBY72wtbCH+O9g6FtK60vU+rc/WwHDpiEhI
         zx9/KPk6H8P0ZWeMLVPJ0JT7sT83zJjXmoOtelOUTwgK2WId6e4fGdXcuDhxU5R6/G
         yLkVHGod5MCJw==
Received: by mail-ej1-f69.google.com with SMTP id n2-20020a170906724200b006fed87ccbb8so554475ejk.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 23:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yEO41M4QEwl2GHy1OyiRTroQlrDw56y+j0EhDtN4chM=;
        b=E3lOp5Hc6kK75zfqGJbGELI+xLZ0ybCoixqEt+K/W41W4sqQ2+OPZN3GOQ3cPJYY0B
         dvRnnD20KY3QjYdC/AswxYZuqB1auBNk3t9KqZwgejybaa4HBR7E9VfjToFaYZ4D6xwt
         XHYVrBnBID0SSRZi3a4h/xff+45KwjQWjXVDEICCJ078GeYyD3Et2vi3fKYhNhDjSHto
         bt34mgKhKBe/fx6X/tXOoyPpTYtzN4YPqOpQkK2vYQZnJ6wBN2T8gmg6/xuyGiAikXJl
         csqIp+pK9NvZ0xAUNZuT0GBDIHv6+WPUuH6PsD3UZHQHXR9+sbN1YBC9q0Or2tKAUGU1
         3L1A==
X-Gm-Message-State: AOAM530gK3QOfCInkBslmzFiVnoSZ0jOkEptLEqKMv4g66PTPZYuWYD/
        WDJH3IX27AphtP8dqUNG8m1eecZiYOtaZtVyrAHddxA2/Ff7WuraxZrJ1hMiDxeqVuMl7V/9wf9
        Yn1Gk7iE8k/dF3y44OuTUcTFhIfnGuMTfadIpAeV3qi/fWEix
X-Received: by 2002:a05:6402:5415:b0:42b:228:5cf with SMTP id ev21-20020a056402541500b0042b022805cfmr19522529edb.245.1653288178044;
        Sun, 22 May 2022 23:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ7ytld9I2P8mL8R1KS+HF6d7ge2qDH3qWflgznfKAeHOLzLYMEmXjk7V+OZ0SsEf9b43icQ==
X-Received: by 2002:a05:6402:5415:b0:42b:228:5cf with SMTP id ev21-20020a056402541500b0042b022805cfmr19522520edb.245.1653288177859;
        Sun, 22 May 2022 23:42:57 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p3-20020a056402074300b0042617ba63a5sm7792416edy.47.2022.05.22.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 23:42:57 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 1/3] ARM: s3c: Kconfig: Fix indentation
Date:   Mon, 23 May 2022 08:42:50 +0200
Message-Id: <20220523064252.11938-2-juergh@canonical.com>
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
 arch/arm/mach-s3c/Kconfig | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index 1899fc3f44fd..860df703f696 100644
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

