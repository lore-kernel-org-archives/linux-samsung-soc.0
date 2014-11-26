From: Heesub Shin <heesub.shin@samsung.com>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Wed, 26 Nov 2014 09:35:29 +0000 (UTC)
Message-ID: <loom.20141126T100245-113@post.gmane.org>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:38283 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbaKZJkG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 04:40:06 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1XtZ4u-00044l-PA
	for linux-samsung-soc@vger.kernel.org; Wed, 26 Nov 2014 10:40:05 +0100
Received: from 210.94.41.89 ([210.94.41.89])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 10:40:04 +0100
Received: from heesub.shin by 210.94.41.89 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 10:40:04 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Kevin Hilman <khilman <at> kernel.org> writes:

> 
> From: Kevin Hilman <khilman <at> linaro.org>
> 
> Using the current exynos_defconfig on the exynos5422-odroid-xu3, only
> 6 of 8 CPUs come online with MCPM boot.  CPU0 is an A7, CPUs 1-4 are
> A15s and CPU5-7 are the other A7s, but with the current code, CPUs 5
> and 7 do not boot:
> 
>    [...]
>    Exynos MCPM support installed
>    CPU1: update cpu_capacity 1535
>    CPU1: thread -1, cpu 0, socket 0, mpidr 80000000
>    CPU2: update cpu_capacity 1535
>    CPU2: thread -1, cpu 1, socket 0, mpidr 80000001
>    CPU3: update cpu_capacity 1535
>    CPU3: thread -1, cpu 2, socket 0, mpidr 80000002
>    CPU4: update cpu_capacity 1535
>    CPU4: thread -1, cpu 3, socket 0, mpidr 80000003
>    CPU5: failed to come online
>    CPU6: update cpu_capacity 448
>    CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
>    CPU7: failed to come online
>    Brought up 6 CPUs
>    CPU: WARNING: CPU(s) started in wrong/inconsistent modes
>    (primary CPU mode 0x13)
>    CPU: This may indicate a broken bootloader or firmware.
> 
> Thanks to a tip from Abhilash, this patch gets all 8 CPUs booting
> again, but the warning about CPUs started in inconsistent modes
> remains.  Also, not being terribly familiar with Exynos internals,
> it's not at all obvious to me why this register write (done for *all*
> secondaries) makes things work works for the 2 secondary CPUs that
> didn't come online.  It's also not obvious whether this is the right
> general fix, since it doesn't seem to be needed on other 542x or 5800
> platforms.

Hi,

Very interesting to see your post. I was also suffering from the same 
problem with my Odroid-XU3 board. With your patch 8 CPUs are brought up, 
but Cortex-A15 CPUs are always offline, showing low performance.

heesub@odroid:~$ cat /sys/devices/system/cpu/online
0,5-7
heesub@odroid:~$ cat /sys/devices/system/cpu/offline
1-4

Any suggestion?

Thanks a lot!!
Heesub
