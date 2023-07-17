Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E45C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 Jul 2023 22:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjGQW6r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 Jul 2023 18:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjGQW6q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 18:58:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE2210EF;
        Mon, 17 Jul 2023 15:58:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4017C612B4;
        Mon, 17 Jul 2023 22:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F80C433C7;
        Mon, 17 Jul 2023 22:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689634724;
        bh=rM26BLazDBsUWhbicT5Xil9vOWS3Rtw9EQvF4oPqBU4=;
        h=From:To:Cc:Subject:Date:From;
        b=d+xnaUrzFHksDRaRYvhXNRgDZX1mSPr8+8T2JlAVzjfLb5Ydem2RGjv/HG/6XV4q7
         yndeBtrZtuOOy3WeWki60J1w7TicdtV2hdl9UHfxGS70DlD9BDkXLeyGGG5INGvs7J
         KHWMBTmDTWRNpRF4Sx3urZKpXpy4WBXb8Ngvw6NcACdYu7gCDxtSOY0fwDRszrjorB
         rHe/qr1/3cYHG+HwtW1iQOc3LuoOjhofWJvBgxCGYk0SPbUyw8rwnsU1INhXZRcp8k
         pgwjn3wBS96h2SJhv9juWlGzzwN+agtw9ScLFQM51oIoN+792a0PdyVE3oLKLzdjE4
         V7t1LsOU3SNpA==
Received: (nullmailer pid 3211848 invoked by uid 1000);
        Mon, 17 Jul 2023 22:54:49 -0000
From:   Rob Herring <robh@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: s5pv210: Explicitly include correct DT includes
Date:   Mon, 17 Jul 2023 16:54:46 -0600
Message-Id: <20230717225446.3211738-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.
---
 arch/arm/mach-s5pv210/s5pv210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s5pv210/s5pv210.c b/arch/arm/mach-s5pv210/s5pv210.c
index a21ed3bb992a..7d4a10184160 100644
--- a/arch/arm/mach-s5pv210/s5pv210.c
+++ b/arch/arm/mach-s5pv210/s5pv210.c
@@ -7,7 +7,7 @@
 // Tomasz Figa <t.figa@samsung.com>
 
 #include <linux/of_fdt.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-- 
2.40.1

