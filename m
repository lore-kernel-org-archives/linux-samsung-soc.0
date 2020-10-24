Return-Path: <SRS0=oj0V=D7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7E5C2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 179FA22257
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 24 Oct 2020 14:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kdli18eH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762101AbgJXOpG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 24 Oct 2020 10:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762097AbgJXOpG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:45:06 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A50FC0613CE;
        Sat, 24 Oct 2020 07:45:06 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n15so6212395wrq.2;
        Sat, 24 Oct 2020 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TChW8WOMVXGXBdvogebo5CK+FJsfavMI5G8Bx+oPNEE=;
        b=Kdli18eHcRu3t52DS7Ra7vI8yJfHP2QF1ujjSnqRHgji6GkN/SfBj/qsJb5+lLm6Wa
         FmSQjH8a7nmXJdi+sbhBWIGr2RX8N7Zm2JsUExhn6UtbLdq+VxQdOBA07jxNG2ADG5d4
         Z3enBWcomrG69jheI7vMZyuL1DmF7PugaiuGKeyaMeseL0uX1d0BIKd3omqE/Kec0MFm
         /wzyNdsnVViaeTpTbLd08yS9YRrjd06Wv8sJk1TOFnwp1ROr9i8jU4zAbihabxzTia+x
         cUiEuthGuuwKH9qizWU0VWKzBTkIqeMsyhGcrG/t1SlKD9wCzKFfj6WHOSTS8D3HnLPG
         wx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TChW8WOMVXGXBdvogebo5CK+FJsfavMI5G8Bx+oPNEE=;
        b=Xj94HwyFCJzgdkKt+ta+IgJN1Tckq11plUTHe/iCYHJy7dasbChKbr0cgA/yJTyeYC
         1sei1AWMKf54YXFdic7YurA63s0av+y5yMeBOKxkPCexmSfky8P/wX0zBT18eudO9tSJ
         PrOrnY+CV+DFdAXvedmUGVXLs7hA/4cMk6GgXCRvjmeOeUXrxO3SFDfrGhNzzT2f6aJ0
         LEOYIvj8NyHRB6SUJGinN34GopaUWFIcHwiu2v6hTJN6IdvI14YmnhT6UdX0x26W/x+z
         GyzYTbinKQR/oz0yM4b7mOgDEsP1HxbvgCHzg5oFZXKuQbP3n8Zy8GhbmNVq0k0QLLnD
         n6UA==
X-Gm-Message-State: AOAM532/jY6WiHIDcb7Sz9JDS9w2naBrlGDg5ws1gm2CzeqPF8tGKRFJ
        i4EDsyFyrFGVhoYQAz2KhVQ=
X-Google-Smtp-Source: ABdhPJwcAOhE602oLm12t8v9Dz+m/Q+ZD7KL3FxPb7kwvF91JvC160CenxH68RFyHlFr2bYvPw4pKw==
X-Received: by 2002:adf:e685:: with SMTP id r5mr8632810wrm.340.1603550704816;
        Sat, 24 Oct 2020 07:45:04 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id u195sm11719482wmu.18.2020.10.24.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:45:04 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 5/5] ARM: exynos: extend cpuidle support to p4note boards
Date:   Sat, 24 Oct 2020 16:44:21 +0200
Message-Id: <20201024144421.34435-6-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024144421.34435-1-martin.juecker@gmail.com>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The p4note family supports cpuidle, so allow it to make use of this
feature.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/mach-exynos/exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 36c37444485a..093c7a99b8aa 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -164,7 +164,8 @@ static void __init exynos_dt_machine_init(void)
 	if (of_machine_is_compatible("samsung,exynos4210") ||
 	    (of_machine_is_compatible("samsung,exynos4412") &&
 	     (of_machine_is_compatible("samsung,trats2") ||
-		  of_machine_is_compatible("samsung,midas"))) ||
+		  of_machine_is_compatible("samsung,midas") ||
+		  of_machine_is_compatible("samsung,p4note"))) ||
 	    of_machine_is_compatible("samsung,exynos3250") ||
 	    of_machine_is_compatible("samsung,exynos5250"))
 		platform_device_register(&exynos_cpuidle);
-- 
2.25.1

