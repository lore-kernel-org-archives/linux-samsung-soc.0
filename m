From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [RFC PATCH v3 2/2] clk: exynos5420: Make sure MDMA0 clock is enabled
 during suspend
Date: Wed, 01 Apr 2015 12:02:36 -0700
Message-ID: <20150401190236.14369.26750@quantum>
References: <1427730803-28635-1-git-send-email-javier.martinez@collabora.co.uk>
 <1427730803-28635-3-git-send-email-javier.martinez@collabora.co.uk>
 <CA+Ln22FBpuzR06qCsVc7SXtLX2mhf901vDE5D-mT1+ijZ2G3sg@mail.gmail.com>
 <551976F1.1000605@collabora.co.uk> <7hiodg98z7.fsf@deeprootsystems.com>
 <CAM4voanzd-iiyTbGvZpTz4nmULJu9_VUFz3EibLB5L295K4P-Q@mail.gmail.com>
 <7h1tk47awc.fsf@deeprootsystems.com>
 <CAJKOXPftzX4KT=RNVnuD3UKOLXKkKr0b9i9_HDE47=8z9AyzUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:38141 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752910AbbDATCu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 15:02:50 -0400
Received: by igbqf9 with SMTP id qf9so54630507igb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Apr 2015 12:02:49 -0700 (PDT)
In-Reply-To: <CAJKOXPftzX4KT=RNVnuD3UKOLXKkKr0b9i9_HDE47=8z9AyzUQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Abhilash Kesavan <kesavan.abhilash@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Tyler Baker <tyler.baker@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Quoting Krzysztof Kozlowski (2015-04-01 02:16:08)
> 2015-04-01 6:03 GMT+02:00 Kevin Hilman <khilman@kernel.org>:
> > Abhilash Kesavan <kesavan.abhilash@gmail.com> writes:
> >
> >> On Wed, Apr 1, 2015 at 2:32 AM, Kevin Hilman <khilman@kernel.org> wrote:
> >>> Javier Martinez Canillas <javier.martinez@collabora.co.uk> writes:
> >>>
> >>> [...]
> >>>
> >>>> Unfortunately I don't fully understand why this clock needs to be
> >>>> enabled. It would be good if someone at Samsung can explain in more
> >>>> detail what the real problem really is.
> >>>
> >>> +1
> >>>
> >>> Maybe Abhilash can shed some light here?
> >>>
> >>> We really should know *why* this is needed because having the fix in the
> >>> clock driver just doesn't seem right.  It seems like the DMA driver
> >>> should be managing this clock.
> >>
> >> I think my last mail might not have reached you (was accidentally sent
> >> as html).
> >
> > Yeah, I saw it a bit later in Javier's reply.  Thanks for doing the
> > research and reporting back.
> >
> >> We are gating the aclk266_g2d clock without checking the
> >> CG_STATUS0 register bits as specified in the UM. It looks like we need
> >> to keep several clocks alive or gate them only after checking the
> >> CG_STATUSx register bits.
> >
> > I dont' know much about this clock hardware, but to me it sounds like a
> > clock driver bug.  The suspend fix Javier is proposing would fix it, but
> > to me it sounds like the clock driver needs to actually start checking
> > these CG_STATUSx bits before gating clocks.
> >
> > Otherwise, we might fix this current bug but a similar one will come and
> > bite us another day.
> 
> Actually it looks kind a similar to issue with adma/mau_epll clocks:
> https://lkml.org/lkml/2014/12/5/291
> 
> In that case runtime PM for pl330 caused adma clock to be gated. This
> lead to gating its parent clock - mau_epll. The clock hierarchy is
> strange for maudio domain. Basically mau_epll is needed to access
> maudio clocks however these clocks are not children of mau_epll.

This sounds like an interface clock. It must be enabled for you touch
registers across a bus/interconnect.

For this type of clock is perfectly correct for the driver to enable it
in addition to any functional clocks (e.g. maudio clocks).

There are many instances where a driver must enable an interface clock
(iclk) and a functional clock (fclk) and this isn't an issue of the
driver knowing the clock topology, but instead knowing it's operational
requirements.

Just to make life more confusing, it might also be appropriate for the
clock driver to manage turning on the interface clocks if this is
required to touching the functional clocks. In general the register
address space is used to determine which IP "owns" such behavior.

Regards,
Mike

> 
> I think we should not enable the mdma0 but instead we should find the
> proper parent which needs to be enabled.
> 
> Anyway it is kind of annoying (or funny if one has sense of black
> humour) that two issues are exposed by runtime PM for pl330 driver.
> 
> Best regards,
> Krzysztof
