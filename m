From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v2] regulator: s2mps11: Simplify expression used in
 BUILD_BUG_ON
Date: Thu, 18 Feb 2016 10:46:10 +0900
Message-ID: <20160218014610.GJ10719@samsunx.samsung>
References: <1455755707-16844-1-git-send-email-k.kozlowski@samsung.com>
 <20160218013705.GI10719@samsunx.samsung> <56C520A7.40201@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53452 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422771AbcBRBqW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 20:46:22 -0500
Content-disposition: inline
In-reply-to: <56C520A7.40201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jacob.e.keller@intel.com, Arnd Bergmann <arnd@arndb.de>

> >> Following BUILD_BUG_ON using a variable fails for some of the compilers
> >> and optimization levels (reported for gcc 4.9):
> >> 	var = ARRAY_SIZE(s2mps15_regulators);
> >> 	BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
> >> Fix this by using ARRAY_SIZE directly.
> >>
> >> Additionally add missing BUILD_BUG_ON check for S2MPS15 device (the
> >> check ensures that internal arrays are big enough to hold data for all
> >> of regulators on all devices).
> >>
> >> Reported-by: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>
> > 
> > [...]
> > 
> >>  	case S2MPS11X:
> >>  		s2mps11->rdev_num = ARRAY_SIZE(s2mps11_regulators);
> > 
> > Why don't we remove rdev_num at all? It's not used that much
> > other than in the probe function.
> 
> Remove from probe? It is used in probe and removal would make the code
> more complicated than it should be.

no, I mean remove it from s2mps11_info. Other than in the probe
this value is used only once in s2mps11_pmic_dt_parse() (which is
called by probe()).

Andi
