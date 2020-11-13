Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7752BC63697
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39F1F22255
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt/fymGp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgKMVgw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:36:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgKMVgv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:36:51 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A649FC08E864;
        Fri, 13 Nov 2020 13:27:48 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id oq3so15719328ejb.7;
        Fri, 13 Nov 2020 13:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=teOsIIFtobz3o9oTMjr4P4N9cJSqHYC4TqodeSUTBZw=;
        b=Yt/fymGpqgqt08fbiKm7f9HWyYKTafKQ+QzHMIcef6e9tCzPmrJR+6JEOJ8hVmwJZ3
         khlJmwXp4IvHtLNcg9q/NfmG4Vmr3VG9MPwNHT0c8Hc95ezOhbuYra7OVx0L0YdxJ8DW
         lO1qo8UZm9orK8W8nywJ3zHDjR9Bnaz3yRn6Fzrc79UPm+QNrAv4GMLnlfunUS3m3D0b
         7vCkwJvFE1hz4h6UxWJZdugsvCyIllTsPeVw9GL89xIhiwp9oo0dNQJ7DVs6H+fmd6do
         yE6sS52WwdfPbIwUuAZFuJTFc8ROC3dEF23oEPqjxPnbZcb9zna7vpxMCgazl9Yy4mIo
         ltYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=teOsIIFtobz3o9oTMjr4P4N9cJSqHYC4TqodeSUTBZw=;
        b=Pzi0LY4gjw3TiMFTNASti11MVcVbnMdHECdIG4N2biRW1sPTqLOKw7+UNgJWtXhCnm
         1F23XbP8LhCdtKwRSRx48RQ7wAPxsuxQYeqSoZQTNEbkSb//S2vC5VeqeV7G597tMOlM
         ujTam4S3yDaVxXSB2AjkMMGQlPxWdUiqbQyOZyo0Lo4Iqxd48+CgD+UPF1d71j8k5TO5
         1XqXr0fh7WAtg9ELdhz/FJ6sRTd/EWvKzz94OErL8hk1MBgegZN8/cKHWp/li9GaifBm
         iFSsCWwSmR2KQXcH/tvS1HqHRRL+n1zj8hZbgSSLhoje3biu0j4lNFfjVWEig0EDRP73
         V1jg==
X-Gm-Message-State: AOAM532n46ztuaARqtqqHEg6IEGV9uPnQJWCGj+Fndo7affhQwgVbBb4
        PM0SNXKWuJD7j3U2dEqMFUdOFEd/1gPR3y/E
X-Google-Smtp-Source: ABdhPJyIEIYR0ajIEVvgWXv7jKdGClZjECHU+gJJ6yrnRiDcu4YGzeS8QY2fkMIs7ODWnv7hCeR6wg==
X-Received: by 2002:a17:906:e216:: with SMTP id gf22mr3966401ejb.286.1605302867455;
        Fri, 13 Nov 2020 13:27:47 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id n22sm5001549edr.11.2020.11.13.13.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:27:46 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH v3 5/5] ARM: exynos: extend cpuidle support to p4note boards
Date:   Fri, 13 Nov 2020 22:25:26 +0100
Message-Id: <20201113212525.13455-6-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113212525.13455-1-martin.juecker@gmail.com>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
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
index 700763e07083..fc8291f76263 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -177,7 +177,8 @@ static void __init exynos_dt_machine_init(void)
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

