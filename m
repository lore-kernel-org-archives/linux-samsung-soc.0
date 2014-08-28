From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 13/14] arm64: exynos7: Enable ARMv8 based Exynos7 (SoC)
 support
Date: Wed, 27 Aug 2014 21:05:17 -0700
Message-ID: <20140828040517.GF4972@localhost>
References: <1409132660-1898-1-git-send-email-ch.naveen@samsung.com>
 <1409132660-1898-5-git-send-email-ch.naveen@samsung.com>
 <20140827110927.GC7773@leverpostej>
 <20140827145021.GC13850@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:62597 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932215AbaH1EHV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Aug 2014 00:07:21 -0400
Received: by mail-pa0-f54.google.com with SMTP id fb1so819529pad.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Aug 2014 21:07:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20140827145021.GC13850@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "naveenkrishna.ch@gmail.com" <naveenkrishna.ch@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>

On Wed, Aug 27, 2014 at 03:50:21PM +0100, Catalin Marinas wrote:
> On Wed, Aug 27, 2014 at 12:09:28PM +0100, Mark Rutland wrote:
> > On Wed, Aug 27, 2014 at 10:44:20AM +0100, Naveen Krishna Chatradhi wrote:
> > > +	select HAVE_SMP
> > 
> > I may have missed something, but I didn't see any SMP support in this
> > series.
> 
> We don't even have HAVE_SMP defined for arm64 (just SMP, which is on in
> defconfig).
> 
> In theory we don't need any specific SMP support for a new SoC as long
> as it uses a standard booting protocol (e.g. PSCI). But for whatever
> reason, I only received about four patches in this series, so can't see
> the rest.

Seems like about 9 of them made it to the list for me.


-Olof
