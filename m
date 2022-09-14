Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC4FECAAD8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Sep 2022 08:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiINIlt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiINIls (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 04:41:48 -0400
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B268661722;
        Wed, 14 Sep 2022 01:41:45 -0700 (PDT)
X-QQ-mid: bizesmtp66t1663144894t808guhs
Received: from localhost.localdomain ( [125.70.163.64])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 14 Sep 2022 16:41:33 +0800 (CST)
X-QQ-SSF: 01000000002000E0G000B00A0000000
X-QQ-FEAT: hoArX50alxGjEz4fKpL+A+Dd0zC88o9Q0W3k3ieTZVhQ+sWNgLzGBBylFlhWp
        G88jQJKLeS0wpt6oFrotoXZgSJJd1wAEJTCRv7c8G+NkWBrCXKT56ffUnvQD/4IuIogDQVO
        eDaQJnJIDPF6iE2/nDGWO/czqUf2MJt3YquJKB0ALP4SKwnC/esFzqLjf9t3j6W6A37uzYH
        J5HUXy/AzaLGemjlve+x1ys3B5AUk21MtQdEZdNcsKG49jQYBIcHb3Bk8ED0Uk+nvRwkGQl
        7TSBUhhwwlhMOszs89pnPRhIrWD61uUjHsw9asI55NnWhLcnQbMCjuLb5tWP1QbyLwnpOdT
        GK4gwlSbIzpaUDmErho0KrgUSjPXe6MZ8+JWKWXCOASNuXQlZsCSclGu4ROSsDqySUaxVkX
X-QQ-GoodBg: 0
From:   Jilin Yuan <yuanjilin@cdjrlc.com>
To:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux@armlinux.org.uk
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] ARM: s3c: fix repeated words in comments
Date:   Wed, 14 Sep 2022 16:41:27 +0800
Message-Id: <20220914084127.33781-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Delete the redundant word 'would'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 arch/arm/mach-s3c/mach-gta02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index abfdce765525..807c1fc8ba2c 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -393,7 +393,7 @@ static struct s3c2410_nand_set __initdata gta02_nand_sets[] = {
 	[0] = {
 		/*
 		 * This name is also hard-coded in the boot loaders, so
-		 * changing it would would require all users to upgrade
+		 * changing it would require all users to upgrade
 		 * their boot loaders, some of which are stored in a NOR
 		 * that is considered to be immutable.
 		 */
-- 
2.36.1

