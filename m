Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DC0CA9EC0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 00:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 272F821835
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 00:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6fqDSuo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfJ2Aui (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 20:50:38 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:36442 "EHLO
        mail-pg1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJ2Aui (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 20:50:38 -0400
Received: by mail-pg1-f169.google.com with SMTP id j22so2220272pgh.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2019 17:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UPoohtNbJjhf5Y5ux0jw/QzNqoDtKVInPIzYUVTu9eo=;
        b=H6fqDSuoe1QtVQiVPmYR3tU/gq3KSJNrNoq9SJP/8+HXRp+iMhwHk0gmBdPxQEikEO
         ykgy+HupVi4gTIzixTdgCloyH1anW8ip9wWiwwLkwC5U5AhTChb9C5hXHXnyf+hYkkae
         9pgd5n9YTFi4hLRPingrxWbWPEyhTR+4O1HljSxzJGNEgTx8/oV2ZONeoN2xgsJb6U6a
         2aOJer3JGak/OYFCjkadFCZsPDuiNhdiB/+ht6vtmmPIyxpEFoQjOFC6JJSnmJaG0hnI
         YuJEuxAeKZAg+SeLJabp+3mtou1W/bT1secfoAJKELBnkvSqeM2hzLyYSYEp1ibJ0Xjo
         GCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UPoohtNbJjhf5Y5ux0jw/QzNqoDtKVInPIzYUVTu9eo=;
        b=SKZbNfwG0ogmmQBbJHOd+POdvrG5bm/eWdwuqIhaZPdQCTE1l3/UkMI4KREE44Sp5y
         mmm/bYdqgl6A+UhXDPJGOQdVOUYOErOVHHvyUzRv2SyMPR9Dnax8AoP0yyxovv654ouD
         +PfiXw515KRC/o4Ffs6VtSbVWwphticY4KatoqmOuTUbPgZly3s1iIfUn3Ibq++mB/PG
         ZTmJyzzgfj2cAPAt8/lzfYRjEMCUnpd+JKMB2kSyPo8YYR8sfe4esi8j+gOt0FJZvPbq
         dG1y9euHZpQbIHqsnIE/cJyGJBrsQ9wfN6pvttpTGmFLwfyHyn24L9xiXAYRSIN/QPtd
         ledw==
X-Gm-Message-State: APjAAAUhNy3PLI0G8JI2gZtNkfGVKhGMTIQnPe/DNZhV9RB8Yj1weR8P
        Wg7K4f32X3PghKGeQMSgRNbb7rhL
X-Google-Smtp-Source: APXvYqzT3NL8TGYMVZQ0KTk+1LbEd5wHRuM6JPNYztTXLYut2jiDkfu+qM0xxH839So2Ud5AbRxnXw==
X-Received: by 2002:a63:d308:: with SMTP id b8mr24214241pgg.246.1572310237358;
        Mon, 28 Oct 2019 17:50:37 -0700 (PDT)
Received: from odroid.ad.adelaide.edu.au (staff-249-094.wireless.adelaide.edu.au. [129.127.249.94])
        by smtp.googlemail.com with ESMTPSA id f15sm11787861pfd.141.2019.10.28.17.50.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 17:50:36 -0700 (PDT)
From:   Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos5420: Preserve CPU clocks configuration during suspend/resume
Date:   Tue, 29 Oct 2019 11:20:25 +1030
Message-Id: <20191029005025.4476-1-mihailescu2m@gmail.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Save and restore top PLL related configuration registers for big (APLL)
and LITTLE (KPLL) cores during suspend/resume cycle. So far, CPU clocks
were reset to default values after suspend/resume cycle and performance
after system resume was affected when performance governor has been selected.

Fixes: 773424326b51 ("clk: samsung: exynos5420: add more registers to restore list")
Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 403b5a367a5b..3a991ca1ee36 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -165,6 +165,8 @@ static const unsigned long exynos5x_clk_regs[] __initconst = {
 	GATE_BUS_CPU,
 	GATE_SCLK_CPU,
 	CLKOUT_CMU_CPU,
+	APLL_CON0,
+	KPLL_CON0,
 	CPLL_CON0,
 	DPLL_CON0,
 	EPLL_CON0,
-- 
2.14.1

