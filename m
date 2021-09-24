Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6658DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:28:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CAF261039
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344807AbhIXN3j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:29:39 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37362
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345061AbhIXN3N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:29:13 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E47804079D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490058;
        bh=9lxNX9SoiwZF5dcOxctnI5jIG4IwRTL7ipvDb0MgSb8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=v8CpYBEPpAENeXtFgA21wA/RtdkDHBM46CTyL+PJTmAzB3tqTLjRj+gFU8uv/A0uv
         8wIjIkUT/lw2VHeaWVQgROkT8UHY0uVGqjaay8dOF+71oZ8kXqeh5L6B9oy6u6RSGc
         re/NZCRX6V7nOPVqLYbHkCsReftHa/lufvPJIzeTgFMLZi3erkwAjhAu9K37J++BVw
         47wU3rvjM5AN5f85B4U+jPytLiTeGUEHP033LCWtwxvUAzM1ytCUmUlhMYFsL4neF+
         WJ0MFKnATiyA2D0qhMGIhvr9g1eNRBkCw1IfCNHl4/10F3unOa2A+ItEgBFZaIxZmR
         TI+aQl1iUlxjg==
Received: by mail-wr1-f70.google.com with SMTP id r15-20020adfce8f000000b0015df1098ccbso8106034wrn.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9lxNX9SoiwZF5dcOxctnI5jIG4IwRTL7ipvDb0MgSb8=;
        b=H+QklW9bD+jm0fwmVjZylCz4gUQKIBs6w/5nANBLdyMYCn9FpRJTeL1B8EFp4xurgo
         vp6ejjaE8VQQ4YDI8PWjKZqDI3BRZXY8QjMb3xWdgJGOmAY+Mhrjl+w7kvphuNSx5Cwj
         DryJTRB92R9KtxCdHClpfGbbzZCeqIrvuV8XsC+3bD8ljc4Ie7GZ/DXSxnUj5n5KFqGi
         lWYxLcBTGIkqvioL5wtKlGZPGzzBGslkJjadTETiS4nw0tcUEjnmZVYXfoRc6eJPMmOX
         2rzx7y0x2WhkH1TlrG6bBqZrdH2j/HhDdGyY5D4irrdRmE1GbxFzcqx8pgiMpUPkAOhx
         zpvg==
X-Gm-Message-State: AOAM531GgLzX+FTr6FX3PZFVD3M/neCuaDYAn+DdVDJ2kdLiwcvhZPWY
        3l9cIop3pDmTMe3Ef/J3uCd+42uip7fJjYTBbxCM8HWh5jlmaoVdH77V2JR8iIrob9QHFgbbLtF
        4bdF/N4/VjY2pHyeSATPDZYIrm3tLNNvDUks/2OF3HYZs6Qw2
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr11753112wrf.416.1632490058475;
        Fri, 24 Sep 2021 06:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjGdcj1FCIMyVG6GWQ+ezHpaSa3jvvTO0U6+mzqQ5umN+Qve67heywragH63BpP0dQDzzy9w==
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr11753098wrf.416.1632490058315;
        Fri, 24 Sep 2021 06:27:38 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id s2sm30386wru.3.2021.09.24.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:27:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] phy: samsung: unify naming and describe driver in KConfig
Date:   Fri, 24 Sep 2021 15:26:57 +0200
Message-Id: <20210924132658.109814-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We use everywhere "Samsung" and "Exynos", not the uppercase versions.
Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/phy/samsung/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index e20d2fcc9fe7..3ccaabf2850a 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -30,16 +30,16 @@ config PHY_EXYNOS_PCIE
 	  This driver provides PHY interface for Exynos PCIe controller.
 
 config PHY_SAMSUNG_UFS
-	tristate "SAMSUNG SoC series UFS PHY driver"
+	tristate "Exynos SoC series UFS PHY driver"
 	depends on OF && (ARCH_EXYNOS || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable this to support the Samsung UFS PHY driver for
-	  Samsung SoCs. This driver provides the interface for UFS
-	  host controller to do PHY related programming.
+	  Enable this to support the Samsung Exynos SoC UFS PHY driver for
+	  Samsung Exynos SoCs. This driver provides the interface for UFS host
+	  controller to do PHY related programming.
 
 config PHY_SAMSUNG_USB2
-	tristate "Samsung USB 2.0 PHY driver"
+	tristate "S5P/Exynos SoC series USB 2.0 PHY driver"
 	depends on HAS_IOMEM
 	depends on USB_EHCI_EXYNOS || USB_OHCI_EXYNOS || USB_DWC2 || COMPILE_TEST
 	select GENERIC_PHY
@@ -47,9 +47,9 @@ config PHY_SAMSUNG_USB2
 	default ARCH_EXYNOS
 	help
 	  Enable this to support the Samsung USB 2.0 PHY driver for Samsung
-	  SoCs. This driver provides the interface for USB 2.0 PHY. Support
-	  for particular PHYs will be enabled based on the SoC type in addition
-	  to this driver.
+	  S5Pv210 and Exynos SoCs. This driver provides the interface for USB
+	  2.0 PHY. Support for particular PHYs will be enabled based on the SoC
+	  type in addition to this driver.
 
 config PHY_EXYNOS4210_USB2
 	bool
-- 
2.30.2

