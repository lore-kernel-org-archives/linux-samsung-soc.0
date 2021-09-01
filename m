Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19939C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:39:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 052026115A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 12:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343547AbhIAMke (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Sep 2021 08:40:34 -0400
Received: from out0.migadu.com ([94.23.1.103]:54263 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344017AbhIAMhT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 08:37:19 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1630499775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pJotZ7v11sHuJLFfrcQ3UlD/rmnLoWbUqGvZgu+uUlQ=;
        b=Ksl3r1rTmRB0M2mXpX3f9HLE+Wk74YmJcLEYbwzZBdQD54hAGhvFYGD5zM4s/h0i+sx1DR
        Mhlo57w/c7ulijCj1yzWvphWGMDp/KYAc6o1fGzGjOfy/V9xwlAzs3kBDOt9hnu530Wt/M
        SWngk6J7G3whPnJcyz5oKYn+7NbVKVk=
From:   Jackie Liu <liu.yun@linux.dev>
To:     krzysztof.kozlowski@canonical.com
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, liu.yun@linux.dev,
        liuyun01@kylinos.cn
Subject: [PATCH v2] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
Date:   Wed,  1 Sep 2021 20:35:57 +0800
Message-Id: <20210901123557.1043953-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
let's add an error pointer check in s3c24xx_handle_irq.

s3c_intc[0] is not NULL or ERR, we can simplify the code.

Fixes: 1f629b7a3ced ("ARM: S3C24XX: transform irq handling into a declarative form")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/arm/mach-s3c/irq-s3c24xx.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
index 0c631c14a817..df471d322493 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c/irq-s3c24xx.c
@@ -362,11 +362,24 @@ static inline int s3c24xx_handle_intc(struct s3c_irq_intc *intc,
 static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
 {
 	do {
-		if (likely(s3c_intc[0]))
-			if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
-				continue;
+		/* For platform based machines, neither ERR nor NULL can happen here.
+		 * The s3c24xx_handle_irq() will be set as IRQ handler iff this succeeds:
+		 *
+		 *    s3c_intc[0] = s3c24xx_init_intc()
+		 *
+		 * If this fails, the next calls to s3c24xx_init_intc() won't be executed.
+		 *
+		 * For DT machine, s3c_init_intc_of() could set the IRQ handler without
+		 * setting s3c_intc[0] only if it was called with num_ctrl=0. There is no
+		 * such code path, so again the s3c_intc[0] will have a valid pointer if
+		 * set_handle_irq() is called.
+		 *
+		 * Therefore in s3c24xx_handle_irq(), the s3c_intc[0] is always something.
+		 */
+		if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
+			continue;
 
-		if (s3c_intc[2])
+		if (!IS_ERR_OR_NULL(s3c_intc[2]))
 			if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
 				continue;
 
-- 
2.25.1

