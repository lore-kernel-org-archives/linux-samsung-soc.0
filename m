Return-Path: <SRS0=E3A4=7A=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF215C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 May 2020 05:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B122E20657
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 May 2020 05:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iEJ9EqMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgERFGv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 May 2020 01:06:51 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:41360 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgERFGv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 May 2020 01:06:51 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200518050648epoutp04eae9fb60b0b02160bc41f2f4904a8602~QBwoBfl9S2570825708epoutp042
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2020 05:06:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200518050648epoutp04eae9fb60b0b02160bc41f2f4904a8602~QBwoBfl9S2570825708epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589778408;
        bh=Bp5I1F2Ajf/Bh+H2f2+WeV8B2kaK+qhwKng13/0okfc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=iEJ9EqMf9IsAc0a7vEQAHdaSjRc1SFaHUAC85UJCdvD/4D1sK0BuUIB2NtJIDbe2l
         UWrKkYMi8UvpN7DiEbPnMej+2x34b6Ky1oBOsN2g/X+LcgkWg/TCv798StZ2CJDyOm
         G3BHgjLa8PiPrILJPt4X/Nm0taHBMB7fyuCjB864=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200518050647epcas1p19676e935ccaf38bb210f54e5c4fc8db8~QBwnuZqR72284222842epcas1p11;
        Mon, 18 May 2020 05:06:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 49QRnd3JvVzMqYkc; Mon, 18 May
        2020 05:06:45 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        5E.52.04648.0E712CE5; Mon, 18 May 2020 14:06:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20200518050640epcas1p325ad883956af656e26788e218539fb10~QBwgt77H31440014400epcas1p3V;
        Mon, 18 May 2020 05:06:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200518050640epsmtrp1012dfafa0e7a3718f1bff1c5daab3d98~QBwgsoNhY2312723127epsmtrp1f;
        Mon, 18 May 2020 05:06:40 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff70000001228-69-5ec217e04a1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        91.54.25866.0E712CE5; Mon, 18 May 2020 14:06:40 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200518050639epsmtip2c1f13627263c081c8c4347b6fc012ea1~QBwghwXnE1300013000epsmtip2X;
        Mon, 18 May 2020 05:06:39 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: mixer: Fix enabling of the runtime power
 management
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <0d14cec1-9c24-4e31-ca86-9f90bc1efde0@samsung.com>
Date:   Mon, 18 May 2020 14:12:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200514100812.17043-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmge4D8UNxBjtfKVvcWneO1WLjjPWs
        Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdl22SkJqakFimk5iXn
        p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
        5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfcmvqPveAFT8WDHYeY
        GxiPcnUxcnJICJhIHJ17lbmLkYtDSGAHo8SB3zehnE+MEkv77rJAOJ8ZJdau/cQC09IxdwUb
        iC0ksItR4vWVAIii94wSZ+dfZwVJCAuESZw8/RfMFhEolZj7/xg7iM0s0A406Xg8iM0moCox
        ccV9sEG8AnYSqyatAqtnAYq/etwBFOfgEBWIkDj9NRGiRFDi5MwnYDdwApV/6L7NCDFSXOLW
        k/lMELa8RPPW2cwQd35ll5hz3g/CdpG4daiPDcIWlnh1fAs7hC0l8bK/jR3kfgmBZkaJiTNO
        M0E4HYwSdx9fh/rYWGL/0slMIAcxC2hKrN+lDxFWlNj5ey7UEXwS7772sIKUSAjwSnS0CUGU
        KEkcu3iDEcKWkLiwZCLUDR4S11tus05gVJyF5LVZSN6ZheSdWQiLFzCyrGIUSy0ozk1PLTYs
        MEaO7E2M4CSpZb6DccM5n0OMAhyMSjy8F6IOxgmxJpYVV+YeYpTgYFYS4Y38vC9OiDclsbIq
        tSg/vqg0J7X4EKMpMOAnMkuJJucDE3heSbyhqZGxsbGFiaGZqaGhkjjv1Os5cUIC6Yklqdmp
        qQWpRTB9TBycUg2MJbyujOx/ppwszT3jcvyX66QfLZFvrxR8EVPZudSvZdmlps8qjTZz7mxI
        O3KqrSBCaN9jf2UDJ5PdOd7Tzk1MvMy6vuj5trtucvKWK1Jq6i9Ey99v83qmlftd6mZDrXaZ
        4ry6S881rYMnb3IoSTYUP7V7tUKs69P/qrUVBe57pUTTzax/i61WYinOSDTUYi4qTgQANJ/x
        cqgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO4D8UNxBj0dbBa31p1jtdg4Yz2r
        xZWv79ksZpzfx2Sx9shddosZk1+yObB53O8+zuTRt2UVo8fnTXIBzFFcNimpOZllqUX6dglc
        Gbem/mMveMFT8WDHIeYGxqNcXYycHBICJhIdc1ewdTFycQgJ7GCU+Pz9B1MXIwdQQkJiy1YO
        CFNY4vDhYoiSt4wS0zZ9YgfpFRYIkzh5+i8riC0iUCrxqv8+I0gRs0A7o8SRfR3sEB0TGSVm
        ntnIBFLFJqAqMXHFfTYQm1fATmLVpFVg3SxA8VePO8DiogIREs+332CEqBGUODnzCQuIzQlU
        /6H7NlicWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJla
        UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcGVpaOxj3rPqgd4iRiYPxEKMEB7OSCG/k531x
        QrwpiZVVqUX58UWlOanFhxilOViUxHm/zloYJySQnliSmp2aWpBaBJNl4uCUamBiPrhl+Zd7
        Cm/WK8zZ4N1tcjrsgcuxOdP3BTQ/V7+ybZ+Dg+5JlbX3NN56zJ6tqsbdy7TyY/gFq+RFUteq
        64KSD0gHJiTEMJ9m2FW3XM5efa3C+ePLVao9SsT35ke2T+yy1PkRFsB9umZnYkSokFt56aVu
        qeD7kxgT/i1V4NSqy+Sp6Ltj97rM2s4yKDc3VlLgSNu3Yq8ts+56XV7RPN+01/Zu3tX9rmvq
        vujqH9DJTDG3C13MuSA1WEu9mLvtcNHGRQdLFbOZKsUyPTsVRVa+52aX/S7MlB7y5k9O13PZ
        CYbR7JpTf5/9EnTigAzb3iKbiJUrFlTGMjiGdn2Vv6T8+Mwvr/kxKXcYpUt/KbEUZyQaajEX
        FScCAJqDwC77AgAA
X-CMS-MailID: 20200518050640epcas1p325ad883956af656e26788e218539fb10
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250
References: <CGME20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250@eucas1p1.samsung.com>
        <20200514100812.17043-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek,

20. 5. 14. 오후 7:08에 Marek Szyprowski 이(가) 쓴 글:
> Runtime power management is essential for the Exynos Mixer driver
> operation. It should be enabled before adding its DRM component, because
> in some cases (when deferred probe takes place due to the IOMMU
> availability) the DRM driver might be initialized directly from the
> Mixer's component_add() call, what results in starting the driver
> operation without enabling the runtime power management.

Seems better to change call order of mixer_remove function like below because you changed the one of probe function.
static int mixer_remove(struct platform_device *pdev)
{
	component_del(&pdev->dev, &mixer_component_ops);

	pm_runtime_disable(&pdev->dev);
}

It's a trivial thing and it would be no problem as-is - we don't touch HW in unbind - so picked it up.

Thanks,
Inki Dae

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_mixer.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index ffbf4a950f69..829d2ce7560d 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1200,9 +1200,11 @@ static int mixer_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, ctx);
>  
> +	pm_runtime_enable(dev);
> +
>  	ret = component_add(&pdev->dev, &mixer_component_ops);
> -	if (!ret)
> -		pm_runtime_enable(dev);
> +	if (ret)
> +		pm_runtime_disable(dev);
>  
>  	return ret;
>  }
> 
