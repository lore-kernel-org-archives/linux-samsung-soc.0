From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V4 2/2] spi: s3c64xx: fix checkpatch error and warnings
Date: Wed, 17 Jul 2013 13:44:25 +0900
Message-ID: <004101ce82a8$50d424c0$f27c6e40$@samsung.com>
References: <003401ce81b6$ab70cb10$02526130$@samsung.com>
 <20130716103630.GI22506@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10390 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124Ab3GQEo1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Jul 2013 00:44:27 -0400
In-reply-to: <20130716103630.GI22506@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>, Jingoo Han <jg1.han@samsung.com>

On Tuesday, July 16, 2013 7:37 PM, Mark Brown wrote:
> On Tue, Jul 16, 2013 at 08:54:39AM +0900, Jingoo Han wrote:
> > Fix the following checkpatch error and warnings:
> >
> >   ERROR: "(foo*)" should be "(foo *)"
> >   WARNING: line over 80 characters
> >   WARNING: quoted string split across lines
> >
> > Also, it converts (void *) to (unsigned long *)(unsigned long)
> > to fix sparse error.
> 
> This doesn't apply to current code (and should really be split up a bit
> for ease of review).  Can you please check and resend?

Hi Mark Brown,

OK, I see. I will make the patch for only conversion,
against your spi.git repository 'for-next' branch.
Thank you. :)

Best regards,
Jingoo Han
