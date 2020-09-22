Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579FFC4727D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 08:04:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6A3823A1E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 08:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j1bxxd/r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgIVIE3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:04:29 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58832 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIVIE2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 04:04:28 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200922080426euoutp0134edd2fa3fca1e7b83cbcf6a08671122~3DG_xS1Hp3232332323euoutp010
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 08:04:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200922080426euoutp0134edd2fa3fca1e7b83cbcf6a08671122~3DG_xS1Hp3232332323euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600761866;
        bh=vMZZdD6CU4Tq8VLs7D3b0T5e/AAfjtVgzf6Xc6Ok4E0=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=j1bxxd/r4p1rnR3l0CngqeJ5TUEfIJAZEqCQOFKrfq7K2iu8+d/Hp4DgOxZLVEsPw
         Y7xlYzZJtd1+UeBvyVLBpZnFo9zxu0r1H7itRsMDaD3i0NykBUSegZD9SydHK3n9Gn
         SyjkbA+578LhjFLZE0UZtwGMFTU4f3kv+OqoWOv0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200922080426eucas1p1cf421a684b96be9c16c4cecf2d37f10f~3DG_hfbOO0725507255eucas1p1d;
        Tue, 22 Sep 2020 08:04:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DE.1D.06456.A00B96F5; Tue, 22
        Sep 2020 09:04:26 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200922080425eucas1p11ccdb959d694d6de86a249bf9c4d1f0e~3DG_JTXxu0946509465eucas1p1F;
        Tue, 22 Sep 2020 08:04:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200922080425eusmtrp19c07c4d48061b191b09503859c967b2e~3DG_IrTJV1174311743eusmtrp1z;
        Tue, 22 Sep 2020 08:04:25 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-d6-5f69b00a37bf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 76.71.06314.900B96F5; Tue, 22
        Sep 2020 09:04:25 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200922080425eusmtip1316409021e73d1389aa52f1baed72a13~3DG9xDjyF0959909599eusmtip1b;
        Tue, 22 Sep 2020 08:04:25 +0000 (GMT)
Subject: Re: [PATCH] mfd: sec: initialize driver via module_platform_driver
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ca74d48f-f611-19ca-87ce-24944535c135@samsung.com>
Date:   Tue, 22 Sep 2020 10:04:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921203421.19456-1-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3e3d2tJtdpeLKHNSkqcCoVDAzTCBn0T1SURGrXvEzLbbbr
        sweJRqmJiEO0OTGD0malLlkiIamoU2szRZsPyjekjcIH5SDJ+evhf59zzvf8zvkefjQhqxb6
        00naVE6vZZPllIS0dq06giQNSXEhrQuUsrG8Xqh0OBpEys8rnUg52GKilOWOVoHyQ+2yIIJS
        Wcz5lGp8+A2lKmoyI9WSZfdp8qLkWAKXnJTO6YPDL0sSbU43Smnfkjk0YULZyCYuQGIamCPw
        qjefKEASWsbUIlh4PCPEwTKCzolfJA6WELzrGVmv0Bstlc2xOF+DoM5kR56nZMw3BJPPbnvY
        hzkFltkxyiPyZb4i+PhkUuApUEwoFLgKKA9LmXDIvmsSephk9kFbjX2DtzGx0NU7RWKNN/Q8
        nNlgMXMUOtxVG70EEwCvXSYCsx+MzlQJPMOAMYhgIMdGYnMn4VNjiwizD8x3N/3hndBnKCRx
        Q+761vYXIhwUIhjMKUdYFQbjdjfl8UwwB6G+JRinI2FqyILwKbzA6fLGS3hBibWMwGkp5N2T
        YfV+MHa//De2rX+AwKyC2pxCqhjtNW6yadxkzbjJmvH/Do8QaUZ+XBqvUXN8qJbLUPCshk/T
        qhVXdBoLWv84fWvdi81oZSC+HTE0km+Vvi1NjJMJ2XQ+S9OOgCbkvtIT7/tiZdIENusGp9fF
        6dOSOb4d7aBJuZ/08OMvMTJGzaZy1zguhdP/rQposX82Ks7MuBVjbTy7fPX6z+eG+Lyimok9
        Lp5U/xjZhYYkXLRiOifQ5vV90ZluzR2fVtlRUOABRVRrQNXY3Pxqx/D94/1P2WbeeIaVPaic
        HnWURWfrquvnZi9UNIQ7Kkotd7i1SxQzFWkICxG3mXN12+sUS94lkO4+73fTGQXnIuQkn8iG
        HiL0PPsb5JaftjQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xu7qcGzLjDT7s1bbYOGM9q8X58xvY
        Le5/PcpocXnXHDaLGef3MVlcXPGFyYHNY9OqTjaPO9f2sHn0bVnF6PF5k1wAS5SeTVF+aUmq
        QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexokbvxgLDnFXXH0w
        h7GB8QRnFyMHh4SAicTcHXFdjFwcQgJLGSU2XWhi7GLkBIrLSJyc1sAKYQtL/LnWxQZR9Bao
        6OwBsISwgLfEpqe3wRIiAm8YJT49PssCUdXBKHH1fh87SBWbgKFE11uQdk4OXgE7iYaWOWDd
        LAKqEgeXnwOzRQXiJM70vICqEZQ4OfMJC4jNKWAqcfjXfLA4s4CZxLzND5khbHmJ7W/nQNni
        EreezGeawCg4C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgLG07
        9nPzDsZLG4MPMQpwMCrx8B6YmhEvxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU
        4kOMpkDPTWSWEk3OB8Z5Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYO
        TqkGxv4++XIuW95Ae4XNSZnO8or8i2TEeCQem3itfn9Pu6YzNMffYcsmicuba5pmFUqZ2wfc
        NntW+rkpJXbW5BjVn4/YzViaJSuPL9hVWhZW7GcTtNT5lVT3LOZoA4E3vK9fZDdKHA23uqD/
        YFVZcaiz6bwwA633P9b4JTEdFdK4IHRMu7BqwVIlluKMREMt5qLiRADhrNZmuwIAAA==
X-CMS-MailID: 20200922080425eucas1p11ccdb959d694d6de86a249bf9c4d1f0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200921203605eucas1p2cd3ab81a750ccbe8dda839ad9f0e98e4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200921203605eucas1p2cd3ab81a750ccbe8dda839ad9f0e98e4
References: <CGME20200921203605eucas1p2cd3ab81a750ccbe8dda839ad9f0e98e4@eucas1p2.samsung.com>
        <20200921203421.19456-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 21.09.2020 22:34, Krzysztof Kozlowski wrote:
> The driver was using subsys_initcall() because in old times deferred
> probe was not supported everywhere and specific ordering was needed.
> Since probe deferral works fine and specific ordering is discouraged
> (hides dependencies between drivers and couples their boot order), the
> driver can be converted to regular module_platform_driver.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/mfd/sec-core.c | 14 +-------------
>   1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index 95473ff9bb4b..8d55992da19e 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -549,19 +549,7 @@ static struct i2c_driver sec_pmic_driver = {
>   	.shutdown = sec_pmic_shutdown,
>   	.id_table = sec_pmic_id,
>   };
> -
> -static int __init sec_pmic_init(void)
> -{
> -	return i2c_add_driver(&sec_pmic_driver);
> -}
> -
> -subsys_initcall(sec_pmic_init);
> -
> -static void __exit sec_pmic_exit(void)
> -{
> -	i2c_del_driver(&sec_pmic_driver);
> -}
> -module_exit(sec_pmic_exit);
> +module_i2c_driver(sec_pmic_driver);
>   
>   MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
>   MODULE_DESCRIPTION("Core support for the S5M MFD");

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

