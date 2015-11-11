From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 09/13] exynos/fimg2d: add g2d_move
Date: Wed, 11 Nov 2015 10:55:47 +0900
Message-ID: <20151111105547.24054c63@hwh-ubuntu>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1442937302-8211-10-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20151109163013.011f4cb6@hwh-ubuntu> <56406B96.1050701@math.uni-bielefeld.de>
 <20151110132005.73ff2b60@hwh-ubuntu> <5641EFFB.1020509@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32934 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbKKBzu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 20:55:50 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NXM01AHHO10CU40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Nov 2015 10:55:48 +0900 (KST)
In-reply-to: <5641EFFB.1020509@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Tobias,

On Tue, 10 Nov 2015 14:24:11 +0100
Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:

> Hello Hyungwon,
> 
> 
> Hyungwon Hwang wrote:
> > Hello Tobias,
> > 
> > On Mon, 09 Nov 2015 10:47:02 +0100
> > Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
> > 
> >> Hello Hyungwon,
> >>
> >>
> >> Hyungwon Hwang wrote:
> >>> Hello Tobias,
> >>>
> >>> I was in vacation last week, so I could run your code today. I
> >>> found that what g2d_move() does is actually copying not moving,
> >>> because the operation does not clear the previous area.
> >> I choose g2d_move() because we also have memcpy() and memmove() in
> >> libc. Like in libc 'moving' memory doesn't actually move it, like
> >> you would move a real object, since it's undefined what 'empty'
> >> memory should be.
> >>
> >> The same applies here. It's not defined what 'empty' areas of the
> >> buffer should be.
> >>
> >>
> >>> Would it be possible to
> >>> generalize g2d_copy() works better, so it could works well in case
> >>> of the src buffer and dst buffer being same.
> >> I think this would break g2d_copy() backward compatibility.
> >>
> >> I also want the user to explicitly request this. The user should
> >> make sure what requirements he has for the buffers in question.
> >> Are the buffers disjoint or not?
> >>
> >>
> >>> If it is possible, I think it
> >>> would be better way to do that. If it is not, at least chaning the
> >>> function name is needed. I tested it on my Odroid U3 board.
> >> I don't have a strong opinion on the naming. Any recommendations?
> >>
> >> I still think the naming is fine though, since it mirrors libc's
> >> naming. And the user is supposed to read the documentation anyway.
> > 
> >>
> >>
> >>
> >> With best wishes,
> >> Tobias
> > 
> > In that manner following glibc, I agree that the naming is
> > reasonable.
> well, that was just my way of thinking. But I guess most people have
> experience using the libc, so the naming should look at least
> 'familiar'.
> 
> 
> 
> > I commented like that previously, because at the first time when I
> > run the test, I think that the result seems like a bug. The test
> > program said that it was a move test, but the operation seemed
> > copying.
> Ok, so just that I understand this correctly. Your issue is with the
> commit the description of the test or with the commit description of
> the patch that introduces g2d_move()?
> 
> Because I don't see what you point out in the test commit description:
> 
> "
> tests/exynos: add test for g2d_move
> 
> To check if g2d_move() works properly we create a small checkerboard
> pattern in the center of the screen and then shift this pattern
> around with g2d_move(). The pattern should be properly preserved
> by the operation.
> "
> 
> I intentionally avoid to write "...move this pattern around...", so
> instead I choose "shift".
> 
> I'm not a native speaker, so I'm clueless how to formulate this in a
> more clear way.

I'm also not a native speaker, so maybe I could not figure out the
subtle difference between move and shift. I just thought that 'shift'
was just the synonym of 'move'.

> 
> 
> > It
> > would be just OK if it is well documented or printed when runs the
> > test that the test does not do anything about the previous area
> > intentionally.
> I could add solid fills of the 'empty' areas after each move()
> operation. Would that be more in line what you think the test should
> do?

No. Because g2d_move() is to g2d_copy() what memmove() is to memcpy(),
the current implementation seems enough.

What about change 'move' to 'copy' in the function description?

* g2d_move - copy content inside single buffer.
*     Similar to 'memmove' this copies a rectangular region
*     of the provided buffer to another location (the source
*     and destination region potentially overlapping)

Best regards,
Hyungwon Hwang

> 
> 
> With best wishes,
> Tobias
> 
> 
> 
> 
> > 
> > 
> > BRs,
> > Hyungwon Hwang
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
