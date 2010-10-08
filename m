From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: missing definition of 's3c_gpio_getpull' function in 'plat-samsung'
Date: Fri, 08 Oct 2010 15:50:07 +0900
Message-ID: <00e301cb66b5$14ce28c0$3e6a7a40$%kim@samsung.com>
References: <000301cb66af$276b8960$76429c20$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57183 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822Ab0JHGuE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 02:50:04 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9Y000J3LND5190@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 15:50:02 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9Y00LQ6LNDEU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 08 Oct 2010 15:50:01 +0900 (KST)
In-reply-to: <000301cb66af$276b8960$76429c20$@com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Daein Moon' <moon9124@samsung.com>, ben-linux@fluff.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Daein Moon wrote:
> 
> Hi Ben Dooks and Kukjin,
> 
> I found an issue about s3c_gpio_getpull API.
> 
> The 'plat-samsung' provides 's3c_gpio_setpull' and 's3c_gpio_getpull'
> to set and get pull-{none|up|down} of GPIO. But there is no
> 's3c_gpio_getpull' definition in 'arch/arm/plat-samsung/gpio-config.c',
> and there is only declaration in the corresponding header file.
> 
> 's3c_gpio_getpull' isn't supported/used. So if providing this api, its
> definition should be inserted.
> 
> Otherwise, code that is used to provide s3c_gpio_getpull including
> following code should be removed.
> 
> arch/arm/plat-samsung/include/plat/gpio-cfg.h:
> 	extern s3c_gpio_pull_t s3c_gpio_getpull(unsigned int pin);
> 
> arch/arm/mach-{s3c*|s5p*}/gpiolib.c:
>         .get_pull       = s3c_gpio_getpull_updown,
> 
> 
> What do you think about that?
> 
Oh...you mean s3c_gpio_getpull()?
Yes right..there is no it in gpio-config.c..maybe missed.

Anyway...in this case, I think to add missed function is better.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
