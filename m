Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D02AC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 06:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18C7323A63
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Dec 2020 06:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgLHGQK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Dec 2020 01:16:10 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:16027 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgLHGQK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Dec 2020 01:16:10 -0500
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201208061527epoutp048084b30518052e030084e59f944edce3~OqS0AF1GS0917009170epoutp04w
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Dec 2020 06:15:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201208061527epoutp048084b30518052e030084e59f944edce3~OqS0AF1GS0917009170epoutp04w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607408127;
        bh=MCSBMcdXRSGLji0RKI8J+aRk1IyyE5dMDdD8dDv4S64=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=dO4Epq7cWIOIqJeBnxPcsxDGkG6T44iPMF7foHGDexUznvtbS7TsjNGnZGrV/YxI5
         o1qOLa5s7i4Wh+APKK4U5wAZJ0i0F5cwFC32UpTqUAOH3hiQ6TWEkmlEVawyqDJbal
         A3Khzp3NEnj/sne7QMn6uE5+/QqWFPh6LVXPZ4oE=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20201208061527epcas5p4f05024d2a16c08fa604248939e59f12b~OqSzgmFG41826718267epcas5p4q;
        Tue,  8 Dec 2020 06:15:27 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        4C.CB.33964.FF91FCF5; Tue,  8 Dec 2020 15:15:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20201208061526epcas5p21b6561d7043f4f5c9538ee3c44f930fa~OqSzC_A7S2424624246epcas5p2u;
        Tue,  8 Dec 2020 06:15:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201208061526epsmtrp20aec4165e7778c25b600068050955ff9~OqSzCONs02350023500epsmtrp2a;
        Tue,  8 Dec 2020 06:15:26 +0000 (GMT)
X-AuditID: b6c32a4b-eb7ff700000184ac-af-5fcf19ff96bd
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.F3.08745.EF91FCF5; Tue,  8 Dec 2020 15:15:26 +0900 (KST)
Received: from pankajdubey02 (unknown [107.122.12.6]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201208061525epsmtip1450f4bac169943acb6e49305b12d6423~OqSxh-brJ1996619966epsmtip1_;
        Tue,  8 Dec 2020 06:15:24 +0000 (GMT)
From:   "Pankaj Dubey" <pankaj.dubey@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc:     "'Sylwester Nawrocki'" <snawrocki@kernel.org>,
        "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        "'Bartlomiej Zolnierkiewicz'" <b.zolnierkie@samsung.com>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>
In-Reply-To: <20201207190517.262051-4-krzk@kernel.org>
Subject: RE: [PATCH v2 3/4] soc: samsung: exynos-chipid: order list of SoCs
 by name
Date:   Tue, 8 Dec 2020 11:45:24 +0530
Message-ID: <000901d6cd29$851d9530$8f58bf90$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3Sc44zrAFnNObXiIFTUqq/KcsYAHd8rwKAbpw74ipDvwxkA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7bCmhu5/yfPxBnt2sVs8mLeNzeLvpGPs
        FhtnrGe1uP7lOavF+fMb2C02Pb7GanF51xw2ixnn9zFZrD1yl92i/elLZgcuj9+/JjF6bFrV
        yeaxeUm9R9+WVYwenzfJBbBGcdmkpOZklqUW6dslcGXc2TGFvaCBv+Lr91+MDYzbeboYOTkk
        BEwkpnyZwNjFyMUhJLCbUeL99O1QzidGiQMvO6Ccz4wSP/7tYepi5ABr6WxmA+kWEtjFKLF8
        iiBEzStGiU1/5jCDJNgE9CXO/ZjHCpIQEZgHlDj0iR3EYRaYxSQx8UsrC0gVp4CZRG/DNlYQ
        W1ggVOLszwusIBtYBFQklk8sBwnzClhKnN68lxXCFpQ4OfMJWCuzgLzE9rcQyyQEFCR+Pl0G
        1ioi4CRx7F84RIm4xMujR8DWSgjs4JCYveUnVL2LxION/xkhbGGJV8e3sEPYUhKf3+1lg7Dz
        JX4snsQM0dzCKDH5+FxWiIS9xIErc1hAljELaEqs36UPsYxPovf3E2gA8Up0tAlBVKtJfH9+
        BmqtjMTD5qVMELaHxKQNV5gnMCrOQvLZLCSfzULywiyEZQsYWVYxSqYWFOempxabFhjnpZbr
        FSfmFpfmpesl5+duYgSnKC3vHYyPHnzQO8TIxMF4iFGCg1lJhFdN6my8EG9KYmVValF+fFFp
        TmrxIUZpDhYlcV6lH2fihATSE0tSs1NTC1KLYLJMHJxSDUz5qau35guIfAiKyjcuPLz4O+PE
        lToSXrkpTC/e3Fj9/HKStPpyj57M/ll3S8XjM9fz+rzLOP7zfcXa90JpJtUaCc++pl4QXKv5
        0TZm++yrkX+Zrm9rYt0YfXbZGbeQdWaxdkbVqbvivVjv/zhz86aGt56ArqzTjGtquxZVfeuo
        PJ/D0eS80+8Oy+XDx7eKrtzk80k3d/O1dudDf1XSvHuC3eQzM7oNalOCJD3LH63lKDtc/PLd
        q7/WZyb5JUysz5K/Pvf+77qvrbUFM7rsT87TVWGJseq5GfJbPff6qzsXH93zt1t081sp05YO
        mZoHGf5TVWbm+O7Z3GhbVnp8f+v8zdLbxZfLOokpKnZI7FdiKc5INNRiLipOBACRaO+NwAMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTvef5Pl4g5V/lSwezNvGZvF30jF2
        i40z1rNaXP/ynNXi/PkN7BabHl9jtbi8aw6bxYzz+5gs1h65y27R/vQlswOXx+9fkxg9Nq3q
        ZPPYvKTeo2/LKkaPz5vkAlijuGxSUnMyy1KL9O0SuDLu7JjCXtDAX/H1+y/GBsbtPF2MHBwS
        AiYSnc1sXYxcHEICOxgluqdOYupi5ASKy0hMXr2CFcIWllj57zk7RNELRokzs/+AFbEJ6Euc
        +zEPrEhEYAGjxPaf4SBFzALzmCSan79ihOjYyCixZP1OZpAqTgEzid6GbWAdwgLBErNbbrOD
        nMEioCKxfGI5SJhXwFLi9Oa9rBC2oMTJmU9YQEqYBfQk2jYygoSZBeQltr+dwwxxnILEz6fL
        WEFKRAScJI79C4coEZd4efQI+wRG4VlIBs1CGDQLyaBZSDoWMLKsYpRMLSjOTc8tNiwwykst
        1ytOzC0uzUvXS87P3cQIjjItrR2Me1Z90DvEyMTBeIhRgoNZSYRXTepsvBBvSmJlVWpRfnxR
        aU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1Ma2f/a7P473DX/d2i+qM2++TP
        92zat3r5QnnviQ6yjzoWsX6VkvqS/UREW/qE3rQN63jmr5+4bfZd/sNFbk8flD5de3VVwa2e
        1TxWuTOSVIOfcOrG+F7OiQ1Oe9rmpbS04duVGfWbl5yTY/ITbZW3rnj/0OfabTEL+xaTlL0y
        TVN4Vj/1N5eff7xQcXLbD6uZnycq7Py9RJkl3vPGC269SbyuIUyFqv5/fO8ceT3P5HfgQ73y
        DzPripayC50x1Hu7q2udwvnFFU414m0e+ybZbT/W+FDUfYM72/UnWy/ub7ynOXuCrci1s9P3
        yUW49v/SWcm0OPSgcvOrey8LldTcF86b/bfe741TPue7S38/1SuxFGckGmoxFxUnAgCIp3n6
        IQMAAA==
X-CMS-MailID: 20201208061526epcas5p21b6561d7043f4f5c9538ee3c44f930fa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20201207190542epcas5p4e5ef5bb30e40ad399b00fb369ce3db20
References: <20201207190517.262051-1-krzk@kernel.org>
        <CGME20201207190542epcas5p4e5ef5bb30e40ad399b00fb369ce3db20@epcas5p4.samsung.com>
        <20201207190517.262051-4-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Tuesday, December 8, 2020 12:35 AM
> To: Krzysztof Kozlowski <krzk@kernel.org>; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>; Marek Szyprowski
> <m.szyprowski@samsung.com>; Bartlomiej Zolnierkiewicz
> <b.zolnierkie@samsung.com>; Arnd Bergmann <arnd@arndb.de>; Chanwoo
> Choi <cw00.choi@samsung.com>; Alim Akhtar <alim.akhtar@samsung.com>;
> Pankaj Dubey <pankaj.dubey@samsung.com>
> Subject: [PATCH v2 3/4] soc: samsung: exynos-chipid: order list of SoCs by
> name
> 
> Bring some order to the list of SoCs.  No functional change.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/soc/samsung/exynos-chipid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/samsung/exynos-chipid.c
> b/drivers/soc/samsung/exynos-chipid.c
> index 8d4d05086906..b4cd0cc00f45 100644
> --- a/drivers/soc/samsung/exynos-chipid.c
> +++ b/drivers/soc/samsung/exynos-chipid.c
> @@ -20,6 +20,7 @@ static const struct exynos_soc_id {
>  	const char *name;
>  	unsigned int id;
>  } soc_ids[] = {
> +	/* List ordered by SoC name */
>  	{ "EXYNOS3250", 0xE3472000 },
>  	{ "EXYNOS4210", 0x43200000 },	/* EVT0 revision */
>  	{ "EXYNOS4210", 0x43210000 },
> @@ -29,10 +30,10 @@ static const struct exynos_soc_id {
>  	{ "EXYNOS5260", 0xE5260000 },
>  	{ "EXYNOS5410", 0xE5410000 },
>  	{ "EXYNOS5420", 0xE5420000 },
> +	{ "EXYNOS5433", 0xE5433000 },
>  	{ "EXYNOS5440", 0xE5440000 },
>  	{ "EXYNOS5800", 0xE5422000 },
>  	{ "EXYNOS7420", 0xE7420000 },
> -	{ "EXYNOS5433", 0xE5433000 },
>  };
> 
>  static const char * __init product_id_to_soc_id(unsigned int product_id)
> --
> 2.25.1

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>

