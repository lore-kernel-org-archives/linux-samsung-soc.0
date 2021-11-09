Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6ADC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 08:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5536F61186
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 08:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239026AbhKIIhq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:37:46 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:34323 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237801AbhKIIhF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:37:05 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211109083416epoutp02f4ca88141b6f6c3849e1eb7f91caf6cf~10776XlMv2313923139epoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Nov 2021 08:34:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211109083416epoutp02f4ca88141b6f6c3849e1eb7f91caf6cf~10776XlMv2313923139epoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1636446856;
        bh=sDjLk9rcgA9y0q28nVaP2OBIx+ivFMlXTEkR/KyXoVg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=U1pkcnT4mDqIH6jDvBgsLLi/MEdXxhENe+WHHN8C+agTxBILOvUxU1UNs6VBITU+G
         cZqSaF1R3Q4XZEyhMNPkauSNio/uAinM72gOGG8sZK4kt4fc4RGhoJrR+EDLSPasSo
         TAbR7yfNqjt3eoVUHfa4LtFzPOozvCi+bZP9jJao=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20211109083416epcas1p4917cd677bcaf4ae3e52d144fc8e794e6~1077dvrkS0755107551epcas1p42;
        Tue,  9 Nov 2021 08:34:16 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.231]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4HpLql48Kfz4x9QF; Tue,  9 Nov
        2021 08:34:11 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        2F.37.21932.1823A816; Tue,  9 Nov 2021 17:34:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20211109083409epcas1p4e2a97bf92b6cfabede4899dea74953f8~1070xT-rC0755007550epcas1p4c;
        Tue,  9 Nov 2021 08:34:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211109083409epsmtrp2b0e79015d6563990f5b218b8a650946b~1070weqGY2878328783epsmtrp2G;
        Tue,  9 Nov 2021 08:34:09 +0000 (GMT)
X-AuditID: b6c32a38-929ff700000255ac-bb-618a32811dab
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.C9.08738.1823A816; Tue,  9 Nov 2021 17:34:09 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211109083408epsmtip1177ffa2b64eb40cf6a47f66304970b77~1070jbUd81133711337epsmtip1O;
        Tue,  9 Nov 2021 08:34:08 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Replace legacy gpio interface for gpiod
 interface
To:     =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
        krzysztof.kozlowski@canonical.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <66123482-1863-0646-87d6-bda61a4b7135@samsung.com>
Date:   Tue, 9 Nov 2021 17:45:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYCgU9BfmnCgYIvO@fedora>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmgW6jUVeiwcrpsha9504yWfzfNpHZ
        4srX92wWL+5dZLHY+PYHk8XZpjfsFpseX2O1uLxrDpvFjPP7mCzaWq6zW8yY/JLNgdtjVkMv
        m8febwtYPLZ/e8Dqcb/7OJPH5iX1Hn1bVjF6PPhY6vF5k1wAR1S2TUZqYkpqkUJqXnJ+SmZe
        uq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QnUoKZYk5pUChgMTiYiV9O5ui/NKS
        VIWM/OISW6XUgpScAtMCveLE3OLSvHS9vNQSK0MDAyNToMKE7IylrU/YC1pkK44f62NrYDwj
        3sXIySEhYCJx5Ot+pi5GLg4hgR2MEiu/7GYFSQgJfGKUOLnRFCLxmVFie9M9ti5GDrCOA/0V
        EPFdjBKfT29hhnDeM0rs//aLBaRbWCBE4u+dL2wgtojAaUaJ/01gHcwCPYwS5z8sYQdJsAmo
        SkxccR+siFfATqJ/w1FGEJtFQEViwaqzYGeICkRK/D25ixWiRlDi5MwnYAs4BdQktpw6BlbP
        LCAucevJfCYIW16ieetssIskBA5wSFycupQR4lEXieab+6FsYYlXx7ewQ9hSEp/f7WWDaGhm
        lJg44zQThNPBKHH38XUWiCpjif1LJzOBAoBZQFNi/S59iLCixM7fc6Gu4JN497WHFRJGvBId
        bUIQJUoSxy7egNorIXFhyUQ2CNtD4vSU26wTGBVnIfltFpJ/ZiH5ZxbC4gWMLKsYxVILinPT
        U4sNC0zg0Z2cn7uJEZyItSx2MM59+0HvECMTB+MhRgkOZiUR3ntHOxKFeFMSK6tSi/Lji0pz
        UosPMZoCQ3sis5Rocj4wF+SVxBuaWBqYmBkZm1gYmhkqifN+litMFBJITyxJzU5NLUgtgulj
        4uCUamCa0604S6PLQ3Pf4YlSN/zvv5g6fYOzgM+Gla/sXk7R+D9hutn/hpuqIv6f1/18E5cu
        GHo+zLD/m0Fz7pRTk59bB+nPVdSRc+C3EDx3a5JaU4XUceGm3R2sAb9ZuDrXlacmTnaKtZ1d
        V5Cl1rjm2ft2U/3lrG7lvpcPaEhaaL2VT1/33P9ayJ4XdxrPrJgRcTh5faRYa+UdxXsfszZs
        mWTp7V1r+uSw7c20e/xKZ8orI+oU959s0vy4n4ff5t7u97/+vpd7uidx0iWBF6553o0ujZs4
        b52fJf6VoTZ92sLCD6ZzT0nO5XCrnnDiqGuVQ76E6XnrYsVpO/+uvlBhUfVKeVFbzuyqh7dk
        V09IE29TYinOSDTUYi4qTgQAwKgl7E0EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSnG6jUVeiwd9WFovecyeZLP5vm8hs
        ceXrezaLF/cuslhsfPuDyeJs0xt2i02Pr7FaXN41h81ixvl9TBZtLdfZLWZMfsnmwO0xq6GX
        zWPvtwUsHtu/PWD1uN99nMlj85J6j74tqxg9Hnws9fi8SS6AI4rLJiU1J7MstUjfLoErY2nr
        E/aCFtmK48f62BoYz4h3MXJwSAiYSBzor+hi5OIQEtjBKPFs/mFWiLiExJatHBCmsMThw8UQ
        JW8ZJSbu2MnUxcjJISwQIvH3zhc2kISIwGlGiaZvn8EcZoEeRokdZ2eyg1QJCVRKdHbtZwWx
        2QRUJSauuM8GYvMK2En0bzjKCGKzCKhILFh1FqxGVCBSounEVqgaQYmTM5+wgNicAmoSW04d
        A6tnFlCX+DPvEjOELS5x68l8JghbXqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxSqYWFOem
        5xYbFhjlpZbrFSfmFpfmpesl5+duYgTHnZbWDsY9qz7oHWJk4mA8xCjBwawkwnvvaEeiEG9K
        YmVValF+fFFpTmrxIUZpDhYlcd4LXSfjhQTSE0tSs1NTC1KLYLJMHJxSDUzMC/uLd/uZMc7Y
        9/fwymxTMY/j14ujhOsjdu2+x/5v45tLZZZ9p3++mDXrreHUKxKa++zK1kV26U77ej/peg8r
        u46qc2Cw5tHr8ziOXWgWt9HfxJUr8JK9Xcj8oPnt1vbTq6fvLX2o9Xn/xRdCM3NqLYpKdv08
        1ztL9W5Cxa/fltld0vUbXffbux7z9Xswv17kYe0e/fVX/v5IDD59LftAyATvS+l2iZuffIvo
        PazqfyHwRcvn8s1CdSsnTbui3hMWwfCLdxXT4eAN76YUMc/9Hf9v6f1M/9Oz507/pXW93YKb
        5Y6LUl61yKEVpZsn7nBYpCrr/Hwdp3B9bViu3/MFDzcuj2W6JPBr5tPpJVL2SizFGYmGWsxF
        xYkAkL/8UCoDAAA=
X-CMS-MailID: 20211109083409epcas1p4e2a97bf92b6cfabede4899dea74953f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211102022027epcas1p2316ca67e11a73b86f6261f7e221ef388
References: <CGME20211102022027epcas1p2316ca67e11a73b86f6261f7e221ef388@epcas1p2.samsung.com>
        <YYCgU9BfmnCgYIvO@fedora>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

21. 11. 2. 오전 11:20에 Maíra Canal 이(가) 쓴 글:
> Considering the current transition of the GPIO subsystem, remove all
> dependencies of the legacy GPIO interface (linux/gpio.h and linux
> /of_gpio.h) and replace it with the descriptor-based GPIO approach.
> 

Applied.

Thanks,
Inki Dae

> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 42 +++++++++----------------
>  1 file changed, 14 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 8d137857818c..b0b1acb7e712 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -13,7 +13,6 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/irq.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_graph.h>
>  #include <linux/phy/phy.h>
>  #include <linux/regulator/consumer.h>
> @@ -265,7 +264,7 @@ struct exynos_dsi {
>  	struct clk **clks;
>  	struct regulator_bulk_data supplies[2];
>  	int irq;
> -	int te_gpio;
> +	struct gpio_desc *te_gpio;
>  
>  	u32 pll_clk_rate;
>  	u32 burst_clk_rate;
> @@ -1298,14 +1297,14 @@ static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
>  {
>  	enable_irq(dsi->irq);
>  
> -	if (gpio_is_valid(dsi->te_gpio))
> -		enable_irq(gpio_to_irq(dsi->te_gpio));
> +	if (dsi->te_gpio)
> +		enable_irq(gpiod_to_irq(dsi->te_gpio));
>  }
>  
>  static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
>  {
> -	if (gpio_is_valid(dsi->te_gpio))
> -		disable_irq(gpio_to_irq(dsi->te_gpio));
> +	if (dsi->te_gpio)
> +		disable_irq(gpiod_to_irq(dsi->te_gpio));
>  
>  	disable_irq(dsi->irq);
>  }
> @@ -1335,29 +1334,20 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
>  	int ret;
>  	int te_gpio_irq;
>  
> -	dsi->te_gpio = of_get_named_gpio(panel->of_node, "te-gpios", 0);
> -	if (dsi->te_gpio == -ENOENT)
> -		return 0;
> -
> -	if (!gpio_is_valid(dsi->te_gpio)) {
> -		ret = dsi->te_gpio;
> -		dev_err(dsi->dev, "cannot get te-gpios, %d\n", ret);
> +	dsi->te_gpio = devm_gpiod_get_optional(dsi->dev, "te", GPIOD_IN);
> +	if (IS_ERR(dsi->te_gpio)) {
> +		dev_err(dsi->dev, "gpio request failed with %ld\n",
> +				PTR_ERR(dsi->te_gpio));
>  		goto out;
>  	}
>  
> -	ret = gpio_request(dsi->te_gpio, "te_gpio");
> -	if (ret) {
> -		dev_err(dsi->dev, "gpio request failed with %d\n", ret);
> -		goto out;
> -	}
> -
> -	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
> +	te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
>  
>  	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
>  				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
>  	if (ret) {
>  		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
> -		gpio_free(dsi->te_gpio);
> +		gpiod_put(dsi->te_gpio);
>  		goto out;
>  	}
>  
> @@ -1367,10 +1357,9 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
>  
>  static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>  {
> -	if (gpio_is_valid(dsi->te_gpio)) {
> -		free_irq(gpio_to_irq(dsi->te_gpio), dsi);
> -		gpio_free(dsi->te_gpio);
> -		dsi->te_gpio = -ENOENT;
> +	if (dsi->te_gpio) {
> +		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
> +		gpiod_put(dsi->te_gpio);
>  	}
>  }
>  
> @@ -1745,9 +1734,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>  	if (!dsi)
>  		return -ENOMEM;
>  
> -	/* To be checked as invalid one */
> -	dsi->te_gpio = -ENOENT;
> -
>  	init_completion(&dsi->completed);
>  	spin_lock_init(&dsi->transfer_lock);
>  	INIT_LIST_HEAD(&dsi->transfer_list);
> 
