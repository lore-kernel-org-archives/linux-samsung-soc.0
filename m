From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v7 1/2] soc: samsung: add exynos chipid driver support
Date: Mon, 07 Nov 2016 09:32:43 +0100
Message-ID: <1708820.kPMIhrYGr6@wuerfel>
References: <1478347427-28409-1-git-send-email-pankaj.dubey@samsung.com> <1478347427-28409-2-git-send-email-pankaj.dubey@samsung.com> <cafc255a-3bdb-7eb2-1092-545866752858@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:56158 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbcKGIdi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 03:33:38 -0500
In-Reply-To: <cafc255a-3bdb-7eb2-1092-545866752858@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, geert+renesas@glider.be, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Monday, November 7, 2016 8:35:47 AM CET Marek Szyprowski wrote:
> This approach is a bit error prone. You have already missed Exynos5410
> and early Exynos 4210 are not detected because of the incorrect SOC MASK.
> IMHO you should replace above code and defines with a simple array,
> where each ID is present only once, so it will be much easier to add
> future SoCs:
> 
> static const struct exynos_soc_id {
>          const char *name;
>          unsigned int id;
>          unsigned int mask;
> } soc_ids[] = {
>          { "EXYNOS3250", 0xE3472000, 0xFFFFF000 },
>          { "EXYNOS4210", 0x43200000, 0xFFFE0000 },
>          { "EXYNOS4212", 0x43220000, 0xFFFE0000 },
>          { "EXYNOS4412", 0xE4412000, 0xFFFE0000 },
>          { "EXYNOS4415", 0xE4415000, 0xFFFE0000 },
>          { "EXYNOS5250", 0x43520000, 0xFFFFF000 },
>          { "EXYNOS5260", 0xE5260000, 0xFFFFF000 },
>          { "EXYNOS5410", 0xE5410000, 0xFFFFF000 },
>          { "EXYNOS5420", 0xE5420000, 0xFFFFF000 },
>          { "EXYNOS5440", 0xE5440000, 0xFFFFF000 },
>          { "EXYNOS5800", 0xE5422000, 0xFFFFF000 },
> };

Good idea

> 
> I'm also not sure about Exynos 4415, which has been scheduled for removal.

I'd vote for leaving it in the driver, and possibly adding other
models even if we don't support them in the other drivers, if
only for documentation purposes.

	Arnd
