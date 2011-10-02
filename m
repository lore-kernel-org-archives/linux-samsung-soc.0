From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain
	framework for EXYNOS4210
Date: Sun, 2 Oct 2011 14:13:08 +0100
Message-ID: <20111002131307.GV11710@n2100.arm.linux.org.uk>
References: <4E4360B2.2060508@samsung.com> <201110021347.02146.rjw@sisk.pl> <20111002114811.GU11710@n2100.arm.linux.org.uk> <201110021508.44083.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:57533 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752126Ab1JBNNY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Oct 2011 09:13:24 -0400
Content-Disposition: inline
In-Reply-To: <201110021508.44083.rjw@sisk.pl>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

On Sun, Oct 02, 2011 at 03:08:43PM +0200, Rafael J. Wysocki wrote:
> On Sunday, October 02, 2011, Russell King - ARM Linux wrote:
> > How do these misconceptions start?
> > 
> > The clock API.  Drivers are supposed to get a clock (source) when they
> > initialize.  Drivers then enable and disable the clock as they _themselves_
> > require the use of that clock.
> 
> OK
> 
> Now think of a driver that should handle the same device on both ARM and
> x86-based SoCs.  Is the clock API available on x86?

No one's bothered yet.
