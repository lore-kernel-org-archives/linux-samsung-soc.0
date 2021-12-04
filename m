Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02617C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  4 Dec 2021 19:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355285AbhLDUBn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 4 Dec 2021 15:01:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355621AbhLDUBd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 15:01:33 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D7FC0698C0
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Dec 2021 11:58:06 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y196so5053143wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Dec 2021 11:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HbHXvXbJFpt3uJhKceFknK3GdQKOcc4a0UIjA9jf6ws=;
        b=AC+gymsXevz7KzoeuWxQeclVpImljNlWqdijMtoi5LfEKFMnv/VZKzkhIJ0DnHHbIr
         hl5Gc2ciT9Dg/wcamfjAYhKyUSAdmJ49S62AerArZ+dBWDnRY4jHSgn2IR+hgqfVhY45
         VOxZMooHX7hGTfMV8wCi+r92Cf3yONE8zQbePc7T4PKv8oXRhGxr4RHchHaraDUX8afZ
         2wtJ5MxhoaVNEq6D/VoCtRJAsBZJh8hW1c55+TPod0LE9OZFZEJWNOWUdZRpl/eModmg
         fmf8VjlRhHAZF/xRl42J1ojNTgfoAYg2C3qKdkDusxy0EPW6d8tPl+VHDDQ3frlO0XEh
         4RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbHXvXbJFpt3uJhKceFknK3GdQKOcc4a0UIjA9jf6ws=;
        b=a6QqWYz3TY6FToWEQ0v7zEcC0qWYLCbg+SNJyeL1rSE9Kk8dh8RVlF1mYyDyJGMY9f
         P6BADq+FEorOZ2ZQwEcn97DberoubJdqLfsQqf8+lEZGWWfRhRbijFU1ql7FNqkY99mI
         Zgy6utIDC4ble7TsHBtp14zrmYsUFQt48ejA4mqD6qr2BA+0S9t1k91Yh0OCY8bOwlDC
         FZ4aoStaEqFvB66PoVnN/W3cj1eV4e5vd+YE6Huaq0hb6XurBg34tQK7dEd5Gltr54oK
         ZIw8VFrrG+RzqV58CyAvCwm8O9Hu+YTAc2leSyq/slH1Ipa8gvDOxVhJbAy+WguGrEN9
         QaDQ==
X-Gm-Message-State: AOAM531YGbII0ehXED/pOBAsteQVU+Sl0BcQPDGZ4yw5+wxoatIFO9nX
        bs2V+GwLr/UM8mYI1OkSjndwnA==
X-Google-Smtp-Source: ABdhPJyi9w6bVaeVo8QNdkjq0qyMoWP8FGierDullgzMXBvH7kDq2VovUQG2k16H1F3vgjNQerbmUQ==
X-Received: by 2002:a05:600c:104b:: with SMTP id 11mr26116957wmx.54.1638647885257;
        Sat, 04 Dec 2021 11:58:05 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c10sm7162328wrb.81.2021.12.04.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 11:58:04 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 4/5] tty: serial: samsung: Enable console as module
Date:   Sat,  4 Dec 2021 21:57:56 +0200
Message-Id: <20211204195757.8600-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211204195757.8600-1-semen.protsenko@linaro.org>
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable serial driver to be built as a module. To do so, init the console
support on driver/module load instead of using console_initcall().

Inspired by commit 87a0b9f98ac5 ("tty: serial: meson: enable console as
module").

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Removed the USI mentioning from commit message

Changes in v2:
  - Added error path handling in samsung_serial_init()
  - Added console unregister in samsung_serial_exit()

 drivers/tty/serial/Kconfig       |  2 +-
 drivers/tty/serial/samsung_tty.c | 36 ++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index fc543ac97c13..0e5ccb25bdb1 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -263,7 +263,7 @@ config SERIAL_SAMSUNG_UARTS
 
 config SERIAL_SAMSUNG_CONSOLE
 	bool "Support for console on Samsung SoC serial port"
-	depends on SERIAL_SAMSUNG=y
+	depends on SERIAL_SAMSUNG
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index f986a9253dc8..61ccb359620a 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -1715,15 +1715,21 @@ s3c24xx_serial_verify_port(struct uart_port *port, struct serial_struct *ser)
 
 static struct console s3c24xx_serial_console;
 
-static int __init s3c24xx_serial_console_init(void)
+static void __init s3c24xx_serial_register_console(void)
 {
 	register_console(&s3c24xx_serial_console);
-	return 0;
 }
-console_initcall(s3c24xx_serial_console_init);
+
+static void s3c24xx_serial_unregister_console(void)
+{
+	if (s3c24xx_serial_console.flags & CON_ENABLED)
+		unregister_console(&s3c24xx_serial_console);
+}
 
 #define S3C24XX_SERIAL_CONSOLE &s3c24xx_serial_console
 #else
+static inline void s3c24xx_serial_register_console(void) { }
+static inline void s3c24xx_serial_unregister_console(void) { }
 #define S3C24XX_SERIAL_CONSOLE NULL
 #endif
 
@@ -2898,7 +2904,29 @@ static struct platform_driver samsung_serial_driver = {
 	},
 };
 
-module_platform_driver(samsung_serial_driver);
+static int __init samsung_serial_init(void)
+{
+	int ret;
+
+	s3c24xx_serial_register_console();
+
+	ret = platform_driver_register(&samsung_serial_driver);
+	if (ret) {
+		s3c24xx_serial_unregister_console();
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit samsung_serial_exit(void)
+{
+	platform_driver_unregister(&samsung_serial_driver);
+	s3c24xx_serial_unregister_console();
+}
+
+module_init(samsung_serial_init);
+module_exit(samsung_serial_exit);
 
 #ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE
 /*
-- 
2.30.2

