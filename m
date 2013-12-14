From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double
 clock initialization
Date: Sat, 14 Dec 2013 12:47:52 +0100
Message-ID: <52AC4568.7030201@gmail.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com> <201312140400.16794.arnd@arndb.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:52353 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794Ab3LNLr6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Dec 2013 06:47:58 -0500
Received: by mail-ea0-f174.google.com with SMTP id b10so1320370eae.33
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2013 03:47:56 -0800 (PST)
In-Reply-To: <201312140400.16794.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>

On 12/14/2013 04:00 AM, Arnd Bergmann wrote:
> On Friday 13 December 2013, Tomasz Figa wrote:
>> Commit
>>
>> 4178bac ARM: call of_clk_init from default time_init handler
>>
>> added implicit call to of_clk_init() from default time_init callback,
>> but it did not change platforms calling it from other callbacks, despite
>> of not having custom time_init callbacks. This caused double clock
>> initialization on such platforms, leading to boot failures. An example
>> of such platform is mach-s3c64xx.
>>
>> This patch fixes boot failure on s3c64xx by dropping custom init_irq
>> callback, which had a call to of_clk_init() and moving system reset
>> initialization to init_machine callback. This allows us to have
>> clocks initialized properly without a need to have custom init_time or
>> init_irq callbacks.
>>
>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Thomas,

thanks for catching this and sorry for the inconvenience. Either I
simply missed s3c64xx or it went in with that global of_clk_init
patch.

> I see of_clk_init(NULL) getting called on two other ARM platforms:
>
> $ git grep -w of_clk_init arch/arm
> arch/arm/kernel/time.c:         of_clk_init(NULL);
> arch/arm/mach-keystone/pm_domain.c:     of_clk_init(NULL);
> arch/arm/mach-mvebu/armada-370-xp.c:    of_clk_init(NULL);
> arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c:        of_clk_init(NULL);
>
> Are the other two platforms ok here?

mvebu is fine as long as it has its own .init_time callback (which it
has).

> I assume that mvebu is fine since Sebastian would have noticed breaking
> that one and it has a custom init_time function, but keystone seems
> broken in the same way as s3c64xx. Santosh, can you have a look?

I also had a look at keystone and guess it is broken, too.
of_clk_init(NULL) is called in keystone_pm_runtime_init() which is
set as subsys_initcall. Simply removing the extra of_clk_init call
in keystone_pm_runtime_init should be enough here:

 From 4ef4720c0d7ca9be57b06dc7ab1483c77a5ada1d Mon Sep 17 00:00:00 2001
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Date: Sat, 14 Dec 2013 12:21:01 +0100
Subject: [PATCH] ARM: keystone: remove call to of_clk_init

Commit

4178bac ARM: call of_clk_init from default time_init handler

added implicit call to of_clk_init(NULL) from default time_init callback.
This causes double clock initialization on keystone, leading to boot
failures.

This patch fixes boot failure on keystone by dropping the call to
of_clk_init(NULL) in keystone_pm_runtime_init(), which is set as
subsys_initcall and therefore called after arch-wide .init_time callback.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
  arch/arm/mach-keystone/pm_domain.c | 2 --
  1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-keystone/pm_domain.c 
b/arch/arm/mach-keystone/pm_domain.c
index 2962523..3f17e16 100644
--- a/arch/arm/mach-keystone/pm_domain.c
+++ b/arch/arm/mach-keystone/pm_domain.c
@@ -16,7 +16,6 @@
  #include <linux/pm_runtime.h>
  #include <linux/pm_clock.h>
  #include <linux/platform_device.h>
-#include <linux/clk-provider.h>
  #include <linux/of.h>

  #ifdef CONFIG_PM_RUNTIME
@@ -74,7 +73,6 @@ int __init keystone_pm_runtime_init(void)
  	if (!np)
  		return 0;

-	of_clk_init(NULL);
  	pm_clk_add_notifier(&platform_bus_type, &platform_domain_notifier);

  	return 0;
-- 
1.8.4.rc3
