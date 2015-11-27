From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH v2 00/13] drm/exynos: async G2D and g2d_move()
Date: Fri, 27 Nov 2015 11:11:08 +0900
Message-ID: <20151127111108.68b4c99a@hwh-ubuntu>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CACvgo51z_t-4D8_QKo3tQngB5b=+c7ReDBM3h7ikTEuKt=+vMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32976 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753674AbbK0CLL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 21:11:11 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYG00BTWBELXM40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Nov 2015 11:11:09 +0900 (KST)
In-reply-to: <CACvgo51z_t-4D8_QKo3tQngB5b=+c7ReDBM3h7ikTEuKt=+vMA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>

Dear All,

On Thu, 26 Nov 2015 16:35:29 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> Hi Tobias,
> 
> On 22 November 2015 at 18:48, Tobias Jakobi
> <tjakobi@math.uni-bielefeld.de> wrote:
> > Hello,
> >
> > this series mostly touches G2D code. It introduces the following:
> >
> > (1) drmHandleEvent2() is added to enable processing of
> > vendor-specific events. This will be used to expose asynchronous
> > operation of the G2D. The necessary kernel infrastructure is
> > already there since a lot of kernel versions. [This touches libdrm
> > core code!]
> >
> Considering the shortage of input on this can you please respin the
> series without it (and related work mentioned below). This way we can
> pick merge the remaining work now and discuss (ping) about the rest.

I am confused a little here. Did you mean that adding drmHandleEvent2()
is not necessary, and the related code which uses drmHandleEvent2() must
be re-implemented?

> 
> > (2) The necessary infrastructure to handle G2D events. This includes
> >     adding g2d_config_event() and g2d_exec2() to the public API.
> >     A test application is provided to ensure that everything works
> >     as expected.
> >
> With above in mind the g2d event will need to be split out, although
> g2d_exec2() should be ok (although of limited use), imho.
> 
> > (3) A small performance test application which can be used to
> > measure the speed of solid color clear operations. Interesting for
> >     benchmarking and plotting colorful graphs (e.g. through
> >     Mathematica).
> >
> > (4) g2d_move() which works similar to g2d_copy() but like the C
> >     memmove() properly handles overlapping buffer copies.
> >     Again a test application is present to check that this
> >     indeed does what it should.
> >
> > (5) Various small changes. A framebuffer colorformat fix for the
> >     general G2D test application. Moving the currently unused
> >     g2d_reset() to the public API.
> I am more of a "add API when it's needed" kind of person, although I
> cannot see anything serious misuse that can arise from g2d_reset().
> 
> > Adding a counterpart to
> >     exynos_bo_map() to unmap buffers again.
> >
> The exynos bo map compatibility was broken a few times already so I'm
> wondering if we really want this one. I guess that with the lack of
> any (outside of tizen) user space things cannot go that wrong :-P
> 

Yes. I agree that adding them at this time is not needed and it would
be OK to add them, when the userspace using them comes.

BRs,
Hyungwon Hwang

> Thanks
> Emil
> 
