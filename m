Return-Path: <SRS0=F6EI=D2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35F2C433E7
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 05:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26F3722260
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Oct 2020 05:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tEe/FqeR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgJSFal (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Oct 2020 01:30:41 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:52778 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgJSFal (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Oct 2020 01:30:41 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201019053039epoutp043f7bff581e4e708b53f16e0abf91500a~-Tba8RLTI1600116001epoutp047
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Oct 2020 05:30:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201019053039epoutp043f7bff581e4e708b53f16e0abf91500a~-Tba8RLTI1600116001epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603085439;
        bh=WeTTCzDpOQ7XbkeWqPVnTgIy6m9BJhORQyCxqSptRMI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=tEe/FqeRV6go9ZdfDzlCJziW7GsU7qCNEGe3sCxSLRB2k9rNLFp5pmkRJLNoyd8tL
         3OsXAq0tM4ZNd+98apIR8RRWTrN5ykYsT+wnaBxx2dZdc2IiecEHRCKK+t7UY+kEJl
         tj6zOORzZ52C73CaZqPD01o8FG0/BwtQwEsSIC4o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201019053037epcas1p2013dd979619a6b5efce63af4de47feae~-TbZMGEI51360613606epcas1p2h;
        Mon, 19 Oct 2020 05:30:37 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.157]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4CF5233HQ4zMqYkt; Mon, 19 Oct
        2020 05:30:35 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        51.94.09918.B742D8F5; Mon, 19 Oct 2020 14:30:35 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20201019053034epcas1p4f0e7875ba34fb6ac270034e7520cec97~-TbVunWEJ2374623746epcas1p4e;
        Mon, 19 Oct 2020 05:30:34 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201019053033epsmtrp25d0a8da8029c0cc621ed3d277916408b~-TbVuIP-f0823908239epsmtrp2G;
        Mon, 19 Oct 2020 05:30:33 +0000 (GMT)
X-AuditID: b6c32a36-713ff700000026be-81-5f8d247bcb15
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7E.1E.08745.9742D8F5; Mon, 19 Oct 2020 14:30:33 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201019053033epsmtip208d2ba83f6aaf51c187ed0b7356431a5~-TbVl327g3161631616epsmtip2Y;
        Mon, 19 Oct 2020 05:30:33 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos/hdmi: add support for 1920x1200@60Hz mode
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <2c460f28-96a6-d2c4-a6c1-9879036a4183@samsung.com>
Date:   Mon, 19 Oct 2020 14:37:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201009130524.30828-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdlhTX7dapTfe4N12CYtb686xWlz5+p7N
        Ysb5fUwWa4/cZbeYMfklmwOrx/3u40wefVtWMXp83iQXwByVbZORmpiSWqSQmpecn5KZl26r
        5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkDtFJJoSwxpxQoFJBYXKykb2dTlF9akqqQ
        kV9cYquUWpCSU2BZoFecmFtcmpeul5yfa2VoYGBkClSYkJ3x4fQhxoLbnBWN668yNTA+Yu9i
        5OSQEDCReLhtGWMXIxeHkMAORommO5eYIJxPjBI/T7WyQjifGSV+/VzKDNPyr+U4O0RiF6PE
        gxmrofrfA/W3HQYbLCzgKXH2zEqwDhGBUom5/4+BxZkFAiVuz+wCs9kEVCUmrrjPBmLzCthJ
        PH7yA8xmAYp3965iBbFFBSIkjndPZoeoEZQ4OfMJC4jNCVT//tsmZoiZ4hK3nsxngrDlJZq3
        zmYGOUhC4CW7xO7GfqizXSQ+vLkAZQtLvDq+BRoCUhKf3+1lg2hoZpSYOOM0E4TTwShx9/F1
        FogqY4n9SycDJTiAVmhKrN+lDxFWlNj5ey4jxGY+iXdfe1hBSiQEeCU62oQgSpQkjl28wQhh
        S0hcWDKRDcL2kFh+4RzjBEbFWUh+m4Xkn1lI/pmFsHgBI8sqRrHUguLc9NRiwwIj5PjexAhO
        kFpmOxgnvf2gd4iRiYPxEKMEB7OSCG+kYFe8EG9KYmVValF+fFFpTmrxIUZTYGhPZJYSTc4H
        pui8knhDUyNjY2MLE0MzU0NDJXHeP9od8UIC6YklqdmpqQWpRTB9TBycUg1M08VfpITXlH2I
        9Gn/unRV99mDvw5XXlzv5L2Z7dqmiG87/txIWchc2dTJvsM6fE2Sy9PNXuvsXwhf2bFtl+rx
        TQu8yz2uvk9rZHr+bOprBbbV/R+PlARvUPWZterb8/4eq5cbn/X9ZDgqush78aawcL59xaYc
        WdsSpKd/c9Fe2ig4yexEeOyjQ3vWaR6/n3mz8PZ7v8sV73h1TCzfpP9OWK51clnjxdeFdXF7
        NfUm7AkNMeT4diNh3qowZqfPdnq3GvauLd257cvrk6tlWqWFeZz/L7Xdt+PcLcb0UuMk7s4L
        LGGfljQ5WF902sZq3ur+r2ZGxv704wdC0pceKI27X/O0OcjM3TS+Zot8nOKRFCWW4oxEQy3m
        ouJEAF3wSegZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWy7bCSvG6lSm+8wby5Vha31p1jtbjy9T2b
        xYzz+5gs1h65y24xY/JLNgdWj/vdx5k8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK+PD6UOM
        Bbc5KxrXX2VqYHzE3sXIySEhYCLxr+U4kM3FISSwg1Hi5pKbLF2MHEAJCYktWzkgTGGJw4eL
        IUreMkpMO3GVBaRXWMBT4uyZlcwgtohAqcSr/vuMIDazQKDE5w+bmSEaJjJKnH+1DmwZm4Cq
        xMQV99lAbF4BO4nHT36A2SxA8e7eVawgtqhAhETL/T/sEDWCEidnPgFbxglU//7bJmaIBeoS
        f+ZdgrLFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ1ILi3PTcYsMCo7zU
        cr3ixNzi0rx0veT83E2M4GjQ0trBuGfVB71DjEwcjIcYJTiYlUR4IwW74oV4UxIrq1KL8uOL
        SnNSiw8xSnOwKInzfp21ME5IID2xJDU7NbUgtQgmy8TBKdXAFHxAZNa0Z3rq74KO6vOYnFVb
        d26PXueRZfFnVl0ojz1r7jKV8YvrgQ2veHZPOJp4oelvvabE3XX2Pvpm5Wcv7vdfwLNFbJV5
        3tZjKR6s7C/X9SbHP7rY5q28UmQiz1fjFWwur/ljmS7Iv83Ju3/+41Hz7Q89Bb2uxssonnSy
        N9pavir6W6uu2/8UtxuBUfceu+1darMz2lkxu+vGiSle3n/ennq0WjqNRenC82Oy88u5Gg8k
        FBhW6lvZ/u7e/Sdd2aau5pezhcbelz8MphxQTBETnbTlYKF8zM/Pc8UmyrTlpm5d9HyG5wS2
        o10a809avTAJnuN/Sef6k7V/t7gyml35WqdmNkPxR/Zb5qzsWCWW4oxEQy3mouJEACYmWmP1
        AgAA
X-CMS-MailID: 20201019053034epcas1p4f0e7875ba34fb6ac270034e7520cec97
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201009130531eucas1p25ba0c17803bd0647c65603feb3180799
References: <CGME20201009130531eucas1p25ba0c17803bd0647c65603feb3180799@eucas1p2.samsung.com>
        <20201009130524.30828-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 10. 9. 오후 10:05에 Marek Szyprowski 이(가) 쓴 글:
> Add clock configuration for 154MHz pixelclock to Exynos542x HDMIPHY,
> which is required for 1920x1200@60Hz mode. The PLL configuration data
> has been taken from the vendor's kernel tree for the Odroid XU4 board.

Merged.

Thanks,
Inki Dae

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index dc01c188c0e0..39fa5d3b01ef 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -522,6 +522,15 @@ static const struct hdmiphy_config hdmiphy_5420_configs[] = {
>  			0x54, 0x4B, 0x25, 0x03, 0x00, 0x80, 0x01, 0x80,
>  		},
>  	},
> +	{
> +		.pixel_clock = 154000000,
> +		.conf = {
> +			0x01, 0xD1, 0x20, 0x01, 0x40, 0x30, 0x08, 0xCC,
> +			0x8C, 0xE8, 0xC1, 0xD8, 0x45, 0xA0, 0xAC, 0x80,
> +			0x08, 0x80, 0x09, 0x84, 0x05, 0x02, 0x24, 0x86,
> +			0x54, 0x3F, 0x25, 0x03, 0x00, 0x00, 0x01, 0x80,
> +		},
> +	},
>  };
>  
>  static const struct hdmiphy_config hdmiphy_5433_configs[] = {
> 
