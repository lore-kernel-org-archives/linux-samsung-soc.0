From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v7 3/4] ARM: EXYNOS: Add platform driver support for Exynos
 PMU
Date: Mon, 28 Jul 2014 08:40:52 +0530
Message-ID: <002601cfaa11$93de5060$bb9af120$@samsung.com>
References: <1404878455-31518-1-git-send-email-pankaj.dubey@samsung.com>
 <1404878455-31518-4-git-send-email-pankaj.dubey@samsung.com>
 <067501cfa7bd$8e6cb460$ab461d20$@samsung.com>
 <000501cfa7c9$e59f4840$b0ddd8c0$@samsung.com> <53D238E1.3030901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23356 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbaG1DJn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 23:09:43 -0400
In-reply-to: <53D238E1.3030901@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, t.figa@samsung.com, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Hi Tomasz,

On Friday, July 25, 2014 Tomasz Figa wrote:

> To: Pankaj Dubey; 'Kukjin Kim'; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: linux@arm.linux.org.uk; t.figa@samsung.com; vikas.sajjan@samsung.com;
> joshi@samsung.com; naushad@samsung.com; thomas.ab@samsung.com;
> chow.kim@samsung.com
> Subject: Re: [PATCH v7 3/4] ARM: EXYNOS: Add platform driver support for
> Exynos PMU
> 
> Hi Pankaj, Kukjin,
> 
> On 25.07.2014 07:32, Pankaj Dubey wrote:
> > Hi Kukjin,
> >
> > On Friday, July 25, 2014 Kukjin Kim wrote:
> 
> [snip]
> 
> >>>
> >> Looks good to me, will apply this and 4/4.
> >>
> >
> > We need to hold these two patches until dependent patch [1] from
> > Tomasz Figa gets merged.
> >
> > [1]: mfd: syscon: Decouple syscon interface from syscon devices
> >       https://lkml.org/lkml/2014/6/24/188
> 
> That RFC patch had few comments from Arnd needed to be addressed, so it
needs a
> new revision.
> 
> Pankaj, If I remember correctly, we had talked about this and the
conclusion was that
> you would take care of addressing the comments and sending new version of
the
> patch. Any update on this or have I missed something?
> 

Well, I don't think we concluded as such anything.
Since this patch needs to get in so that Exynos PMU and PM related changes
can go in,
I discussed with you saying that I am not able to understand about Arnd's
comments and
if possible and time permits I will look into it. Meanwhile I got busy with
some other
official work, so could not get time to look into it.


> Best regards,
> Tomasz
