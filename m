Return-Path: <SRS0=iB35=AY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19ADC433E3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 06:19:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2D9E2065F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 06:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mZqKYM3J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgGMGTc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 02:19:32 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57844 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbgGMGTb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 02:19:31 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200713061928euoutp0269602253d84680077bf10d8c5e4a2445~hO4EgKYXv1971619716euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 06:19:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200713061928euoutp0269602253d84680077bf10d8c5e4a2445~hO4EgKYXv1971619716euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594621168;
        bh=qEEhINtpDfVNfGXiKaqgjGXL6Xp2WAPnJ235t6FDqYc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mZqKYM3JVWG6JY1hcUqAK2ceHIuSu+bhOnoxL3KWkUdpANIqxcIRuAchdqrvs/ihQ
         9Ug+jWn1VjwIpViECxHTIBx9D8Ug3vobXuVHNFTc7ZrOfKpZ2TnZHj7g7CUnHKRk8u
         mfTrYOdUHYb7TiFDjPE58yf4FwHU0o2Z0cld/c+w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200713061928eucas1p12f54b2c5085cd6abc172e2f472940b8a~hO4EDdj5w2327023270eucas1p1a;
        Mon, 13 Jul 2020 06:19:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 71.38.06456.0FCFB0F5; Mon, 13
        Jul 2020 07:19:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200713061927eucas1p14082a27fb134e887a8c52c4460062dae~hO4DYB8Dz2552825528eucas1p1X;
        Mon, 13 Jul 2020 06:19:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200713061927eusmtrp1334875425fbe85eadb188f1af31f5950~hO4DXcjD00094200942eusmtrp18;
        Mon, 13 Jul 2020 06:19:27 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-9b-5f0bfcf00482
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D0.4F.06017.FECFB0F5; Mon, 13
        Jul 2020 07:19:27 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200713061927eusmtip1f4294bf91853ba26f92175f8bed9704d~hO4C59FnY2175821758eusmtip1W;
        Mon, 13 Jul 2020 06:19:27 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: gem: Fix sparse warning
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <94a95357-51b9-c3b5-4d3d-fdde7bcd395d@samsung.com>
Date:   Mon, 13 Jul 2020 08:19:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710183037.GI17565@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7of/nDHG0xfIGRxa905VouNM9az
        Wlz5+p7NYsb5fUwWK35uZbSYMfklmwObx/3u40weS6ZdZfPo27KK0ePzJrkAligum5TUnMyy
        1CJ9uwSujAn7OtgL1nFXXPxyjK2BcT1nFyMnh4SAicT+hXtYuhi5OIQEVjBK3Dj/nBnC+cIo
        0dXwkhHC+cwoMXfjeSaYlvbmU1Atyxkllh2dAlX1nlHizJeVjCBVwgIWEgef32EGsUUElCWO
        n7/GCmIzC5xllPj4zBHEZhMwlOh628UGYvMK2Ek0r38LZrMIqEocWfAarF5UIE5i/cvtTBA1
        ghInZz5hAbE5BYwkzrx7xQgxU15i+9s5zBC2uMStJ/OZQA6SEFjGLrH40FZ2iLNdJLr/L2GB
        sIUlXh3fAhWXkTg9uYcFoqGZUeLhubXsEE4Po8TlphmMEFXWEnfO/QI6jwNohabE+l36EGFH
        iV3bdjGChCUE+CRuvBWEOIJPYtK26cwQYV6JjjYhiGo1iVnH18GtPXjhEvMERqVZSF6bheSd
        WUjemYWwdwEjyypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzAlHP63/FPOxi/Xko6xCjA
        wajEw6thyB0vxJpYVlyZe4hRgoNZSYTX6ezpOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8xote
        xgoJpCeWpGanphakFsFkmTg4pRoYZQWeybyfE520y4rROeJY05F3CjusVp+8eP7rRfEVCfek
        +x6vztp143zm6ZwJk60NzDc03jFjUIp3yW5tqZ2972vmXVNH3vXWPlslj71dfmrV16fyHMnS
        JUVyJlG/P+d01HzZnFYvc9dqygMxqx03lr7jOcx0mEd4wQfzDN4bp/4LrM6dpaewWYmlOCPR
        UIu5qDgRAGfYBxk1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRmVeSWpSXmKPExsVy+t/xu7rv/3DHG8yarmxxa905VouNM9az
        Wlz5+p7NYsb5fUwWK35uZbSYMfklmwObx/3u40weS6ZdZfPo27KK0ePzJrkAlig9m6L80pJU
        hYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jAn7OtgL1nFXXPxy
        jK2BcT1nFyMnh4SAiUR78ykWEFtIYCmjxI1XshBxGYmT0xpYIWxhiT/Xuti6GLmAat4ySsz8
        cgCsQVjAQuLg8zvMILaIgLLE8fPXWEGKmAXOM0p8vXMEqmMHo8T3+S/YQKrYBAwlut52gdm8
        AnYSzevfgtksAqoSRxa8BlsnKhAnsXzLfHaIGkGJkzOfgG3jFDCSOPPuFSOIzSxgJjFv80Nm
        CFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeu
        l5yfu4kRGGPbjv3csoOx613wIUYBDkYlHt4LetzxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUms
        rEotyo8vKs1JLT7EaAr03ERmKdHkfGD855XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnN
        Tk0tSC2C6WPi4JRqYJzPJ7t5vvEhziUrK1cvfq7BWrrGwtngbEzSj0V+PO8WbXC/tC7uzLbG
        VD/Bpa1bkrpPbXO12L8y7lL3dP8fbaLrzjZuVEo3nBESm7vE3u/Fr286c7Y+qJ+crPW5fp7A
        9Rlb+E2m9dy73741kXfVJZG86gUymve5e9v2M9XJtM30nrrojXHaQhMlluKMREMt5qLiRAAO
        OChUxwIAAA==
X-CMS-MailID: 20200713061927eucas1p14082a27fb134e887a8c52c4460062dae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f
References: <CGME20200707110911eucas1p1e21621f402b2aac89457647c3b2ad46f@eucas1p1.samsung.com>
        <20200707110859.3822-1-m.szyprowski@samsung.com>
        <20200710183037.GI17565@ravnborg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

On 10.07.2020 20:30, Sam Ravnborg wrote:
> Hi Marek.
>
> On Tue, Jul 07, 2020 at 01:08:59PM +0200, Marek Szyprowski wrote:
>> Add a proper cast on the exynos_gem->kvaddr assignment to avoid a sparse warning.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 9940d9d93406 ("drm/exynos: gem: Get rid of the internal 'pages' array")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> index efa476858db5..65d11784f29f 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -59,7 +59,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>>   	}
>>   
>>   	if (kvmap)
>> -		exynos_gem->kvaddr = exynos_gem->cookie;
>> +		exynos_gem->kvaddr = (void __iomem *)exynos_gem->cookie;
> >From a brif look at the code the correct fix looks to me to drop the
> __iomem annotation of kvaddr.
> And then no cast is needed.
>
> Care to take a look at this?

Right, besides dropping iomem annotation, I will change fbi->screen_base 
assignment to fbi->screen_buffer. This was probably the main reason of 
this iomem annotation.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

