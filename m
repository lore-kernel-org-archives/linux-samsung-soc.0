From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain framework
 for EXYNOS4210
Date: Mon, 03 Oct 2011 12:27:21 +0900
Message-ID: <005701cc817c$5c54a240$14fde6c0$%kim@samsung.com>
References: <4E4360B2.2060508@samsung.com> <201110021508.44083.rjw@sisk.pl>
 <20111002131307.GV11710@n2100.arm.linux.org.uk>
 <201110022000.56556.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14656 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751183Ab1JCD1W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 23:27:22 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSH00MTA09ICH90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:21 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSH00FS809LLZ30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 03 Oct 2011 12:27:21 +0900 (KST)
In-reply-to: <201110022000.56556.rjw@sisk.pl>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Rafael J. Wysocki wrote:
> 
> On Sunday, October 02, 2011, Russell King - ARM Linux wrote:
> > On Sun, Oct 02, 2011 at 03:08:43PM +0200, Rafael J. Wysocki wrote:
> > > On Sunday, October 02, 2011, Russell King - ARM Linux wrote:
> > > > How do these misconceptions start?
> > > >
> > > > The clock API.  Drivers are supposed to get a clock (source) when
they
> > > > initialize.  Drivers then enable and disable the clock as they
_themselves_
> > > > require the use of that clock.
> > >
> > > OK
> > >
> > > Now think of a driver that should handle the same device on both ARM
and
> > > x86-based SoCs.  Is the clock API available on x86?
> >
> > No one's bothered yet.
> 
> Prehaps because x86 doesn't allow us to control device clocks directly.
> They are controlled through PCI PM or through ACPI methods, both of which
> hide the clocks behind abstract low-power states we're supposed to use.
> 
Well, I think Embedded drivers especially ARM sometimes need to control its
own clock directly and each embedded drivers know when clock controlling is
required or not. Actually, Samsung driver stuff have calling clk_enable() in
probe() or open() and clk_disable() when clock is not needed more. But I'm
not sure we _really_ can get some benefits when matching clock and power
control on ARM devices.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
