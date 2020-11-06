Return-Path: <SRS0=C3hI=EM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE09CC55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75EFC20B80
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Nov 2020 21:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwgnNdAO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbgKFViD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Nov 2020 16:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbgKFVhY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 16:37:24 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1924CC0613D3
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2020 13:37:23 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 10so2050614wml.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Nov 2020 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
        b=wwgnNdAOe+PD9Q3GFnTFboZRLNCbOK5iVRKNDH4UXAYgMLHljsAHyjvrv6vbTyOCZe
         dg/K1CprVU+/O4DDaVm1Q+Yl4MJCTCuT34V0Jt4cxix4CQacddo5nu1MYPQTNDC0iMYm
         AlHrtess6Cen09LCHigFMCj5/t/4j7v/Av4gBeejtdmnwI4q0Ebxs1Q4VHxWTZlcW4e7
         7NeObc0e0V9f7epYzSlrUje8JSJM/4bE/QQXHBdt2qQVEUZWORq5pWExrJPw9MpiTo2Y
         4Cnd3lzwwtYjdxZ9ZtI4OLosLvd7QDLk27k8xoQ9yHG8uWrozz7XOhHG7f2vEZo37d3L
         HCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkJ226wW4T/WFBWAXYAYxSOD3N/A9uUc453pKIqhWNc=;
        b=avJj9bBYOr+o6MUAMsshtHGYIm1pWIGiFGXcS7FDzKlLZEmr9d/C+mYvymJzPAyJ2+
         1An5592HEwuIc8HLhVBOs6PT+andBijqKUv6qkTSE2Zm+dhKUgqo1FLnYBaO6kaEwBfN
         VQHN6vT8byuKE8Oh/uOYcu1WhJt0v6rs85lRvWW4x2fy+Q4Nz28mxEBCsAnw0UygbGgX
         L8N1TNGSSx+ZZC8Bb16Nl7LLx5bV5A6VeDTGiIftahmHa1JM0kz81el0T+nDUNUN4n7A
         HIeqEfRoofRw/WzasvNkGhn641rvS3rIevNWMAC1k3lWfckrCGWkOelyYQLarMskGxsf
         70MA==
X-Gm-Message-State: AOAM533jqQprozpeZDpPEywwioK3Em853mvAz8O5tY7pC2402tdVxUjj
        rYiShUKgFEtRhOFA/hdC800Hfw==
X-Google-Smtp-Source: ABdhPJywbY9m/AfB8+o1a2jvP+ApAocKvACDEgH2J3sDHJEx/A+oIVBnlqIrqIacyAvInCsMahP8pA==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr1687461wmc.32.1604698641856;
        Fri, 06 Nov 2020 13:37:21 -0800 (PST)
Received: from dell.default ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 13:37:21 -0800 (PST)
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
Subject: [PATCH v2 17/23] mtd: nand: raw: s3c2410: Add documentation for 2 missing struct members
Date:   Fri,  6 Nov 2020 21:36:49 +0000
Message-Id: <20201106213655.1838861-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
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

