Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22648C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C0C960F4C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346006AbhIXNcQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:32:16 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59636
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345989AbhIXNcO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:32:14 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5657940783
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490240;
        bh=3xD6qAEhtRsJqFfznLwkKRQHrDkBb3UaWxl2/slC6j4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=nSjm3xZyhfahJPG/dd2BJOA02+LCoFxYoguBs6CybtMYbjB18D0DM1KPv5jTLqY6X
         nlIYIqRHgJy0L2EuIYJBhbSmCdrSEPWC8yJ/9FBt4CSurIYr66iqE2ky6vcDn1hlWU
         dN/Ng9JdxDbazvJTXTJcyi+IbVK0gMqN2vOx5C7QIrxadz8Zv6v+ym8xtkmTph3fQ7
         yrGW20s5ZFT/wLoikFsCKO21fuU0JaiqEaVADR1b5D/7kijNpavDfURf4af/uc2EJN
         vFX3G4DsRxx92eYfnzBOSu+LAndjijk0OZbK/ulBe/rJagxD97Cc/FzyXB863N443R
         LzrdsmSDinvSw==
Received: by mail-wr1-f69.google.com with SMTP id j16-20020adfa550000000b0016012acc443so8079703wrb.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xD6qAEhtRsJqFfznLwkKRQHrDkBb3UaWxl2/slC6j4=;
        b=XB6wW1a3auAQmFoK+PYx3THuXZMd/mL9RjowmxwhogdvaeI4V7aRUCYlD9Z/hpkBlU
         R4iTM0xvS8UEMxJR08Fas3ZRBCoP+vMO+PCXAx5IvOoXkSvMIx91f2HlRL60hlPpNa7l
         LEGKpNotdqoi+hJIZR7K2KySb953pP4pZcZC+RVBAtGiGsBrK9SVDYfpVO+lCl5ntGkq
         77YWSdmGEDcircUFyATb3Lon2GTG2+c9LZhPYK4oxntFCino3RRgoelCpSC4mQp7Vsd4
         +mJQG6fQ49w88ChERhvfAMR/rCpzNufd1Sm61WpY1vamK7Yxbsr9LOTkM+G81WZrr29y
         ZNmQ==
X-Gm-Message-State: AOAM532VImBg6+C646GG5o1NIjtB18N0dLAB+puZJJmjLMfwHVUnBfg1
        gYevap/LbUqK79kCGeqDFJji1hElfgN7b62aDgK6WXT6ngvcT41MPryoWGPlEhCP0rLFMiQQhFI
        VN45XzcPr6iMqpe8R9irfKURscLgUxUUhGXqSoTJtg445CtYJ
X-Received: by 2002:a7b:c052:: with SMTP id u18mr2131024wmc.105.1632490239951;
        Fri, 24 Sep 2021 06:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxatSONAGwx8bkyPabvpoXT2g6eOdCu2CFURKgVt6gBRUeQdbu9BS0S8yUmhBIZdqIfSdu7VA==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr2130997wmc.105.1632490239750;
        Fri, 24 Sep 2021 06:30:39 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l19sm8646742wrc.16.2021.09.24.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:30:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: exynos: describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:30:05 +0200
Message-Id: <20210924133005.111564-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/usb/dwc3/Kconfig | 7 ++++---
 drivers/usb/host/Kconfig | 6 ++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 66b1454c4db2..c483f28b695d 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -66,12 +66,13 @@ config USB_DWC3_OMAP
 	  Say 'Y' or 'M' here if you have one such device
 
 config USB_DWC3_EXYNOS
-	tristate "Samsung Exynos Platform"
+	tristate "Samsung Exynos SoC Platform"
 	depends on (ARCH_EXYNOS || COMPILE_TEST) && OF
 	default USB_DWC3
 	help
-	  Recent Exynos5 SoCs ship with one DesignWare Core USB3 IP inside,
-	  say 'Y' or 'M' if you have one such device.
+	  Recent Samsung Exynos SoCs (Exynos5250, Exynos5410, Exynos542x,
+	  Exynos5800, Exynos5433, Exynos7) ship with one DesignWare Core USB3
+	  IP inside, say 'Y' or 'M' if you have one such device.
 
 config USB_DWC3_PCI
 	tristate "PCIe-based Platforms"
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index c4736d1d020c..d1d926f8f9c2 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -290,7 +290,8 @@ config USB_EHCI_EXYNOS
 	tristate "EHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
-	  Enable support for the Samsung Exynos SOC's on-chip EHCI controller.
+	  Enable support for the Samsung S5Pv210 and Exynos SOC's on-chip EHCI
+	  controller.
 
 config USB_EHCI_MV
 	tristate "EHCI support for Marvell PXA/MMP USB controller"
@@ -563,7 +564,8 @@ config USB_OHCI_EXYNOS
 	tristate "OHCI support for Samsung S5P/Exynos SoC Series"
 	depends on ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	help
-	  Enable support for the Samsung Exynos SOC's on-chip OHCI controller.
+	  Enable support for the Samsung S5Pv210 and Exynos SOC's on-chip OHCI
+	  controller.
 
 config USB_CNS3XXX_OHCI
 	bool "Cavium CNS3XXX OHCI Module (DEPRECATED)"
-- 
2.30.2

