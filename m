Return-Path: <SRS0=jHm+=EI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6581EC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 070CA223BD
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  2 Nov 2020 11:55:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwo7Yx4V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbgKBLyh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 2 Nov 2020 06:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728872AbgKBLyg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 2 Nov 2020 06:54:36 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE35C061A04
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2020 03:54:36 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s9so14231149wro.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2020 03:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OFnrCj5AUw9J2PyEpjsbtv1aDV1Keh7odnMYGn7YCNQ=;
        b=vwo7Yx4VybkS5xn8u6PYPuQ4vL2I2xyS/vM7Rci9CN9TrePI7gqUUmpdwqpJ2bmzb6
         WYOgVYZ7Ze2JUYdDxCy9KLuhR1t7GoLZdc2ueTppoeskmcwktxyRN44zXc39dDTKy82T
         O6WoTMUlElpFyNXzv70tLq+vUYF4OTKSE16+10jdao440d3hLFThjLDBCRnAwz/HHYsW
         wROXrUvMRkbkhprsH6TkynQH/ogmIBTCZHrLecMX0K13OzKsAtjcljydmv4kQqQmFYHO
         a+LqJVfSEnKkg0xGyDdf78sFjjUX5liYVsZr8+peyzW+G1UwqwMeXndUu0T37Flbb6pP
         JMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OFnrCj5AUw9J2PyEpjsbtv1aDV1Keh7odnMYGn7YCNQ=;
        b=VvvI0hsoEF45Vpxu9cNo/P+qJV/fjOpFqAjmmMyBTsYkevkOC+SgSen1voPJAFkEbj
         Q3fhcrZCgxmoiLPQMqy5Q3kYmzRLFMcoChjX+/iD1sbBvAjNShBRBJey0wIVUbse91d2
         GgQ9ssn43Y66sPNj3wE3ZVTQFp5Xo9cy/SbHOKS3jyDqEi22Mv8ifqy3265pu0MinC/O
         mcIOFqlgPnkVbRGa9VPIE4Idl9rrf3Xj8qrBOt1f1hiZXxh3OhKma4+iL1vJKzGq5z5i
         ZxHaza4V5uxVRqUTNZL2cnaXEHa8FeAA8rRubYivSv231+gBstB6lhOm7TlO4htl6D+4
         ZZcA==
X-Gm-Message-State: AOAM53353qua2xYRfX3Pb+qYGHvR/X23EQKQ9muKONyYz//xizWeKd/o
        ScIRV4DZtJx7RvcAt9H00tmsng==
X-Google-Smtp-Source: ABdhPJy5ZtHSIVaace5Co/vTqGEHfDVDCDQ5NYXntVwU3E1kI4P6xLWriuJnDUaxbUwOLSIDWL+Y8Q==
X-Received: by 2002:adf:ab02:: with SMTP id q2mr11069577wrc.320.1604318074911;
        Mon, 02 Nov 2020 03:54:34 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id t23sm14284010wmn.13.2020.11.02.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:54:34 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     vigneshr@ti.com
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben@simtec.co.uk>, linux-mtd@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 17/23] mtd: nand: raw: s3c2410: Add documentation for 2 missing struct members
Date:   Mon,  2 Nov 2020 11:54:00 +0000
Message-Id: <20201102115406.1074327-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201102115406.1074327-1-lee.jones@linaro.org>
References: <20201102115406.1074327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

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

