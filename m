From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v2] rtc: s3c: Don't print an error on probe deferral
Date: Mon, 14 Mar 2016 23:58:11 +0100
Message-ID: <20160314225811.GG28277@piout.net>
References: <1457987157-1177-1-git-send-email-javier@osg.samsung.com>
 <1457987453.11972.133.camel@perches.com>
 <56E72818.8050407@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:36593 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S932361AbcCNW6R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 18:58:17 -0400
Content-Disposition: inline
In-Reply-To: <56E72818.8050407@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com

On 14/03/2016 at 18:07:36 -0300, Javier Martinez Canillas wrote :
> Hello Joe,
> 
> On 03/14/2016 05:30 PM, Joe Perches wrote:
> > On Mon, 2016-03-14 at 17:25 -0300, Javier Martinez Canillas wrote:
> >> The clock and source clock looked up by the driver may not be available
> >> just because the clock controller driver was not probed yet so printing
> >> an error in this case is not correct and only adds confusion to users.
> >>
> >> However, knowing that a driver's probe was deferred may be useful so it
> >> can be printed as debug information.
> > 
> > Hello again Javier:
> >> +			dev_dbg(&pdev->dev, "probe deferred due missing rtc clk\n");
> > 
> > Again, intelligible English would not use "due"
> > but would use "due to" or "because of".
> > 
> 
> Ok, I'll post another version then. I hope the third time's the charm...
> 
> Alexandre, do you have any other comments before I re-spin this patch?
> 

No further comments :)


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
