Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D81C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 07:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbiDGHqm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 03:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242070AbiDGHql (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 03:46:41 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A8127CD0;
        Thu,  7 Apr 2022 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1649317481;
  x=1680853481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9o4101lhSUaQUglAFx0wOW4oYv+E/yNVxgL5P9cf4Zo=;
  b=VJrOk/7EUbpRczszWKSuBwyZfGY9EcYvbqFGFFRedxfiEhuviuhmBBJh
   XkIqP39evglXV/VG2X5UqeTwoC2iXS2gT+h4/mNPyQPWP2XvgFA9Q4sY+
   eh3UUy6If3DB/dpupc0m/LQ6gOEZXIYPoLC+MH68cUBqqstcJ50ut6Fem
   qptQw6Qbu1o7gqqHHRylaCpsxqCv5eOeK6rNOxNbU14m85+kU25ajr52K
   DtE8t92CoxjuswbiHJOm6CFVfBNlHV8qYSGPX5IfdGEaP4kyV8PEfNKn3
   O9pUJGbKribV729GdNV9kVhH5z/Yl/zFwKnwrrX0HCsCgN47GZ6OwpGEg
   A==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <krzk@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>
CC:     <kernel@axis.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <alim.akhtar@samsung.com>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 4/4] clocksource/drivers/exynos_mct: Enable building on ARTPEC
Date:   Thu, 7 Apr 2022 09:44:32 +0200
Message-ID: <20220407074432.424578-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220407074432.424578-1-vincent.whitchurch@axis.com>
References: <20220407074432.424578-1-vincent.whitchurch@axis.com>
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

