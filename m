From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 23:10:10 +0000
Message-ID: <20120121231010.GA15238@sirena.org.uk>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20120121183155.GE10751@opensource.wolfsonmicro.com>
 <4F1B2235.4000009@gmail.com>
 <201201212223.54801.heiko@sntech.de>
 <4F1B2F38.9050708@gmail.com>
 <20120121215758.GC8331@opensource.wolfsonmicro.com>
 <4F1B40F7.1000602@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47765 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751052Ab2AUXKQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 18:10:16 -0500
Content-Disposition: inline
In-Reply-To: <4F1B40F7.1000602@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Heiko St??bner <heiko@sntech.de>, linux-i2c@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Sat, Jan 21, 2012 at 11:49:27PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 10:57 PM, Mark Brown wrote:

> > It's just a Kconfig switch, the only issue is that users might not turn
> > it on and for platforms where there's not much driver support they're
> > more likely to not have done so.

> Yes, and some simple SoCs might probably never benefit from runtime PM due to
> their limited power modes. Hence enforcing RUNTIME_PM dependency on some 
> common drivers might not be sane. But it would be ideal not to work around
> things too much, and reimplement in drivers functionality that involves
> upper layers.

Yes, that's the thinking behind my approach of not touching existing
code - I don't feel too bad about making new stuff depend on new
features but for older stuff I'd rather leave it alone for now.  Once we
can manage to deliver the WFI states there would be a very useful win
there so there's going to be a benefit to users from turning it on.

> only.. I noticed recently that you did a nice work correcting broken s3c-fb 
> driver PM code. I've done similar corrections but the patches never left the 

Thanks.

> internal trees due to limited time for this. And there is also a DRM driver 
> for FIMD on Exynos now.

Yeah, I don't really have access to too much of the shiny new stuff
right now so I've not been able to take advantage of a lot of the stuff
you guys are doing.  My primary development platform is S3C6410 based at
the minute.
