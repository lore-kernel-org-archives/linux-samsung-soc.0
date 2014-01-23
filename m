From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] regulator: s5m8767: Document new bindings for Buck9
 GPIO control
Date: Thu, 23 Jan 2014 08:37:01 +0100
Message-ID: <1390462621.25714.5.camel@AMDC1943>
References: <1390406848-20964-1-git-send-email-k.kozlowski@samsung.com>
 <1390406848-20964-3-git-send-email-k.kozlowski@samsung.com>
 <20140122194927.GZ17314@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43788 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831AbaAWHhG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 02:37:06 -0500
In-reply-to: <20140122194927.GZ17314@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Grant Likely <grant.likely@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Amit Daniel Kachhap <amit.daniel@samsung.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, 2014-01-22 at 19:49 +0000, Mark Brown wrote:
> On Wed, Jan 22, 2014 at 05:07:28PM +0100, Krzysztof Kozlowski wrote:
> > Add documentation for new bindings for controlling (enable/disable) the
> > Buck9 Converter by GPIO (BUCK9EN).
> 
> Your CC list for this is *very* large...
Hmmm... The get_maintainers produces such long list for any change in
Documentation/devicetree/bindings... I'll stop using it for this.

> 
> > +	- s5m8767,pmic-ext-control-enable: regulator can be enabled/disabled
> > +		by GPIO (valid only for buck9).
> > +	- s5m8767,pmic-ext-control-gpio: GPIO specifier for one GPIO
> > +		controlling this regulator (valid only for buck9).
> > +		This property is required when 's5m8767,pmic-ext-control-enable' is specified.
> 
> In what situation might the GPIO be present but not usable - can't we
> just use the presence of the GPIO property?  Also GPIO properties are
> supposed to be always "-gpios".
Remove the "s5m8767,pmic-ext-control-enable" and use only
"s5m8767,pmic-ext-control-gpios"? Sure, that makes sense. Thanks for
idea.


Best regards,
Krzysztof
