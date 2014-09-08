From: Will Deacon <will.deacon@arm.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 13:46:01 +0100
Message-ID: <20140908124601.GN26030@arm.com>
References: <20140905115704.GO13515@arm.com>
 <20140905122232.GP13515@arm.com>
 <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk>
 <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk>
 <540C8577.2070907@gmail.com>
 <20140908112112.GK26030@arm.com>
 <540D9931.6050603@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:53614 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752185AbaIHMqV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 08:46:21 -0400
Content-Disposition: inline
In-Reply-To: <540D9931.6050603@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>

On Mon, Sep 08, 2014 at 12:55:29PM +0100, Javier Martinez Canillas wrote:
> On 09/08/2014 01:21 PM, Will Deacon wrote:
> > On Sun, Sep 07, 2014 at 05:19:03PM +0100, Tomasz Figa wrote:
> >> At least for next 3.17-rc I'd suggest fixing this up in respective clock
> >> driver and dropping the hack only after Exynos DRM patches are merged
> >> and confirmed working.
> > 
> > Whilst I'm sympathetic to people working to enable DRM, I think this is
> > the right solution to the problem. The transition from simplefb to DRM
> > shouldn't break display for a bunch of kernel revisions whilst the code is
> > in flux.
> > 
> 
> Agreed, I'm preparing a patch-set to prevent the kernel to disable both the
> clocks and regulators needed for the display, I'll try to post it today or
> tomorrow at worst.

Thanks, Javier. Please CC me on the patch and I'll take it for a spin.

Will
