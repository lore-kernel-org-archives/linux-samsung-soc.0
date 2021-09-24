Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388BAC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FA9861029
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:34:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346482AbhIXNgX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:36:23 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59858
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346711AbhIXNgO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:36:14 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F17E440783
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490480;
        bh=5+nyS+8H1EI+4wuDtZ6/wTKJyuB2Y7OoOebqtWuTbI8=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=uc9l97I8qPsRzQeSeXLeOlKLdYgl9OsVxBowfUKFeYuhLmv3gJxRnqoVVAQHlVWro
         TQAehkhtXQVmrXpej2OmX3QhPuWY3sYrg9jQygYU16vu5uADF6fnkbVz0NPIYdNsWj
         ellENIqAMIRKnFvQZ4vA91ZwafSvgzub5tvUX9548L/9Q7f53do5n2mkKN1AP/2r2T
         e3RlaqSgfIfmeg8ZNEF9nWhEcV9sdfybvMCF0Lsj1eBusiY0wiTxtCv/eeFmAEwPoZ
         CNHcwENhd1oW6xt9SBIpJ6U/U23V01GJST9f80EfKuNP4EV37MlL0IdECAjxH4HzfS
         39NrkGiUyJ5Uw==
Received: by mail-wr1-f71.google.com with SMTP id r9-20020a5d4989000000b0015d0fbb8823so8059695wrq.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5+nyS+8H1EI+4wuDtZ6/wTKJyuB2Y7OoOebqtWuTbI8=;
        b=smCTutCkBOACJCNeNHNvvzdUvJI6OzO2kVEu1vBlDNFsI1Ocxa8/OTaepiIaQwYgfu
         pNUYeygItmYdBxemerKWEj0K0PqlEBXgMUN3KL/mYQ2BktcY6wIDY10qluj8P7jrkEEY
         A1uOapM7m2pQzMCKpkDOig201PKWYH1B+NcO2zDi+bxWpJ9Ca3dGKNG/5vrzwNZGzM+c
         MXQBo1d8Kp5eO9k5HT6auPN/4jDABzZjj8ZK3IMzHshr0D39t7FxkqJSRyshGPe8VGwL
         Ia0KDxQH86f72G1S5v81R8BY77svozPLrAUWvnn8dwEBTTl+QscKT4P/Ib4A+Yu/Mszs
         WcEg==
X-Gm-Message-State: AOAM532HW22+lqSKb8p2VrvVl85UIbNIKiG70JjyjeplTMAYXC89QaAO
        lnqR9iq9FS7R2+DGBwDc4XgmnDWfQAwlBQSiarnufCw7E33lyN7x3o4gH/KdKKF08hEa2K8nCHV
        giWU/gdSeey+BV19fEAoX5cwfpRMergB9Y3Z52Wfjb8PpFaQV
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr2196077wmh.18.1632490480726;
        Fri, 24 Sep 2021 06:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwD8TiymTUOSk80Xbr11Auvywd8mj3T7jXFVBsXWifcr1B2/E9Cd30auAL2+T5fNBUS3S8NQ==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr2196062wmh.18.1632490480577;
        Fri, 24 Sep 2021 06:34:40 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id q7sm8297225wru.56.2021.09.24.06.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:34:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] memory: samsung: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:34:06 +0200
Message-Id: <20210924133406.112174-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Rephrase the Kconfig option and make it clear it applies only to Samsung
SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/memory/samsung/Kconfig | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/samsung/Kconfig b/drivers/memory/samsung/Kconfig
index 8e240f078afc..7fb70f573031 100644
--- a/drivers/memory/samsung/Kconfig
+++ b/drivers/memory/samsung/Kconfig
@@ -14,11 +14,12 @@ config EXYNOS5422_DMC
 	depends on DEVFREQ_GOV_SIMPLE_ONDEMAND
 	depends on (PM_DEVFREQ && PM_DEVFREQ_EVENT)
 	help
-	  This adds driver for Exynos5422 DMC (Dynamic Memory Controller).
-	  The driver provides support for Dynamic Voltage and Frequency Scaling in
-	  DMC and DRAM. It also supports changing timings of DRAM running with
-	  different frequency. The timings are calculated based on DT memory
-	  information.
+	  This adds driver for Samsung Exynos5422 SoC DMC (Dynamic Memory
+	  Controller).  The driver provides support for Dynamic Voltage and
+	  Frequency Scaling in DMC and DRAM. It also supports changing timings
+	  of DRAM running with different frequency. The timings are calculated
+	  based on DT memory information.
+	  If unsure, say Y on devices with Samsung Exynos SoCs.
 
 config EXYNOS_SROM
 	bool "Exynos SROM controller driver" if COMPILE_TEST
@@ -29,6 +30,6 @@ config EXYNOS_SROM
 	  during suspend.  If however appropriate device tree configuration
 	  is provided, the driver enables support for external memory
 	  or external devices.
-	  If unsure, say Y on devices with Samsung Exynos SocS.
+	  If unsure, say Y on devices with Samsung Exynos SoCs.
 
 endif
-- 
2.30.2

