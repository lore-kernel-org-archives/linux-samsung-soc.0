Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71CCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 19:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiGTTBs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 15:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiGTTBo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 15:01:44 -0400
Received: from smtpbg.qq.com (unknown [43.155.67.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AB151A0F;
        Wed, 20 Jul 2022 12:01:37 -0700 (PDT)
X-QQ-mid: bizesmtp75t1658343666tmbmswyw
Received: from harry-jrlc.. ( [125.70.163.183])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 21 Jul 2022 03:00:44 +0800 (CST)
X-QQ-SSF: 0100000000000030C000B00A0000020
X-QQ-FEAT: ao4JQgu0M3+9jr5Iz2O5/00KyhAFsgtflReKiqHPDCB1pkLwLkRTyTz4s9tw0
        ox9YjKAPjMbzAvMaL16KuScxZSSTtz/Lkw+YoFqDKOpJ/spPriEWuL8t+BLfoi+usu7o6PV
        ZncFjSSSZ7FX3uD0+RAxQS2ZlYiRwvLAr3KPgkRUAMrhnhPUkCPlBrEaP3RVVVOHkoU0YBn
        WG5QMrBI6ButgCxa8WeV0otAnDszy4O5LWFT0qvGKUV8EM+POdl02AgzbkoLlQEkspaxWxv
        Q09LumGKwVycyQORhOkxui3kxtLEoipFZPn40sisKjJ+qOoASTdLI34TYX2+YUf6CbW4car
        yEASwqgiIKkjmfTRfk=
X-QQ-GoodBg: 0
From:   Xin Gao <gaoxin@cdjrlc.com>
To:     rzysztof.kozlowski@linaro.org
Cc:     alim.akhtar@samsung.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xin Gao <gaoxin@cdjrlc.com>
Subject: [PATCH] ARM:repeated word: 'would'.
Date:   Thu, 21 Jul 2022 03:00:42 +0800
Message-Id: <20220720190042.6509-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

repeated word: 'would'.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
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
2.30.2

