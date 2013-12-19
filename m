From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks
Date: Thu, 19 Dec 2013 15:10:41 +0100
Message-ID: <3552349.yKrGzNhczA@amdc1227>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
 <2996623.YXg5JqReYS@flatron>
 <CAK9yfHzs+T0g0qy-EALFkrKFybdJDAQ3ZGAoYovZO8PDaWM4QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63437 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751689Ab3LSOK7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 09:10:59 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MY2000VP4Q9UZ90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Dec 2013 14:10:57 +0000 (GMT)
In-reply-to: <CAK9yfHzs+T0g0qy-EALFkrKFybdJDAQ3ZGAoYovZO8PDaWM4QA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Andrew Bresticker <abrestic@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>

Hi Sachin, Andrew,

On Wednesday 18 of December 2013 23:39:58 Sachin Kamat wrote:
> Hi Tomasz,
> 
> On 10 November 2013 22:38, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> > Hi Sachin, Andrew,
> >
> > On Friday 08 of November 2013 15:44:07 Sachin Kamat wrote:
> >> From: Andrew Bresticker <abrestic@chromium.org>
> >>
> >> The gate clocks for the MFC sysmmus appear to be flipped, i.e.
> >> GATE_IP_MFC[2] gates sysmmu_mfcl and GATE_IP_MFC[1] gates sysmmu_mfcr.
> >> Fix this so that the MFC will start up.
> >
> > Wow, this means that there is a mistake in the documentation. Not that
> > I'm surprised, though.
> >
> > I guess you are sure about this, so:
> >
> > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
> I believe you are going to take this through your tree along with a
> few others which you have already reviewed?

This patch seems to depend on my Exynos 5250 clock clean-up series, which
will be merged for 3.14. Are you okay with this patch being merged for
3.14 as well or this fix is needed for earlier kernel versions too?
(It is not a regression introduced in 3.13, though.)

Best regards,
Tomasz
