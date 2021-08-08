Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3713BC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Aug 2021 20:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C23860EB7
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  8 Aug 2021 20:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhHHU5w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 8 Aug 2021 16:57:52 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:43376 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhHHU5w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 16:57:52 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 11F7F20DE925
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 4/9] usb: gadget: udc: s3c2410: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <f704a632-a970-fe8d-35e7-f4d032c670c7@omp.ru>
Date:   Sun, 8 Aug 2021 23:57:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_irq() (which takes
*unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
error code. Stop calling devm_request_irq() with the invalid IRQ #s.

Fixes: 8b2e76687b39 ("USB: AT91 UDC updates, mostly power management")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/gadget/udc/at91_udc.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: usb/drivers/usb/gadget/udc/at91_udc.c
===================================================================
--- usb.orig/drivers/usb/gadget/udc/at91_udc.c
+++ usb/drivers/usb/gadget/udc/at91_udc.c
@@ -1876,7 +1876,9 @@ static int at91udc_probe(struct platform
 	clk_disable(udc->iclk);
 
 	/* request UDC and maybe VBUS irqs */
-	udc->udp_irq = platform_get_irq(pdev, 0);
+	udc->udp_irq = retval = platform_get_irq(pdev, 0);
+	if (retval < 0)
+		goto err_unprepare_iclk;
 	retval = devm_request_irq(dev, udc->udp_irq, at91_udc_irq, 0,
 				  driver_name, udc);
 	if (retval) {
