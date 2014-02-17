From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 11/14] regulator: s2mps11: Add opmode for S2MPS14
 regulators
Date: Mon, 17 Feb 2014 09:09:46 +0100
Message-ID: <1392624586.3755.13.camel@AMDC1943>
References: <1392282847-25444-1-git-send-email-k.kozlowski@samsung.com>
 <1392282847-25444-12-git-send-email-k.kozlowski@samsung.com>
 <20140213192835.GD28112@sirena.org.uk> <1392365712.29133.16.camel@AMDC1943>
 <20140214205915.GW4451@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:30965 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750956AbaBQIJu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Feb 2014 03:09:50 -0500
In-reply-to: <20140214205915.GW4451@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>

On Fri, 2014-02-14 at 20:59 +0000, Mark Brown wrote:
> On Fri, Feb 14, 2014 at 09:15:12AM +0100, Krzysztof Kozlowski wrote:
> 
> > My initial idea was to do this similarly to the S5M8767 regulator (where
> > there is also 4th mode: low power). The presence of GPIO in DTS can
> > simplify the bindings but on the other hand it wouldn't be compatible
> > with S5M8767 regulator driver. This may complicate the merge of these
> > drivers.
> 
> They can always use separate ops.
> 
> > What is your opinion on this - should I abandon the "op_mode" idea and
> > use presence of GPIO?
> 
> Yes, that's better - especially since the framework has support for
> enable GPIOs.  It can do things like handle cases where the hardware has
> tied the enables for several regulators together so they all need to be
> enabled and disabled as one.

OK. I'll rewrite this patch and send later when S2MPS14 will be
accepted.

Best regards,
Krzysztof
