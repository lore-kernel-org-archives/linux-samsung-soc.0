From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5PV310: Implement kernel timers using MCT
Date: Thu, 23 Dec 2010 12:22:35 +0000
Message-ID: <20101223122235.GH3636@n2100.arm.linux.org.uk>
References: <1293017221-31037-1-git-send-email-kgene.kim@samsung.com> <20101222225555.GH14693@n2100.arm.linux.org.uk> <003e01cba28c$5517dee0$ff479ca0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:60813 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752829Ab0LWMWv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Dec 2010 07:22:51 -0500
Content-Disposition: inline
In-Reply-To: <003e01cba28c$5517dee0$ff479ca0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Changhwan Youn' <chaos.youn@samsung.com>

On Thu, Dec 23, 2010 at 07:29:48PM +0900, Kukjin Kim wrote:
> Russell King - ARM Linux wrote:
> > This looks like it's supporting SMP - is there some reason not to use
> > the localtimer support built into SMP, which also supports hotplug CPU
> > (the above doesn't because the local clockevents will be automatically
> > unregistered.)
> > 
> As I know, to use the localtimer support, it needs to support PPI.
> Unfortunately the MCT of S5PV310 supports SPI. For hotplug CPU, I'm looking
> for the methods to register clockevents again at CPU hotplug-in.

We can avoid that - nothing forces you to use the PPI interrupt.
Just register your interrupt handler in the normal way.

There's really no need to reinvent the wheel.
