Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C80C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 May 2021 12:14:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5639D6105A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 May 2021 12:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhEDMPj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 4 May 2021 08:15:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41494 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhEDMPi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 May 2021 08:15:38 -0400
Received: from mail-qt1-f199.google.com ([209.85.160.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1ldtwo-000149-Pj
        for linux-samsung-soc@vger.kernel.org; Tue, 04 May 2021 12:14:42 +0000
Received: by mail-qt1-f199.google.com with SMTP id s4-20020ac85cc40000b02901b59d9c0986so3399188qta.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 May 2021 05:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2jrHuSrwRsSBaANh1fW2x8t+NrzkJf+pmPZRwAI6hhI=;
        b=dVg5Y1cu8GKDTPWZnsDqFBjOui/d6vltFSpGRSVN/onKvOUIVwhmEbedHvcCCNw/qd
         oGPdxCujGtzDA0wAgePjPzh6BKDTXB71448su1hm2fRzjz0xptLCknIY7mZerM2MW1k7
         04pxVxGRTiWX/datgaqjRi9IHsnquYi0Fmf5rVTJzdOURR9gRsm207Yxv8d23nD2ZVgv
         3o+VN/q5Sbhj5+HA+CU3f7UboXuM6xdJ3Jqu7LDGPvpr0SXRgqWHw98g0xUmKFcIGZNe
         pexEQYf6ae/S9mn6yGZuZ2abSU4Klfv2cfQdQyFOdpxH2E1vgfnshWdS9Wwmp5GJd67z
         b+zw==
X-Gm-Message-State: AOAM5306qZ4mxiFqLZa/3B9RBh4ZtALNrRvpVsGu62Zx7KZm7Lk175l/
        q7JEtKLzWm6oq5qp2kd5wJUAu9ZOBRphpO+phJnlUsgbanZmCQeu4pGxeG/epdRUyt5bM72i99m
        i0ct1mZQFX5Zw5KOqHgLnza65RFLEukrKbEIW0V1HViby+zoO
X-Received: by 2002:a05:6214:a62:: with SMTP id ef2mr19916174qvb.31.1620130482023;
        Tue, 04 May 2021 05:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfTe7sTJl6AKixtSfV1yALubwrsCN0jqdi8R0pr10kYahin2lK2I1QmOQq1q4omwSb3OIA7g==
X-Received: by 2002:a05:6214:a62:: with SMTP id ef2mr19916162qvb.31.1620130481914;
        Tue, 04 May 2021 05:14:41 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.5])
        by smtp.gmail.com with ESMTPSA id v66sm10743990qkd.113.2021.05.04.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 05:14:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: power: supply: use Krzysztof Kozlowski's Canonical address
Date:   Tue,  4 May 2021 08:14:37 -0400
Message-Id: <20210504121437.13424-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Switch to Canonical address in S3C power supply driver, just like in
other entries.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1783372a608a..ccb9823fb77f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16021,7 +16021,7 @@ W:	http://www.ibm.com/developerworks/linux/linux390/
 F:	drivers/s390/scsi/zfcp_*
 
 S3C ADC BATTERY DRIVER
-M:	Krzysztof Kozlowski <krzk@kernel.org>
+M:	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
 L:	linux-samsung-soc@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/power/supply/s3c_adc_battery.c
-- 
2.25.1

