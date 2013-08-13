From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH] drm/exynos: Add missing includes
Date: Tue, 13 Aug 2013 19:52:51 +0900
Message-ID: <00be01ce9813$42184350$c648c9f0$%dae@samsung.com>
References: <1376351200-23009-1-git-send-email-broonie@kernel.org>
 <005601ce97cc$995f3840$cc1da8c0$%dae@samsung.com>
 <20130813095357.GO6427@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26972 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757147Ab3HMKwx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Aug 2013 06:52:53 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRG00MJEU84QKT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Aug 2013 19:52:52 +0900 (KST)
In-reply-to: <20130813095357.GO6427@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: 'David Airlie' <airlied@linux.ie>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org



> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Mark Brown
> Sent: Tuesday, August 13, 2013 6:54 PM
> To: Inki Dae
> Cc: 'David Airlie'; linux-samsung-soc@vger.kernel.org; dri-
> devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/exynos: Add missing includes
> 
> On Tue, Aug 13, 2013 at 11:27:04AM +0900, Inki Dae wrote:
> 
> > > Ensure that all externally accessed functions are correctly
> > > prototyped when defined in each file by making sure the headers with
> > > the protoypes are included in the file with the definition.
> 
> > I definitely missed it. sorry about that. Actually I was going to try
> > to incur something such as compile warning. You mean that the warning
> > could be incurred by compiler in case that a external module includes
> > a header of Exynos drm but the prototype of the header file differs
> > from the one of .c file?
> 
> Probably nothing would actively warn about a mismatch (since everything
> happens per complilation unit) without the file defining the function
> including the incorrect prototype but you'd get problems at runtime if the
> declaration and defintion were incompatible so some things (including
> sparse) will warn if there's no prototype for an exported symbol.
> 

Applied.

Thanks,
Inki Dae

> > I will apply it to -next but I'd like to understand why this patch is
> > needed surely. And it seems like that other drivers have same issue
> > also. :)
> 
> Yes, it's a bit of a problem (especially in the graphics stack for some
> reason) but since there's tools that pick up the issue it does tend to get
> fixed.
