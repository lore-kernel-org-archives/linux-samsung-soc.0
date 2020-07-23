Return-Path: <SRS0=dIYQ=BC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA27C433E4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jul 2020 12:27:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 584F220792
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Jul 2020 12:27:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VLzuVAzw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728990AbgGWM1m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgGWMY5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jul 2020 08:24:57 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1640DC0619E2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 05:24:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 88so4977201wrh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 05:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mCXO0Gr/A00l7Lne4sBK8Frz9I2gxXn2t7va3NQnE+k=;
        b=VLzuVAzwLVM/dZrwghui32Cthrp/jLIjGRFYoekwj6rOfYdWN+Ca8euH5j0gmIclVA
         DPGAmw1kGbUVZEsPzHiJS4mVA4nIS/w0UhXhvtODtvdzRx0u3R/sEMZwyCzDADT/E9iu
         vLDxEbeoH+2JdqhS/3o/A9XdzqzYaakIGrL8NYVb3/bFEM+CIqVptPUaom3/SoHEeGNy
         sLA228efpCsVu2LU5uwYHYJjtRMQQlQyjtUkunjK29dLPWUIqm6go4LnmxMhmQcTNcuN
         K+Bn4hm1c0VKWz+h46vh5QR8aI/QuPomXCz/us8WLkqhjS4TOlcTzxWt1lj0K1kR4iqs
         V2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mCXO0Gr/A00l7Lne4sBK8Frz9I2gxXn2t7va3NQnE+k=;
        b=a7FyZd0Mnw7VgPAA8f6E5gpmmOzDCGKqWGgARMxwmVX7BaML6ysr5pfdmyXD/JRb7N
         5H8KOSKtI8ZxZ64cPDx6eWEeoIJP9U2Cc6EqmKs3sd45X8sa8AV5ZeRlQ2gbu+eVwrkR
         QNpdybU8Y2jgpoec7o6W8mdrGoE5Fj0QlNHViANDt72A7AMP1YkGA3kAmEX2sUzzIvf7
         d2uibsPfLIq3ScnE1wvHuTgjB3YWxShg2RW+CzU4oyNIWcc74N/qNFSR3NewObUsJiQ3
         /6Unm1hXG4Yd4sPSheQDh4nvlKs1ALVpoqUe3KlO+bZlUuMwLeOxMKynzZBQNh2ZkkPk
         I40g==
X-Gm-Message-State: AOAM531xjf6u8bIuw17rLCgmZoEpft7iVbPaMXvOt0DwaVcZ9yjawVbe
        TROM6xVHcG76xhTUnxfuwFZhLg==
X-Google-Smtp-Source: ABdhPJyHdbt4arhYy1wxPK9DL4Wp99G0wUnJEmOEIFHYKnmyhpXMeS1JDOviOFALkqZ19VIiGO62Sw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr3829930wrj.265.1595507095851;
        Thu, 23 Jul 2020 05:24:55 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id j5sm3510651wma.45.2020.07.23.05.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:24:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 05/40] scsi: ufs: ufs-exynos: Make stubs 'static inline'
Date:   Thu, 23 Jul 2020 13:24:11 +0100
Message-Id: <20200723122446.1329773-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723122446.1329773-1-lee.jones@linaro.org>
References: <20200723122446.1329773-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Else the compiler complains of missing prototypes.

Fixes the following W=1 kernel build warning(s):

 In file included from drivers/scsi/ufs/ufs-exynos.c:23:
 drivers/scsi/ufs/ufs-exynos.h:302:6: warning: no previous prototype for ‘exynos_ufs_cmd_log_start’ [-Wmissing-prototypes]
 302 | void exynos_ufs_cmd_log_start(struct ufs_exynos_handle *handle,
 | ^~~~~~~~~~~~~~~~~~~~~~~~
 drivers/scsi/ufs/ufs-exynos.h:307:6: warning: no previous prototype for ‘exynos_ufs_cmd_log_end’ [-Wmissing-prototypes]
 307 | void exynos_ufs_cmd_log_end(struct ufs_exynos_handle *handle,
 | ^~~~~~~~~~~~~~~~~~~~~~
 drivers/scsi/ufs/ufs-exynos.h:312:5: warning: no previous prototype for ‘exynos_ufs_init_dbg’ [-Wmissing-prototypes]
 312 | int exynos_ufs_init_dbg(struct ufs_exynos_handle *handle, struct device *dev)
 | ^~~~~~~~~~~~~~~~~~~
 drivers/scsi/ufs/ufs-exynos.h:317:6: warning: no previous prototype for ‘exynos_ufs_dump_info’ [-Wmissing-prototypes]
 317 | void exynos_ufs_dump_info(struct ufs_exynos_handle *handle, struct device *dev)
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kiwoong Kim <kwmad.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/ufs/ufs-exynos.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.h b/drivers/scsi/ufs/ufs-exynos.h
index d86d0a0f74780..0908283a76936 100644
--- a/drivers/scsi/ufs/ufs-exynos.h
+++ b/drivers/scsi/ufs/ufs-exynos.h
@@ -299,22 +299,22 @@ void exynos_ufs_cmd_log_end(struct ufs_exynos_handle *handle,
 int exynos_ufs_init_dbg(struct ufs_exynos_handle *handle, struct device *dev);
 void exynos_ufs_dump_info(struct ufs_exynos_handle *handle, struct device *dev);
 #else
-void exynos_ufs_cmd_log_start(struct ufs_exynos_handle *handle,
-			      struct ufs_hba *hba, int tag)
+static inline void exynos_ufs_cmd_log_start(struct ufs_exynos_handle *handle,
+					    struct ufs_hba *hba, int tag)
 {
 }
 
-void exynos_ufs_cmd_log_end(struct ufs_exynos_handle *handle,
-			    struct ufs_hba *hba, int tag)
+static inline void exynos_ufs_cmd_log_end(struct ufs_exynos_handle *handle,
+					  struct ufs_hba *hba, int tag)
 {
 }
 
-int exynos_ufs_init_dbg(struct ufs_exynos_handle *handle, struct device *dev)
+static inline int exynos_ufs_init_dbg(struct ufs_exynos_handle *handle, struct device *dev)
 {
 	return 0;
 }
 
-void exynos_ufs_dump_info(struct ufs_exynos_handle *handle, struct device *dev)
+static inline void exynos_ufs_dump_info(struct ufs_exynos_handle *handle, struct device *dev)
 {
 }
 
-- 
2.25.1

