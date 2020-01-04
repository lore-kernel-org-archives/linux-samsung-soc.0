Return-Path: <SRS0=VjsZ=2Z=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EBEC2D0C2
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Jan 2020 15:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA8D62465D
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Jan 2020 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578151359;
	bh=KISZBPbueXgh6MYL4P8fo2t7dbtR9islwQqQs7IMFKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=b6SwJyNGUWmAfrsPo0FMdPmoAr99kLmdmBiuqa496CKEbSMR+i7ZZcjfLYZVQzKCl
	 0SyjNP4m3w1LCr68bmVxqw9KysVV/oJiDuBQbFSS4BG8KMocKbHeik3DdIy8b6gEjs
	 qc40+I74yijxHG7awgzw7EpVAIBkd52fjO/2Tecs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbgADPWj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Jan 2020 10:22:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgADPWi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Jan 2020 10:22:38 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0885E24653;
        Sat,  4 Jan 2020 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578151357;
        bh=KISZBPbueXgh6MYL4P8fo2t7dbtR9islwQqQs7IMFKM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VqBfAOI9cOd3uOBeusFc5GTGCQEzCj6mJRMGlx5lwSfn3WUaNYn+3MaUkNfQ7Ei6A
         kAyjxTNYMhxGcGxJYdSBJMqc/DADWGm9GsIM517n+uQFYnwjqP0WhosISmPFN+VPyc
         7aszUk6VTB4S0sFVu+KSUBuMAYUfA0JgRkOrz8ss=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 11/20] clocksource/drivers/exynos_mct: Rename Exynos to lowercase
Date:   Sat,  4 Jan 2020 16:20:58 +0100
Message-Id: <20200104152107.11407-12-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104152107.11407-1-krzk@kernel.org>
References: <20200104152107.11407-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Exynos"
name.

"EXYNOS" is not an abbreviation but a regular trademarked name.
Therefore it should be written with lowercase letters starting with
capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clocksource/exynos_mct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 74cb299f5089..a267fe31ef13 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2011 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
- * EXYNOS4 MCT(Multi-Core Timer) support
+ * Exynos4 MCT(Multi-Core Timer) support
 */
 
 #include <linux/interrupt.h>
-- 
2.17.1

