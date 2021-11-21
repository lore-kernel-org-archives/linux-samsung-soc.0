Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE1CC19775
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 16:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238441AbhKURAH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 12:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238414AbhKURAD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:03 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79778C06174A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:57 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id z34so69240362lfu.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tE2PiK+QMQdzrBf8Dn3otgisMDlF9CZ6ayfu9Pqan/0=;
        b=wJJjrI9KQ1gy1JLj2pqrhYhpVx2I4yCGCfCY1iXFWeKef6mhs2XYqYDn2ZqIzEEhxn
         0T+JG0jQ+iDiILi9nQNWvVbwoxWSvBgYpn9fYJP3/su1EvmLDCePDfTw1TF7CZ/AxW8a
         kOuZSlMjf5kKegAByRENXn46VmOkdXZWvRB8uh2b/IqjPy5crxVXtQGd9MEL6AT5IsAm
         +QJIOAD9Z+660bLSRACt7dytw43M8er13Lo2OATzLKLZT5AazBTRgLTx4iZ4qwmIiWIm
         e5EGvB9bK3lob1Df34SVbQS1mK24pxlQqI22prqpc2zGZNSwZAiupGHwGFtUlYkRwpq5
         ZBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tE2PiK+QMQdzrBf8Dn3otgisMDlF9CZ6ayfu9Pqan/0=;
        b=ycOzuft/OIIXrDSCJcXJqvEjurqHFhWC56H7sCczi+KvQOMFXrId865CT/2gswZBPN
         lA9rXgBB6SNCWFyUAW6cixnXbu4TyRU4N6uA09eZMFioPrT7eeWWIRIynm3PeVabDh6h
         QGxDGRXrwvhvSgkPqHXA50WSQdkGNPiqLs3meq/ctQ65h1TkLBWuCrLuLk6YHqQV6f42
         Hwjn+rU2UDrQANaizbXzT0dR4FTexh9OHOICz0basmRFD75QF8jJhmgNhKN0Bjez4Dwz
         2Lu4T+8G4n5K0xhMi6YkDUJe3NC2dIfgemfYg1WQmBHJoRtqUUAk+K0XaD11I0EZ1C93
         A4LA==
X-Gm-Message-State: AOAM5324IrdXaJirULFZZ87ALS2hUs59IkvfQxTL3/IiiSWdN0tYEPmO
        w1EhwGO+Q4sbVw3G2zAyozYOZw==
X-Google-Smtp-Source: ABdhPJz+n0rvNN4I1ZmBuqTiIEefxy+ISO/6NkZz+svWmRjzF7gYCrkFN1SmNxZjkbYdqbiaPXQ7ug==
X-Received: by 2002:ac2:4e0d:: with SMTP id e13mr49222025lfr.388.1637513815870;
        Sun, 21 Nov 2021 08:56:55 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b43sm601297ljr.64.2021.11.21.08.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:56:55 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 04/12] watchdog: s3c2410: Let kernel kick watchdog
Date:   Sun, 21 Nov 2021 18:56:39 +0200
Message-Id: <20211121165647.26706-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When "tmr_atboot" module param is set, the watchdog is started in
driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
watchdog core driver know it's running. This way watchdog core can kick
the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
enabled), until user space takes control.

WDOG_HW_RUNNING bit must be set before registering the watchdog. So the
"tmr_atboot" handling code is moved before watchdog registration, to
avoid performing the same check twice. This is also logical because
WDOG_HW_RUNNING bit makes WDT core expect actually running watchdog.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - Added explanation on moving the code block to commit message
  - [PATCH 03/12] handles the case when tmr_atboot is present but valid
    timeout wasn't found

 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 00421cf22556..0845c05034a1 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -604,6 +604,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	/*
+	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
+	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
+	 *
+	 * If we're not enabling the watchdog, then ensure it is disabled if it
+	 * has been left running from the bootloader or other source.
+	 */
+	if (tmr_atboot) {
+		dev_info(dev, "starting watchdog timer\n");
+		s3c2410wdt_start(&wdt->wdt_device);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
+	} else {
+		s3c2410wdt_stop(&wdt->wdt_device);
+	}
+
 	ret = watchdog_register_device(&wdt->wdt_device);
 	if (ret)
 		goto err_cpufreq;
@@ -612,17 +627,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister;
 
-	if (tmr_atboot) {
-		dev_info(dev, "starting watchdog timer\n");
-		s3c2410wdt_start(&wdt->wdt_device);
-	} else {
-		/* if we're not enabling the watchdog, then ensure it is
-		 * disabled if it has been left running from the bootloader
-		 * or other source */
-
-		s3c2410wdt_stop(&wdt->wdt_device);
-	}
-
 	platform_set_drvdata(pdev, wdt);
 
 	/* print out a statement of readiness */
-- 
2.30.2

