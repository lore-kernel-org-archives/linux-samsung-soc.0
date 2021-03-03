Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F0CC4332E
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 21:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86E47600EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 21:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344252AbhCCU4x (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 3 Mar 2021 15:56:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349999AbhCCS2g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Mar 2021 13:28:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A9C164EBD;
        Wed,  3 Mar 2021 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614796018;
        bh=3TjdgPjZpCV5a/8Py4GtoxI2w3VgY7OFKnXhrLgP8V0=;
        h=From:To:Cc:Subject:Date:From;
        b=LDhRYGGyJVo5hupkxd3kzZ5puMnN76d9Y3cTrDWaC5XbZK5iUJy8VfRQYqU7ySBTG
         PlHA8V5LxsqzdJ677AosBd8RHzcwFs6AIicPHGdH3F6YWyyJ/baMLNrWw9+OvMLij9
         hac3odMDh+oeLE2SUChFkjGJVSGGLEPZ0G0nD+4wYt2fp8BKs0OzSRhhOcPtc/kUYd
         6JVcRhMxMXUSbW1c8gJ7LIuf1I4XaHHOfZTQzi1wiCcA34qhM9bYd+ubEktRuhXXMO
         L6yZlWzcfct9pJQ1ZZkFdy4k9pf/VdUYet2PmOn4aqxPNJ5q6KDtts0jxjli6lWoOq
         5K7l+U8WXVZVw==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
Date:   Wed,  3 Mar 2021 19:26:46 +0100
Message-Id: <20210303182646.137008-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Samsung PMIC drivers are used only on Devicetree boards.

Additionally, the PMIC datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

Marek Szyprowski reports that together with DTS change (proper level in
DTS) it fixes RTC alarm failure that he observed from time to time on
TM2e board.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes since v1:
1. Mention in commit msg that this fixes TM2e RTC alarm.
2. Add Marek's tested-by.
---
 drivers/mfd/sec-irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index a98c5d165039..760f88a865ab 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -480,8 +480,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
-				       sec_pmic->irq,
-				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				       sec_pmic->irq, IRQF_ONESHOT,
 				       sec_pmic->irq_base, sec_irq_chip,
 				       &sec_pmic->irq_data);
 	if (ret != 0) {
-- 
2.25.1

