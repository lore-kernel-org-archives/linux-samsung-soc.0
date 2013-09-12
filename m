From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Thu, 12 Sep 2013 17:55:59 +0200
Message-ID: <1657964.f1bIFjAZ98@amdc1227>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <2175767.kktjrZWOAr@amdc1227> <20130912135233.GS29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49760 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753358Ab3ILP4G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 11:56:06 -0400
In-reply-to: <20130912135233.GS29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org

On Thursday 12 of September 2013 14:52:33 Mark Brown wrote:
> On Thu, Sep 12, 2013 at 02:58:59PM +0200, Tomasz Figa wrote:
> > On Thursday 12 of September 2013 11:40:27 Mark Brown wrote:
> Please delete unneeded context from your mails, it makes it much easier
> to find the new content.

I always snip unnecessary parts of quoted message if its really long, but 
if its length is in acceptable range then I try to keep the whole message 
just for reference.

> > > +	i2c@12CA0000 {
> > > +		status = "okay";
> > 
> > Hmm, no other properties needed here?
> 
> Apparently not, it looks like the binding for the aribtrator doesn't sit
> as a child of the bus it's arbitrating - this is the controller
> referenced from the arbitrator node.

i2c@12CA0000 does look like a normal hardware I2C controller, which needs 
some extra properties like samsung,i2c-sda-delay or samsung,i2c-max-bus-
freq. However they are specified in cros5250-common.dtsi, so I'd say that 
this might be better place for the status override as well.

Best regards,
Tomasz
