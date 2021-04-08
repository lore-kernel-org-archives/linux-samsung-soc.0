Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818A0C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E4D561151
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 20:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbhDHUQj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 16:16:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42279 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbhDHUQi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 16:16:38 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lUb4k-0005de-8E
        for linux-samsung-soc@vger.kernel.org; Thu, 08 Apr 2021 20:16:26 +0000
Received: by mail-wr1-f70.google.com with SMTP id r12so615315wrw.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Apr 2021 13:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jMABrCg2yQSz0NJfTRJiCfa17aCfiZuFRJh5dj2jnZI=;
        b=NNiO48jWuxJZbaYvVtPEs4RzjFvAcdTAezBRSBXZINna4EYl+68ePI5TMVtfxBtlK+
         qO7tBux9Evfpv1JfH9SzIH7hpYUWjOV+ezHe6xq5avL0Hwau0hifsSlByuojzKhuZzrr
         IiEUkHnMTOEW26cGqFMEtzjyOLr7pC+z5mjUKtUyetreI8GXdvmNlqbnFUeN7iHlFVMS
         8kSLbXaSF7wizhx1pQOXYugCsTtKEfspcAUU1KBhoVF4Md116rFsnt98pcmI6DDzMRk5
         jFe7EIR/xbUonBt1Z4ptQW0rdBYWBO33Lkl4OUVQWbsZWceawEyyk3+5DiFfDBfbMZYg
         0XiA==
X-Gm-Message-State: AOAM532XdHk8QJ4AjraDxcSsarqnjAxk8j2ACj2BtT1IyYVbRuf2fb6V
        vtt36zkxYu5YhgRnvgTQUnFNWJ31j7TFnYtNoCez9bpS/obomcZ2h6YxJ6q0bhe4A7Q7d8MottX
        K0uecTP1HIQpkAWh89XowZrjBqasQT5+yB+5qE2eFEvOhUrxo
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr14429555wrr.140.1617912985403;
        Thu, 08 Apr 2021 13:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIwIaAo5oCPu118XWrKhGbQi+Nic/eanTaCnDGq7QIZYT+he+8z9GdaAve8WhKurUn3nUuoA==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr14429534wrr.140.1617912985197;
        Thu, 08 Apr 2021 13:16:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id o62sm22690337wmo.3.2021.04.08.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 13:16:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] iommu: exynos: remove unneeded local variable initialization
Date:   Thu,  8 Apr 2021 22:16:22 +0200
Message-Id: <20210408201622.78009-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The initialization of 'fault_addr' local variable is not needed as it is
shortly after overwritten.

Addresses-Coverity: Unused value
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/iommu/exynos-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index de324b4eedfe..8fa9a591fb96 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -407,7 +407,7 @@ static irqreturn_t exynos_sysmmu_irq(int irq, void *dev_id)
 	struct sysmmu_drvdata *data = dev_id;
 	const struct sysmmu_fault_info *finfo;
 	unsigned int i, n, itype;
-	sysmmu_iova_t fault_addr = -1;
+	sysmmu_iova_t fault_addr;
 	unsigned short reg_status, reg_clear;
 	int ret = -ENOSYS;
 
-- 
2.25.1

