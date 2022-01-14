Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432E5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jan 2022 14:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241949AbiANOqK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jan 2022 09:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241959AbiANOqK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 09:46:10 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8F0C061574
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:46:09 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b14so12523731lff.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 06:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSKRUaLsfJfUnzvmnBvx1Gx7Z4MA4RF1gGT6nyveJj0=;
        b=l+aO4kxL+2IolvBE1/PZe4caAKQ+C4QQRKMRUspMhpn0bG6GPSCcVbqEwcExCyi4Dr
         myngy1BLNt86v5Ywzk09729EHCzCVerjZOCjTzu6C8aMlmkH2eu475hmKlnAjaEnnVt1
         9Cf4NX46x23ppQPniRKPgz7TNXwj0dUwld7XCaNUJir/kdfZNqGcYtK94mVBfjFT4OZn
         Pde+62KnnP4VlUN7ocEDzcyM1uG7XcxheMKSl6n6Z1DsRCv2WdSpovOYOD7cKk3mkbqd
         4EVFQzKZmX2VHy57rr3WZrTpurgTIowrWfnjWCN/Yn+B14YYFApnTqBI0kOv9c6J+whg
         EfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CSKRUaLsfJfUnzvmnBvx1Gx7Z4MA4RF1gGT6nyveJj0=;
        b=ot/b7zMurvznQNjCyNGjKsLc/HCgdbGfAf5l2YIBex3HNLu6uTEU9CMqV2dzvxeDWO
         NxXFYLHy2NcEgBhfrgkCt0oeEc3P9Z9nYUrWz7/tLugGekNw9JpOSRUdN7O3dfVMSaGO
         ZsageDCjL7DFkKKDtTw0RUg97HohzUgUV7c4/KMxkpXF6ggxFzyziaSQl8i+iNqz8L2D
         2eQXrxWg7jEsT0bL1IX/+GOUdGb8WYrCbh1fInsql0FGTfRg2Dz1cZPMm0Dq1pR+fGTI
         FdKafqIM3oxZnuLQuaBz9K9UUhTrUgHN5lXUE4ixMwvjJbKb0M+sfRoY3CyVLXIBiarq
         y0zg==
X-Gm-Message-State: AOAM531A/rWahfj8UQK2jNUMO5gGUYYlvykFstfOF6CrEZkJVsV9jXxX
        5z/dpuw/woSw0g9AWGQnO5zy1l0O/zG4dqhi
X-Google-Smtp-Source: ABdhPJy75c34uMOZTp1fMT1cUhgs2/p0FZuOt7qJKZIOS0vbBgCNSStp6M8LTRjt6Ovtac0R1MC5vA==
X-Received: by 2002:ac2:4a8e:: with SMTP id l14mr7049062lfp.520.1642171568006;
        Fri, 14 Jan 2022 06:46:08 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b17sm364093ljr.86.2022.01.14.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 06:46:07 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: samsung: Fix typo in CONFIG_EXYNOS_USI description
Date:   Fri, 14 Jan 2022 16:46:06 +0200
Message-Id: <20220114144606.24358-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The proper name is Exynos Auto V9, not V0. It was the typo slipped in
unnoticed, fix it.

Fixes: b603377e408f ("soc: samsung: Add USI driver")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
Changes in v2:
  - Add "Fixes" tag
  - Add R-b tag by Chanho Park

 drivers/soc/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index a9f8b224322e..02e319508cc6 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -31,7 +31,7 @@ config EXYNOS_USI
 	help
 	  Enable support for USI block. USI (Universal Serial Interface) is an
 	  IP-core found in modern Samsung Exynos SoCs, like Exynos850 and
-	  ExynosAutoV0. USI block can be configured to provide one of the
+	  ExynosAutoV9. USI block can be configured to provide one of the
 	  following serial protocols: UART, SPI or High Speed I2C.
 
 	  This driver allows one to configure USI for desired protocol, which
-- 
2.30.2

