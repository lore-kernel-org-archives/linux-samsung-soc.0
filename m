From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Thu, 20 Jun 2013 21:32:52 -0700
Message-ID: <20130621043252.9136.66418@quantum>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4MtBXMaZDDRT1aKsS=HzwjpbyMY85oRLMbk-KvJCU1hag@mail.gmail.com>
 <51C1B9AD.8060804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:39147 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161062Ab3FUEc4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 00:32:56 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf11so7152191pab.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2013 21:32:56 -0700 (PDT)
In-Reply-To: <51C1B9AD.8060804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Quoting Kukjin Kim (2013-06-19 07:01:17)
> On 06/19/13 13:04, Rahul Sharma wrote:
> > + mike
> >
> Mike, I'm waiting for your reply on this. If you're OK, let me take this 
> series on top of exynos5420 stuff in samsung tree.
> 
> Of course, if any concerns, please let me know.

I never got these patches.  I'm not subscribed to devicetree-devel or
linux-samsung so I only got two replies to patch #0, but none of the
code. Can you or Rajul resend?

Thanks,
Mike

> 
> Thanks,
> - Kukjin
> 
> > On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma<rahul.sharma@samsung.com>  wrote:
> >> Add clock changes for hdmi subsystem for exynos5250 SoC. These
> >> include addition of new clocks like mout_hdmi and smmu_tv, associating
> >> ID to clk_hdmiphy and some essential corrections.
> >>
> >> This set is based on kukjin's for-next branch at
> >> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
> >>
> >> This set dependents on the following patches which add support for Exynos5420
> >> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg19264.html
> >>
> >> Rahul Sharma (5):
> >>    clk/exynos5420: add sclk_hdmiphy to the list of special clocks
> >>    clk/exynos5420: add gate clock for tv sysmmu
> >>    clk/exynos5420: fix the order of parents of hdmi mux
> >>    clk/exynos5420: add hdmi mux to change parents in hdmi driver
> >>    clk/exynos5420: assign sclk_pixel id to pixel clock divider
> >>
> >>   .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
> >>   drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
> >>   2 files changed, 18 insertions(+), 7 deletions(-)
> >>
> >> --
> >> 1.7.10.4
