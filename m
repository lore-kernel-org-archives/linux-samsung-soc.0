Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC64C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Mar 2022 10:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbiCRKjH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235060AbiCRKi6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 06:38:58 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BC82D8126;
        Fri, 18 Mar 2022 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=70GBOoGlM1s/D/vZ/gDz7tsiLlk7NWNVX7tgLUieEPg=;
  b=mxQ0CtrWw8OtDoXXQVFm8pi+3gB5tEHcj4Lmd3G5XYPe1Iy5s6kuu5if
   DYGNOgfSlNU1e44x/RMVmVmLsVSi/on3OMd2Uhy+CsVhVPtWG3boA1hzn
   iy+MY0b8q02hPUMSn2G5mC2JeMUJXxr3RJ1G0fn3kgAZij9ot+E8Td4Wq
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,192,1643670000"; 
   d="scan'208";a="8935634"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 11:37:35 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kernel-janitors@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s3c: s3c24xx: fix typos in comments
Date:   Fri, 18 Mar 2022 11:37:00 +0100
Message-Id: <20220318103729.157574-5-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/arm/mach-s3c/s3c24xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/s3c24xx.c b/arch/arm/mach-s3c/s3c24xx.c
index ccfed48c98aa..37eaf9480da7 100644
--- a/arch/arm/mach-s3c/s3c24xx.c
+++ b/arch/arm/mach-s3c/s3c24xx.c
@@ -146,7 +146,7 @@ static struct map_desc s3c_iodesc[] __initdata __maybe_unused = {
 	IODESC_ENT(UART)
 };
 
-/* read cpu identificaiton code */
+/* read cpu identification code */
 
 static unsigned long s3c24xx_read_idcode_v5(void)
 {

