From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH 01/15] ARM: S3C: Add S3C2416 detection to uncompress
 code
Date: Wed, 12 May 2010 10:25:21 +0300
Message-ID: <20100512072521.GA24747@jeknote.loshitsa1.net>
References: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
 <20100512023845.GM2589@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:2309 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110Ab0ELHZ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 May 2010 03:25:28 -0400
Received: by fg-out-1718.google.com with SMTP id 19so1755986fgg.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 May 2010 00:25:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20100512023845.GM2589@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wed, May 12, 2010 at 03:38:45AM +0100, Ben Dooks wrote:
> On Wed, May 12, 2010 at 03:35:52AM +0100, Ben Dooks wrote:
> > From: Yauhen Kharuzhy <jekhor@gmail.com>
> > 
> > Add S3C2416 serial port setup to uncompress code.
> 
> Yahuen, let me know if you've any objection to this going upstrea.
No, don't have.

> Forgot to add --compose to send-email, so here's what should have gone
> into the first email of this series:
> 
> S3C2416 support, mainly just processor core and a few peripheral setup
> patches. Also has basic support for the S3C2450 which is very similar
> SoC which will be updated later in the series.
> 
> Currently based on the s3c24xx gpio series.
> 
> Russell, let me know if this is ok for the next merge window, and if so
> I'll send a pull request.
> 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> > ---
> >  arch/arm/mach-s3c2410/include/mach/uncompress.h |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/arch/arm/mach-s3c2410/include/mach/uncompress.h b/arch/arm/mach-s3c2410/include/mach/uncompress.h
> > index 72f756c..8b283f8 100644
> > --- a/arch/arm/mach-s3c2410/include/mach/uncompress.h
> > +++ b/arch/arm/mach-s3c2410/include/mach/uncompress.h
> > @@ -40,7 +40,9 @@ static void arch_detect_cpu(void)
> >  	cpuid &= S3C2410_GSTATUS1_IDMASK;
> >  
> >  	if (is_arm926() || cpuid == S3C2410_GSTATUS1_2440 ||
> > -	    cpuid == S3C2410_GSTATUS1_2442) {
> > +	    cpuid == S3C2410_GSTATUS1_2442 ||
> > +	    cpuid == S3C2410_GSTATUS1_2416 ||
> > +	    cpuid == S3C2410_GSTATUS1_2450) {
> >  		fifo_mask = S3C2440_UFSTAT_TXMASK;
> >  		fifo_max = 63 << S3C2440_UFSTAT_TXSHIFT;
> >  	} else {
> > -- 
> > 1.6.3.3
> > 
> 
> -- 
> -- 
> Ben
> 
> Q:      What's a light-year?
> A:      One-third less calories than a regular year.
> 

-- 
Yauhen Kharuzhy		jekhor _at_ gmail.com
			JID: jek@jabber.ru

A: No
Q: Should I quote below my post?
