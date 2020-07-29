Return-Path: <SRS0=8fUM=BI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9AEC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jul 2020 07:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70C9820809
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jul 2020 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596008612;
	bh=ace2NZT8XNdUD7ge/5nLTjgszpNwFb2jWR8Ly0WU/14=;
	h=From:To:Subject:Date:List-ID:From;
	b=YtpSfjG3v0rBWQCSJSBOD7eouef2uqGZun60wPz/xxeNZfRmxL58jRQMC2a4rPkRK
	 iGS4fAZKo8N05dMMOm40wnDbXqEjSLd+2ZLrcCgLpgCozwsdtYelb7ookn8L0PiWIs
	 jVfZ0CpLRUXML7Y1uHyRb2jK+t/WSy5lmYacLk5I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgG2Hnc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jul 2020 03:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727006AbgG2Hnb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jul 2020 03:43:31 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE86B207F5;
        Wed, 29 Jul 2020 07:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596008611;
        bh=ace2NZT8XNdUD7ge/5nLTjgszpNwFb2jWR8Ly0WU/14=;
        h=From:To:Subject:Date:From;
        b=uFCeLKuGo4eMf754vt4BXTZuuRtovXjTiVvSK5uwCUEzE04sNC+tULxtf1QkKS7Vn
         SmdS+E+p69zLDvqMy4WThdcu4f84qDoPi/76IgiGJKKnM7LT1CXcNVyjP2M4QMD8QQ
         T825aY/WEMBO20PTqC+88Rw2r30U51+6lxQAxjaQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: samsung: Fix kerneldoc of s3c_pm_do_restore_core()
Date:   Wed, 29 Jul 2020 09:43:25 +0200
Message-Id: <20200729074325.28241-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    arch/arm/plat-samsung/pm-common.c:68: warning: Function parameter or member 'ptr' not described in 's3c_pm_do_restore_core'
    arch/arm/plat-samsung/pm-common.c:68: warning: Function parameter or member 'count' not described in 's3c_pm_do_restore_core'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/plat-samsung/pm-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/plat-samsung/pm-common.c b/arch/arm/plat-samsung/pm-common.c
index 59a10c6dcba1..2da0d352441f 100644
--- a/arch/arm/plat-samsung/pm-common.c
+++ b/arch/arm/plat-samsung/pm-common.c
@@ -55,6 +55,8 @@ void s3c_pm_do_restore(const struct sleep_save *ptr, int count)
 
 /**
  * s3c_pm_do_restore_core() - early restore register values from save list.
+ * @ptr: Pointer to an array of registers.
+ * @count: Size of the ptr array.
  *
  * This is similar to s3c_pm_do_restore() except we try and minimise the
  * side effects of the function in case registers that hardware might need
-- 
2.17.1

