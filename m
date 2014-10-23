From: Kevin Hilman <khilman@kernel.org>
Subject: Re: exynos5422-odroid-xu3: MCPM: only 6 of 8 CPUs coming online
Date: Thu, 23 Oct 2014 11:01:05 -0700
Message-ID: <7h8uk6acny.fsf@deeprootsystems.com>
References: <7133556.456161412823997169.JavaMail.weblogic@epml02>
	<7hzjd4lxc5.fsf@deeprootsystems.com>
	<loom.20141015T133306-266@post.gmane.org>
	<CAMAWPa8ANvzaC4EfvRbwCZSya6xt=u6qmvN5cF1jhAROTdW3Pg@mail.gmail.com>
	<54485433.2040008@samsung.com> <54485730.10803@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:59049 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752865AbaJWSBJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Oct 2014 14:01:09 -0400
Received: by mail-pd0-f173.google.com with SMTP id v10so1445225pde.18
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Oct 2014 11:01:08 -0700 (PDT)
In-Reply-To: <54485730.10803@samsung.com> (Joonyoung Shim's message of "Thu,
	23 Oct 2014 10:17:36 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, a.kesavan@samsung.com, k.chander@samsung.com, mauro.ribeiro@hardkernel.com, abhijeet@abhijeet-dev.net

Joonyoung Shim <jy0922.shim@samsung.com> writes:

[...]

>> One more problem, cpu0 doesn't boot after offline and system is halted.
>> 
>> # echo 0 > /sys/devices/system/cpu/cpu0/online
>> [   28.027852] IRQ152 no longer affine to CPU0
>> [   28.028087] IRQ256 no longer affine to CPU0
>> [   28.028344] CPU0: shutdown
>> # 
>> # echo 1 > /sys/devices/system/cpu/cpu0/online
>> 
>> So, it's failed script[1] to test MCPM functionalities
>> 
>> Thanks.
>> 
>> [1]: http://www.spinics.net/lists/arm-kernel/msg330946.html

FYI... this hotplug problem happens with or without the patch to bring
all 8 CPUs online, so it's not related to that fix.

Also, it only happens with the bL switcher enabled, and not with the
switcher disabled.  Since the bL switcher is built on top of hotplug,
I'm not sure if the switcher deals well with CPUs being hotplugged
without it knowing.

Kevin
