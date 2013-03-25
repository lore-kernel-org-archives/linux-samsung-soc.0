From: Chen Gang <gang.chen@asianux.com>
Subject: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using randconfig
Date: Mon, 25 Mar 2013 10:10:10 +0800
Message-ID: <514FB202.3040807@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:46900 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755019Ab3CYCKm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Mar 2013 22:10:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, Will Deacon <will.deacon@arm.com>, dhowells@redhat.com, plagnioj@jcrosoft.com, "kgene.kim@samsung.com" <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Maintainers:

  is it an issue that need solving ?

  :-)


details:

  make:
    make V=1 EXTRA_CFLAGS=-W ARCH=arm randconfig
    make V=1 EXTRA_CFLAGS=-W ARCH=arm menuconfig
      set arm-linux-gnu-  for "Cross-compiler tool prefix"
      set "Samsung S5PV210/S5PC210" for "ARM system type"
    make V=1 EXTRA_CFLAGS=-W ARCH=arm


  err:
    arch/arm/kernel/entry-armv.S: Assembler messages:
    arch/arm/kernel/entry-armv.S:207: Error: selected processor does not support ARM mode `clrex'
    arch/arm/kernel/entry-armv.S:231: Error: selected processor does not support ARM mode `clrex'
    arch/arm/kernel/entry-armv.S:314: Error: selected processor does not support ARM mode `clrex'
    arch/arm/kernel/entry-armv.S:335: Error: selected processor does not support ARM mode `clrex'
    arch/arm/kernel/entry-armv.S:813: Error: selected processor does not support ARM mode `ldrd r4,r5,[r0]'
    arch/arm/kernel/entry-armv.S:814: Error: selected processor does not support ARM mode `ldrd r6,r7,[r1]'
    arch/arm/kernel/entry-armv.S:816: Error: selected processor does not support ARM mode `ldrexd r0,r1,[r2]'
    arch/arm/kernel/entry-armv.S:819: Error: selected processor does not support ARM mode `strexdeq r3,r6,r7,[r2]'
    make[1]: *** [arch/arm/kernel/entry-armv.o] Error 1
    make: *** [arch/arm/kernel] Error 2

  related gcc command:
arm-linux-gnu-gcc -Wp,-MD,arch/arm/kernel/.entry-armv.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabi/4.7.1/include -I/android/public-kernel/linux-next/arch/arm/include -Iarch/arm/include/generated  -Iinclude -I/android/public-kernel/linux-next/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/android/public-kernel/linux-next/include/uapi -Iinclude/generated/uapi -include /android/public-kernel/linux-next/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-s5pv210/include -Iarch/arm/plat-samsung/include  -D__ASSEMBLY__ -mabi=apcs-gnu -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -include asm/unified.h -msoft-float          -c -o arch/arm/kernel/entry-armv.o arch/arm/kernel/entry-armv.S



  thanks.

-- 
Chen Gang

Asianux Corporation
