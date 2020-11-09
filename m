Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D30C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6367F206A1
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnIv3xHQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbgKISWr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Nov 2020 13:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbgKISWr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 13:22:47 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBEAC0613D3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Nov 2020 10:22:46 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so5400733wrb.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Nov 2020 10:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
        b=hnIv3xHQzK4vGHqLPgeKIlXEoxGlX40FuncVJiGSRcaWOMt6IjHpgKwD0EH4POESnm
         6mZYdUgIB4Krx0LuV3VIHbnNSdX5+/gJ5wBJc8HvoZyix/37Nusji2mRqtPKGmx/rjX6
         E7M1WhQJT0Ei+AXyGJNPeI8WDJo8itEjTgi3KFI7vl8zNWYxwwREaS7T+Dqz209xE4yk
         oualc01T7JcNNjacXTYXNZkakn8qfoZfdRkbLFOBrr1S5tx8sI3hnHVjxCnIvSVMNaSJ
         yAIrr8SLVSIbBnLA6mhM5UPNkBEyz+/E9zS8ei+kHp0IHvHIdRh0SItSjLN17df7FUMG
         J2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
        b=rxQtmf4pzY1Q+uDveiOMJXgzdb7VjjwfIvNoZy6YjMBd9aQ7vPyT7VQ6IetoFsmKWq
         vRGc9S9zDArlS1XzAJc2wXXbHlAeHeoPOtV7lgULGMOPuwqRtEV4L9VXxfy5yC+HeDdv
         LA4DlP81lgDkVeuyBzEXY0XMZ6EZGCWghvq4gR5ALcTqMY7t0kOk+nllN7GecaBfwWmO
         ukMJc7r2ELcRP2XQgyBNA8wq8fHi2yW7P+YqJdgQlIUqXQDlRh/Q7WrDRaRktZhYUJDz
         c9lLgr3rSQCVEGrh9W2qfVlJKmbA0HeK8HYtdKL/QHGQvHvTx7KhHd+m57jiKsDHurND
         JW7g==
X-Gm-Message-State: AOAM531l0hbdb/UGrs3bxTa/hZPDCW0LbdbGsnD0cT8PcQV2RgR6LwES
        vZFMUt9CmCjWm5TtHNp1k7c+gg==
X-Google-Smtp-Source: ABdhPJyeWbF4IXe3J+rChMedpclviC8/eufVt3JW57d/2S+UA46Kq8Z4Wfo6mzD+v6wBNgAyYwk7sg==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr20826857wrw.201.1604946165213;
        Mon, 09 Nov 2020 10:22:45 -0800 (PST)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 10:22:44 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben@simtec.co.uk>, linux-mtd@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 17/23] mtd: rawnand: s3c2410: Add documentation for 2 missing struct members
Date:   Mon,  9 Nov 2020 18:22:00 +0000
Message-Id: <20201109182206.3037326-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct 'controller' typo while we're at it.

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
 drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-mtd@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mtd/nand/raw/s3c2410.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index cb2d1b4e278cb..f0a4535c812aa 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -133,7 +133,8 @@ enum s3c_nand_clk_state {
 
 /**
  * struct s3c2410_nand_info - NAND controller state.
- * @mtds: An array of MTD instances on this controoler.
+ * @controller: Base controller structure.
+ * @mtds: An array of MTD instances on this controller.
  * @platform: The platform data for this board.
  * @device: The platform device we bound to.
  * @clk: The clock resource for this controller.
@@ -145,6 +146,7 @@ enum s3c_nand_clk_state {
  * @clk_rate: The clock rate from @clk.
  * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
+ * @freq_transition: CPUFreq notifier block
  */
 struct s3c2410_nand_info {
 	/* mtd info */
-- 
2.25.1

