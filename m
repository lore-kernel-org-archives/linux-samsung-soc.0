From: Martin Fuzzey <mfuzzey@gmail.com>
Subject: Re: not coming prompt in 2.6.33.6 kernel
Date: Fri, 30 Jul 2010 17:25:07 +0200
Message-ID: <AANLkTim8KEn7-dFpHdbYs0Wvi_hxjrbmUmhEQ2nMOtHj@mail.gmail.com>
References: <AANLkTikgB9OF6mRqZ2KgQYuCQ4JcF7N6oTJyUbrYq0t7@mail.gmail.com>
	<20100728094344.GA9142@trinity.fluff.org>
	<AANLkTikgq_Fb0ZfT-b+9zOA5w2pDpNgwnUqe919hAsnd@mail.gmail.com>
	<AANLkTin8STiQqvjZo-atA9jhz1OLWuk2k61-VYnZrcD8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:47830 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750945Ab0G3PZI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jul 2010 11:25:08 -0400
Received: by pzk26 with SMTP id 26so573720pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2010 08:25:07 -0700 (PDT)
In-Reply-To: <AANLkTin8STiQqvjZo-atA9jhz1OLWuk2k61-VYnZrcD8@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nitin vishnoi <nitvishnoi@gmail.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org

Hi,
On Fri, Jul 30, 2010 at 12:40 PM, nitin vishnoi <nitvishnoi@gmail.com> wrote:
> Hi now i am able the uart info also.Bu stil not getting the prompt.
> and getting the following log.
>
> Starting kernel ...
>
>
> Uncompressing
> Linux......................................................................
> done, booting the kernel.
> Linux version 2.6.31.14 (root@ubntu-desktop) (gcc version 4.1.2) #34 Fri Jul
> 30 15:33:38 IST 2010
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
> CPU: VIVT data cache, VIVT instruction cache
> Kernel command line: root=/dev/ram initrd=0x30800000,8M ramdisk=24576
> init=/sbin/init console=ttySAC3,115200 mem=64M
> RAMDISK: gzip image found at block 0
> EXT2-fs warning: maximal mount count reached, running e2fsck is recommended
> VFS: Mounted root (ext2 filesystem) on device 1:0.
> Freeing init memory: 88K
> Kernel panic - not syncing: Attempted to kill init!
>

Looks like the init process is terminating unexpectedly.
What's /sbin/init for you?
How is it compiled? (could it be a OABI / EABI issue?)

What happens if you try booting with  init=/bin/sh   ?
or try using a script like this as init

#! /bin/sh
echo "Test stdout"
echo "Test console" > /dev/console
echo "Test tty1" > /dev/tty1
/bin/ls -l /dev > /dev/tty1

Cheers,
Martin
