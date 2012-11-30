From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 6/7] Samsung devel-3 for v3.8
Date: Fri, 30 Nov 2012 09:33:52 -0800
Message-ID: <20121130173352.GE697@quad.lixom.net>
References: <50B557CE.7050909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33036 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757288Ab2K3Rdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Nov 2012 12:33:52 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so489859pad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Nov 2012 09:33:52 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <50B557CE.7050909@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

On Wed, Nov 28, 2012 at 09:16:14AM +0900, Kukjin Kim wrote:
> Arnd, Olof
> 
> This is including Samsung small updates(developments) for v3.8.
> 
> add node PL330 MDMA1 and UART3 for DEBUG_LL and secondary cpu
> bring-up for exynos4412.
> 
> Please pull from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/devel-samsung-3

Please try to avoid these "devel" branches -- call them a proper topic
instead. These seem to be:

> Bartlomiej Zolnierkiewicz (1):
>       ARM: dts: add node for PL330 MDMA1 controller for exynos4

That's a dt patch.

> 
> Olof Johansson (1):
>       ARM: EXYNOS: add UART3 to DEBUG_LL ports

This is a soc support patch, or maybe driver.

> Tomasz Figa (1):
>       ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412

That's another soc support patch.


I will pull this into next/soc since 2 out of the three patches belong there.


-Olof
