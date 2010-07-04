From: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH v3 05/12] s3c-fb: Add support for display panning
Date: Sun, 4 Jul 2010 14:50:10 +0100
Message-ID: <20100704135010.GA1201@shareable.org>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com> <1277712538-23188-6-git-send-email-p.osciak@samsung.com> <4C2DCC5B.2000100@simtec.co.uk> <003e01cb19ea$969e0090$c3da01b0$%osciak@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail2.shareable.org ([80.68.89.115]:56811 "EHLO
	mail2.shareable.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757602Ab0GDNuO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 09:50:14 -0400
Content-Disposition: inline
In-Reply-To: <003e01cb19ea$969e0090$c3da01b0$%osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pawel Osciak <p.osciak@samsung.com>
Cc: 'Ben Dooks' <ben@simtec.co.uk>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Pawel Osciak wrote:
> >Ben Dooks <ben@simtec.co.uk> wrote:
> >On 28/06/10 09:08, Pawel Osciak wrote:
> 
> >> diff --git a/arch/arm/plat-samsung/include/plat/regs-fb.h b/arch/arm/plat-
> >samsung/include/plat/regs-fb.h
> >> index ac10013..f454e32 100644
> >> --- a/arch/arm/plat-samsung/include/plat/regs-fb.h
> >> +++ b/arch/arm/plat-samsung/include/plat/regs-fb.h
> >> @@ -112,6 +112,11 @@
> >>  #define VIDCON2_ORGYCbCr			(1 << 8)
> >>  #define VIDCON2_YUVORDCrCb			(1 << 7)
> >>
> >> +/* PRTCON (S3C6410, S5PC100) */
> >
> >Not listed in my S3C6410 manual?
> >
> 
> Not in my either. It is there in the S5PC100 docs though. This is not an
> "official statement", but I've been testing panning on my 6410 *very*
> intensively and experienced a lot of crashes without it. Not a single one
> with it though. So it's either almost impossible luck or it is there,
> undocumented. There is a hole at this address anyway, so this shouldn't
> hurt anything.

Probably a good idea to put that in a comment, for the person who
looks at it in 5 years time and wonders if the code is mistaken.

-- Jamie
