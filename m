Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5035FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3859060FE8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhJUUZX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231971AbhJUUZT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 16:25:19 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7CFC061220
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:03 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id t16so5577180eds.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FoCS2Of8JxmjrHA0ciYvVff3O/0PQ9jcwIzAZgxkZS4=;
        b=xZaim99sf1bhVyq0cz+y+AGLha2Rs85XXTMdgylFks8k1SKW0pM6Tf4ovbIHHTJm7a
         f5k7Kc/crnsPDQWV92l8nrxWK26UPS0UA+rBvHaM2ffryWvXOWI8H+Vc12Tq2LKjphVs
         wzjP56H05iTP5rL9g/zdrJ2L6raRN3zejvpMVVn9veKSfip5gnXk19/TJYGMM3Cs6Xro
         NiV7ep6Y1Es7b4YDM39aRn7Qzq1XDw0L/B1nl0TMSmfxpJ8SPH0oTL+60Uvt5Zohr7Vz
         5qn3lg2t4TNzdHxT2nEQBsMV5NBCg2afSX3CPIj72gsISFp6/SGISgJ86s1J9/wes7lJ
         ge4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FoCS2Of8JxmjrHA0ciYvVff3O/0PQ9jcwIzAZgxkZS4=;
        b=pLo1ZAbiSSw/CM+8ZKbmMe7kKvRnSKsG28idQX6GAbuxGtlhA1+mQdXJhfa4dw3Fxp
         VIRlCklIGbTPxZIZkzzZOsef/yro26jV7gKXDasWUuNQYfScHsP2UElll7WyEzPsQbJO
         jm6SXjjB/dHp+oXqn7UFmD3xDc+9kahRx8kJlqgaZ9U/GSPhzZT0ib+UUN8zbn2MrfmJ
         xX7X2fE198CgjccBmP50nG6OTHDUqxv9FPNB0LCuY46aAk91VEtOQidEvePsaqgfyQ2z
         kU0vM//FPxOLqFVo1Rag/09vjI1mYaM4oSkqVKB7Qgk8ZUhL9uENLYyQDY6xiGD4pixG
         sS3g==
X-Gm-Message-State: AOAM533D8fSgZGiuEkigwCJm+zY6AC96v2ps8jShPJtssIXa2Eynrm6o
        fNR51LVe76fqKMLiZZ9cQhqGFA==
X-Google-Smtp-Source: ABdhPJzNwPC1x2uv2WuF6tsvx9+hXHVKaMH2Rdw3WklOnENLjkro6EEJq++2tcWXb/uSqXPiBfPnBg==
X-Received: by 2002:a17:906:181a:: with SMTP id v26mr2131988eje.478.1634847781841;
        Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u18sm3293456eds.86.2021.10.21.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] rtc: s3c: Add time range
Date:   Thu, 21 Oct 2021 23:22:56 +0300
Message-Id: <20211021202256.28517-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021202256.28517-1-semen.protsenko@linaro.org>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This RTC driver starts counting from 2000 to avoid Y2K problem. Also it
only supports 100 years range for all RTCs.  Provide that info to RTC
framework. Also remove check for 100 years range in s3c_rtc_settime(),
as RTC core won't pass any invalid values to the driver, now that
correct range is set.

Here is the rationale on 100 years range limitation. Info on different
Samsung RTCs (credit goes to Krzysztof Kozlowski):
  - All S3C chips have only 8-bit wide year register (can store 100
    years range in BCD format)
  - S5Pv210 and Exynos chips have 12-bit year register (can store 1000
    years range in BCD format)

But in reality we usually can't make use of those 12 bits either:
  - RTCs might think that both 2000 and 2100 years are leap years. So
    when the YEAR register is 0, RTC goes from 28 Feb to 29 Feb, and
    when the YEAR register is 100, RTC also goes from 28 Feb to 29 Feb.
    This is of course incorrect: RTC breaks leap year criteria, which
    breaks the time contiguity, which leads to inability to use the RTC
    after year of 2099. It was found for example on Exynos850 SoC.
  - Despite having 12 bits for holding the year value, RTC might
    overflow the year value internally much earlier. For example, on
    Exynos850 the RTC overflows when YEAR=159, making the next YEAR=0.
    This way RTC actually has range of 160 years, not 1000 as one may
    think.

All that said, there is no sense in trying to increase the time range
for more than 100 years on RTCs that seem capable of that. It also
doesn't have too much practical value -- current hardware will be
probably obsolete by 2100.

Tested manually on Exynos850 RTC:

    $ date -s "1999-12-31 23:59:50"
    $ hwclock -w -f /dev/rtc0
    $ date -s "2100-01-01 00:00:00"
    $ hwclock -w -f /dev/rtc0
    $ date -s "2000-01-01 00:00:00"
    $ hwclock -w -f /dev/rtc0
    $ hwclock -r -f /dev/rtc0
    $ date -s "2099-12-31 23:59:50"
    $ hwclock -w -f /dev/rtc0
    $ hwclock -r -f /dev/rtc0

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Removed check for 100 years range in s3c_rtc_settime()
  - Improved the commit message

 drivers/rtc/rtc-s3c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index d1baf655c008..db529733c9c4 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -219,11 +219,6 @@ static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
 	rtc_tm.tm_year -= 100;
 	rtc_tm.tm_mon += 1;
 
-	if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
-		dev_err(dev, "rtc only supports 100 years\n");
-		return -EINVAL;
-	}
-
 	return s3c_rtc_write_time(info, &rtc_tm);
 }
 
@@ -478,6 +473,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	}
 
 	info->rtc->ops = &s3c_rtcops;
+	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ret = devm_rtc_register_device(info->rtc);
 	if (ret)
-- 
2.30.2

