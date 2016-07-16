From: Marian Mihailescu <mihailescu2m@gmail.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Sat, 16 Jul 2016 13:53:52 +0000 (UTC)
Message-ID: <loom.20160716T153429-759@post.gmane.org>
References: <1468525055.4843.4.camel@ndufresne.ca>  <1468525558.4843.6.camel@ndufresne.ca> <1468527750.4843.7.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:55474 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751379AbcGPOKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2016 10:10:10 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1bOQI8-0003oE-Gz
	for linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2016 16:10:05 +0200
Received: from CPE-58-160-173-207.unqy1.fli.bigpond.net.au ([58.160.173.207])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Jul 2016 16:10:04 +0200
Received: from mihailescu2m by CPE-58-160-173-207.unqy1.fli.bigpond.net.au with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Jul 2016 16:10:04 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

I can provide more information, i've been battling with this for a long time.
Tried on U3 and U3+ with similar results:

1) samsung tizen 4.1 kernel reboots OK.

2) i tried 4.4, 4.6, 4.7 (from Tobias's repository) all have the reboot issue.
i've put some printk in the syscon reboot. it looks like it gets registered,
but i never saw the printk put in the actual notifier function.

3) the issue is the same for emmc and sd-card, i've tried both

4) IT'S VERY RANDOM

* i've got sysrq rebooting OK, i've got sysrq ending in a kernel crash
(like Nicolas above)
* I've got rebooting working ok sometimes, but only from tty1 console or
sometimes ssh - NEVER from ttySAC1 serial console.
rebooting from serial console always resulted in hang after systemd stops.
* after switching from emmc to sd-card, there are always problems.
i had sd-card rebooting ok (from tty1) for a few hours, then after i put in
an emmc card => hell broke loose. putting sd-card back => still had issues,
although sd was fine before.
* many times, after reboot hang or switching from emmc to sd
or the other way around => kernel would crash on boot for a few times.

I reverted the SYSCON driver changes, and went back to the reboot code
in the exynos pmu.c file like 4.1 kernel => got the same issues.

I thought it's a systemd issue (after seeing echo b > /proc/sysrq-trigger
working ok) and tried the kernel on a ubuntu 14.04 image (with upstart)
=> got the same issues.

I think it might be u-boot.

PS: please keep me in the CC from here on as well.
