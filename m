From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: SMDK6440: Crash during boot up while configuring GPIO bank R
Date: Wed, 23 Jun 2010 11:07:53 +0530
Message-ID: <AANLkTingC66StF3iVZqwleenthLZ8mQpdaV0XMRHWI0v@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:50953 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab0FWFiO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 01:38:14 -0400
Received: by vws9 with SMTP id 9so447395vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 22:38:13 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Hi Ben,

I'm adding I2C support for SMDK6440 board.

And observed a bootup crash while configuring GPIO GPR();

The following are the boot logs

BUG: spinlock recursion on CPU#0, swapper/1
=A0lock: c01fbd64, .magic: dead4ead, .owner: swapper/1, .owner_cpu: 0
[<c0023260>] (unwind_backtrace+0x0/0xec) from [<c011e764>]
(do_raw_spin_lock+0x48/0x14c)
[<c011e764>] (do_raw_spin_lock+0x48/0x14c) from [<c016e6e8>]
(_raw_spin_lock_irqsave+0x10/0x18)
[<c016e6e8>] (_raw_spin_lock_irqsave+0x10/0x18) from [<c00292e8>]
(s5p6440_gpio_setcfg_4bit_rbank+0x54/0xb4)
[<c00292e8>] (s5p6440_gpio_setcfg_4bit_rbank+0x54/0xb4) from
[<c002a1bc>] (s3c_gpio_cfgpin+0x50/0x74)
[<c002a1bc>] (s3c_gpio_cfgpin+0x50/0x74) from [<c0029478>]
(s3c_i2c1_cfg_gpio+0x10/0x20)
[<c0029478>] (s3c_i2c1_cfg_gpio+0x10/0x20) from [<c016af24>]
(s3c24xx_i2c_probe+0x21c/0x5c8)
[<c016af24>] (s3c24xx_i2c_probe+0x21c/0x5c8) from [<c01445ac>]
(platform_drv_probe+0x18/0x1c)
[<c01445ac>] (platform_drv_probe+0x18/0x1c) from [<c0143700>]
(driver_probe_device+0xa8/0x158)
[<c0143700>] (driver_probe_device+0xa8/0x158) from [<c0143810>]
(__driver_attach+0x60/0x84)
[<c0143810>] (__driver_attach+0x60/0x84) from [<c0142fa0>]
(bus_for_each_dev+0x44/0x74)
[<c0142fa0>] (bus_for_each_dev+0x44/0x74) from [<c01428a8>]
(bus_add_driver+0x98/0x218)
[<c01428a8>] (bus_add_driver+0x98/0x218) from [<c0143ae0>]
(driver_register+0xa8/0x138)
[<c0143ae0>] (driver_register+0xa8/0x138) from [<c001d388>]
(do_one_initcall+0x58/0x1a8)
[<c001d388>] (do_one_initcall+0x58/0x1a8) from [<c0008570>]
(kernel_init+0x90/0x144)
[<c0008570>] (kernel_init+0x90/0x144) from [<c001edf4>]
(kernel_thread_exit+0x0/0x8)
BUG: spinlock lockup on CPU#0, swapper/1, c01fbd64
[<c0023260>] (unwind_backtrace+0x0/0xec) from [<c011e82c>]
(do_raw_spin_lock+0x110/0x14c)
[<c011e82c>] (do_raw_spin_lock+0x110/0x14c) from [<c016e6e8>]
(_raw_spin_lock_irqsave+0x10/0x18)
[<c016e6e8>] (_raw_spin_lock_irqsave+0x10/0x18) from [<c00292e8>]
(s5p6440_gpio_setcfg_4bit_rbank+0x54/0xb4)
[<c00292e8>] (s5p6440_gpio_setcfg_4bit_rbank+0x54/0xb4) from
[<c002a1bc>] (s3c_gpio_cfgpin+0x50/0x74)
[<c002a1bc>] (s3c_gpio_cfgpin+0x50/0x74) from [<c0029478>]
(s3c_i2c1_cfg_gpio+0x10/0x20)
[<c0029478>] (s3c_i2c1_cfg_gpio+0x10/0x20) from [<c016af24>]
(s3c24xx_i2c_probe+0x21c/0x5c8)
[<c016af24>] (s3c24xx_i2c_probe+0x21c/0x5c8) from [<c01445ac>]
(platform_drv_probe+0x18/0x1c)
[<c01445ac>] (platform_drv_probe+0x18/0x1c) from [<c0143700>]
(driver_probe_device+0xa8/0x158)
[<c0143700>] (driver_probe_device+0xa8/0x158) from [<c0143810>]
(__driver_attach+0x60/0x84)
[<c0143810>] (__driver_attach+0x60/0x84) from [<c0142fa0>]
(bus_for_each_dev+0x44/0x74)
[<c0142fa0>] (bus_for_each_dev+0x44/0x74) from [<c01428a8>]
(bus_add_driver+0x98/0x218)
[<c01428a8>] (bus_add_driver+0x98/0x218) from [<c0143ae0>]
(driver_register+0xa8/0x138)
[<c0143ae0>] (driver_register+0xa8/0x138) from [<c001d388>]
(do_one_initcall+0x58/0x1a8)
[<c001d388>] (do_one_initcall+0x58/0x1a8) from [<c0008570>]
(kernel_init+0x90/0x144)
[<c0008570>] (kernel_init+0x90/0x144) from [<c001edf4>]
(kernel_thread_exit+0x0/0x8)

I found in the code that s3c_gpio_cfgpin() has a spinlock and it in
turn calls=A0s5p6440_gpio_setcfg_4bit_rbank() which has another spinloc=
k
with in.

Should i be calling=A0s5p6440_gpio_setcfg_4bit_rbank() directly when
required to configure GPIO Bank R.

Why there are special functions defined for GPIO Bank R only in
S5P6440 and not in any other CPU.

--
Shine bright,
(: Naveen Krishna Ch :)
