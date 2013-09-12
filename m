From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Thu, 12 Sep 2013 13:15:15 +0200
Message-ID: <3071955.IukkWJSFK6@amdc1227>
References: <1378491435-15624-1-git-send-email-broonie@kernel.org>
 <20130910174113.GB4708@sirena.org.uk> <06ff01ceafa4$d81671d0$88435570$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30998 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab3ILLPX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 07:15:23 -0400
In-reply-to: <06ff01ceafa4$d81671d0$88435570$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Mark Brown' <broonie@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, rob.herring@calxeda.com, 'Pawel Moll' <Pawel.Moll@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, 'devicetree' <devicetree@vger.kernel.org>

Hi Kukjin,

On Thursday 12 of September 2013 19:42:57 Kukjin Kim wrote:
> Mark Brown wrote:
> > On Tue, Sep 10, 2013 at 06:35:48PM +0100, Mark Rutland wrote:
> > > It seems far more sensible to me to mark devices disabled by default
> > > in
> > > shared dtsi files and then okay them as needed in particular dts
> > > files.
> > > I'd be happy with more of this.
> > 
> > Yeah, me too - though only for devices that have an external impact,
> > for
> > things that are internal only (eg, a crypto engine) it makes sense to
> > enable them by default since they should normally be usable regardless
> > of the system configuration.
> 
> (+ DT ML)
> 
> Makes sense but I need to get the opinions from DT guys...

Yes, this patch should have been posted to the DT ML indeed, but it has 
been already acked by Mark Rutland, one of DT binding maintainers.

Best regards,
Tomasz
