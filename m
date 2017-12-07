From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH 0/3] i2c: exynos5: bus recovery implementation
Date: Thu, 07 Dec 2017 16:36:07 +0900
Message-ID: <20171207073607.GB1355@gangnam.samsung>
References: <CGME20171130143017eucas1p172b94622814eff172a27176c82f6e6fe@eucas1p1.samsung.com>
        <20171130143007.30258-1-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34588 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752142AbdLGHgK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 02:36:10 -0500
Content-disposition: inline
In-reply-to: <20171130143007.30258-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Hi Andrzej,

> This patchset adds bus recovery functionality to Exynos HSI2C, it is used in
> case of transmission timeouts.
> Internal tests shows that it significantly improves I2C transmissions.
> 
> Andi, could you take a look at it/test, feedback welcome.
> 
> Later, I will post also patches to MHL chip which uses this functionality.
> MHL chip has known bug of being in incorrect state after hard reset,
> I2C bus recovery cures it.
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (3):
>   i2c: exynos5: change internal transmission timeout to 100ms
>   i2c: exynos5: implement bus recovery functionality
>   i2c: exynos5: do not check TRANS_STATUS in case of Exynos7 variant

Thanks for the patches, they look good and I tested them.

You can add for all three

Reviewed-by: Andi Shyti <andi.shyti@samsung.com>
Tested-by: Andi Shyti <andi.shyti@samsung.com>

Thanks,
Andi
