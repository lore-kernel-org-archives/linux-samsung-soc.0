From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks
Date: Thu, 19 Dec 2013 01:36:11 +0100
Message-ID: <2195944.NGxsB7RHkr@flatron>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org> <CA+Ln22GD5fr4S6aR-+85bdutkeeHmgutLvRWETEQEt1vJX-Y6Q@mail.gmail.com> <20131218192430.23538.93253@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:49723 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab3LSAgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 19:36:14 -0500
Received: by mail-ea0-f178.google.com with SMTP id d10so149735eaj.37
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 16:36:13 -0800 (PST)
In-Reply-To: <20131218192430.23538.93253@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wednesday 18 of December 2013 11:24:30 Mike Turquette wrote:
> Quoting Tomasz Figa (2013-12-18 10:28:57)
> > Hi Sachin,
> > 
> > 2013/12/18 Sachin Kamat <sachin.kamat@linaro.org>:
> > > Hi Tomasz,
> > >
> > > On 10 November 2013 22:38, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> > >> Hi Sachin, Andrew,
> > >>
> > >> On Friday 08 of November 2013 15:44:07 Sachin Kamat wrote:
> > >>> From: Andrew Bresticker <abrestic@chromium.org>
> > >>>
> > >>> The gate clocks for the MFC sysmmus appear to be flipped, i.e.
> > >>> GATE_IP_MFC[2] gates sysmmu_mfcl and GATE_IP_MFC[1] gates sysmmu_mfcr.
> > >>> Fix this so that the MFC will start up.
> > >>
> > >> Wow, this means that there is a mistake in the documentation. Not that
> > >> I'm surprised, though.
> > >>
> > >> I guess you are sure about this, so:
> > >>
> > >> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > >
> > > I believe you are going to take this through your tree along with a
> > > few others which you have already reviewed?
> > 
> > Thanks for reminding me about this patch. It's been quite a while
> > since it was posted
> > to the list.
> > 
> > Yes, I will apply it to samsung-clk tree.
> 
> Feel free to add my Ack when you apply it. Will these be sent later as a
> pull request for the clk tree?

Yes. That's the plan. :)

Best regards,
Tomasz
