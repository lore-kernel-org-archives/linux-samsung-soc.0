From: Will Deacon <will.deacon@arm.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Fri, 5 Sep 2014 13:22:32 +0100
Message-ID: <20140905122232.GP13515@arm.com>
References: <20140905115704.GO13515@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:42478 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932098AbaIEMWl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Sep 2014 08:22:41 -0400
Content-Disposition: inline
In-Reply-To: <20140905115704.GO13515@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "dianders@chromium.org" <dianders@chromium.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

[Looks like it's not just Rutland that can't spell the address of the
 mailing list today. Fixed here, so please use this post in any replies].

On Fri, Sep 05, 2014 at 12:57:04PM +0100, Will Deacon wrote:
> Hi all,
> 
> I'm one of the few, foolish people to try running mainline on my 5250-based
> Samsung Chromebook (snow). I can live without wireless, usb3 and video
> acceleration, so actually it makes a reasonable development platform for
> doing A15-based (micro)-architectural work.
> 
> However, since 3.15 I've not been able to boot *any* mainline kernels on
> this board. I did mean to report this earlier, but I have other machines
> that can run mainline so this has fallen by the wayside.
> 
> The problems started with 3.16, where simple-fb would fail to initialise
> and I lost my display. Note that I don't have a serial console on this
> machine (I looked at the PCB and there's no way I can solder one of those
> myself :) I bisected the issue at the time, and I could get my display back
> by removing some of the new regulator and hdmi properties from the DT. At
> that point, I could boot, but DMA didn't initialise for the MMC controller
> so I couldn't mount my root filesystem.
> 
> With 3.17-rc3, it seems a lot worse -- I don't get any output after nv-uboot
> (i.e. the nv-uboot screen just remains on the display, with the last line
> reading "Stashed 20 records").
> 
> I'd usually try to debug this a bit further, but without a console it's
> really painful to get anywhere. I've been working with 3.15, but now I'm
> having to backport patches when I want to test them, which is more effort
> than I can be bothered with.
> 
> Is anybody else running mainline on this device and are these known/fixed
> problems?
> 
> Cheers,
> 
> Will
