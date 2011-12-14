From: Axel Lin <axel.lin@gmail.com>
Subject: [linux-next] make  s5p64x0_defconfig build error
Date: Wed, 14 Dec 2011 12:57:10 +0800
Message-ID: <1323838630.18517.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:48221 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754135Ab1LNE5X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Dec 2011 23:57:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,
I got below build error on linux-next 20111213.

  CC      arch/arm/kernel/process.o
In file included from arch/arm/mach-s5p64x0/include/mach/system.h:16,
                 from arch/arm/kernel/process.c:64:
arch/arm/plat-samsung/include/plat/system-reset.h:19:2: error: #error Fix me up
make[1]: *** [arch/arm/kernel/process.o] Error 1
make: *** [arch/arm/kernel] Error 2

Regards,
Axel
