Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E51C64E7A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 23:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0BDC2224B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Dec 2020 23:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727221AbgLAXdE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Dec 2020 18:33:04 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:54076 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbgLAXdD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 18:33:03 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201201233220epoutp02cbdf8264400ec6799f955ea1a7ec9eea~Mu7Imf83P1186611866epoutp02J
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Dec 2020 23:32:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201201233220epoutp02cbdf8264400ec6799f955ea1a7ec9eea~Mu7Imf83P1186611866epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606865540;
        bh=7AzdPkw6oANEZKed//wNXTRa9lc96TKk29La8YlIxjw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=J30G6QZMzIijWnZlrx9oujslx92sqU8KKCpnX3p+8I2PI7bBn/1LEqp2d6+NcwuYu
         BfnZLNw/3EUk1/pVepQ9cX4/6rlKrZPd4NxQbD8ztGRczYMEYKgXISzorXqFF0NA6W
         Mlx94P4MeJZXlDcYHT6+HzpT0vZ8mn8d/OoKi2nc=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201201233220epcas1p1aea51ccd355fa264a96dd0a1dc2c1299~Mu7IOtfEl2183221832epcas1p1J;
        Tue,  1 Dec 2020 23:32:20 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.155]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4Clz0L2xr8z4x9Pr; Tue,  1 Dec
        2020 23:32:18 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.2F.10463.282D6CF5; Wed,  2 Dec 2020 08:32:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201201233217epcas1p3edabd7a5081ef85badfe1e57ffcaa1c6~Mu7FyDVB92958729587epcas1p3P;
        Tue,  1 Dec 2020 23:32:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201201233217epsmtrp1afb06b68ba5560fdaf067982eeabb923~Mu7FxT7v41374713747epsmtrp1z;
        Tue,  1 Dec 2020 23:32:17 +0000 (GMT)
X-AuditID: b6c32a38-efbff700000028df-b9-5fc6d2823ff9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1E.2A.08745.182D6CF5; Wed,  2 Dec 2020 08:32:17 +0900 (KST)
Received: from [10.113.113.235] (unknown [10.113.113.235]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201201233217epsmtip2053cedc3b2f8004b4476de2a88cfbf34~Mu7FfKuue1433414334epsmtip2c;
        Tue,  1 Dec 2020 23:32:17 +0000 (GMT)
Subject: Re: [PATCH] phy: samsung: Fix build break in USB2 PHY driver for
 Exynos5420 SoCs
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Willy Wolff <willy.mh.wolff.ml@gmail.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Markus Reichl <m.reichl@fivetechno.de>
From:   Jaehoon Chung <jh80.chung@samsung.com>
Message-ID: <6077e585-fcef-6fc1-f736-aebf3d53c091@samsung.com>
Date:   Wed, 2 Dec 2020 08:32:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201170905.16153-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRmVeSWpSXmKPExsWy7bCmvm7TpWPxBjNuiVhsnLGe1eLC0x42
        i/PnN7BbXN41h81ixvl9TBYvj/xgtFh75C67xfppP1ktDr9pZ7XYeecEs8W3E48YHbg9bt2p
        99g56y67x6ZVnWwefVtWMXocv7GdyePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hT
        MwNDXUNLC3MlhbzE3FRbJRefAF23zByg85QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqp
        BSk5BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RmNy6awFmwXrLiyyreBcTdfFyMHh4SAiUTP
        0dAuRi4OIYEdjBKvJ31lhXA+MUp0fb7MCOF8ZpTYMvMMkMMJ1vG6fR8TRGIXo8SJi19YIJz3
        jBJnLj5lAakSFoiW+LvuLTOILSIQInH/6QuwucwCv5gkjm+4DDaKTUBHYvu340wgNq+AncSf
        X3PA4iwCKhIff+8Gs0UFIiV2Pn3JDlEjKHFy5hOwBZxA9Su+7mAFsZkFxCVuPZnPBGHLS2x/
        O4cZZJmEwBYOiZO7JzFB3O0isWniIyhbWOLV8S3sELaUxMv+Nii7WmJX8xmo5g5GiVvbmqAa
        jCX2L53MBAoyZgFNifW79CHCihI7f89lhFjMJ/Huaw8rJFR5JTrahCBKVCQuvX7JBLPq7pP/
        rBC2h8SuqbuYJjAqzkLy2iwk78xC8s4shMULGFlWMYqlFhTnpqcWGxaYIMf2JkZw0tWy2ME4
        9+0HvUOMTByMhxglOJiVRHhZ/h2JF+JNSaysSi3Kjy8qzUktPsRoCgzsicxSosn5wLSfVxJv
        aGpkbGxsYWJoZmpoqCTO+0e7I15IID2xJDU7NbUgtQimj4mDU6qByfXs9hse3J7uoZP+HY+X
        fyIQJ9u4/umKc/nHu763bnuaKTM/Z9W07+7M/PNDyzdNOP/6vGC5JEfPvPO3NHtdekUmT5RS
        rsvYcv75pbKZs9Zd3dK+wzMibevswD+lL7lWL2Fi2ptutvzzlkmJqedOvP9frvCQsbY503mO
        A+dXuUPFu5jDb9qnsR+RvshwKktdLWnXsivr43b9tV2hyP+1Kmut+LJJz5X2PTcMW5PeKf18
        oy1zRXGU4pLtRVwemzj5bkUGnmyWr7EKTzGyvzd5pUigjcf3faUCcit37baQDxeS3nD85Pxy
        9q8LT+p/3CC78/WLu9Lqp5rXnhI/fYfJef2snZeYzlVfYdnH39H9nkmJpTgj0VCLuag4EQCL
        qUu/QwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJXrfx0rF4g56T2hYbZ6xntbjwtIfN
        4vz5DewWl3fNYbOYcX4fk8XLIz8YLdYeuctusX7aT1aLw2/aWS123jnBbPHtxCNGB26PW3fq
        PXbOusvusWlVJ5tH35ZVjB7Hb2xn8vi8SS6ALYrLJiU1J7MstUjfLoEro3HZFNaC7YIVV1b5
        NjDu5uti5OSQEDCReN2+j6mLkYtDSGAHo8TJv0cYIRJSEp+fTmXrYuQAsoUlDh8uhqh5yyix
        6cNaVpAaYYFoib/r3jKD1IgIhEgsfK8HUsMs8IdJ4uviT2wgNUICExkl/k7VBbHZBHQktn87
        zgRi8wrYSfz5NQdsF4uAisTH37sZQeaICkRK7NxhCVEiKHFy5hMWEJsTqHzF1x1ga5kF1CX+
        zLvEDGGLS9x6Mp8JwpaX2P52DvMERqFZSNpnIWmZhaRlFpKWBYwsqxglUwuKc9Nziw0LjPJS
        y/WKE3OLS/PS9ZLzczcxgiNMS2sH455VH/QOMTJxMB5ilOBgVhLhZfl3JF6INyWxsiq1KD++
        qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotgskwcnFINTGWSbxTSk6+erdJpv/1lg/TX
        rCNn4nLKJ4Y73S+PeiBQJcnq/kTfac5j4xVrn7oVdBlks2TmNS1+8NrrZrSzYbWc6Zmm9IVN
        Uy5u/SNy1Oyh0O6VldPftP1/a+1xl3tVUvvSnEOKl2yN/R/nrE3cLCUjVs2ketfnNUPok1Oy
        +gc27HCbGPtnf73q6fv3ZCfl+vztrFeaF1FcczpjpXqUf/6p4xfXHdnJOiHquurjSztWzpq2
        Xs06UuuPyT2h7b02s8oO3fnr8F4vM1x+ruQ9zckPAsVWLohrzrJS7gySsTUpLjy33z0+reUv
        8y+rVx2MAS9nH/S6cfe5Qb63n2Xykiv8i/QNzyd3PHbes8t6mhJLcUaioRZzUXEiAEbxxzsf
        AwAA
X-CMS-MailID: 20201201233217epcas1p3edabd7a5081ef85badfe1e57ffcaa1c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85
References: <CGME20201201170918eucas1p2a34ca6e90ec710400a7a5d7121197d85@eucas1p2.samsung.com>
        <20201201170905.16153-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/2/20 2:09 AM, Marek Szyprowski wrote:
> Exynos5420 variant of USB2 PHY is handled by the same code as the
> Exynos5250 one. Introducing a separate Kconfig symbol for it was an
> over-engineering, which turned out to cause build break for certain
> configurations:
> 
> ERROR: modpost: "exynos5420_usb2_phy_config" [drivers/phy/samsung/phy-exynos-usb2.ko] undefined!
> 
> Fix this by removing PHY_EXYNOS5420_USB2 symbol and using
> PHY_EXYNOS5250_USB2 also for Exynos5420 SoCs.
> 
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Fixes: 81b534f7e9b2 ("phy: samsung: Add support for the Exynos5420 variant of the USB2 PHY")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> Vinod: this a fix to the patch merged yesterday. If you want me to resend
> a fixed initial patch, let me know.
> ---
>  drivers/phy/samsung/Kconfig            | 7 +------
>  drivers/phy/samsung/phy-samsung-usb2.c | 2 --
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
> index 0f51d3bf38cc..e20d2fcc9fe7 100644
> --- a/drivers/phy/samsung/Kconfig
> +++ b/drivers/phy/samsung/Kconfig
> @@ -64,12 +64,7 @@ config PHY_EXYNOS4X12_USB2
>  config PHY_EXYNOS5250_USB2
>  	bool
>  	depends on PHY_SAMSUNG_USB2
> -	default SOC_EXYNOS5250
> -
> -config PHY_EXYNOS5420_USB2
> -	bool
> -	depends on PHY_SAMSUNG_USB2
> -	default SOC_EXYNOS5420
> +	default SOC_EXYNOS5250 || SOC_EXYNOS5420
>  
>  config PHY_S5PV210_USB2
>  	bool "Support for S5PV210"
> diff --git a/drivers/phy/samsung/phy-samsung-usb2.c b/drivers/phy/samsung/phy-samsung-usb2.c
> index 3908153f2ce5..ec2befabeea6 100644
> --- a/drivers/phy/samsung/phy-samsung-usb2.c
> +++ b/drivers/phy/samsung/phy-samsung-usb2.c
> @@ -127,8 +127,6 @@ static const struct of_device_id samsung_usb2_phy_of_match[] = {
>  		.compatible = "samsung,exynos5250-usb2-phy",
>  		.data = &exynos5250_usb2_phy_config,
>  	},
> -#endif
> -#ifdef CONFIG_PHY_EXYNOS5420_USB2
>  	{
>  		.compatible = "samsung,exynos5420-usb2-phy",
>  		.data = &exynos5420_usb2_phy_config,
> 

