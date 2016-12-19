From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v8 1/8] soc: samsung: add exynos chipid driver support
Date: Mon, 19 Dec 2016 18:59:08 +0530
Message-ID: <9b64f5c0-e289-9091-c784-ae4bfad3caf5@samsung.com>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-2-git-send-email-pankaj.dubey@samsung.com>
 <CGME20161219120000epcas1p1904dfec707de0ce20341279f354d74dc@epcas1p1.samsung.com>
 <ceba534d-108d-9ac4-d29c-c2a55af49849@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37234 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752668AbcLSN0i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Dec 2016 08:26:38 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OIF00IVYPCCOD90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Dec 2016 22:26:36 +0900 (KST)
In-reply-to: <ceba534d-108d-9ac4-d29c-c2a55af49849@fivetechno.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Markus Reichl <m.reichl@fivetechno.de>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, arnd@arndb.de, geert+renesas@glider.be, m.szyprowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Markus,

On Monday 19 December 2016 05:29 PM, Markus Reichl wrote:
> Hi Pankaj,
> 
> tested your patches 1/8 and 2/8 + Javiers diff for verbose output: 
> https://www.spinics.net/lists/linux-samsung-soc/msg56576.html
> 
> on Odroid U3:
> [    0.080178] Exynos: CPU[UNKNOWN] CPU_REV[0x20] PKG_ID[0x602d058] AUX_INFO[0x0] 
> on Odroid X:
> [    0.080169] Exynos: CPU[UNKNOWN] CPU_REV[0x11] PKG_ID[0x1b0f6008] AUX_INFO[0x0] 
> 
> XU4:	 [    0.080039] Exynos: CPU[EXYNOS5800] CPU_REV[0x1] PKG_ID[0x1c04832a] AUX_INFO[0x43] 
> XU3:	 [    0.080034] Exynos: CPU[EXYNOS5800] CPU_REV[0x1] PKG_ID[0x1604832a] AUX_INFO[0x43] 
> XU3-lite:[    0.080033] Exynos: CPU[EXYNOS5800] CPU_REV[0x1] PKG_ID[0x5a12832a] AUX_INFO[0x13000054] 
> 
> Regards,
> --
> Markus Reichl

Thanks for testing and letting us know.

Hopefully this driver will be of more use in near future, as Javiers
pointed out it can help us to select better ASV tables based on PKG_ID
and AUX_INFO. Even though these fields are not part of the driver in my
patch, it can be extended as per need.

Thanks,
Pankaj Dubey
