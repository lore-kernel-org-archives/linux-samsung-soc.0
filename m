Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DCCC5519F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 01:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF2E920771
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 01:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Aps6gfjy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgKWBRD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 Nov 2020 20:17:03 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:48450 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgKWBRC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Nov 2020 20:17:02 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201123011700epoutp02046bdb3684724dfd5ea3545b7043b5a9~J-i8ML7kx1484214842epoutp02R
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2020 01:17:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201123011700epoutp02046bdb3684724dfd5ea3545b7043b5a9~J-i8ML7kx1484214842epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606094220;
        bh=zVzTnuyKE3DO2//uowBhMsWnup1z0a7x1hwyk7fg5zg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Aps6gfjyPJ2Q9prFEC5A2XDcfvIjNEaobfUnrat1AZ90L+MbwbRBMZvHFpkKivCwS
         zNFijCDn53fj96kkISoQ00K8uLuu3E3R4MiuUkqzsVfa6sray9oJl7J2or91SDr1aR
         sc36Xg+SqyQO73RCLGGMxhLEf9tfXbLSlCxqHrsQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201123011659epcas1p1f73f65b6aba279f2b7958c17ccf58dd8~J-i7sOpua0596505965epcas1p1L;
        Mon, 23 Nov 2020 01:16:59 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.153]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CfTlF1lw6zMqYkb; Mon, 23 Nov
        2020 01:16:57 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        47.4A.63458.18D0BBF5; Mon, 23 Nov 2020 10:16:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20201123011649epcas1p4824e4ed9cdcb96e74606da954f783edb~J-ix9TPv02005820058epcas1p4n;
        Mon, 23 Nov 2020 01:16:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201123011649epsmtrp1720f6cfb9eb188fce3ea745a6eefd8b2~J-ix8Os7O1181211812epsmtrp1Z;
        Mon, 23 Nov 2020 01:16:49 +0000 (GMT)
X-AuditID: b6c32a36-6c9ff7000000f7e2-18-5fbb0d81f8fc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        9F.D5.13470.18D0BBF5; Mon, 23 Nov 2020 10:16:49 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201123011648epsmtip2c593d73923d4ce98001aae700522ba1f~J-ixpnLIB0813908139epsmtip2R;
        Mon, 23 Nov 2020 01:16:48 +0000 (GMT)
Subject: Re: [PATCH 1/2] drm/exynos: depend on COMMON_CLK to fix compile
 tests
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Paul Cercueil <paul@crapouillou.net>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <5447e15e-d5a9-9d09-d6d1-6f9dff8cc142@samsung.com>
Date:   Mon, 23 Nov 2020 10:24:23 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201116175301.402787-1-krzk@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmnm4j7+54g0uflS16z51ksvi/bSKz
        xZWv79ksXty7yGJx/vwGdouzTW/YLTY9vsZqcXnXHDaLGef3MVm8an7EZtG/+BKLxYzJL9kc
        eDxWX2pn89j7bQGLx+I9L5k8Nq3qZPPY/u0Bq8f97uNMHpuX1Hv0bVnF6PF5k1wAZ1S2TUZq
        YkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqtkotPgK5bZg7QyUoKZYk5pUCh
        gMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7IzlB9pZ
        Ck5yVTS+3c/cwHibo4uRk0NCwESi+c9y9i5GLg4hgR2MEg1vJzJCOJ8YJWbtOMUK4XxjlPi/
        9io7TMudY5ugEnsZJR62r2SBcN4zSrzbfp6ti5GDQ1ggQKLpqxBIg4jAAmaJbxudQWxmAVWJ
        13vfMoHYbED2xBX32UBsXgE7iR1NPWALWIDiezubWEBsUYEIiePdk9khagQlTs58AhbnFDCT
        WPXvAiPETHGJW0/mM0HY8hLNW2czg9wjIXCGQ2LuyW42iKtdJL6+nwZlC0u8Or4F6hspiZf9
        bewQDc2MEhNnnGaCcDoYJe4+vs4CUWUssX/pZCaQz5gFNCXW79KHCCtK7Pw9F+oKPol3X3tY
        QUokBHglOtqEIEqUJI5dvMEIYUtIXFgyEeoGD4nZNz+xTWBUnIXkt1lI/pmF5J9ZCIsXMLKs
        YhRLLSjOTU8tNiwwQo7uTYzg9KxltoNx0tsPeocYmTgYDzFKcDArifC2yu2MF+JNSaysSi3K
        jy8qzUktPsRoCgzticxSosn5wAyRVxJvaGpkbGxsYWJoZmpoqCTO+0e7I15IID2xJDU7NbUg
        tQimj4mDU6qByWmy+CUdtT08pzxuF5w4ctlvrZnX8as6Vja/vjQySX6yn8zXGq4xobz62jWP
        mkKds9vqGBodwh60/bvBkmOTI3DjxPrFaTsbEv5avhQO0Iq+O2/BCrVl6/L0lO6fY5h4duFx
        1w+CB/+YODnbqK97Pv1iWtbsGFu5332GqWEXtpaXvNxibfzvun4625mV51aoK2wXmlR396GG
        tN3Rh+faf65/cT7oh/7a13XRhk0J0rw7n4U+kVnq8nCJGOunOTWJX67ki97JnV9VvPPZwYYQ
        V07vP3eYTv0vT37K7xMbrt95lO9L4i3b6n+xPccK0pZPez/1muOb/uAfjdOdeqOT8+bkd3hn
        +Dcbbjtpw/TjjhJLcUaioRZzUXEiAHIgVz1YBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsWy7bCSvG4j7+54g1ebmC16z51ksvi/bSKz
        xZWv79ksXty7yGJx/vwGdouzTW/YLTY9vsZqcXnXHDaLGef3MVm8an7EZtG/+BKLxYzJL9kc
        eDxWX2pn89j7bQGLx+I9L5k8Nq3qZPPY/u0Bq8f97uNMHpuX1Hv0bVnF6PF5k1wAZxSXTUpq
        TmZZapG+XQJXxvID7SwFJ7kqGt/uZ25gvM3RxcjJISFgInHn2CbWLkYuDiGB3YwS67ffY+li
        5ABKSEhs2coBYQpLHD5cDFHyllHiz7JeZpC4sICfxOYlDiBxEYFFzBIfrzxhApnJLKAq8Xrv
        WyaIhk5GibtXn7CAJNiAEhNX3GcDsXkF7CR2NPWwg9gsQPG9nU1gNaICERIt9/+wQ9QISpyc
        CdHLKWAmserfBUaIBeoSf+ZdYoawxSVuPZkPtVheonnrbOYJjEKzkLTPQtIyC0nLLCQtCxhZ
        VjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEejluYOxu2rPugdYmTiYDzEKMHBrCTC
        2yq3M16INyWxsiq1KD++qDQntfgQozQHi5I4743ChXFCAumJJanZqakFqUUwWSYOTqkGpqNa
        82y05hyecO4Ek+c9ho0/Km1Zn74OX2D03ek+69uVGzvXZn9qX68u4SIf+SPBTLNavOn0QWW+
        g+EcovvKpXr6HgbE5uluumkaz/Fp4eNXf9dwCH5+4af25yijyMy/Nz5IWIvM3bcnijchwSDw
        bo70zc/TXmlPEfTcWPPA3nnxcV+J7NfiYXOYI0RPsQVOXlidsFXQ9uhu+bJ9p/qWmi09cnm9
        ycam+6t6M0/MTt99JiBgfvGE2eeZla79mbrmTRXPkfdRfKejPpXd3rlg+btKy0obxtgj2x99
        5PmllSxzMk1iq9jB3Z9Wzk29n7e/7/fWJq9trM3BlUKGJva5bnsyeq693cSUHbyk5aP4/1Yl
        luKMREMt5qLiRAAjRKH+NQMAAA==
X-CMS-MailID: 20201123011649epcas1p4824e4ed9cdcb96e74606da954f783edb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201116175410epcas1p1c0dbe17b850b30baa05d768fbdc74f5d
References: <CGME20201116175410epcas1p1c0dbe17b850b30baa05d768fbdc74f5d@epcas1p1.samsung.com>
        <20201116175301.402787-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

HI Krzysztof,

20. 11. 17. 오전 2:53에 Krzysztof Kozlowski 이(가) 쓴 글:
> The Exynos DRM uses Common Clock Framework thus it cannot be built on
> platforms without it (e.g. compile test on MIPS with RALINK and
> SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/exynos/exynos_mixer.o: in function `mixer_bind':
>     exynos_mixer.c:(.text+0x958): undefined reference to `clk_set_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Picked it up.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 6417f374b923..951d5f708e92 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -1,7 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_EXYNOS
>  	tristate "DRM Support for Samsung SoC Exynos Series"
> -	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST)
> +	depends on OF && DRM && COMMON_CLK
> +	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST
>  	depends on MMU
>  	select DRM_KMS_HELPER
>  	select VIDEOMODE_HELPERS
> 
