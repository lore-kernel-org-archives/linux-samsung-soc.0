Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D23C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:28:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 170B061029
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:28:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344626AbhIXN3k (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:29:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37398
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345930AbhIXN3N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:29:13 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F15904081A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490059;
        bh=Yduh3EuPKF8pEjpWRTy33G3o5bhDuVyJYzIS4FssiFw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=di3bwnC4Z5kTHP2go5K5gWLMGdN5FH0PjlDFoxx9NXJkc+6XL56OQZ7ZJB6ROj5Sd
         qmQ0iHs3jqA+yaxvm3XQm+SMx1+g30iH/YdTbFCFVXtvKdCTfLj2yWYqLGslbAg8tL
         zrL5F3o5tHsKBPtum1ljGQdbuygzrSl//8v9/29PqEGcxfQvsGUQ+jjqZygBWqt6Yk
         UdJyQ8lUh4sW1C3ENmW8gBFyBduekDS1+/osC/hJF4SxM3exQvBBilXygVUSM7E1Pv
         rNTWl8iRVYKMs2dphuUpCG2esTiYVViXLmeQ9bnYJwHyMtNdNMSLeRR/cgIbXljWNT
         c7V7/L+rMFH9w==
Received: by mail-wr1-f72.google.com with SMTP id m18-20020adfe952000000b0015b0aa32fd6so8070380wrn.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yduh3EuPKF8pEjpWRTy33G3o5bhDuVyJYzIS4FssiFw=;
        b=TwmcTSXkcM4ny+IDCa7+J70V+CWrOGnydyM4G0+NxwWRAuucZqUyz71iFtb9x1ewOD
         wQ3MVqno9BwzaF21Df/j0fEjPxZvSGJMKYMmhG1A1zt1o+Xi+WurJ+TbH84//jbWrOwf
         rqWLhVRZmRIztkJw9X10d9cRa5AJ85kPHkTVmG/vJurNefTFYLDciUhdTWp9C/8qyyz2
         8zCYOZib4AYQ0nXWzXtuS+sjhda46YWRe5dHhOIVXTc04112j2sFC4mojOYH8SgQFlfb
         1JMp9wePAM0TGwglrU6PhS31xo0DPAvC/vVWXDn4iPVp3amxQYL3kIYN7kNfRT5OxI74
         xE0A==
X-Gm-Message-State: AOAM531Im824UN4QRhctVIv2aBsZzxc2mw7qoQr4O2Y0wwmJZ9oWLs3U
        sfXGWCCPewsnWKFifeSr4LX6BRoZb+t1/MtmyxGKYF9WYamoOcR8tvOefnCPlUYM3P9DblCek01
        N+L3UqEwSpdC2sMG84X/XwusCWegfjy9WpUPwsz32tq95BLZl
X-Received: by 2002:a5d:6545:: with SMTP id z5mr11455572wrv.51.1632490059711;
        Fri, 24 Sep 2021 06:27:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5S/UeS56vFgo1ZCJhSJ4phgoKPfDX2Y+OA8xv8ibUzmyYGx+lfLXUHLOGyC+XxWzMQL4icA==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr11455561wrv.51.1632490059558;
        Fri, 24 Sep 2021 06:27:39 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id s2sm30386wru.3.2021.09.24.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:27:39 -0700 (PDT)
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
Subject: [PATCH 2/2] scsi: ufs: exynos: unify naming
Date:   Fri, 24 Sep 2021 15:26:58 +0200
Message-Id: <20210924132658.109814-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924132658.109814-1-krzysztof.kozlowski@canonical.com>
References: <20210924132658.109814-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

We use everywhere "Samsung" and "Exynos", not the uppercase versions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/scsi/ufs/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 565e8aa6319d..af66cb3634a8 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -165,14 +165,14 @@ config SCSI_UFS_BSG
 	  If unsure, say N.
 
 config SCSI_UFS_EXYNOS
-	tristate "EXYNOS specific hooks to UFS controller platform driver"
+	tristate "Exynos specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && (ARCH_EXYNOS || COMPILE_TEST)
 	help
-	  This selects the EXYNOS specific additions to UFSHCD platform driver.
-	  UFS host on EXYNOS includes HCI and UNIPRO layer, and associates with
-	  UFS-PHY driver.
+	  This selects the Samsung Exynos SoC specific additions to UFSHCD
+	  platform driver.  UFS host on Samsung Exynos SoC includes HCI and
+	  UNIPRO layer, and associates with UFS-PHY driver.
 
-	  Select this if you have UFS host controller on EXYNOS chipset.
+	  Select this if you have UFS host controller on Samsung Exynos SoC.
 	  If unsure, say N.
 
 config SCSI_UFS_CRYPTO
-- 
2.30.2

