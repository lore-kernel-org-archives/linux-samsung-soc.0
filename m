Return-Path: <SRS0=6p2y=DJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140F1C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 06:00:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9246E206FA
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  2 Oct 2020 06:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cvbnVE+v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgJBGAb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 2 Oct 2020 02:00:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51980 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgJBGAa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Oct 2020 02:00:30 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201002060028euoutp01b65f8ff85102d3696b01afce5a5ae290~6F3mkSD230139701397euoutp01O
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Oct 2020 06:00:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201002060028euoutp01b65f8ff85102d3696b01afce5a5ae290~6F3mkSD230139701397euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601618428;
        bh=XjGN4pDxDl/aVQMYFiIwt/xYhba0QT+AGy3DjuwusaU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cvbnVE+vCvxadDWAtC4HVXvry7r0u0zAJ8szP3Zb6VrwuNDSl9PSmc7kO0qhhXAQq
         /NLYY9rLiP5bTZjZryMmhkhnl6GBti9Hx36cXKUjE5zGTa8+3Qho76geaSfLjsHBRK
         UblkvcNWQCaw2InTqL6/a1ZmL1PGpx2ZffN7ZlJE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201002060028eucas1p10ce6b227ec88ceb0619907a7daaa5421~6F3mK5SPO1524315243eucas1p1h;
        Fri,  2 Oct 2020 06:00:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 69.80.05997.CF1C67F5; Fri,  2
        Oct 2020 07:00:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201002060027eucas1p127aa6aee66868a41b1e2252d01bc2577~6F3luVNc_2308623086eucas1p1K;
        Fri,  2 Oct 2020 06:00:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201002060027eusmtrp14e0f5298c79be9eaeb6161e8a60c3553~6F3ltuefg1824218242eusmtrp1d;
        Fri,  2 Oct 2020 06:00:27 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-36-5f76c1fcc906
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E0.D7.06314.BF1C67F5; Fri,  2
        Oct 2020 07:00:27 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201002060027eusmtip2c17956e42c278720aab9fcba6fe168ee~6F3lTAxCy2773627736eusmtip2T;
        Fri,  2 Oct 2020 06:00:27 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Remove 'opp-shared' from Exynos4412
 bus OPP-tables
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2414d856-0861-36a9-cd27-a684eb3447fb@samsung.com>
Date:   Fri, 2 Oct 2020 08:00:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920152738.GA7451@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87p/DpbFGyzYyGuxccZ6VovrX56z
        Wpw/v4HdYsb5fUwWL4/8YLQ4/Kad1YHN49adeo9NqzrZPPq2rGL0+LxJLoAlissmJTUnsyy1
        SN8ugStj967JLAX7uCqWHhdsYDzC0cXIySEhYCLReWYNaxcjF4eQwApGidsn5jFDOF8YJY5d
        vwTlfGaU2H9jLxtMS+Oh/2wQieVALTtPQjnvGSW27b/FCFIlLBAt0dt9gx3EFhHQlLj+9zsr
        iM0scItR4uBGBxCbTcBQouttF9hUXgE7iX9TL7KA2CwCKhKN+5aB1YsKxEkcO/WIBaJGUOLk
        zCdgNqeAnsSlbZNZIGbKS2x/O4cZwhaXuPVkPhPIQRICi9glzj+8ww5xtovEzk0wtrDEq+Nb
        oGwZidOTe1ggGpoZJR6eW8sO4fQwSlxumsEIUWUtcefcL6BTOYBWaEqs36UPEXaUeL16HzNI
        WEKAT+LGW0GII/gkJm2bDhXmlehoE4KoVpOYdXwd3NqDFy4xT2BUmoXktVlI3pmF5J1ZCHsX
        MLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECEw3p/8d/7KDcdefpEOMAhyMSjy8AgdK
        44VYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU
        7NTUgtQimCwTB6dUA6P/qg8Nc3kmdjfnWdf8kL9+6IL5/NAFAhd01q19cGBnQyHXFtFKt1nN
        ick3d3LtOp4R1aS5NfD8zHb/LV+TTdZ8sk5NyGtVD9m7Ts/yxKv8jKqfeW/696T+MGXPN5IX
        L7/zMy/EWvYL14q4XyELm/N3HfmlIVcXbsnyaurlXzOkv3m+XemcWajEUpyRaKjFXFScCABe
        V6/EMwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRmVeSWpSXmKPExsVy+t/xe7q/D5bFGzzs0rLYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLl0d+MFocftPO6sDmcetOvcemVZ1sHn1bVjF6fN4kF8ASpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJexe9dkloJ9XBVLjws2
        MB7h6GLk5JAQMJFoPPSfrYuRi0NIYCmjRPOKdWwQCRmJk9MaWCFsYYk/17qgit4ySpz6dY0J
        JCEsEC3xZ+U1FhBbREBT4vrf76wgRcwCdxgl7l4/BdWxlVHi6vLlYKPYBAwlut52ga3gFbCT
        +Df1Ilg3i4CKROO+ZWA1ogJxEmd6XkDVCEqcnPkErIZTQE/i0rbJYDazgJnEvM0PmSFseYnt
        b+dA2eISt57MZ5rAKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4m
        RmCEbTv2c/MOxksbgw8xCnAwKvHwChwojRdiTSwrrsw9xCjBwawkwut09nScEG9KYmVValF+
        fFFpTmrxIUZToOcmMkuJJucDoz+vJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFq
        EUwfEwenVANj65TIy5u2zlOaG3x5Vc2RDZ8375HX+Xv5+QG5bq9XR7gUVF9Mm7GMxfv3d7sn
        snKLZ9+2T1r45eHFtx8bdNJ+zloW/D/+9Pasmhl252zmLVvOEir/W0Ng+5eTdZze+etUnTY/
        9RKVCpl9ZPu9c6/n9U/sEDy5/boh4yKJRWcM176Un5KvsVjhb5ESS3FGoqEWc1FxIgCm8GZh
        xgIAAA==
X-CMS-MailID: 20201002060027eucas1p127aa6aee66868a41b1e2252d01bc2577
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df
References: <CGME20200911122246eucas1p1a8ccc7c5b970ce6aa9aa346d78ad69df@eucas1p1.samsung.com>
        <20200911122236.16805-1-m.szyprowski@samsung.com>
        <20200920152738.GA7451@kozik-lap>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 20.09.2020 17:27, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2020 at 02:22:36PM +0200, Marek Szyprowski wrote:
>> Commits 1019fe2c7280 ("ARM: dts: exynos: Adjust bus related OPPs to the
>> values correct for Exynos5422 Odroids") and 9ff416cf45a0 ("ARM: dts:
>> exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family")
>> revealed that 'opp-shared' property for the Exynos bus OPPs was used
>> incorrectly, what had the side-effect of disabling frequency scaling for
>> the second and latter buses sharing given OPP-table.
>>
>> Fix this by removing bogus 'opp-shared' properties from Exynos4412 bus
>> OPP-tables. This restores frequency scaling for the following busses:
>> C2C, RightBus, and MFC.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4412.dtsi | 6 ------
>>   1 file changed, 6 deletions(-)
>>
> As discussed on IRC, I am waiting with these patches till you let me
> know they're good.

I got the information from Markus Reichl that this patch finally doesn't 
cause a regression. The issue he observed must be something else. 
Anyway, I would like to postpone this patch to the next release cycle to 
give it enough testing in linux-next.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

