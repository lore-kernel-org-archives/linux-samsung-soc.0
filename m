Return-Path: <SRS0=vFf2=EG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A57C388F7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F4035206DD
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyqoN92z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgJaSA3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Oct 2020 14:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgJaSA3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Oct 2020 14:00:29 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3793FC0617A6;
        Sat, 31 Oct 2020 11:00:29 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v5so5628003wmh.1;
        Sat, 31 Oct 2020 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TChW8WOMVXGXBdvogebo5CK+FJsfavMI5G8Bx+oPNEE=;
        b=hyqoN92zjbySD8aP6UE/iwJm0KdDH5jSXdpTI/vRSQ4LYd6FktalCaFfjHpj8xUdmC
         QJSr446YwX4ZpSXO6Z7FUeVFFSdxWhfGItxiZgO7X62Ijc1UjKbNerNN4DrIESufp6WI
         so6Z4xMw5tyeEFhOzae8+c9RZ6tVj6iqVcH2YVqTgw9gS4Jr/pvbLw0TcT94hE/VKwBd
         G7B8jfSREhL0A5Nb4JewlAHdvpTjWZIZU71oR4SkLp+S2Z16Up4dqzAMesDOPefZ1yFx
         eiTbFzqm6uZ29CArRDfwz/srof8eDM8bLglqDPvXuOXdYsaUsnvjDLcqHVmhMsnLhttS
         eg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TChW8WOMVXGXBdvogebo5CK+FJsfavMI5G8Bx+oPNEE=;
        b=f1jAoQ2rlm14jy32QOJb++4WpzrOimFLTAgiWGNssUPsdidTxMVgErQJ6seAItfJlC
         8cxk5m70mh2ukKicl6vpiZQLikG0zT8EXokjcVvBiTs4e+15fT7qeg2pazBFEoNMfCOH
         LxcSebg+YU4br0potSGlnRD9UcmTwU2bD739uwXtUn4H9p3J6keJPZF2J6Ugbr+e4/EH
         32aZu+dFNiee9PIXSb6oGpZtDkrmxOPQbQxsNgEceDKpo97mTRPohy4uTASkXXrWO/gj
         Daj7/+5bnkGfjC/R50G0ccw6nR5Vj3KIlbbTun+HrtmzcPe1b09JKlmWMD1FWJna9FM0
         GbaA==
X-Gm-Message-State: AOAM533HaEqjYjNwpPCmJEKLRGpt7ynL9c7YZjbsEVQv0jpxi7Ny4LT0
        PDCGIHjm3wHnVH+RTLJ+IGM=
X-Google-Smtp-Source: ABdhPJzClEs1yofiUK4ewv5r1W5TdapimZeuNQ4C+BP9HPwq9TH8UHppARaDHoHgYfXLC59VsI3pJQ==
X-Received: by 2002:a1c:740f:: with SMTP id p15mr9178319wmc.106.1604167228003;
        Sat, 31 Oct 2020 11:00:28 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id h8sm13302092wro.14.2020.10.31.11.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 11:00:27 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH 5/5] ARM: exynos: extend cpuidle support to p4note boards
Date:   Sat, 31 Oct 2020 18:58:37 +0100
Message-Id: <20201031175836.47745-6-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201031175836.47745-1-martin.juecker@gmail.com>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
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

