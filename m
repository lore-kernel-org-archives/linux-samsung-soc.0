From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 09/14] regulator: s2mps11: Add support for S2MPS14
 regulators
Date: Fri, 14 Feb 2014 08:33:40 +0100
Message-ID: <1392363220.29133.4.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-10-git-send-email-k.kozlowski@samsung.com>
 <20140213191028.GC28112@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:27379 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751492AbaBNHdo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Feb 2014 02:33:44 -0500
In-reply-to: <20140213191028.GC28112@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>

On Thu, 2014-02-13 at 19:10 +0000, Mark Brown wrote:
> On Thu, Feb 13, 2014 at 10:14:02AM +0100, Krzysztof Kozlowski wrote:
> > Add support for S2MPS14 PMIC regulators to s2mps11 driver. The S2MPS14
> > has fewer BUCK-s and LDO-s than S2MPS11. It also does not support
> > controlling the BUCK ramp delay.
> 
> How different are the other Samsung PMICs?  They share the core driver
> code and this makes the driver more parameterisable so perhaps it means
> the others could be merged in here too.

With some effort the s2mps11 and s5m8767 regulator drivers can be
merged. The s5m8767 shares most of the features with s2mps11 and adds
some new stuff (i.e. GPIO control over BUCK DVS, low power mode for
opmode). Anyway it was easier to add support for S2MPS14 to S2MPS11 than
to merge everything now.
