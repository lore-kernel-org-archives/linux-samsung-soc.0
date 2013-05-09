From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: exynos: Select PINCTRL_EXYNOS for exynos5
Date: Thu, 09 May 2013 11:45:10 +0200
Message-ID: <1614776.P66h1VoFPp@amdc1227>
References: <1368034349-15091-1-git-send-email-dianders@chromium.org>
 <CAD=FV=X2n+zHZ3frorwW7L1yybnWWK1=-rWMQJQFus3eNiFFeQ@mail.gmail.com>
 <CAOesGMi=K4iJKjSk3RoynhiCMPPT98v5jADnqZ__TwX_YLw65Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60867 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753048Ab3EIJpg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 05:45:36 -0400
In-reply-to: <CAOesGMi=K4iJKjSk3RoynhiCMPPT98v5jADnqZ__TwX_YLw65Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Doug, Olof,

On Wednesday 08 of May 2013 12:33:34 Olof Johansson wrote:
> Hi,
> 
> On Wed, May 8, 2013 at 11:48 AM, Doug Anderson <dianders@chromium.org> 
wrote:
> > Olof,
> > 
> > On Wed, May 8, 2013 at 11:19 AM, Olof Johansson <olof@lixom.net> wrote:
> >> Seems like this should be selected by the SoC (ARCH_EXYNOS5) instead
> >> of the board. Actually, I'm not sure we need the board Kconfig entry
> >> long-term; all boards will be dt-only.
> > 
> > Good point.  Hopefully someone at Samsung can work on removing the
> > board itself?  If you'd like me to take this on then let me know and I
> > can put it on my list.
> 
> Nothing stops you from doing that on your own. I tend to push back
> onto the maintainers to get them engaged in their own housekeeping,
> but anyone is free to :)
> 
> > I'm happy to resubmit my patch under ARCH_EXYNOS5.  I'll move the
> > exynos4 one at the same time.
> 
> Great.
> 
> > I'm going to make the assumption that PINCTRL_EXYNOS and
> > PINCTRL_EXYNOS5440 can happily coexist.  Certainly I've got both
> > defined in my tree right now and nothing blows up.  I haven't tested
> > on 5440 but things ought to be handled by "compatible" checks, right?
> 
> Yes, if they can't coexist then that's a bug.
> 
> > I'll also assume that eventually someone will move PINCTRL_EXYNOS5440
> > into PINCTRL_EXYNOS.  If PINCTRL_EXYNOS5440 won't eventually move
> > under PINCTRL_EXYNOS then it makes less sense to define PINCTRL_EXYNOS
> > for all exynos parts.
> 
> Yeah, it should -- this is just in transition since 5440 was first out
> of the gate with pinctrl.

AFAIK, Exynos5440 contains a completely different pin controller block, which 
is not compatible with pinctrl-samsung driver, so I don't see any point of 
moving it under PINCTRL_EXYNOS, which is currently used for Exynos 4210, 4x12 
and 5250, but will be also extended with driver data for S5PV210 as well.

I'd say that CPU_EXYNOS4210, SOC_EXYNOS4212, SOC_EXYNOS4412 and SOC_EXYNOS5250 
should select PINCTRL_EXYNOS and SOC_EXYNOS5440 should be left as is, 
selecting PINCTRL_EXYNOS5440.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
