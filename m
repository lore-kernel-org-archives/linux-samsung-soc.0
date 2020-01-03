Return-Path: <SRS0=A+3s=2Y=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121A6C2D0C2
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jan 2020 16:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA4E52464E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jan 2020 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578070339;
	bh=GNr6Irv4ZHYaD0lADq4BHgVbO6AWrFxItDdiA1EIOyQ=;
	h=From:To:Subject:Date:List-ID:From;
	b=flez+15l6AI3yuVXcy/8Ezyt+OLit+l8ZwHFzgDOqhl2tXX3By9+F+9G+xxMcbapV
	 Wk7RsS8BMLCKNf13ltfNELNi+EP4m4lV4jsBlB1UjC8k+bzZJ6cftwcTm9G41VLNKo
	 ToJmNazaLNaqCQnQ2Gai5WS5y88JRohX/qBKty8I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgACQwQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Jan 2020 11:52:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:39852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727912AbgACQwQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jan 2020 11:52:16 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2449921734;
        Fri,  3 Jan 2020 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578070335;
        bh=GNr6Irv4ZHYaD0lADq4BHgVbO6AWrFxItDdiA1EIOyQ=;
        h=From:To:Subject:Date:From;
        b=hIYXmzwQSe0GJcYL5eJfh7B+W5SoNxd3n78lFtGRppNmkQbh4juqaawFJCNwACN31
         cqU8MaAIJvTtaEzbAvzIQ6RU+/dc0Z2tid7Fy0xzv5CsXtW5tU8uCD5Q9inVGV2MFc
         5B5nFs7Ges1vAFv5GQmDBQp8OMxXy2Ohp8MHRZic=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: exynos: Correct the help text for platform Kconfig option
Date:   Fri,  3 Jan 2020 17:52:08 +0100
Message-Id: <20200103165208.8287-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ARCH_EXYNOS option is used for entire ARMv7 Exynos family, including
also Exynos3 SoCs.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 4ef56571145b..9fb045ab80e4 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -41,7 +41,7 @@ menuconfig ARCH_EXYNOS
 	select POWER_RESET_SYSCON
 	select POWER_RESET_SYSCON_POWEROFF
 	help
-	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
+	  Support for SAMSUNG EXYNOS SoCs
 
 if ARCH_EXYNOS
 
-- 
2.17.1

