From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Wed, 26 Nov 2014 08:00:27 -0800
Message-ID: <7ha93egdes.fsf@deeprootsystems.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
	<loom.20141126T100245-113@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:51811 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751110AbaKZQAb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 11:00:31 -0500
Received: by mail-pd0-f176.google.com with SMTP id y10so3043976pdj.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2014 08:00:31 -0800 (PST)
In-Reply-To: <loom.20141126T100245-113@post.gmane.org> (Heesub Shin's message
	of "Wed, 26 Nov 2014 09:35:29 +0000 (UTC)")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heesub Shin <heesub.shin@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hello,

Heesub Shin <heesub.shin@samsung.com> writes:

>> Using the current exynos_defconfig on the exynos5422-odroid-xu3, only
>> 6 of 8 CPUs come online with MCPM boot.  CPU0 is an A7, CPUs 1-4 are
>> A15s and CPU5-7 are the other A7s, but with the current code, CPUs 5
>> and 7 do not boot:
>> 
>>    [...]
>>    Exynos MCPM support installed
>>    CPU1: update cpu_capacity 1535
>>    CPU1: thread -1, cpu 0, socket 0, mpidr 80000000
>>    CPU2: update cpu_capacity 1535
>>    CPU2: thread -1, cpu 1, socket 0, mpidr 80000001
>>    CPU3: update cpu_capacity 1535
>>    CPU3: thread -1, cpu 2, socket 0, mpidr 80000002
>>    CPU4: update cpu_capacity 1535
>>    CPU4: thread -1, cpu 3, socket 0, mpidr 80000003
>>    CPU5: failed to come online
>>    CPU6: update cpu_capacity 448
>>    CPU6: thread -1, cpu 2, socket 1, mpidr 80000102
>>    CPU7: failed to come online
>>    Brought up 6 CPUs
>>    CPU: WARNING: CPU(s) started in wrong/inconsistent modes
>>    (primary CPU mode 0x13)
>>    CPU: This may indicate a broken bootloader or firmware.
>> 
>> Thanks to a tip from Abhilash, this patch gets all 8 CPUs booting
>> again, but the warning about CPUs started in inconsistent modes
>> remains.  Also, not being terribly familiar with Exynos internals,
>> it's not at all obvious to me why this register write (done for *all*
>> secondaries) makes things work works for the 2 secondary CPUs that
>> didn't come online.  It's also not obvious whether this is the right
>> general fix, since it doesn't seem to be needed on other 542x or 5800
>> platforms.
>
> Very interesting to see your post. I was also suffering from the same 
> problem with my Odroid-XU3 board. With your patch 8 CPUs are brought up, 
> but Cortex-A15 CPUs are always offline, showing low performance.
>
> heesub@odroid:~$ cat /sys/devices/system/cpu/online
> 0,5-7
> heesub@odroid:~$ cat /sys/devices/system/cpu/offline
> 1-4
>
> Any suggestion?

That's probably because you have the big.LITTLE switcher enabled in your
.config (which is the default when using exynos_defconfig).

If you modify your .config and set CONFIG_BL_SWITCHER=n, you will see
all 8 cores online.

Kevin
