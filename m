Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FBEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A480660F9F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhJUUZV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232042AbhJUUZS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 16:25:18 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FF1C0613B9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g10so5446616edj.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=glchSb7LkrwxGNQCjKRWEsS5PvFIuTxlbK6/zONAkIk=;
        b=KpEL68zcVP+M4NooHb3dkc1TgMATaHrfumvlw3R/L77MotAqaKIp4mmYWMdH901vbE
         1hBm4LFT8xQgTRLxPGcg54Zi0pWpPWZH8+wn9ZmT8/69CfCR4wlFEkTboUKq6nxZiyNX
         LFAcSxSg3JQyOnTXUJ3rX5BNUY0VVVGaPxEyxMfMpMLz5jS3LZhVWibB+BI4QhvZLePe
         363NnHGU/sgIYaWud3EHbgeoH12U5+hQEjkiMeKGxtFe+c5T417zZe1215Aevzp0J+dn
         jKBRv/TSRHs4dOLXbuyTqZmZlmhTkuKdzABx/kGun0HpjGa0NgA2o57SSskrz6+8ivLV
         Tevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=glchSb7LkrwxGNQCjKRWEsS5PvFIuTxlbK6/zONAkIk=;
        b=x+qkZyqG+FTVuxTJklDOkb/P3shM6V2six0QPZh2/FEG3p0x/sqk8tspsv93RtUL/x
         As4kt2a/WXj6VZOGMY70BhfTZhFEwkufKC0RgcRgRRdTmiEsjajg22PsrEtDmXZOeYVd
         /OEp//Ch2VuSKWiLyW5bAOCtaLcQSWRWu9w8eBBNhhxukiOLKv+wKlvDg6QCwCEyUwG9
         QzIfx2vc6+k8VipVa0GVy4I+D1FqGR7DK6eKoMnwsryQj18E60nfwJ7nWEbXfvgFdGK6
         aAyZ2h4qWFH6N0XNqnWm+bT0Wq3FLjLo/8EqN0deqhKItzc40O+vIUeCVOJw0xDhFfAw
         aVdg==
X-Gm-Message-State: AOAM531ncIJlm2AfBX7H9kinwifPbmR+w4s864QNRDxYNc4PVqtY/Z8U
        hLJzDM3ot7TmzG51HN0eQWcCSg==
X-Google-Smtp-Source: ABdhPJwGeJvBtPf3xpLbNfsPi1DeSjqR5ZXTBomes2A/ND+cndS3US8/3BpLTUmiyjcHNr4JBnv3Jw==
X-Received: by 2002:a17:906:6ad0:: with SMTP id q16mr1793021ejs.552.1634847780482;
        Thu, 21 Oct 2021 13:23:00 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p10sm3369779edj.91.2021.10.21.13.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:23:00 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] rtc: s3c: Extract read/write IO into separate functions
Date:   Thu, 21 Oct 2021 23:22:55 +0300
Message-Id: <20211021202256.28517-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021202256.28517-1-semen.protsenko@linaro.org>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Create dedicated functions for I/O operations and BCD conversion. It can
be useful to separate those from representation conversion and other
stuff found in RTC callbacks.

This patch does not introduce any functional changes, it's merely
refactoring change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Changed the commit message wording a bit

 drivers/rtc/rtc-s3c.c | 98 +++++++++++++++++++++++++++----------------
 1 file changed, 61 insertions(+), 37 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 10e591794276..d1baf655c008 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -127,10 +127,9 @@ static int s3c_rtc_setaie(struct device *dev, unsigned int enabled)
 	return ret;
 }
 
-/* Time read/write */
-static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
+/* Read time from RTC and convert it from BCD */
+static int s3c_rtc_read_time(struct s3c_rtc *info, struct rtc_time *tm)
 {
-	struct s3c_rtc *info = dev_get_drvdata(dev);
 	unsigned int have_retried = 0;
 	int ret;
 
@@ -139,54 +138,40 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 		return ret;
 
 retry_get_time:
-	rtc_tm->tm_min  = readb(info->base + S3C2410_RTCMIN);
-	rtc_tm->tm_hour = readb(info->base + S3C2410_RTCHOUR);
-	rtc_tm->tm_mday = readb(info->base + S3C2410_RTCDATE);
-	rtc_tm->tm_mon  = readb(info->base + S3C2410_RTCMON);
-	rtc_tm->tm_year = readb(info->base + S3C2410_RTCYEAR);
-	rtc_tm->tm_sec  = readb(info->base + S3C2410_RTCSEC);
-
-	/* the only way to work out whether the system was mid-update
+	tm->tm_min  = readb(info->base + S3C2410_RTCMIN);
+	tm->tm_hour = readb(info->base + S3C2410_RTCHOUR);
+	tm->tm_mday = readb(info->base + S3C2410_RTCDATE);
+	tm->tm_mon  = readb(info->base + S3C2410_RTCMON);
+	tm->tm_year = readb(info->base + S3C2410_RTCYEAR);
+	tm->tm_sec  = readb(info->base + S3C2410_RTCSEC);
+
+	/*
+	 * The only way to work out whether the system was mid-update
 	 * when we read it is to check the second counter, and if it
 	 * is zero, then we re-try the entire read
 	 */
-
-	if (rtc_tm->tm_sec == 0 && !have_retried) {
+	if (tm->tm_sec == 0 && !have_retried) {
 		have_retried = 1;
 		goto retry_get_time;
 	}
 
-	rtc_tm->tm_sec = bcd2bin(rtc_tm->tm_sec);
-	rtc_tm->tm_min = bcd2bin(rtc_tm->tm_min);
-	rtc_tm->tm_hour = bcd2bin(rtc_tm->tm_hour);
-	rtc_tm->tm_mday = bcd2bin(rtc_tm->tm_mday);
-	rtc_tm->tm_mon = bcd2bin(rtc_tm->tm_mon);
-	rtc_tm->tm_year = bcd2bin(rtc_tm->tm_year);
-
 	s3c_rtc_disable_clk(info);
 
-	rtc_tm->tm_year += 100;
-	rtc_tm->tm_mon -= 1;
+	tm->tm_sec  = bcd2bin(tm->tm_sec);
+	tm->tm_min  = bcd2bin(tm->tm_min);
+	tm->tm_hour = bcd2bin(tm->tm_hour);
+	tm->tm_mday = bcd2bin(tm->tm_mday);
+	tm->tm_mon  = bcd2bin(tm->tm_mon);
+	tm->tm_year = bcd2bin(tm->tm_year);
 
-	dev_dbg(dev, "read time %ptR\n", rtc_tm);
 	return 0;
 }
 
-static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
+/* Convert time to BCD and write it to RTC */
+static int s3c_rtc_write_time(struct s3c_rtc *info, const struct rtc_time *tm)
 {
-	struct s3c_rtc *info = dev_get_drvdata(dev);
-	int year = tm->tm_year - 100;
 	int ret;
 
-	dev_dbg(dev, "set time %ptR\n", tm);
-
-	/* we get around y2k by simply not supporting it */
-
-	if (year < 0 || year >= 100) {
-		dev_err(dev, "rtc only supports 100 years\n");
-		return -EINVAL;
-	}
-
 	ret = s3c_rtc_enable_clk(info);
 	if (ret)
 		return ret;
@@ -195,14 +180,53 @@ static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
 	writeb(bin2bcd(tm->tm_min),  info->base + S3C2410_RTCMIN);
 	writeb(bin2bcd(tm->tm_hour), info->base + S3C2410_RTCHOUR);
 	writeb(bin2bcd(tm->tm_mday), info->base + S3C2410_RTCDATE);
-	writeb(bin2bcd(tm->tm_mon + 1), info->base + S3C2410_RTCMON);
-	writeb(bin2bcd(year), info->base + S3C2410_RTCYEAR);
+	writeb(bin2bcd(tm->tm_mon),  info->base + S3C2410_RTCMON);
+	writeb(bin2bcd(tm->tm_year), info->base + S3C2410_RTCYEAR);
 
 	s3c_rtc_disable_clk(info);
 
 	return 0;
 }
 
+static int s3c_rtc_gettime(struct device *dev, struct rtc_time *tm)
+{
+	struct s3c_rtc *info = dev_get_drvdata(dev);
+	int ret;
+
+	ret = s3c_rtc_read_time(info, tm);
+	if (ret)
+		return ret;
+
+	/* Convert internal representation to actual date/time */
+	tm->tm_year += 100;
+	tm->tm_mon -= 1;
+
+	dev_dbg(dev, "read time %ptR\n", tm);
+	return 0;
+}
+
+static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
+{
+	struct s3c_rtc *info = dev_get_drvdata(dev);
+	struct rtc_time rtc_tm = *tm;
+
+	dev_dbg(dev, "set time %ptR\n", tm);
+
+	/*
+	 * Convert actual date/time to internal representation.
+	 * We get around Y2K by simply not supporting it.
+	 */
+	rtc_tm.tm_year -= 100;
+	rtc_tm.tm_mon += 1;
+
+	if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
+		dev_err(dev, "rtc only supports 100 years\n");
+		return -EINVAL;
+	}
+
+	return s3c_rtc_write_time(info, &rtc_tm);
+}
+
 static int s3c_rtc_getalarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct s3c_rtc *info = dev_get_drvdata(dev);
-- 
2.30.2

