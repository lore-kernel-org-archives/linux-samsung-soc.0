From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Initialize L2x0 cache controller for Exynos4 only
Date: Sat, 19 Oct 2013 16:04:22 +0200
Message-ID: <1947285.WNu0Q66K3g@thinkpad>
References: <1382011392-18199-1-git-send-email-sachin.kamat@linaro.org> <3434799.pjC3lbNE3P@amdc1227> <CAK9yfHxNPKeRPpxPjoeUs1Xbu9pibn=dLK2U=7atpxEmKY1k1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:48557 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752219Ab3JSODf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Oct 2013 10:03:35 -0400
Received: by mail-ea0-f182.google.com with SMTP id o10so2614808eaj.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Oct 2013 07:03:34 -0700 (PDT)
In-Reply-To: <CAK9yfHxNPKeRPpxPjoeUs1Xbu9pibn=dLK2U=7atpxEmKY1k1Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Will Deacon <will.deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>

Hi Sachin,

[adding more people on Cc for some discussion]

On Saturday 19 of October 2013 18:09:15 Sachin Kamat wrote:
> Hi Tomasz,
> 
> On 17 October 2013 18:35, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Sachin,
> > 
> > On Thursday 17 of October 2013 17:33:12 Sachin Kamat wrote:
> >> L2x0 cache controller is present only in Cortex-A9 based Exynos4 SoCs.
> >> Thus move this function to Exynos4 early init call to avoid non-Exynos4
> >> SoCs from calling this function in multi-platform support.
> > 
> > I believe that at the time .init_early() is called there is no ioremap()
> > infrastructure working yet and so L2 cache initialization which needs
> > it will cause a kernel panic. This patch worked only because currently
> > there is no L2X0 controller defined in device tree sources of Exynos 4.
> 
> It is not clear to me as to why device tree entry is required for this
> to work in current form
> as we call the  L2X0 init function explicitly.

L2x0 controller is just another IP block on the SoC. In addition its
registers are memory mapped and the driver needs some way to get their
location. The function being called explicitly simply scans device tree
for applicable node and performs rest of the setup only if it finds one.

Ideally there should be no need to call this function explicitly, as it
should be called by some code based on presence of applicable device tree
node.

> 
> > Other than that, it will be required to register firmware operations
> > before L2X0 initialization, because on some boards it is needed to
> > initialize the L2 cache through secure firmware.
> > 
> > Please let me handle this by the way of patches adding firmware based
> > L2X0 initialization.
> 
> Sure, please go ahead. BTW, any rough estimate about when you plan to post
> them?

They might not make it for 3.13, as during next week I'm on LCE/KS/ELCE
in Edinburgh and I will be able to continue my work on this only after
getting back.

If this is something of high priority, then here's my idea:

- the l2x0_of_init() function itself should be an early_initcall, without
  any arguments. It would carry on with appropriate initialization only
  if there is an l2x0 node specified in device tree,
- the aux_val and aux_mask parameters should rather come from device tree,
  if there are no other means of obtaining them automatically.

This is something that still needs a bit more thought, as there are some
more interesting cases (as mach-ux500) which do more things than just
simple call to l2x0_of_init(). I guess this should be discussed with
people responsible for such platforms and l2x0 driver in general.

Best regards,
Tomasz
