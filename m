Return-Path: <SRS0=luaX=4P=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E265BC4BA3B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 08:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D2F62467F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Feb 2020 08:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Kgbbc3jA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbgB0I6W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Feb 2020 03:58:22 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56084 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbgB0I6W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 03:58:22 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200227085820euoutp0213ca4b3d4d3627629a47451e02fceecc~3NqqattKE3189631896euoutp02h
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Feb 2020 08:58:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200227085820euoutp0213ca4b3d4d3627629a47451e02fceecc~3NqqattKE3189631896euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582793900;
        bh=qyf3f/4GPxGaihzml6Xs74mg5QxZbnvyO1n5g/vXoio=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Kgbbc3jAsyGxhEq/PfDMyzAU4Rfe6s8HLfZk3jsoylak6Gz+xWKcXqiYtx54QZC2Q
         9YgvmvjQW3f2S+saZq1ArjH14dLYe4j9mveNCogYlTzdq0Rue8xG8xdnQisgb7Szdb
         fM3AnNZeYWiQSgHWRyTFaPr0jVsPGeCbe3Tmlo+Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200227085820eucas1p2946723ec5017c334e4179f0857d65a8b~3NqqG1eNx0113001130eucas1p2F;
        Thu, 27 Feb 2020 08:58:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B9.DC.61286.BA4875E5; Thu, 27
        Feb 2020 08:58:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200227085819eucas1p205cbe0921a5711c2967e1e6bbca2e151~3NqpoiXQe3259732597eucas1p2-;
        Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200227085819eusmtrp292e2bc4033f73a05eefc88d2428e0f63~3Nqpn7xQL1945219452eusmtrp2S;
        Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-18-5e5784ab48c6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6B.66.07950.BA4875E5; Thu, 27
        Feb 2020 08:58:19 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200227085819eusmtip2e3b4d906f8248118a379ff2787c57084~3NqpS-LVX3065630656eusmtip2H;
        Thu, 27 Feb 2020 08:58:19 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: dsi: fix workaround for the legacy clock
 name
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <93f7a68a-580e-9e1b-27fa-35726a34a12f@samsung.com>
Date:   Thu, 27 Feb 2020 09:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220123012.19179-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djPc7prWsLjDLZ8Z7LYOGM9q8WVr+/Z
        LGac38dksfbIXXaLGZNfsjmwetzvPs7k0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBlzf55g
        LuiSqjiyZhtbA2OTWBcjJ4eEgInE/Cn7GLsYuTiEBFYwSnTvnsQO4XxhlOjfe40ZwvnMKDH/
        /2ZmmJbFz6awQSSWM0ps2fKKCcJ5yyixefFJoCp2DmGBAInlBiD1IgKlEnP/H2MHsZkFkiR2
        rupkBbHZBDQl/m6+yQZi8wrYSdxa/QXMZhFQlVhwZjnYLlGBCIlp2/8xQtQISpyc+YQFxOYE
        qj+2aj4zxEx5ieats6FscYlbT+YzQdzZzy7RtSmwi5EDyHaRWPhWAyIsLPHq+BZ2CFtG4v9O
        mPJ6ifsrWsD+lRDoYJTYumEn1L/WEnfO/WIDmcMMdPP6XfoQYUeJlwevs0CM55O48VYQ4gI+
        iUnbpjNDhHklOtqEIKoVJe6f3Qo1UFxi6YWvbBMYlWYh+WsWkl9mIfllFsLeBYwsqxjFU0uL
        c9NTiw3zUsv1ihNzi0vz0vWS83M3MQKTyul/xz/tYPx6KekQowAHoxIPr0RCWJwQa2JZcWXu
        IUYJDmYlEd6NX0PjhHhTEiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl
        4uCUamCcUvZxJf/USZOrikuCn3yoP6hypdXayv2d1LYH3583Vqx49Uh1+6rX5zU5n/inFzcv
        nlQkfGDCsR8eUnmGQsE/WOrbVliwLt3RuyH1Q61EzIu57o07c47UxvjeeZyaKLfmr4LzvvBn
        1s0lu/N7Wxx02K/L2H/iOb1k2fYVTMoZ204+mPtL+aaMEktxRqKhFnNRcSIA2DL5PSYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7qrW8LjDC5+l7bYOGM9q8WVr+/Z
        LGac38dksfbIXXaLGZNfsjmwetzvPs7k0bdlFaPH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlzf55gLuiSqjiyZhtbA2OTWBcjJ4eE
        gInE4mdT2LoYuTiEBJYySuw6e5sRIiEusXv+W2YIW1jiz7UuqKLXjBJ/Dk9lAUkIC/hJHN5x
        nA3EFhEolXjVfx+omYODWSBJYt8lBYj6iYwSa1ftBKthE9CU+Lv5JpjNK2AncWv1FzCbRUBV
        YsGZ5WDLRAUiJB5PbGeEqBGUODnzCdguTqD6Y6vmg9UwC6hL/Jl3CcqWl2jeOhvKFpe49WQ+
        0wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqNp27GfW3Yw
        dr0LPsQowMGoxMNbkBQWJ8SaWFZcmXuIUYKDWUmEd+PX0Dgh3pTEyqrUovz4otKc1OJDjKZA
        z01klhJNzgdGel5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsa4
        T7Ya0rwMC9ZzvqmP8Gjcs3qNf+mjW9HBi0/9Pr3gssr2M79Pni6M3rQ1IX+aSoXdJ0+d2YuO
        7pTkmFtjqH8ge+e9tZoaAVsvvJliJ7Pi0crvUXFKzg+6xVJ25y60jY15YD3vjvmt2bY+O/Yq
        Wc77tqXZvYKXl/0C71wxzsrp3Mo/RDNrHmxVYinOSDTUYi4qTgQA+X3RWrwCAAA=
X-CMS-MailID: 20200227085819eucas1p205cbe0921a5711c2967e1e6bbca2e151
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18
References: <CGME20200220123022eucas1p21d015e2880680ae1c16e4b2a1d0ebb18@eucas1p2.samsung.com>
        <20200220123012.19179-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20.02.2020 13:30, Marek Szyprowski wrote:
> Writing to the built-in strings arrays doesn't work if driver is loaded
> as kernel module. This is also considered as a bad pattern. Fix this by
> adding a call to clk_get() with legacy clock name. This fixes following
> kernel oops if driver is loaded as module:
>
> Unable to handle kernel paging request at virtual address bf047978
>  pgd = (ptrval)
>  [bf047978] *pgd=59344811, *pte=5903c6df, *ppte=5903c65f
>  Internal error: Oops: 80f [#1] SMP ARM
>  Modules linked in: mc exynosdrm(+) analogix_dp rtc_s3c exynos_ppmu i2c_gpio
>  CPU: 1 PID: 212 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200219 #326
>  videodev: Linux video capture interface: v2.00
>  Hardware name: Samsung Exynos (Flattened Device Tree)
>  PC is at exynos_dsi_probe+0x1f0/0x384 [exynosdrm]
>  LR is at exynos_dsi_probe+0x1dc/0x384 [exynosdrm]
>  ...
>  Process systemd-udevd (pid: 212, stack limit = 0x(ptrval))
>  ...
>  [<bf03cf14>] (exynos_dsi_probe [exynosdrm]) from [<c09b1ca0>] (platform_drv_probe+0x6c/0xa4)
>  [<c09b1ca0>] (platform_drv_probe) from [<c09afcb8>] (really_probe+0x210/0x350)
>  [<c09afcb8>] (really_probe) from [<c09aff74>] (driver_probe_device+0x60/0x1a0)
>  [<c09aff74>] (driver_probe_device) from [<c09b0254>] (device_driver_attach+0x58/0x60)
>  [<c09b0254>] (device_driver_attach) from [<c09b02dc>] (__driver_attach+0x80/0xbc)
>  [<c09b02dc>] (__driver_attach) from [<c09ade00>] (bus_for_each_dev+0x68/0xb4)
>  [<c09ade00>] (bus_for_each_dev) from [<c09aefd8>] (bus_add_driver+0x130/0x1e8)
>  [<c09aefd8>] (bus_add_driver) from [<c09b0d64>] (driver_register+0x78/0x110)
>  [<c09b0d64>] (driver_register) from [<bf038558>] (exynos_drm_init+0xe8/0x11c [exynosdrm])
>  [<bf038558>] (exynos_drm_init [exynosdrm]) from [<c0302fa8>] (do_one_initcall+0x50/0x220)
>  [<c0302fa8>] (do_one_initcall) from [<c03dd02c>] (do_init_module+0x60/0x210)
>  [<c03dd02c>] (do_init_module) from [<c03dbf44>] (load_module+0x1c0c/0x2310)
>  [<c03dbf44>] (load_module) from [<c03dc85c>] (sys_finit_module+0xac/0xbc)
>  [<c03dc85c>] (sys_finit_module) from [<c0301000>] (ret_fast_syscall+0x0/0x54)
>  Exception stack(0xd979bfa8 to 0xd979bff0)
>  ...
>  ---[ end trace db16efe05faab470 ]---
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Why did it worked with build-in driver remains mystery.


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 33628d85edad..08a8ce3f499c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1787,9 +1787,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
>  		if (IS_ERR(dsi->clks[i])) {
>  			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
> -				strcpy(clk_names[i], OLD_SCLK_MIPI_CLK_NAME);
> -				i--;
> -				continue;
> +				dsi->clks[i] = devm_clk_get(dev,
> +							OLD_SCLK_MIPI_CLK_NAME);
> +				if (!IS_ERR(dsi->clks[i]))
> +					continue;
>  			}
>  
>  			dev_info(dev, "failed to get the clock: %s\n",


