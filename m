Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A236C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 06:22:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6741B610CC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 06:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhDTGXJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 02:23:09 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:55849 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhDTGXI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 02:23:08 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210420062235epoutp015ae682cf8088ba071433062686cae451~3fMAmluxC3234732347epoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 06:22:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210420062235epoutp015ae682cf8088ba071433062686cae451~3fMAmluxC3234732347epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1618899755;
        bh=GZcw++8eRqRO6mbzVQ+zFrCr+EYpEAwP4L8/DA6RlYk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Yip3TkdVqL4GPVFubMEsNf6zI/H5EhrQh1hd1T6IOggMXDAye4ncBUFjLsp41WUdp
         PWF3tpRRnWl2VKQJXOtkCEJyCfmHPJGM40m+Z+Jni/NFm9wLYgaM4QIQrAowoGGp0K
         Loa5h96HA7B3wjTXWlvHZLhCC+YW1+K2fQtvI/v8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210420062227epcas1p1ce550cf986772db68d19cb9b89fd5704~3fL5WJGmP0652906529epcas1p1E;
        Tue, 20 Apr 2021 06:22:27 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.157]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4FPYWN3Rvkz4x9Q8; Tue, 20 Apr
        2021 06:22:24 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        3F.74.10258.B137E706; Tue, 20 Apr 2021 15:22:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210420062213epcas1p4470b2884ef68e66eb95c72500533dd60~3fLrpwNXJ2564425644epcas1p44;
        Tue, 20 Apr 2021 06:22:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210420062213epsmtrp1f2ada2d1d218497feb61a8e4b2e5039f~3fLrpAFkU0991009910epsmtrp10;
        Tue, 20 Apr 2021 06:22:13 +0000 (GMT)
X-AuditID: b6c32a38-42fff70000002812-15-607e731b6758
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.73.08163.5137E706; Tue, 20 Apr 2021 15:22:13 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210420062213epsmtip196f57bab178b9c3931cf68131d892b3c~3fLrbtZ_k2244222442epsmtip1B;
        Tue, 20 Apr 2021 06:22:12 +0000 (GMT)
Subject: Re: [PATCH 03/12] drm/exynos: Don't set allow_fb_modifiers
 explicitly
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <df4acc12-27da-3a81-6e2b-eee197107341@samsung.com>
Date:   Tue, 20 Apr 2021 15:31:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
        Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIJsWRmVeSWpSXmKPExsWy7bCmrq50cV2Cwcy5phYLH95ltlh+Zh2z
        xZWv79ksZk/YzGTx4t5FFovz5zewW5xtesNusenxNVaLGef3MVnMmPySzYHLY++3BSwei/e8
        ZPLYtKqTzeN+93Emj81L6j36tqxi9Pi8SS6APSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7U
        zMBQ19DSwlxJIS8xN9VWycUnQNctMwfoPCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJq
        QUpOgWWBXnFibnFpXrpecn6ulaGBgZEpUGFCdsanNQcZC/5wV1w9fJKpgbGPq4uRk0NCwERi
        6cZNzF2MXBxCAjsYJR4euMsE4XxilLjw6BYrhPOZUWJpYweQwwHW8nh1PER8F6PEgZ5WRpBR
        QgLvGSX+P2YBsYUFAiSO/TjABmKLCMRLHJ6xmh2kgVngHpPEk1V7wYrYBFQlJq64D1bEK2An
        cfD8bHYQmwUo/vrsZLAaUYEIiRfzl0PVCEqcnPkELM4JVP930kywOLOAuMStJ/OZIGx5ieat
        s8H+kRBYySHxtaOfBeJRF4mpT/cyQtjCEq+Ob2GHsKUkXva3sUM0NDNKTJxxmgnC6WCUuPv4
        OlS3scT+pZOZQP5nFtCUWL9LHyKsKLHz91xGiM18Eu++9kCDiFeio00IokRJ4tjFG1B7JSQu
        LJnIBmF7SBxYvYRpAqPiLCS/zULyzywk/8xCWLyAkWUVo1hqQXFuemqxYYEJcnRvYgSnXS2L
        HYxz337QO8TIxMF4iFGCg1lJhPd+bU2CEG9KYmVValF+fFFpTmrxIUZTYGhPZJYSTc4HJv68
        knhDUyNjY2MLE0MzU0NDJXHedOfqBCGB9MSS1OzU1ILUIpg+Jg5OqQamjv2Ljixom3b0aNzl
        C9lCQieVDH3mfLt2UbrVueNyCUf4K169PJH3sU/OucxJYr8XEr6yL6jGYO9apyb+bPdfk///
        8knr2bZ1mbZkqlPeJY/9cr1rUkrf3mi5tJnrbrHjo9jfDw/XWBs6HHjIsmVd60GTD1XzKjjf
        1Fkb9P6Z5T5lh+nOeZMNQ/j+7vP8sMjd9NaXjzscV1RF1x/aHX7UatvC2FtXp3OqqAa0teUG
        rvi+hcMsI0CNIfyW3bPeNPVMVSPhS29rzkckV80QejQ/fk7t5r+eGfa8j4oYzjV8b7rN072p
        wvhY4DH7pOXHp15Z7b5VSflpyHojZZ49jQt+/537o7fx34uQyYe7rj2oUmIpzkg01GIuKk4E
        AHyb3apEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTle0uC7B4HMbj8XCh3eZLZafWcds
        ceXrezaL2RM2M1m8uHeRxeL8+Q3sFmeb3rBbbHp8jdVixvl9TBYzJr9kc+Dy2PttAYvH4j0v
        mTw2repk87jffZzJY/OSeo++LasYPT5vkgtgj+KySUnNySxLLdK3S+DK+LTmIGPBH+6Kq4dP
        MjUw9nF1MXJwSAiYSDxeHd/FyMUhJLCDUWL5/xZmiLiExJatHBCmsMThw8UQJW8ZJbbebgcq
        4eQQFvCTuDNzAZgtIhAv0XniNCNIEbPAIyaJw71LWCE6jjJKfO59BFbFJqAqMXHFfTYQm1fA
        TuLg+dnsIDYLUPz12cksILaoQITEgskgzSA1ghInZz4Bi3MC1f+dNBOsl1lAXeLPvEvMELa4
        xK0n85kgbHmJ5q2zmScwCs1C0j4LScssJC2zkLQsYGRZxSiZWlCcm55bbFhglJdarlecmFtc
        mpeul5yfu4kRHGVaWjsY96z6oHeIkYmD8RCjBAezkgjv/dqaBCHelMTKqtSi/Pii0pzU4kOM
        0hwsSuK8F7pOxgsJpCeWpGanphakFsFkmTg4pRqYDnScMilX52753SmyT6snOv1xSPjbxFO7
        T0do1UyYPPXwzCTZ1wo25sU7uadLXi3OuZNgtkg4qCm8ZrkI4/S8/7d8frcyhQkaXsq+Fq9f
        G7vDfof8/fll57oc595wddg8nUv46+zTp7f7XLq7+1fFP+7FyhtCYvTbZR53CKxInJ0ndW3N
        C3e9BUbdHrfERM/sWtZvfLh6YdGCK3tWJ030amPPn7HU+Kbap6Ws7eX6jcueZYet3W8sGBh6
        9bPqxOURAW2zjpYfmhxvtbBR+3+SpJr7da2wsDL9rOdnvf7eDX9ueynby9e66b2Z3b/Lpnca
        EysvpXRaCn74U5et3XomM11qurU0r6TjP+6b1UZKLMUZiYZazEXFiQDvbGZyIQMAAA==
X-CMS-MailID: 20210420062213epcas1p4470b2884ef68e66eb95c72500533dd60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
        <CGME20210413094922epcas1p47e75ce008a78971af7a923aadc0b9d3b@epcas1p4.samsung.com>
        <20210413094904.3736372-3-daniel.vetter@ffwll.ch>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



21. 4. 13. 오후 6:48에 Daniel Vetter 이(가) 쓴 글:
> Since
> 
> commit 890880ddfdbe256083170866e49c87618b706ac7
> Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Date:   Fri Jan 4 09:56:10 2019 +0100
> 
>     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> 
> this is done automatically as part of plane init, if drivers set the
> modifier list correctly. Which is the case here.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Inki Dae <inki.dae@samsung.com>

Thanks,
Inki Dae

> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index 64370b634cca..79fa3649185c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -177,7 +177,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
>  	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
>  	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
>  
> -	dev->mode_config.allow_fb_modifiers = true;
> -
>  	dev->mode_config.normalize_zpos = true;
>  }
> 
