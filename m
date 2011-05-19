From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 2/2] serial: Remove redundant console_initcall from s3c and s5p
 console drivers
Date: Fri, 20 May 2011 02:20:02 +0530
Message-ID: <1305838202-1256-3-git-send-email-thomas.ab@samsung.com>
References: <1305838202-1256-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9985 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934719Ab1ESUm6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 May 2011 16:42:58 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLG00J58MV0JYC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:42:57 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLG00DHXMVF6Z@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 May 2011 05:42:57 +0900 (KST)
In-reply-to: <1305838202-1256-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Uart port is registered as a console during the driver's probe.
So explict registration of console with console_initcall is
removed.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/s3c2400.c |    2 --
 drivers/tty/serial/s3c2410.c |    2 --
 drivers/tty/serial/s3c2412.c |    2 --
 drivers/tty/serial/s3c2440.c |    2 --
 drivers/tty/serial/s3c24a0.c |    2 --
 drivers/tty/serial/s3c6400.c |    2 --
 drivers/tty/serial/s5pv210.c |    7 -------
 drivers/tty/serial/samsung.c |    3 ++-
 drivers/tty/serial/samsung.h |   19 -------------------
 9 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/tty/serial/s3c2400.c b/drivers/tty/serial/s3c2400.c
index fed1a9a..48f1611 100644
--- a/drivers/tty/serial/s3c2400.c
+++ b/drivers/tty/serial/s3c2400.c
@@ -85,8 +85,6 @@ static struct platform_driver s3c2400_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c2400_serial_driver, &s3c2400_uart_inf);
-
 static inline int s3c2400_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c2400_serial_driver, &s3c2400_uart_inf);
diff --git a/drivers/tty/serial/s3c2410.c b/drivers/tty/serial/s3c2410.c
index 73f089d..f042c35 100644
--- a/drivers/tty/serial/s3c2410.c
+++ b/drivers/tty/serial/s3c2410.c
@@ -97,8 +97,6 @@ static struct platform_driver s3c2410_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c2410_serial_driver, &s3c2410_uart_inf);
-
 static int __init s3c2410_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c2410_serial_driver, &s3c2410_uart_inf);
diff --git a/drivers/tty/serial/s3c2412.c b/drivers/tty/serial/s3c2412.c
index 1700b1a..6ecfff3 100644
--- a/drivers/tty/serial/s3c2412.c
+++ b/drivers/tty/serial/s3c2412.c
@@ -131,8 +131,6 @@ static struct platform_driver s3c2412_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c2412_serial_driver, &s3c2412_uart_inf);
-
 static inline int s3c2412_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c2412_serial_driver, &s3c2412_uart_inf);
diff --git a/drivers/tty/serial/s3c2440.c b/drivers/tty/serial/s3c2440.c
index 094cc39..389b6b3 100644
--- a/drivers/tty/serial/s3c2440.c
+++ b/drivers/tty/serial/s3c2440.c
@@ -160,8 +160,6 @@ static struct platform_driver s3c2440_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c2440_serial_driver, &s3c2440_uart_inf);
-
 static int __init s3c2440_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c2440_serial_driver, &s3c2440_uart_inf);
diff --git a/drivers/tty/serial/s3c24a0.c b/drivers/tty/serial/s3c24a0.c
index fad6083..45e119d 100644
--- a/drivers/tty/serial/s3c24a0.c
+++ b/drivers/tty/serial/s3c24a0.c
@@ -101,8 +101,6 @@ static struct platform_driver s3c24a0_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c24a0_serial_driver, &s3c24a0_uart_inf);
-
 static int __init s3c24a0_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c24a0_serial_driver, &s3c24a0_uart_inf);
diff --git a/drivers/tty/serial/s3c6400.c b/drivers/tty/serial/s3c6400.c
index 4be92ab..1d8abe4 100644
--- a/drivers/tty/serial/s3c6400.c
+++ b/drivers/tty/serial/s3c6400.c
@@ -131,8 +131,6 @@ static struct platform_driver s3c6400_serial_driver = {
 	},
 };
 
-s3c24xx_console_init(&s3c6400_serial_driver, &s3c6400_uart_inf);
-
 static int __init s3c6400_serial_init(void)
 {
 	return s3c24xx_serial_init(&s3c6400_serial_driver, &s3c6400_uart_inf);
diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv210.c
index 6ebccd7..cdee626 100644
--- a/drivers/tty/serial/s5pv210.c
+++ b/drivers/tty/serial/s5pv210.c
@@ -136,13 +136,6 @@ static struct platform_driver s5p_serial_driver = {
 	},
 };
 
-static int __init s5pv210_serial_console_init(void)
-{
-	return s3c24xx_serial_initconsole(&s5p_serial_driver, s5p_uart_inf);
-}
-
-console_initcall(s5pv210_serial_console_init);
-
 static int __init s5p_serial_init(void)
 {
 	return s3c24xx_serial_init(&s5p_serial_driver, *s5p_uart_inf);
diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 08e72a2..14a2e41 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1450,7 +1450,8 @@ static struct console s3c24xx_serial_console = {
 	.flags		= CON_PRINTBUFFER,
 	.index		= -1,
 	.write		= s3c24xx_serial_console_write,
-	.setup		= s3c24xx_serial_console_setup
+	.setup		= s3c24xx_serial_console_setup,
+	.data		= &s3c24xx_uart_drv,
 };
 
 int s3c24xx_serial_initconsole(struct platform_driver *drv,
diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsung.h
index 0ac06a0..5832660 100644
--- a/drivers/tty/serial/samsung.h
+++ b/drivers/tty/serial/samsung.h
@@ -80,25 +80,6 @@ extern int s3c24xx_serial_initconsole(struct platform_driver *drv,
 extern int s3c24xx_serial_init(struct platform_driver *drv,
 			       struct s3c24xx_uart_info *info);
 
-#ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE
-
-#define s3c24xx_console_init(__drv, __inf)				\
-static int __init s3c_serial_console_init(void)				\
-{									\
-	struct s3c24xx_uart_info *uinfo[CONFIG_SERIAL_SAMSUNG_UARTS];	\
-	int i;								\
-									\
-	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)		\
-		uinfo[i] = __inf;					\
-	return s3c24xx_serial_initconsole(__drv, uinfo);		\
-}									\
-									\
-console_initcall(s3c_serial_console_init)
-
-#else
-#define s3c24xx_console_init(drv, inf) extern void no_console(void)
-#endif
-
 #ifdef CONFIG_SERIAL_SAMSUNG_DEBUG
 
 extern void printascii(const char *);
-- 
1.6.6.rc2
