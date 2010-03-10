From: James Simmons <jsimmons@infradead.org>
Subject: Re: [PATCH] s3c2410fb: silence warning
Date: Wed, 10 Mar 2010 16:41:40 +0000 (GMT)
Message-ID: <alpine.LFD.2.00.1003101641170.4419@casper.infradead.org>
References: <876356o0ct.fsf@lechat.rtp-net.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56777 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756284Ab0CJQln (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Mar 2010 11:41:43 -0500
In-Reply-To: <876356o0ct.fsf@lechat.rtp-net.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Cc: linux-fbdev@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org


Can you please resend it not as a attachemnt. Thank you.


> 
> 
> When building s3c2410fb with CPU_FREQ set, one gets :
> 
> drivers/video/s3c2410fb.c: In function 's3c2410fb_cpufreq_transition':
> drivers/video/s3c2410fb.c:769: warning: unused variable 'freqs'
> 
> Remove this useless declaration to silence the warning.
> 
> Signed-off-by: Arnaud Patard <arnaud.patard@rtp-net.org>
> ---
> 
