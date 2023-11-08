Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BF2C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Nov 2023 09:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343809AbjKHJBO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Nov 2023 04:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235332AbjKHJBM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2023 04:01:12 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C875E10A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Nov 2023 01:01:10 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 86F012195A;
        Wed,  8 Nov 2023 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1699434069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Xm+XdVl+/EMFFesx6inPpLf5HtpcLim26vN17ke2hwE=;
        b=UldKzpf1AXjsliv3P7YYJ3tb1zXHh70PYF87J+57Ct0+uok7zLFLRixqP5reOrli707sx7
        IgdsP9Mn75L23LO3Lm7tbdD00SzWIzuFYfZNUDdAl63QoAG80vvxrfDz6puMbJGdtSDJ0N
        IDLykMDJE7Sd2r5JpAX37mwaw8EAr44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1699434069;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=Xm+XdVl+/EMFFesx6inPpLf5HtpcLim26vN17ke2hwE=;
        b=ihzWCclf6vO5mLsNDWnLVBMenyKZp29jqCZY/n48v245rXa+jy5s9qNBGTbk7cbKp8+rJN
        I80xcznrUoOLmoDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6CB39138F2;
        Wed,  8 Nov 2023 09:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id sx4rGVVOS2XPRAAAMHmgww
        (envelope-from <pvorel@suse.cz>); Wed, 08 Nov 2023 09:01:09 +0000
From:   Petr Vorel <pvorel@suse.cz>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Petr Vorel <pvorel@suse.cz>
Subject: [PATCH 1/1] samsung: Sort Makefile
Date:   Wed,  8 Nov 2023 10:01:06 +0100
Message-ID: <20231108090106.8933-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 drivers/clk/samsung/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
index ebbeacabe88f..8a678ed05181 100644
--- a/drivers/clk/samsung/Makefile
+++ b/drivers/clk/samsung/Makefile
@@ -7,20 +7,20 @@ obj-$(CONFIG_COMMON_CLK)	+= clk.o clk-pll.o clk-cpu.o
 obj-$(CONFIG_EXYNOS_3250_COMMON_CLK)	+= clk-exynos3250.o
 obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4.o
 obj-$(CONFIG_EXYNOS_4_COMMON_CLK)	+= clk-exynos4412-isp.o
-obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5250.o
 obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5-subcmu.o
+obj-$(CONFIG_EXYNOS_5250_COMMON_CLK)	+= clk-exynos5250.o
 obj-$(CONFIG_EXYNOS_5260_COMMON_CLK)	+= clk-exynos5260.o
 obj-$(CONFIG_EXYNOS_5410_COMMON_CLK)	+= clk-exynos5410.o
-obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5420.o
 obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5-subcmu.o
-obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
-obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
-obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
+obj-$(CONFIG_EXYNOS_5420_COMMON_CLK)	+= clk-exynos5420.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos-arm64.o
+obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
 obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
+obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
+obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
 obj-$(CONFIG_S3C64XX_COMMON_CLK)	+= clk-s3c64xx.o
 obj-$(CONFIG_S5PV210_COMMON_CLK)	+= clk-s5pv210.o clk-s5pv210-audss.o
 obj-$(CONFIG_TESLA_FSD_COMMON_CLK)	+= clk-fsd.o
-- 
2.42.0

