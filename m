From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Thu, 29 Aug 2013 18:04:36 -0700
Message-ID: <20130830010436.10934.31643@quantum>
References: <1377754629-31465-1-git-send-email-rahul.sharma@samsung.com>
 <1873021.WMcNDqLpjt@amdc1227>
 <CAPdUM4Mf4pv031-W0X0EAJe7R=8xtqnNbbLyoo+O6LV0d-H0GA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:43860 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751968Ab3H3BEp convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 21:04:45 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so1634457pab.29
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2013 18:04:44 -0700 (PDT)
In-Reply-To: <CAPdUM4Mf4pv031-W0X0EAJe7R=8xtqnNbbLyoo+O6LV0d-H0GA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>, Tomasz Figa <t.figa@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>

Quoting Rahul Sharma (2013-08-29 06:36:51)
> On 29 August 2013 18:00, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Rahul,
> >
> > On Thursday 29 of August 2013 11:07:04 Rahul Sharma wrote:
> >> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> >> include addition of new clocks like mout_hdmi and smmu_tv, associating
> >> ID to clk_hdmiphy and some essential corrections.
> >>
> >> V4:
> >> 1) Optimised gaps between Gate, Muxes and Dividers.
> >>
> >> V3:
> >> 1) Assign new ID to divider clock keeping sclk_pixel gate same.
> >>
> >> V2:
> >> 1) Rebase to Mike's Tree.
> >> 2) Change smmu_tv to smmu_mixer.
> >>
> >> This set is based on Mike's clk-next branch at
> >> https://git.linaro.org/gitweb?p=people/mturquette/linux.git
> >>
> >> Rahul Sharma (5):
> >>   clk/exynos5420: add sclk_hdmiphy to the list of special clocks
> >>   clk/exynos5420: add gate clock for mixer sysmmu
> >>   clk/exynos5420: fix the order of parents of hdmi mux
> >>   clk/exynos5420: add hdmi mux to change parents in hdmi driver
> >>   clk/exynos5420: assign dout_pixel id to pixel clock divider
> >>
> >>  .../devicetree/bindings/clock/exynos5420-clock.txt  |   12 ++++++++++++
> >>  drivers/clk/samsung/clk-exynos5420.c                |   19
> >> +++++++++++++------ 2 files changed, 25 insertions(+), 6 deletions(-)
> >
> > For the whole series:
> >
> > Acked-by: Tomasz Figa <t.figa@samsung.com>
> >
> 
> Thanks Tomasz,
> 
> Mike ! please consider it for clk-next branch.

Taken into clk-next.

Regards,
Mike

> 
> regards,
> Rahul Sharma.
> 
> > Best regards,
> > Tomasz
> >
