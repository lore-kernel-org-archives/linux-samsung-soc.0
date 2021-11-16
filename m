Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7A2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 09:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7789761B29
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 09:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhKPJYL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Nov 2021 04:24:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:54572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233020AbhKPJXz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 04:23:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EBCA61B29;
        Tue, 16 Nov 2021 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637054457;
        bh=MhR/qpOj1Qb6+XNEomi1ZnDwRyDYSnoJ7V97l6b+hAs=;
        h=From:To:Cc:Subject:Date:From;
        b=YI4dH2FypRnPTaLkL+6uKE/KpllGSPYXPw51zWPrpRHFTA5syotzuTNTJIhaO9ssC
         k9iIddYy9xslVYb3uiwCBU/9ARQDLOPqhOI1ImAzrbGShMCpwX6e9C2AMLcd0047mh
         1VW6RJSpU2t7+kwcdaQg/FAzixLJZaaAk4OZlKI5lS83cWFP45MNgVD0ysZLjB6lj4
         OyNpJdrOa5HfI9flS7ke2SoKzbxbzrFQJ5WqbIJYmU67DwqokQ4bQXnkCBNMS4rb/I
         rgF6Vv4Dk1NjHzItqFDe1L+3Hj0fQGNf6MfvBpunZIPoneWbcwtAWT8K5hJePBp14o
         B7d9v+DKk3T5w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH] ARM: s3c/jive: add one more "fallthrough" statement
Date:   Tue, 16 Nov 2021 10:20:42 +0100
Message-Id: <20211116092053.4042799-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang warns about one missing fallthrough that gcc ignores:

arch/arm/mach-s3c/mach-jive.c:250:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]

Add it here as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/mach-jive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c/mach-jive.c b/arch/arm/mach-s3c/mach-jive.c
index 0785638a9069..285e1f0f4145 100644
--- a/arch/arm/mach-s3c/mach-jive.c
+++ b/arch/arm/mach-s3c/mach-jive.c
@@ -247,6 +247,7 @@ static int __init jive_mtdset(char *options)
 	case 1:
 		nand->nr_partitions = ARRAY_SIZE(jive_imageB_nand_part);
 		nand->partitions = jive_imageB_nand_part;
+		break;
 	case 0:
 		/* this is already setup in the nand info */
 		break;
-- 
2.29.2

