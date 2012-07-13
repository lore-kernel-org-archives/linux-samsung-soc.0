From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] ARM: exynos: Enable TMU support in exynos platforms
Date: Fri, 13 Jul 2012 07:41:38 -0700
Message-ID: <20120713144138.GB25264@roeck-us.net>
References: <1342084543-8302-1-git-send-email-amit.daniel@samsung.com>
 <117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:58741 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753366Ab2GMOli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 10:41:38 -0400
Content-Disposition: inline
In-Reply-To: <117e01cd60ea$99f24e60$cdd6eb20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, amit.kachhap@linaro.org, linux-samsung-soc@vger.kernel.org, lenb@kernel.org, "'Rafael J. Wysocki'" <rjw@sisk.pl>

On Fri, Jul 13, 2012 at 08:28:18PM +0900, Kukjin Kim wrote:
> Amit Daniel Kachhap wrote:
> > 
> > These TMU enablement patches are needed for exynos4 and exynos5 TMU
> > driver patches sent earlier. The link for those are
> > http://www.spinics.net/lists/lm-sensors/msg35858.html.
> > 
> How was going on above patches? I can't see them you said in linux-next now,
> it means if I apply this series in my tree, problem will be happened :(
> 
> Note1: I've seen Rafael's updating exynos4_tmu patch which is using struct
> dev_pm_ops for pm and applied by Guenter.
> 
If that is in the way, I can drop it, to be applied after the move. Let me know.
There is now another patch pending, to convert the driver to use devm_ functions.
Please let me know what you want me to do with it.

> Note2: would be helpful if you could do adding me in Cc of exynos tmu
> patches...
> 
If you want to be copied, it might make sense to add yourself as maintainer for
this file. Otherwise you can not expect people to know.

Thanks,
Guenter
