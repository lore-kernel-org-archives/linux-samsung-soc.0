From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v7 00/11] Add generic set_rate clk_ops for PLL35xx and
 PLL36xx for samsung SoCs
Date: Tue, 25 Jun 2013 11:10:08 +0900
Message-ID: <007001ce7149$1f683f40$5e38bdc0$%kim@samsung.com>
References: <1370943076-13461-1-git-send-email-yadi.brar@samsung.com>
 <CAKew6eUOy4=D08v_iq7CTRY5gvt37VAN7Z7WOr2Yt25znDJb2g@mail.gmail.com>
 <CAGm_ybiVZOPBJJ0bYX33wafn1So6aqSAnk7myXZ+Z+RfLBeBQw@mail.gmail.com>
 <1524664.UCV47tfIRU@flatron> <20130621163143.9136.28807@quantum>
 <51C85F8F.9050501@samsung.com> <20130624190227.20448.68120@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55091 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165Ab3FYCKL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Jun 2013 22:10:11 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOX000XPFCSGIA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jun 2013 11:10:10 +0900 (KST)
In-reply-to: <20130624190227.20448.68120@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 'Vikas Sajjan' <sajjan.linux@gmail.com>, 'Yadwinder Singh Brar' <yadi.brar@samsung.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Andrew Bresticker' <abrestic@chromium.org>, 'Tomasz Figa' <t.figa@samsung.com>, 'Doug Anderson' <dianders@chromium.org>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Vikas Sajjan' <vikas.sajjan@linaro.org>

Mike Turquette wrote:
> 
> Quoting Kukjin Kim (2013-06-24 08:02:39)
> > On 06/22/13 01:31, Mike Turquette wrote:
> > >
> > > Acked-by: Mike Turquette<mturquette@linaro.org>
> > >
> > > Or I can take this through the clk tree. Either way is fine.
> > >
> > Mike, please go ahead taking this series into the clk tree for 3.11.
> 
> Actually it might be better for you to take it. Patch #5 relies on
> drivers/clk/samsung/clk-exynos5420.c which only exists in the samsung
> tree.  It was introduced by commit 1609027f, "clk: exynos5420: register
> clocks using common clock framework".
> 
Yes, you're right. It depends on soc-exynos5420 stuff in samsung tree.

> And these patches need to be applied with some fuzz to the clk tree due
> to other changes which are not in my tree and only present in yours.
> 
> The best two options are either for you to take this series or it can be
> rebased on top of clk-next, after which I'll apply it.
> 
Let me try to send this series via samsung tree for v3.11 but I'm not sure because it's a little bit late for arm-soc tree.

Thanks for your ack, just note I will send to arm-soc tonight in my time.

- Kukjin
