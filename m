Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08642C6FD20
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Mar 2023 18:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjCUSff (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Mar 2023 14:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjCUSfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 14:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C18241C8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679423684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=sPS9ll6drXSpZudk7wgwyOxcgefAuYnobo/FFgs8jpQ=;
        b=jKOuX4H7KKrZHvL4QoJfSrsCEU4cE+O4j0K6ZpbFLZatVoKKp9wfJKdXPcDix//iYzqaW0
        BFBf1gzJVbkTMryBZ6DSDHo/RgHpWdelvh90WCiDH6ConTcvu8WCTy6zpejaZHcUtzMEyD
        p48Qxa0irnrCDG6vpE4suM/Y+j6ZoTA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-sIkACYWEPk2Mq_bH2hvf8w-1; Tue, 21 Mar 2023 14:34:43 -0400
X-MC-Unique: sIkACYWEPk2Mq_bH2hvf8w-1
Received: by mail-qv1-f72.google.com with SMTP id s3-20020a05621412c300b005cc75c78efcso2624833qvv.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 11:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPS9ll6drXSpZudk7wgwyOxcgefAuYnobo/FFgs8jpQ=;
        b=1G6wze9JlKsmVn4L2v6DTP2FBlYr3qJpBipCzdJyU7hb2fxt4oDzDNRuVAkeplgLMM
         9xqvDKs/2z20aMf31IuLhaeqE2MtYs44Uvmg5Zcfb3x+cDiMhJbGyS2p9/muhPFOEkBb
         nnED2PFkPrKM2I4XFgaY45MxunPXsn5czWsEbudaspoSJCMHiHKDvvlzOalJAViFbOWh
         Tl6/YHGKQ3ZWo5Kpf8ouwjvSrssMZoB+j7YNcaxWB0ihueNAgDOzjXfXKNi7Ers4cVaZ
         TS5rp4TfxiiE5WTDfMinNslUKPuipy+9ILLJwWLI38bpFnN3d4lJAdXELWyuJjHCJVr0
         JdyQ==
X-Gm-Message-State: AO0yUKUpKgqFirmgym+XoLRW0l8/CXDDE5m/PZc9xXHkKyvAUESA9QiO
        ox/S56VArrILPXswtSqZPyryY6Tn0azId2uEdAm5IhAl/Yf6/ktAbjV8KCy5WVE/Bu65/EPzihK
        ZPMinL1lu1eLo6P7/c8snD/9/oRrDUQ4=
X-Received: by 2002:a05:622a:c:b0:3b9:bc8c:c212 with SMTP id x12-20020a05622a000c00b003b9bc8cc212mr1130917qtw.29.1679423683056;
        Tue, 21 Mar 2023 11:34:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Nu0137AV03cS5KH42Ha1QHglBsq3KR/srTrXB0d2sDKNVBqq1BOANC35xWCA7cmroLW7GGw==
X-Received: by 2002:a05:622a:c:b0:3b9:bc8c:c212 with SMTP id x12-20020a05622a000c00b003b9bc8cc212mr1130898qtw.29.1679423682803;
        Tue, 21 Mar 2023 11:34:42 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i16-20020ac871d0000000b003d9a69b4876sm8778906qtp.11.2023.03.21.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:34:42 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] watchdog: s3c2410: remove unused freq_to_wdt and s3c2410wdt_is_running functions
Date:   Tue, 21 Mar 2023 14:34:39 -0400
Message-Id: <20230321183439.1826823-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

clang with W=1 reports
drivers/watchdog/s3c2410_wdt.c:311:35: error: unused function
  'freq_to_wdt' [-Werror,-Wunused-function]
static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
                                  ^
drivers/watchdog/s3c2410_wdt.c:446:19: error: unused function
  's3c2410wdt_is_running' [-Werror,-Wunused-function]
static inline int s3c2410wdt_is_running(struct s3c2410_wdt *wdt)
                  ^
These functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 200ba236a72e..6394dda7a5dc 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -308,11 +308,6 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 				       / S3C2410_WTCON_MAXDIV);
 }
 
-static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
-{
-	return container_of(nb, struct s3c2410_wdt, freq_transition);
-}
-
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
@@ -443,11 +438,6 @@ static int s3c2410wdt_start(struct watchdog_device *wdd)
 	return 0;
 }
 
-static inline int s3c2410wdt_is_running(struct s3c2410_wdt *wdt)
-{
-	return readl(wdt->reg_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
-}
-
 static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 				    unsigned int timeout)
 {
-- 
2.27.0

