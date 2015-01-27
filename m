From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 1/2] exynos: Don't use DRM_EXYNOS_GEM_{MAP_OFFSET/MMAP}
 ioctls
Date: Tue, 27 Jan 2015 10:05:34 +0900
Message-ID: <20150127100534.3619e1bd@hwh-ubuntu>
References: <1421449054-2808-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1421449054-2808-2-git-send-email-tjakobi@math.uni-bielefeld.de>
 <20150126104238.65da492e@hwh-ubuntu>
 <CACvgo52r33R99JkOkWxHGEO+1zvAjfBb2nJfk6Kqt57M3iA5FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62971 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755541AbbA0BFg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Jan 2015 20:05:36 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NIT00IJH9PA1CB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Jan 2015 10:05:34 +0900 (KST)
In-reply-to: <CACvgo52r33R99JkOkWxHGEO+1zvAjfBb2nJfk6Kqt57M3iA5FA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>

Dear Emil,

On Mon, 26 Jan 2015 19:05:51 +0000
Emil Velikov <emil.l.velikov@gmail.com> wrote:

> On 26 January 2015 at 01:42, Hyungwon Hwang <human.hwang@samsung.com>
> wrote:
> > Dear Tobias,
> >
> > Thanks for fixing it.
> >
> > Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
> >
> Hi Hyungwon Hwang
> 
> I'm a bit confused about the use of s-o-b here. I've assumed that
> libdrm follows the kernel style [1] for those type of things ?
> Would you have anything handy which I can read on the topic ?

I also think that DRI-devel mailing list follow the kernel rule. I used
s-o-b here by the meaning of (a) below (this text is excerpted from the
link you sent)

12) Sign your work

To improve tracking of who did what, especially with patches that can
percolate to their final resting place in the kernel through several
layers of maintainers, we've introduced a "sign-off" procedure on
patches that are being emailed around.

The sign-off is a simple line at the end of the explanation for the
patch, which certifies that you wrote it or otherwise have the right to
pass it on as an open-source patch.  The rules are pretty simple: if you
can certify the below:

        Developer's Certificate of Origin 1.1

        By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

Was it wrong to add s-o-b here? Should I have used "Reviewed-by" here?
I am sorry, if I broke the rule and confused you.

> 
> Cheers,
> Emil
> 
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/SubmittingPatches#n358
> 
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


Best regards,
Hyungwon Hwang
