From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Build error with s3c2410_defconfig
Date: Mon, 08 Nov 2010 16:15:55 +0900
Message-ID: <001001cb7f14$cace6af0$606b40d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:49575 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752376Ab0KHHQm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Nov 2010 02:16:42 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LBK00B2C1HWYC50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Nov 2010 16:15:32 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LBK00ICV1HWSA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Nov 2010 16:15:32 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Vasily Khoruzhick' <anarsoul@gmail.com>

Hi Vasily,

Now, happens following build error due to commit
14477095abc661a9f195ca4733bb739c54794b32 'ARM: h1940: Use gpiolib for latch
access' with s3c2410_defconfig.

drivers/leds/leds-h1940.c: In function 'h1940_greenled_set':
drivers/leds/leds-h1940.c:33: error: implicit declaration of function
'h1940_latch_control'

The h1940_greenled_set(), h1940_redled_set(), and h1940_blueled_set() in
drivers/leds/leds-h1940.c call h1940_latch_control()...

Need to fix it up.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
