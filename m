Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3214EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 15:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbiBVPB0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbiBVPAr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:47 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB7110E579
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 07:00:02 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9CE2940815
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541997;
        bh=Yp6ZDVV8RuEvdp6hHMI16oZzyQVBXO+fcxhml4rBHaw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=IqyMWU8dEvL0XSI/W60DpA5Ua4xVnh5DvmW9HvFPl8XWQiPFUZK1K1fBYLnz2ViKk
         sAFPd09TV3AVPfmTxbBKNGOaV/J/ErkKLYbj25FtP+9I7jKebIZ3epqF0T6A56Z/mu
         1NYuA2J6uT2hvE9bUq37cJo42t9JtOrnjSHRCTEg6gK38WcnjAsqQetcTnIjlHlHYJ
         L3nZR6vL9vKhe0HUEQy1ZtxofuJ/N3YxGlUeLzi6YaAMXj9erd1gUxYBD/96VhKveq
         m5IgAqiA2gu9halXYBrMFQyTfL8c7BEKgQsRs1sCa9z2yWdgYlUfb/JCvWuGwynrhq
         xtHlLJS7cEPcg==
Received: by mail-ed1-f71.google.com with SMTP id e10-20020a056402190a00b00410f20467abso12088088edz.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yp6ZDVV8RuEvdp6hHMI16oZzyQVBXO+fcxhml4rBHaw=;
        b=bBoxDewNN3QmTx9pJHbuq/fXqhCPLN7a8soxxkr0DPz3q+wgIoNZUVXyGn+gw4wjKu
         d1QLZ75j2aBw0RDe9c6MmDGUhKdesDxrYl9tBXF3STdIJFb4ze+/h8WTPF19m+yUpSPd
         2mTgO8ZXhl5yMu6T6TOQd53HibzrmJFD2mDiEtxNLVb92tdxYy6V81Ljtg8YEg4sQWhl
         l1Z2YzQJ9SAFTX0xAZ6PCnr+whnB16FH4bmaDwTNReehv88AjnOBX5R5hz7q5OcEurZd
         B1XsBviRf+oIAa1FtrTuZ4d3AJRknLnxtIRILBL7JczExlKOe/43fhI2Iny89Xmf1YCc
         IyRg==
X-Gm-Message-State: AOAM530jHVYyxaTTK/DImJMyJhAvFV49w7Ms8AkWyti7XaW+ZA7O00xp
        bnZArDwCWQLOenzvmDLNFIIGeW9QTNqmovD61nv+bCpc9NvxS1GcIrXoYe/IfAmVFTb8nuBFs3b
        83TWcQWLTzQ6dfMGd/AR9uF/q2lsyU+GOOL27qAQ3KRcVdN/P
X-Received: by 2002:a17:906:8299:b0:6cf:3847:284b with SMTP id h25-20020a170906829900b006cf3847284bmr19368278ejx.682.1645541994352;
        Tue, 22 Feb 2022 06:59:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+ToxX03cNeq8vGzKfuUoRQ0zvi1K010zfig8ivZ8cYm8EVedSW9bVloWqWHnEbvwuSlDU2A==
X-Received: by 2002:a17:906:8299:b0:6cf:3847:284b with SMTP id h25-20020a170906829900b006cf3847284bmr19368246ejx.682.1645541994125;
        Tue, 22 Feb 2022 06:59:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Date:   Tue, 22 Feb 2022 15:58:48 +0100
Message-Id: <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
and use 'freq-table' instead.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 87975d1a21c8..2b192477d158 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -47,8 +47,9 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 	if (cnt <= 0)
 		goto out;
 
-	if (!of_get_property(np, "freq-table-hz", &len)) {
-		dev_info(dev, "freq-table-hz property not specified\n");
+	if (!of_get_property(np, "freq-table", &len) ||
+	    !of_get_property(np, "freq-table-hz", &len)) {
+		dev_info(dev, "freq-table property not specified\n");
 		goto out;
 	}
 
@@ -57,7 +58,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 
 	sz = len / sizeof(*clkfreq);
 	if (sz != 2 * cnt) {
-		dev_err(dev, "%s len mismatch\n", "freq-table-hz");
+		dev_err(dev, "%s len mismatch\n", "freq-table");
 		ret = -EINVAL;
 		goto out;
 	}
@@ -69,12 +70,16 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 		goto out;
 	}
 
-	ret = of_property_read_u32_array(np, "freq-table-hz",
+	ret = of_property_read_u32_array(np, "freq-table",
 			clkfreq, sz);
 	if (ret && (ret != -EINVAL)) {
-		dev_err(dev, "%s: error reading array %d\n",
-				"freq-table-hz", ret);
-		return ret;
+		ret = of_property_read_u32_array(np, "freq-table-hz",
+						 clkfreq, sz);
+		if (ret && (ret != -EINVAL)) {
+			dev_err(dev, "%s: error reading array %d\n",
+				"freq-table", ret);
+			return ret;
+		}
 	}
 
 	for (i = 0; i < sz; i += 2) {
@@ -99,7 +104,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 
 		if (!strcmp(name, "ref_clk"))
 			clki->keep_link_active = true;
-		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table-hz",
+		dev_dbg(dev, "%s: min %u max %u name %s\n", "freq-table",
 				clki->min_freq, clki->max_freq, clki->name);
 		list_add_tail(&clki->list, &hba->clk_list_head);
 	}
-- 
2.32.0

