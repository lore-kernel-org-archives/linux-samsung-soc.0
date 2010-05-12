From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 01/15] ARM: S3C: Add S3C2416 detection to uncompress
	code
Date: Wed, 12 May 2010 03:38:45 +0100
Message-ID: <20100512023845.GM2589@trinity.fluff.org>
References: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33009 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751640Ab0ELCiq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 May 2010 22:38:46 -0400
Content-Disposition: inline
In-Reply-To: <1273631766-15693-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>

On Wed, May 12, 2010 at 03:35:52AM +0100, Ben Dooks wrote:
> From: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> Add S3C2416 serial port setup to uncompress code.

Yahuen, let me know if you've any objection to this going upstrea.

Forgot to add --compose to send-email, so here's what should have gone
into the first email of this series:

S3C2416 support, mainly just processor core and a few peripheral setup
patches. Also has basic support for the S3C2450 which is very similar
SoC which will be updated later in the series.

Currently based on the s3c24xx gpio series.

Russell, let me know if this is ok for the next merge window, and if so
I'll send a pull request.

> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/mach-s3c2410/include/mach/uncompress.h |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2410/include/mach/uncompress.h b/arch/arm/mach-s3c2410/include/mach/uncompress.h
> index 72f756c..8b283f8 100644
> --- a/arch/arm/mach-s3c2410/include/mach/uncompress.h
> +++ b/arch/arm/mach-s3c2410/include/mach/uncompress.h
> @@ -40,7 +40,9 @@ static void arch_detect_cpu(void)
>  	cpuid &= S3C2410_GSTATUS1_IDMASK;
>  
>  	if (is_arm926() || cpuid == S3C2410_GSTATUS1_2440 ||
> -	    cpuid == S3C2410_GSTATUS1_2442) {
> +	    cpuid == S3C2410_GSTATUS1_2442 ||
> +	    cpuid == S3C2410_GSTATUS1_2416 ||
> +	    cpuid == S3C2410_GSTATUS1_2450) {
>  		fifo_mask = S3C2440_UFSTAT_TXMASK;
>  		fifo_max = 63 << S3C2440_UFSTAT_TXSHIFT;
>  	} else {
> -- 
> 1.6.3.3
> 

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
