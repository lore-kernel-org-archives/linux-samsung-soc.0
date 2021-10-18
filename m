Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627F4C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 18:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42E2A60F93
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 18:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbhJRSl7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 14:41:59 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:52906 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhJRSlu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 14:41:50 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 2D18D207135B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 10/22] usb: host: ohci-exynos: deny IRQ0
Date:   Mon, 18 Oct 2021 21:39:18 +0300
Message-ID: <20211018183930.8448-11-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...

Fixes: 1d4169834628 ("usb: host: ohci-exynos: Fix error handling in exynos_ohci_probe()")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/usb/host/ohci-exynos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index 5f5e8a64c8e2..f28f28e42f43 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -175,6 +175,10 @@ static int exynos_ohci_probe(struct platform_device *pdev)
 		err = irq;
 		goto fail_io;
 	}
+	if (!irq) {
+		err = -EINVAL;
+		goto fail_io;
+	}
 
 	platform_set_drvdata(pdev, hcd);
 
-- 
2.26.3

