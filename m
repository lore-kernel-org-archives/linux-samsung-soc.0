Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BE7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 Nov 2021 03:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 337D860041
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 Nov 2021 03:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhKMDOy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Nov 2021 22:14:54 -0500
Received: from smtpbg604.qq.com ([59.36.128.82]:38370 "EHLO smtpbg604.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232113AbhKMDOy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 22:14:54 -0500
X-QQ-mid: bizesmtp32t1636773081tu786nmz
Received: from localhost.localdomain (unknown [125.69.41.88])
        by esmtp6.qq.com (ESMTP) with 
        id ; Sat, 13 Nov 2021 11:11:19 +0800 (CST)
X-QQ-SSF: 01000000000000C0F000000A0000000
X-QQ-FEAT: qfvbM89F700Weup9tOdjzXXvc8HF98cSSrZGlKTVRH4kBv4IPyPqPOMESiZ6V
        RtwTh/SpUneGijNdySXGSjsjYcyMbVwaLRFNlU2NzDZwYnlSFRCYad+Bsz7SsERF2Dib2iN
        HIwptU9I4eq/EizgfOTbcGPQ45m9W8k/Y3yBD6jBs1b9U3ywC4LgnXS2qalRv73Brf6nncr
        7aEa1J2625wQnnzivUE1MAYb6mK1WGdwNpqOOwaH2/HFaaiCqavhJry0Ll+UZ6EbjJh3Xv2
        6XWOza4jvXNrerMZMSdhFZKCUVL8zS/OG4fXIpRpCivJJtqL8lvOEWgM4W3t2ZBd90xEp51
        wBL9di7jz6B4qKA/PIEoJj/RGeniw==
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     krzysztof.kozlowski@canonical.com
Cc:     linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] ARM: s3c: Fix typo in one comment
Date:   Sat, 13 Nov 2021 11:11:17 +0800
Message-Id: <20211113031117.33727-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The double `would' in the comment might be repeated. Remove one of them
from the comment.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/arm/mach-s3c/mach-gta02.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index 418939ce0fc3..174b2e55ea16 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -393,9 +393,9 @@ static struct s3c2410_nand_set __initdata gta02_nand_sets[] = {
 	[0] = {
 		/*
 		 * This name is also hard-coded in the boot loaders, so
-		 * changing it would would require all users to upgrade
-		 * their boot loaders, some of which are stored in a NOR
-		 * that is considered to be immutable.
+		 * changing it would require all users to upgrade their
+		 * boot loaders, some of which are stored in a NOR that
+		 * is considered to be immutable.
 		 */
 		.name		= "neo1973-nand",
 		.nr_chips	= 1,
-- 
2.33.0

