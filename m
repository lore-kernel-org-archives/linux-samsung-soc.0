From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: Fix PLL35XX lock time
Date: Thu, 10 Oct 2013 07:20:31 +0200
Message-ID: <2947491.pJZ8F0UW5m@amdn883>
References: <1381215399-25394-1-git-send-email-arun.kk@samsung.com>
 <CAD=FV=WcKpO947DgF6xwWALpVMYPOaZ=G_1+iRmFjac2bQGAMw@mail.gmail.com>
 <CALt3h78Lt2epHFmKeQ90839-L4XSQL+rDUTHGj681S2sTG=Jeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58283 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026Ab3JJFUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:20:35 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUF00JS4TI9QA80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 06:20:33 +0100 (BST)
In-reply-to: <CALt3h78Lt2epHFmKeQ90839-L4XSQL+rDUTHGj681S2sTG=Jeg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arunkk.samsung@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>

Hi Arun,

On Wednesday 09 of October 2013 09:21:43 Arun Kumar K wrote:
> Hi Doug,
> 
> On Tue, Oct 8, 2013 at 9:39 PM, Doug Anderson <dianders@chromium.org> wrote:
> > Arun,
> > 
> > On Mon, Oct 7, 2013 at 11:56 PM, Arun Kumar K <arun.kk@samsung.com> wrote:
> >> PLL35XX lock factor is 250 as per the manual whereas its
> >> wrongly set as 270 now.
> >> 
> >> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> >> ---
> >> 
> >>  drivers/clk/samsung/clk-pll.c |    4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > I don't think this is right.  I believe that it needs to be passed in
> > by the SoC.  On exynos5250 I see 250 in both the manual and in our
> > code.  On exynos5420 manual I actually see 200 now.  I'm not actually
> > sure where the 270 came from, now that I search for it.
> 
> The manual I referred gives 250 for both 5250 and 5420 and thats why I
> concluded on this fix. I will check other versions of the manual to see if
> the value is changing.

270 is the value taken from Exynos 4412 User's Manual rev. 1.1.

I believe we don't have to extend this to support per SoC value, because it 
should be always safe to take the value of SoC that requires the longest 
locking period. The differences are small enough to be insignificant, so there 
should be no practical performance penalty.

Best regards,
Tomasz
