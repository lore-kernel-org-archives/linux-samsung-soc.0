From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] ARM: dts: Disable Exynos5250 I2S controllers by default
Date: Thu, 12 Sep 2013 19:42:57 +0900
Message-ID: <06ff01ceafa4$d81671d0$88435570$@org>
References: <1378491435-15624-1-git-send-email-broonie@kernel.org>
 <20130910173548.GA18878@e106331-lin.cambridge.arm.com>
 <20130910174113.GB4708@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52397 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943Ab3ILKm7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 06:42:59 -0400
In-reply-to: <20130910174113.GB4708@sirena.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>
Cc: rob.herring@calxeda.com, 'Pawel Moll' <Pawel.Moll@arm.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, 'devicetree' <devicetree@vger.kernel.org>

Mark Brown wrote:
> 
> On Tue, Sep 10, 2013 at 06:35:48PM +0100, Mark Rutland wrote:
> 
> > It seems far more sensible to me to mark devices disabled by default in
> > shared dtsi files and then okay them as needed in particular dts files.
> > I'd be happy with more of this.
> 
> Yeah, me too - though only for devices that have an external impact, for
> things that are internal only (eg, a crypto engine) it makes sense to
> enable them by default since they should normally be usable regardless
> of the system configuration.

(+ DT ML)

Makes sense but I need to get the opinions from DT guys...

- Kukjin
