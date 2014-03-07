From: Alexander Varnin <fenixk19@mail.ru>
Subject: s3c2443 hangs on msleep on resume from suspend
Date: Fri, 07 Mar 2014 22:08:50 +0400
Message-ID: <531A0B32.4030805@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:34526 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753178AbaCGSJ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Mar 2014 13:09:29 -0500
Received: from smtp22.mail.ru (smtp22.mail.ru [94.100.176.175])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id 9533934E857A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2014 22:09:26 +0400 (MSK)
Received: from [46.28.89.34] (port=61068 helo=[10.1.4.224])
	by smtp22.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1WLzCY-00046h-Qq
	for linux-samsung-soc@vger.kernel.org; Fri, 07 Mar 2014 22:09:07 +0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hello.
I'm developing on Samsung s3c2443 CPU and now my aim is to make suspend
mode working properly. My kernel version is 3.6. Everything was OK,
however Linux hanged on resume, if usb ohci driver was loaded. My
investigation showed, that it hangs on msleep function, that is getting
called in ohci_run() function in drivers/usb/host/ohci-hcd.c file. Exact
line of code is [1]. I found on the web, that there was [2] similar
problem on s3c2410. The reason of hang is that msleep locks the only
working thread in system, and nobody can unlock it. The simple
workaround is to replace msleep with mdelay. But the usage of msleep is
in platform-independent usb-ohci code. That means, that other platforms
somehow bypass this problem, and work with msleep correctly. But I will
prefer to fix it in platform-depended, than to make workaround in common
code.

What bugs in platform-depended code could lead to such problem?

I suggest, that there is some problem with sequence of resume actions,
and usb resume happens much earlier, than it have to. But where exactly
should I search for the problem?

Thanks,
Alexander.

[1]
http://lxr.free-electrons.com/source/drivers/usb/host/ohci-hcd.c?v=3.6;a=arm#L621
[2] http://osdir.com/ml/handhelds.openmoko.kernel/2008-05/msg00168.html
