From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH v3 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Wed, 27 Jan 2016 11:12:14 +0900
Message-ID: <20160127021214.GG14296@samsunx.samsung>
References: <1453836020-29579-1-git-send-email-javier@osg.samsung.com>
 <1453836020-29579-8-git-send-email-javier@osg.samsung.com>
 <20160127012230.GE14296@samsunx.samsung> <56A82331.5050403@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:32820 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbcA0CMX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 21:12:23 -0500
Content-disposition: inline
In-reply-to: <56A82331.5050403@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

> >>  		if (tm->tm_year < 100) {
> >>-			pr_warn("RTC can't handle year %d. Assume it's 2000.\n",
> >>-				1900 + tm->tm_year);
> >>+			dev_warn(info->dev,
> >>+				 "RTC can't handle year %d. Assume it's 2000\n",
> >>+				 1900 + tm->tm_year);
> >>  			return -EINVAL;
> >
> >Because we are returning an error value, why not use dev_err()?
> >
> 
> You are absolutely right. Since the driver was using pr_warn(), I used
> dev_warn() but dev_err() would had been correct.
> 
> If you don't mind I plan to do it as a follow up patch to avoid having
> to resend the whole series only for this change.

Fine for me!

Andi
