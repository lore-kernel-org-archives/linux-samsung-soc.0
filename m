From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/3] spi/s3c64xx diagnostic and PM updates
Date: Sat, 21 Jan 2012 15:13:41 +0000
Message-ID: <20120121151341.GB20505@sirena.org.uk>
References: <20120121132329.GA10751@opensource.wolfsonmicro.com>
 <CACxGe6t_h9=U=TpK57XvLUKixmZRwovr_JionXBE39mSrTVHRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36465 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632Ab2AUPNo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 10:13:44 -0500
Content-Disposition: inline
In-Reply-To: <CACxGe6t_h9=U=TpK57XvLUKixmZRwovr_JionXBE39mSrTVHRQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net

On Sat, Jan 21, 2012 at 07:27:23AM -0700, Grant Likely wrote:

> Pushed out to git://git.secretlab.ca/git/linux-2.6.git spi/merge.
> I'll ask Linus to pull in a couple of days after it has hit
> linux-next.

Thanks.  Obviously it'd be nice to get it into 3.3 but I don't see a
huge rush and it did miss the merge window - it doesn't fix any bugs
and without a bunch of other work in cpuidle that's not been done yet
the power gains from the runtime PM are vanishingly small.
