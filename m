From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] regulator: s2mps11: Simplify expression used in BUILD_BUG_ON
Date: Thu, 18 Feb 2016 10:06:28 +0100
Message-ID: <2870104.0q2mccK2EB@wuerfel>
References: <1455755707-16844-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:62862 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425595AbcBRJGs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Feb 2016 04:06:48 -0500
In-Reply-To: <1455755707-16844-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jacob.e.keller@intel.com

On Thursday 18 February 2016 09:35:07 Krzysztof Kozlowski wrote:
> Following BUILD_BUG_ON using a variable fails for some of the compilers
> and optimization levels (reported for gcc 4.9):
>         var = ARRAY_SIZE(s2mps15_regulators);
>         BUILD_BUG_ON(S2MPS_REGULATOR_MAX < var);
> Fix this by using ARRAY_SIZE directly.
> 
> Additionally add missing BUILD_BUG_ON check for S2MPS15 device (the
> check ensures that internal arrays are big enough to hold data for all
> of regulators on all devices).
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I've verified that this is the exact patch I have successfully tested
on locally and in Olof's autobuilder which reported the problem.

>         case S2MPS15X:
>                 s2mps11->rdev_num = ARRAY_SIZE(s2mps15_regulators);
>                 regulators = s2mps15_regulators;
> +               BUILD_BUG_ON(S2MPS_REGULATOR_MAX < ARRAY_SIZE(s2mps15_regulators));
>                 break;
> 

My version did not add this line, but it seems correct.

Tested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
