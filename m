Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4918CCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243667AbiFIL1q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 07:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236455AbiFIL1p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 07:27:45 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FF616A53E;
        Thu,  9 Jun 2022 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654774063;
  x=1686310063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pMBBlRkHHit1/qLmds0baWambd4XCf5DopNfauB0VUI=;
  b=MPZNXrSglV1qfNvPlx3TxPwxRxwcOiSu8cb2oaydJhGY5WyaXfInhxPB
   1m/S66QKNIs1l7TEu56ObgCoIHmAJnOAN6/k/7HlpJCIWLv3NTWV5JJOy
   PbBJHSM6+YwIKWSj8XFIncs34n0kdGhuWjCm+UT/jCMdmJJJEH/7Wui/M
   b7zgVdPBxi/jpvpprdNIpjV39hMoPWG2iAEQNU6FP+v8xkvYCluz8w0up
   E4f9bLeu7NEqgYIomu0YBxcc38BaXBiOlOLORs+wAlWJghqysCVFI0/Um
   pj7Pyw+IAuCnRNqpGVKMt7vkgG7HPC/91g11jzUSTo528+x6rvt4h2sKB
   g==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <krzysztof.kozlowski@linaro.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH v4 4/4] clocksource/drivers/exynos_mct: Enable building on ARTPEC
Date:   Thu, 9 Jun 2022 13:27:38 +0200
Message-ID: <20220609112738.359385-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609112738.359385-1-vincent.whitchurch@axis.com>
References: <20220609112738.359385-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This timer block is used on ARTPEC-8.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v3:
    - Add Krzysztof's Reviewed-by.

 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 3c0ee102fe73..b275583f946c 100644
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

