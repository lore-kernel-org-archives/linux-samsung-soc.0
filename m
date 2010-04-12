From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RFC] IDLE/DEEP IDLE scheduler modification for power savings
Date: Mon, 12 Apr 2010 11:39:05 +0200
Message-ID: <000001cada24$01a5ee90$04f1cbb0$%majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout5.samsung.com ([203.254.224.35]:62719 "EHLO
	mailout5.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752576Ab0DLJlY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Apr 2010 05:41:24 -0400
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L0R003AXC8YWZ@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Apr 2010 18:41:22 +0900 (KST)
Received: from AMDN142 ([106.116.44.225])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L0R00IUPC8K4Q@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Apr 2010 18:41:21 +0900 (KST)
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Ingo Molnar' <mingo@redhat.com>, Tomasz Fujak <t.fujak@samsung.local>, Marek Szyprowski <m.szyprowski@samsung.local>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Lukasz Majewski' <l.majewski@samsung.com>

Hello all,

I'd like to ask for comments and possible ways of solution for the following
problem:

Some SoCs allow for entering IDLE mode when they know that the system will
be
"inactive" for some time (to be more precise it will execute the idle task -
which prepares system to enter IDLE state). In that mode CPU core is not
active
(CPU core is clock gated) and may be woken up by several interrupts. IDLE
mode entering is already implemented in the kernel and works smoothly.

It is also possible in some SoCs to go even further and use the DEEP IDLE
mode, which (like in the case of Samsung) allows for power gating for
several
internal blocks (including CPU). In this state chip PLLs are disabled and
several hundreds of microseconds are needed to restore the processor state
after waking up. The benefit of this mode is that the power consumption of
the system can be significantly reduced. One of the possible use cases of
this mode is the Low Power Audio Player in conjunction with ALSA and
kernel's
CPU idle framework. However the waking up from this state may be performed
with use of smaller number of the wake up sources when compared to ordinary
IDLE state (because of power gating of SoC internal blocks).

One approach to solve the problem, and therefore deliver power savings,
is to modify the ALSA driver and provide a switch to inform the CPU IDLE
framework that it should now use the DEEP IDLE instead of IDLE when entering
the Low Power Audio playback mode is expected.  This change may be performed
by replacing the method for entering the IDLE mode to DEEP IDLE. Moreover
some sources immune to power gating (like e.g. RTC timer) have to be used
for waking up. The biggest problem for this approach is the kernel's policy
violation, that no user program should directly change scheduling/idle
policy.

In my humble opinion, maybe a better solution would be to add a new
scheduling
policy or modify the CFS scheduler to evaluate if the time for next task
execution is bigger than the time needed to wake up (and restore the system 
state) from DEEP IDLE (in my case it is more than several hundred
microseconds).
This approach would allow for using existing CFS scheduler framework (as it
is 
done  with implementation of CFS, or Real-Time policies) and prevent from
threads 
mentioned above (i.e. changing the CPU Idle framework with some "external" 
switch). One more advantage is that the DEEP IDLE mode could be used not
only 
in the above use case (after properly prepared for DEEP IDLE drivers, but
this 
is another issue). This can bring extra power savings for battery operated 
systems.

So what is your opinion about integrating use of the DEEP IDLE state mode
in the scheduler (either as new scheduling policy or modifying scheduler
code)?

Any comments will be appreciated.

Best regards,

Lukasz Majewski
Samsung Poland R&D Center
Platform Group
