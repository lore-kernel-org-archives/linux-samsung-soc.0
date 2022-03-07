Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569A3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiCGIit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbiCGIit (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:38:49 -0500
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FB917A9B;
        Mon,  7 Mar 2022 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646642274;
  x=1678178274;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FAzSlWNm2A11JVb+FZjaMh+1yDJMbFg4gll5ey/fEcU=;
  b=IAF3EqLUV4fS9RgzL1WN8c3ByVsz8YVHfT3XmEWv5KkwDFEgfhtOF2Pz
   dKVEkujbNbgKuo494UT+PZcUsrl+qRuB/3xNqUGEBCyMeArC2gRYhf9TZ
   dWgcxtUADXrxRfNLUq+hCnDbHjErGdwGYHN4VUCWVQpgG4RT5+SCwDQVu
   gkWMVqHelObyJPObVNxxvSUu0Y0/lTvB+lw8kYqNhPy3ui8PJKPoFwj3K
   CGbJ1xtFAhHTkVYlt+Suh4ViqXS45ffo3cTqxoho3eOrr04Na5N3fgYrb
   9sdb8sVSx7UPahp8fSTwyfBPrK84qA7QbloEZ4owb9VWhcK35Q6GX5U4E
   w==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <krzysztof.kozlowski@canonical.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     <kernel@axis.com>, <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] clocksource/drivers/exynos_mct: Enable building on ARTPEC
Date:   Mon, 7 Mar 2022 09:37:44 +0100
Message-ID: <20220307083744.1592533-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This timer block is used on ARTPEC-8.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index ae95d06a4a8f..2ea981ef23af 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -419,7 +419,7 @@ config ATMEL_TCB_CLKSRC
 config CLKSRC_EXYNOS_MCT
 	bool "Exynos multi core timer driver" if COMPILE_TEST
 	depends on ARM || ARM64
-	depends on ARCH_EXYNOS || COMPILE_TEST
+	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
-- 
2.34.1

