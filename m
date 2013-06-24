From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH 0/5] clk/exynos5420: add clocks for hdmi subsystem
Date: Mon, 24 Jun 2013 09:58:20 +0530
Message-ID: <CAPdUM4NOsQThGW7dGJir_a9-kkLm-AUDPi2hM0w2Jz7cdCwFrQ@mail.gmail.com>
References: <1371565998-3642-1-git-send-email-rahul.sharma@samsung.com>
	<CAPdUM4MtBXMaZDDRT1aKsS=HzwjpbyMY85oRLMbk-KvJCU1hag@mail.gmail.com>
	<51C1B9AD.8060804@samsung.com>
	<20130621043252.9136.66418@quantum>
	<CAPdUM4NxCKtKrZg1RYD0=83jDYt9Nzd3paYL53ZL9tt2zfJy7A@mail.gmail.com>
	<20130621164303.9136.5127@quantum>
	<CAPdUM4MENsYV3uA+FEt7UX9Qe8DyJ6a_cNj3wzW1+j1q+xf6Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:57967 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990Ab3FXE2V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 00:28:21 -0400
Received: by mail-wg0-f45.google.com with SMTP id j13so8120529wgh.24
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jun 2013 21:28:20 -0700 (PDT)
In-Reply-To: <CAPdUM4MENsYV3uA+FEt7UX9Qe8DyJ6a_cNj3wzW1+j1q+xf6Fg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Hi Mr. Kim,

v3.11-next/soc-exynos5420 seems correct branch for it, not
v3.11-next/samsung-clk. In this
case rebasing is not required. It cleanly applies there.

regards,
Rahul Sharma.

On Mon, Jun 24, 2013 at 9:33 AM, Rahul Sharma <r.sh.open@gmail.com> wrote:
> Thanks Mike.
>
> I will rebase these patches to v3.11-next/samsung-clk branch and post v2.
>
> regards,
> Rahul Sharma.
>
> On Fri, Jun 21, 2013 at 10:13 PM, Mike Turquette <mturquette@linaro.org> wrote:
>> Quoting Rahul Sharma (2013-06-20 21:47:35)
>>> On Fri, Jun 21, 2013 at 10:02 AM, Mike Turquette <mturquette@linaro.org> wrote:
>>> > Quoting Kukjin Kim (2013-06-19 07:01:17)
>>> >> On 06/19/13 13:04, Rahul Sharma wrote:
>>> >> > + mike
>>> >> >
>>> >> Mike, I'm waiting for your reply on this. If you're OK, let me take this
>>> >> series on top of exynos5420 stuff in samsung tree.
>>> >>
>>> >> Of course, if any concerns, please let me know.
>>> >
>>> > I never got these patches.  I'm not subscribed to devicetree-devel or
>>> > linux-samsung so I only got two replies to patch #0, but none of the
>>> > code. Can you or Rajul resend?
>>> >
>>>
>>> Sure mike.
>>
>> Acked-by: Mike Turquette <mturquette@linaro.org>
>>
>> Regards,
>> Mike
>>
>>>
>>> > Thanks,
>>> > Mike
>>> >
>>> >>
>>> >> Thanks,
>>> >> - Kukjin
>>> >>
>>> >> > On Tue, Jun 18, 2013 at 8:03 PM, Rahul Sharma<rahul.sharma@samsung.com>  wrote:
>>> >> >> Add clock changes for hdmi subsystem for exynos5250 SoC. These
>>> >> >> include addition of new clocks like mout_hdmi and smmu_tv, associating
>>> >> >> ID to clk_hdmiphy and some essential corrections.
>>> >> >>
>>> >> >> This set is based on kukjin's for-next branch at
>>> >> >> http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.
>>> >> >>
>>> >> >> This set dependents on the following patches which add support for Exynos5420
>>> >> >> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg19264.html
>>> >> >>
>>> >> >> Rahul Sharma (5):
>>> >> >>    clk/exynos5420: add sclk_hdmiphy to the list of special clocks
>>> >> >>    clk/exynos5420: add gate clock for tv sysmmu
>>> >> >>    clk/exynos5420: fix the order of parents of hdmi mux
>>> >> >>    clk/exynos5420: add hdmi mux to change parents in hdmi driver
>>> >> >>    clk/exynos5420: assign sclk_pixel id to pixel clock divider
>>> >> >>
>>> >> >>   .../devicetree/bindings/clock/exynos5420-clock.txt   |    7 +++++++
>>> >> >>   drivers/clk/samsung/clk-exynos5420.c                 |   18 +++++++++++-------
>>> >> >>   2 files changed, 18 insertions(+), 7 deletions(-)
>>> >> >>
>>> >> >> --
>>> >> >> 1.7.10.4
