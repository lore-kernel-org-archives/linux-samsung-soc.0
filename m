Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07A7C43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EE37613AF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 17:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhDTRDV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:03:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50134 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbhDTRDV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 13:03:21 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtlx-0004be-2i
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 17:02:49 +0000
Received: by mail-ed1-f70.google.com with SMTP id m18-20020a0564025112b0290378d2a266ebso13458179edd.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rjka4Njemna1OOKJdcZeeFwVYEY/9hgKuOFFKuvjSYE=;
        b=EMLZfUJ5ChzDSP5tHC4eoMWeVAl0HqIaI2ZmhZZgpabXrjirWRhMevUCw0zuzpbLuB
         1gSQ5OiVISsubo9c8DUdTR4drO04TMpOhT2VUtzkxcZUCPB8510lDVmk9nTFzyXq8hNj
         inm9vvslnF8p12A+uHR+i0atQfl4AwokvgOShcMtTRSIrSNY5vmMcjemnG6ALYoAofpH
         9rsaoIW9JtyMUBIqdXtEqhDbN66hkEgylU8BiD3P5Sy3fWn/+4iQ5taizeocKhOAl1ea
         kIYi9KlVDnxPR/QNu/dUqRLzlQL7l9Tc/RZNSQv346Krzqx/h+YnjgdtL/slhpGue0V0
         8wrg==
X-Gm-Message-State: AOAM530ixPRM85u6tKYTYbU8UeG301TQc3s7Ag/MicTvgxusmYb5UJnD
        6epw/HBuhXErpwnXFCb5Qcp3H0CYm3wGqiRzChZmftdOu6cREdP7p3zuGdK5oyd8pLORC4ODkrS
        QeFCGEzqbOsHzjgMqmfSKxTepEE5dDG/qx8DirXogZCyV3KWd
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr29272725ejb.231.1618938168643;
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEptLquhZ2/QqZ4X/5o6u/BOlY7S9w9blCK0zCE6EhdECvGDYJS8VhGVzjFSaiOFlOBW2WUw==
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr29272709ejb.231.1618938168470;
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 6/9] mfd: sec: Remove unused platform data members
Date:   Tue, 20 Apr 2021 19:02:41 +0200
Message-Id: <20210420170244.13467-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung PMIC drivers for early chipsets like S5M8767 stored quite a
lot in platform data (struct sec_platform_data).  The s5m8767 regulator
driver currently references only some of its fields.  Newer regulator
drivers (e.g. s2mps11) use even less platform data fields.

Clean up the structure to reduce memory footprint and source code size.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/linux/mfd/samsung/core.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b0d049a56d16..f92fe090473d 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -80,8 +80,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	bool				buck_voltage_lock;
-
 	int				buck_gpios[3];
 	int				buck_ds[3];
 	unsigned int			buck2_voltage[8];
@@ -91,35 +89,12 @@ struct sec_platform_data {
 	unsigned int			buck4_voltage[8];
 	bool				buck4_gpiodvs;
 
-	int				buck_set1;
-	int				buck_set2;
-	int				buck_set3;
-	int				buck2_enable;
-	int				buck3_enable;
-	int				buck4_enable;
 	int				buck_default_idx;
-	int				buck2_default_idx;
-	int				buck3_default_idx;
-	int				buck4_default_idx;
-
 	int				buck_ramp_delay;
 
-	int				buck2_ramp_delay;
-	int				buck34_ramp_delay;
-	int				buck5_ramp_delay;
-	int				buck16_ramp_delay;
-	int				buck7810_ramp_delay;
-	int				buck9_ramp_delay;
-	int				buck24_ramp_delay;
-	int				buck3_ramp_delay;
-	int				buck7_ramp_delay;
-	int				buck8910_ramp_delay;
-
-	bool				buck1_ramp_enable;
 	bool				buck2_ramp_enable;
 	bool				buck3_ramp_enable;
 	bool				buck4_ramp_enable;
-	bool				buck6_ramp_enable;
 
 	int				buck2_init;
 	int				buck3_init;
-- 
2.25.1

