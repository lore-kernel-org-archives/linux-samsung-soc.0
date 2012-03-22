From: Ebin <ebin@ritesourcellc.com>
Subject: Emulating S3C6410 using qemu
Date: Thu, 22 Mar 2012 09:23:41 +0000 (UTC)
Message-ID: <loom.20120322T094359-501@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:37234 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964916Ab2CVJaH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Mar 2012 05:30:07 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1SAeLN-00065v-Dw
	for linux-samsung-soc@vger.kernel.org; Thu, 22 Mar 2012 10:30:05 +0100
Received: from ABTS-KK-dynamic-224.152.166.122.airtelbroadband.in ([ABTS-KK-dynamic-224.152.166.122.airtelbroadband.in])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Mar 2012 10:30:05 +0100
Received: from ebin by ABTS-KK-dynamic-224.152.166.122.airtelbroadband.in with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Mar 2012 10:30:05 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Hi all, i am new to the embedded linux field.
I am trying to emulate Real6410-s3c6410 board using qemu. I am using the linux 
kernel version-2.6.28.6 and toolchain-gcc version 4.3.2 (Sourcery G++ Lite 
2008q3-72 which came with the development board cd.

I compiled qemu for arm and configured the kernel for arm system type-Samsung 
S3C64XX using menuconfig command and compiled it to make the zImage. When i 
checked the qemu-arm supported machines, i couldn't see supported machine for 
s3c6410. so i used versatilepb machine using command :qemu-system-arm -M 
versatilepb -m 128M -kernel zImage. But when i test this image on qemu it shows 
error message-
 qemu: fatal: Trying to execute code outside RAM or ROM at 0x50008000 
R00=00000000 R01=00000183 R02=00000100 R03=00000000 R04=00000000 R05=00000000 
R06=00000000 R07=00000000 R08=00000000 R09=00000000 R10=00000000 R11=00000000 
R12=00000000 R13=00000000 R14=00000000 R15=50008000 PSR=400001d3 -Z-- A svc32 
Aborted.
Can you suggest a method to solve this, and i would like to know whether it is 
possible to emulate S3C6410 on qemu?

Thanks,
Ebin.
