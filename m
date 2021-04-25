Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B25DC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Apr 2021 17:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55A646103E
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 25 Apr 2021 17:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhDYRua (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 25 Apr 2021 13:50:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51476 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhDYRu3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Apr 2021 13:50:29 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1laitA-0005Hk-Ke
        for linux-samsung-soc@vger.kernel.org; Sun, 25 Apr 2021 17:49:48 +0000
Received: by mail-ed1-f70.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bso21878185edb.23
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Apr 2021 10:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBjEAtJQftD+dVBcJH/vI5ONKidJRREyztVu/ffD0/8=;
        b=VaHwR9sr6y4SXPF0JNZz56fTMZF+jdTsHFuVOnSTU7wyo9vR0D99uQ4GKJtn5J1Nrs
         f0Dh09Zm8JLoXrgNUJSO2V/9vO2iGrksldJWYvVlyWMBtozrd7AwwpAt1E+xY0Holh+7
         b+YSeRfYohYp8x6CQfgbGQmIfRdA4kRXoQTGi096k04KasJF4/hAYOfsyH2a2O6EK20P
         KrFXB2KLb1PnWE5mjko62ywEtVSQq7nwrZgcJJV29iZ19QY+nWtTebVT5qQG9aiiVebe
         VwGqc2t4EK+z5gX8y3SNz2WQvu53BoTt20QEClRlaKnEeoVUBukLB+B54nxDlw/W8c70
         +p2A==
X-Gm-Message-State: AOAM530oo4auLigM/I6ZIIXtkDpvdQQiGDAAcNij+dzlVQ9wF6Wxa+kV
        e9pzbDhoInV6Q9+5sKTHdPDzUqmNR19nLNg6P6QmsjZT8jjn2jFRnyTtlO6YVX8HOPHW61Z2H47
        Vzet3Aqo/PWUvlQxELZU0/YpbCUSlse7TGdn7WLPvk5W4XIZR
X-Received: by 2002:a17:906:38c5:: with SMTP id r5mr14085226ejd.230.1619372988160;
        Sun, 25 Apr 2021 10:49:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxIa+fvr/8tH3+GL4vr6HdZUUJF//xEt4ORa/3i/PjDfkoJ3qcmGmy6Th5L2m2eXQP7EgPhw==
X-Received: by 2002:a17:906:38c5:: with SMTP id r5mr14085217ejd.230.1619372988033;
        Sun, 25 Apr 2021 10:49:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id ca1sm12113585edb.76.2021.04.25.10.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 10:49:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: exynos: add missing of_node_put for loop iteration
Date:   Sun, 25 Apr 2021 19:49:45 +0200
Message-Id: <20210425174945.164612-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Early exits from for_each_compatible_node() should decrement the
node reference counter.  Reported by Coccinelle:

  arch/arm/mach-exynos/exynos.c:52:1-25: WARNING:
    Function "for_each_compatible_node" should have of_node_put() before break around line 58.

Fixes: b3205dea8fbf ("ARM: EXYNOS: Map SYSRAM through generic DT bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/mach-exynos/exynos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 25b01da4771b..8b48326be9fd 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -55,6 +55,7 @@ void __init exynos_sysram_init(void)
 		sysram_base_addr = of_iomap(node, 0);
 		sysram_base_phys = of_translate_address(node,
 					   of_get_address(node, 0, NULL, NULL));
+		of_node_put(node);
 		break;
 	}
 
@@ -62,6 +63,7 @@ void __init exynos_sysram_init(void)
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
+		of_node_put(node);
 		break;
 	}
 }
-- 
2.25.1

