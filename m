From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RESEND RFT PATCH 0/2] mfd: max14577: Allow the driver to be
 built as a module
Date: Wed, 15 Jun 2016 10:03:00 -0400
Message-ID: <c48bf11e-8a39-6cbf-2016-284d91f3dfb6@osg.samsung.com>
References: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60196 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753390AbcFOODL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 10:03:11 -0400
In-Reply-To: <1464280340-13228-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>

Hello,

On 05/26/2016 12:32 PM, Javier Martinez Canillas wrote:
> 
> This series is similar to [0] and allows the max14577 PMIC MFD driver to
> be built as a module. Currently the Kconfig symbol for the driver is a
> boolean but there isn't really a reason for this restriction.
> 
> Chanwoo Choi tried to test the original post but found a build issue [1].
> The fix for that issue landed in v4.6 so I'm resending this series now
> that there are no in-flight dependencies anymore.
> 
> The patches have been just built tested because I don't have any of the
> boards using this driver, so testing will be highly appreciated.
> 
> [0]: https://lkml.org/lkml/2016/2/11/857
> [1]: https://lkml.org/lkml/2016/3/17/546
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (2):
>   mfd: max14577: Use module_init() instead of subsys_initcall()
>   mfd: max14577: Allow driver to be built as a module
> 
>  drivers/mfd/Kconfig    | 4 ++--
>  drivers/mfd/max14577.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Any comments about these patches?

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
