Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711FCC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245687AbiCHOZW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343682AbiCHOZU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 09:25:20 -0500
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439D84B849;
        Tue,  8 Mar 2022 06:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646749463;
  x=1678285463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gchs80jcH+/5TFd0a5Cy8wkt4l2VcoMbwk5kapLsbnY=;
  b=YecgrHTgaYodtEGv0gXOUJy10uw57FE8fGJKquWmmLk69aponOEHrFNa
   znlWt91z98sQSQ6pEML2n+Y76vFXDsqDONHbLrkTiUMo/RmNN32cJ3Z+5
   y9Lm4VFzP2kgPzxArDiK4Aw9Ubhi2A7du40fyLqWX0eztSH2lgipU5q7U
   9BcKFmwT62RJXQdSFTAL5ZOVbzKOLNyNLykaAl3LXTP5cAfY5JIg2XINC
   yBZQ5SWdCCxvgBgqpyWF+Gbg9VJq7bAt/zam0LdmypHoPEpJ6xpZgGitX
   AoVk8ylL62wVFShbZxohe0+TF+qrYKZIIBdBcKI9hIUFakXIOLyEGA04A
   Q==;
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     <krzysztof.kozlowski@canonical.com>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>
CC:     <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <alim.akhtar@samsung.com>, <robh+dt@kernel.org>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH v2 4/4] clocksource/drivers/exynos_mct: Enable building on ARTPEC
Date:   Tue, 8 Mar 2022 15:24:10 +0100
Message-ID: <20220308142410.3193729-5-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
References: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This timer block is used on ARTPEC-8.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---

Notes:
    v2: No changes.

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

