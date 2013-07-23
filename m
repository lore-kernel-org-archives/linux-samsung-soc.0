From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v7 00/11] Add generic set_rate clk_ops for PLL35xx and PLL36xx
 for samsung SoCs
Date: Mon, 22 Jul 2013 18:26:21 -0700
Message-ID: <20130723012621.7598.46496@quantum>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
 <CAKew6eUOy4=D08v_iq7CTRY5gvt37VAN7Z7WOr2Yt25znDJb2g@mail.gmail.com>
 <CAGm_ybiVZOPBJJ0bYX33wafn1So6aqSAnk7myXZ+Z+RfLBeBQw@mail.gmail.com>
 <1524664.UCV47tfIRU@flatron> <20130621163143.9136.28807@quantum>
 <51C85F8F.9050501@samsung.com> <20130624190227.20448.68120@quantum>
 <007001ce7149$1f683f40$5e38bdc0$%kim@samsung.com>
 <CAKew6eVW6dOzLRN2CG8jT3Oo1uzKrXqi1aRYkAHmUu61dBSDpA@mail.gmail.com>
 <CAGm_ybj31kv=iW2YKsHnBRJ741G2amSNAJf+Mx8Z-JMoVynZ8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:64361 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751088Ab3GWB0Z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 21:26:25 -0400
Received: by mail-pb0-f49.google.com with SMTP id jt11so7756990pbb.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 18:26:25 -0700 (PDT)
In-Reply-To: <CAGm_ybj31kv=iW2YKsHnBRJ741G2amSNAJf+Mx8Z-JMoVynZ8w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <sajjan.linux@gmail.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andrew Bresticker <abrestic@chromium.org>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Vikas Sajjan <vikas.sajjan@linaro.org>

Quoting Vikas Sajjan (2013-07-21 23:15:27)
> Hi Kukjin / Mike,
> 
> Can you apply this series

Let me apply this to see if the dependencies are taken care of now. If
so I'll just take it through the clk tree.

Regards,
Mike

> 
> On Tue, Jul 16, 2013 at 7:10 PM, Yadwinder Singh Brar
> <yadi.brar01@gmail.com> wrote:
> > Hi Kukjin / Mike,
> >
> > On Tue, Jun 25, 2013 at 7:40 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >> Mike Turquette wrote:
> >>>
> >>> Quoting Kukjin Kim (2013-06-24 08:02:39)
> >>> > On 06/22/13 01:31, Mike Turquette wrote:
> >>> > >
> >>> > > Acked-by: Mike Turquette<mturquette@linaro.org>
> >>> > >
> >>> > > Or I can take this through the clk tree. Either way is fine.
> >>> > >
> >>> > Mike, please go ahead taking this series into the clk tree for 3.11.
> >>>
> >>> Actually it might be better for you to take it. Patch #5 relies on
> >>> drivers/clk/samsung/clk-exynos5420.c which only exists in the samsung
> >>> tree.  It was introduced by commit 1609027f, "clk: exynos5420: register
> >>> clocks using common clock framework".
> >>>
> >> Yes, you're right. It depends on soc-exynos5420 stuff in samsung tree.
> >>
> >>> And these patches need to be applied with some fuzz to the clk tree due
> >>> to other changes which are not in my tree and only present in yours.
> >>>
> >>> The best two options are either for you to take this series or it can be
> >>> rebased on top of clk-next, after which I'll apply it.
> >>>
> >> Let me try to send this series via samsung tree for v3.11 but I'm not sure because it's a little bit late for arm-soc tree.
> >>
> >> Thanks for your ack, just note I will send to arm-soc tonight in my time.
> >>
> >
> > Can we get this series merge now in any of trees.
> > Please let me if its required to rebase it.
> >
> > Regards,
> > Yadwinder
