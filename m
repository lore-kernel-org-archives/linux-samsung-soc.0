Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ACCC28D13
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Aug 2022 12:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbiHVMJo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Aug 2022 08:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbiHVMJo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 08:09:44 -0400
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8D9399F6;
        Mon, 22 Aug 2022 05:09:41 -0700 (PDT)
X-QQ-mid: bizesmtp77t1661170150tizb7q9p
Received: from localhost.localdomain ( [182.148.14.124])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 22 Aug 2022 20:09:08 +0800 (CST)
X-QQ-SSF: 01000000002000C0D000B00A0000000
X-QQ-FEAT: J5JfekO1WsjqZ9Csd1xMP8RiLXNCg6N05x9timq6hi6m6FxQ7t81A1rQPp8mO
        pp0j2b89NGZLsTJsSEz2j+fbfVZ2IynUbhPo0xvT38blLo3I8iZWr/MPsuWMqtLKZs4kyqv
        mw/3+OULHPpVGQk2SHg6k0uS+8FE0ZCbgTZY3DMXoKYDmHSoCHIgru2RrPTPIKHoIb/wh2+
        FrD5pVGNwS9epJXtOvUF4aaEhLXd3EcU1vv0N7dNnCcfO+E56UFiLqhwnPk8AGmFcg91xk3
        vr7h/EUdFSx5L+P/v3OxBwVJKpH+KVTmhrHbFvO6Cszy6PXmdBY6Xi42u2A9XkCkdawHlsD
        /flw6msX6EyQi159wsGsxqj0mukGWbWOd4Y6XUYIyScYWEKGiEn5v7z5IAXqiZFZHPbxt2W
        jwZYAkypJPs=
X-QQ-GoodBg: 0
From:   Jilin Yuan <yuanjilin@cdjrlc.com>
To:     gregkh@linuxfoundation.org, jirislaby@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Cc:     linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] tty/serial: fix repeated words in comments
Date:   Mon, 22 Aug 2022 20:09:01 +0800
Message-Id: <20220822120901.17913-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

 Delete the redundant word 'power'.
 Delete the redundant word 'long'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/tty/serial/imx.c         | 2 +-
 drivers/tty/serial/samsung_tty.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 30edb35a6a15..c72e0dad3544 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2069,7 +2069,7 @@ imx_uart_console_get_options(struct imx_port *sport, int *baud,
 		{	/*
 			 * The next code provides exact computation of
 			 *   baud_raw = round(((uartclk/16) * (ubir + 1)) / (ubmr + 1))
-			 * without need of float support or long long division,
+			 * without need of float support or long division,
 			 * which would be required to prevent 32bit arithmetic overflow
 			 */
 			unsigned int mul = ubir + 1;
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index d5ca904def34..af799b79ba25 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1353,7 +1353,7 @@ static int apple_s5l_serial_startup(struct uart_port *port)
 	return ret;
 }
 
-/* power power management control */
+/* power management control */
 
 static void s3c24xx_serial_pm(struct uart_port *port, unsigned int level,
 			      unsigned int old)
-- 
2.36.1

