Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AC4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 13:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67DB760F8F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 13:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235857AbhJSNT7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 09:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbhJSNT6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 09:19:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0336AC06161C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:45 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id i20so12686059edj.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ewk+JEJPIl628LqXQys4kMJx/dyvNqWJyRtOhvqF++g=;
        b=Yc4z25m9SraOPeiH3fHVJW5xx3KlcCixhz0k7H2JTkNHVZdcA36BlPe0AlbS8b0JD4
         c5v5LU1YLvlq1oTAST4LZxTg0Z7wWnvH46hZLeFFhexMx8Oroz3dPwcIxONA0984EFnG
         bh/lJoBGN2Wzw9vijQT6GPu4pdi21lcRZTGh7DhbtdgQzfvL8++z7CBTPG3OtaA4s2p+
         IT3aKeAVa6DURrDiNwZ7oKDWP8n0lJVGWcq0JLMU/ytXAWQ/D6JwGVaSVCbHyKazf3/s
         DMtQwJQQ7fax80a/UsxkGD7zKoRuRGOcxk890Cw7spYDADMvr4SVrz0lTXCU8Kx+pl0i
         p5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ewk+JEJPIl628LqXQys4kMJx/dyvNqWJyRtOhvqF++g=;
        b=EZ6QN+59tku3km4ES4qy19zlVdi8RtBDqpIcmzurGtY6eLrn1HAV/tllS9pHusnEDt
         +8Vfq5I/E63nBDSX7EvxRYxruhYZwz1wLRHFiuHr1XLyk7v8uvOxH1IZKHY972OzG8U4
         ZUjKT8Kim3n4Q4Jd4ZKzPodYdltXUtb3KHTFTuSXSvjiaBSDpvdIsvpR8yxg2iVdNdCR
         iDEsC8wrsesUXjF1PO8uRc5z1Capj39AZl/J9NZwSNHFlP0LwwzTIyiMF6K52KHF0Vlt
         RZkwPElbDHWBvM3YzxZ51kV9ENpqzf7JzodNOsYkEjJIp/x8zK3s2FxIzt7a/2Sbgp7/
         Pkwg==
X-Gm-Message-State: AOAM530YvQJo7dq4H4sVNYP0arQI9nB9oT+wWt+QPYW3C0olDVY4VdR2
        x8bT0RhlJFCpOHZr42ro9hBcmA==
X-Google-Smtp-Source: ABdhPJziJB5SbEcOtz0oFtQUCLbbWw4+8Tt+U0AspLInaG+PMwo/xOaYy5WYP43QRMA2QWE2c9rGRA==
X-Received: by 2002:a17:906:64a:: with SMTP id t10mr39685589ejb.5.1634649453375;
        Tue, 19 Oct 2021 06:17:33 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id w11sm11336968edl.87.2021.10.19.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:17:33 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
Date:   Tue, 19 Oct 2021 16:17:24 +0300
Message-Id: <20211019131724.3109-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211019131724.3109-1-semen.protsenko@linaro.org>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On first RTC boot it has the month register value set to 0.
Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
to the next error message in kernel log:

    hctosys: unable to read the hardware clock

That happens in s3c_rtc_probe() when trying to register the RTC, which
in turn tries to read and validate the time. Initialize RTC date/time
registers to valid values in probe function on the first boot to prevent
such errors.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/rtc/rtc-s3c.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 238928e29fbc..c7e763bcf61f 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -403,6 +403,28 @@ static int s3c_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/* Set RTC with valid date/time values on first boot */
+static int s3c_rtc_init_time(struct s3c_rtc *info)
+{
+	struct rtc_time tm;
+	int ret;
+
+	ret = s3c_rtc_read_time(info, &tm);
+	if (ret)
+		return ret;
+
+	/* Only init RTC date/time on first boot */
+	if (tm.tm_mday > 0)
+		return 0;
+
+	/* Init date/time: 1 Jan 2000 00:00:00 */
+	memset(&tm, 0, sizeof(struct rtc_time));
+	tm.tm_mday = 1;	/* tm_mday min valid value is 1 */
+	tm.tm_mon = 1;	/* January in internal representation */
+
+	return s3c_rtc_write_time(info, &tm);
+}
+
 static int s3c_rtc_probe(struct platform_device *pdev)
 {
 	struct s3c_rtc *info = NULL;
@@ -471,6 +493,10 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 
 	device_init_wakeup(&pdev->dev, 1);
 
+	ret = s3c_rtc_init_time(info);
+	if (ret)
+		goto err_nortc;
+
 	info->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(info->rtc)) {
 		ret = PTR_ERR(info->rtc);
-- 
2.30.2

