Return-Path: <SRS0=LI8s=AZ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE09AC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Jul 2020 01:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76BF221974
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Jul 2020 01:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="B+Em6PhR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgGNBuP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 21:50:15 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:27364 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgGNBuO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 21:50:14 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200714015010epoutp044c9e36a1e2ff9ebf2043c044ea93371e~he2OdVhEo0548005480epoutp04s
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2020 01:50:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200714015010epoutp044c9e36a1e2ff9ebf2043c044ea93371e~he2OdVhEo0548005480epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1594691410;
        bh=HNyaDeR4AskBkcg0fKW9G9hZa5/3aL1Ks0nqKyfxK6E=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=B+Em6PhRisNIhefk62lDa4mdVGkcfhvuolh+Be2J63oVwI21AxSwkG0h4BLTKomA2
         Q4PeKEax1mdhgshBMRNWgF0FZ9+fouADoGMpcrzA2LB/KR14+DWXyuQn8guj3OPvlD
         GP1ORR+bQ7jakyZHlLIMt7N2+weos/H02wHvpw3c=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20200714015009epcas1p3ec010e8e446baa273d93d2a8503b24fe~he2NbUsgl2499324993epcas1p3C;
        Tue, 14 Jul 2020 01:50:09 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4B5NkR0pqdzMqYkn; Tue, 14 Jul
        2020 01:50:07 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.13.28578.D4F0D0F5; Tue, 14 Jul 2020 10:50:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200714015004epcas1p2c577099e34bb7d65099672707b866e02~he2I1CzTx1414714147epcas1p2r;
        Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200714015004epsmtrp20847ef4da655833f38eff2f57480999b~he2I0VIB12335223352epsmtrp2f;
        Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
X-AuditID: b6c32a39-e6f5da8000006fa2-8d-5f0d0f4df05e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        98.50.08303.C4F0D0F5; Tue, 14 Jul 2020 10:50:04 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200714015004epsmtip2a9627e2cff87a138853602602023bc31~he2IqdF4L0310703107epsmtip2S;
        Tue, 14 Jul 2020 01:50:04 +0000 (GMT)
Subject: Re: [PATCH v2] drm/exynos: gem: Fix sparse warning
To:     Sam Ravnborg <sam@ravnborg.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <5b6fc413-8850-5c23-93f4-736b310ea67f@samsung.com>
Date:   Tue, 14 Jul 2020 10:56:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200713160342.GB1223330@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmrq4vP2+8wellqha31p1jtdg4Yz2r
        xZWv79ksZpzfx2Sx9shddosVP7cyWsyY/JLNgd3jfvdxJo8l066yefRtWcXo8XmTXABLVLZN
        RmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtAFSgpliTml
        QKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwCywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjClP
        Z7EV7BeqONuQ1sB4jL+LkZNDQsBEYufsRkYQW0hgB6PEtpt8EPYnRokP/0O6GLmA7M+MEtf3
        tTPCNBxff5MFIrGLUeLkuc+MEM57RokH8+eygVQJC1hL/PxxFaxDRCBIorv3ATNIEbPAWUaJ
        vplHmUESbAKqEhNX3Adr4BWwk7hz6jhYAwtQ/EHLHHYQW1QgQuJ492R2iBpBiZMzn7CA2JxA
        Z3TOPgFmMwuIS9x6Mp8JwpaXaN46G2yZhEArh8TuzyfYIe52kbjQ18cMYQtLvDq+BSouJfH5
        3V42iIZmRomJM04zQTgdjBJ3H19ngagylti/dDJQggNohabE+l36EGFFiZ2/5zJCbOaTePe1
        hxWkREKAV6KjTQiiREni2MUb0LCTkLiwZCIbhO0hMWduB+sERsVZSH6bheSfWUj+mYWweAEj
        yypGsdSC4tz01GLDAlPk2N7ECE6dWpY7GKe//aB3iJGJg/EQowQHs5IILw8Xb7wQb0piZVVq
        UX58UWlOavEhRlNgaE9klhJNzgcm77ySeENTI2NjYwsTQzNTQ0Mlcd5/Z9njhQTSE0tSs1NT
        C1KLYPqYODilGphElI9cbq+ea1u1pXrJwxq9mwmXrjPUT5x67bObotJkg/wLlz3LovqP6rrI
        XUmy+35ok7rI6pwu3awiwVds4RtcbnpNeBHVsZivsmNTUNW0z2Ibxe9w2l7Y+0L16r0NnVu7
        sxk/rlWfuOOqj3nSd21d/zL3VSZMrc4G4XcreMpPFvff+PPv9dxv64NStr1aOP9a2NfX4SJr
        n4ZPDKj9KLcp4F9iVvs2cyF+6f7HVhO/Jxu+cjUr8XN/t+nmqzQDmTa92wmduycce3314/0J
        Tx9sVV5fynh1ZlzhrZe2fnwrjyfZLzFomvfrCdPL27Nzerx2PL/8dlHenpg+vuw/H7wnWK0L
        uWAQ2dhZx9F19NUiJZbijERDLeai4kQAHXGAOiYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvK4PP2+8QcMuHYtb686xWmycsZ7V
        4srX92wWM87vY7JYe+Quu8WKn1sZLWZMfsnmwO5xv/s4k8eSaVfZPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugStjytNZbAX7hSrONqQ1MB7j72Lk5JAQMJE4vv4mSxcjF4eQwA5GiUWPHzN3
        MXIAJSQktmzlgDCFJQ4fLoYoecsocXvrM0aQXmEBa4mfP64ygtSICARJbL1fAFLDLHCWUaLl
        2i1WkBohgd1AzvscEJtNQFVi4or7bCA2r4CdxJ1Tx8HmsADFH7TMYQexRQUiJFru/2GHqBGU
        ODnzCQuIzQl0Z+fsE2A2s4C6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYh
        aVnAyLKKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4TrS0djDuWfVB7xAjEwfjIUYJ
        DmYlEV4eLt54Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxfZy2MExJITyxJzU5NLUgtgskycXBK
        NTAZTb1y6eue7xEn5D+wXj+g05Czrnb27ELHK8E+jDX75h/kKFUJeckRcmD38dnyxaoZ8QIc
        MXNkd5096/bA5+zbkl9WyREJy2N+d+wOVP72t3xLKmPDquf/byrXsjOG1Vl++ea0ZPdlkbUv
        Ju646rqwrbtA4LxHAPfrhJ3zu86E1O09fovP//ob5cs31BtdWd+27X0TPiUuYsHWNRoms4tC
        M+1etCbM1L+VHnKpz27dq2cWEk5cWmkaT55LdZx1Dd668HpcW5/b/dOrlzz7qRa2Vf+Rz/rE
        +beCxatd38kd9r3QfiBQnP/tSvYfBTbrqxL0Nh3l/G1SVTv3A999q9RdP1+/PvKn6HuK+E+N
        TdIflViKMxINtZiLihMBZLJ2ugIDAAA=
X-CMS-MailID: 20200714015004epcas1p2c577099e34bb7d65099672707b866e02
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c
References: <CGME20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c@eucas1p2.samsung.com>
        <20200713070708.30828-1-m.szyprowski@samsung.com>
        <20200713160342.GB1223330@ravnborg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



20. 7. 14. 오전 1:03에 Sam Ravnborg 이(가) 쓴 글:
> On Mon, Jul 13, 2020 at 09:07:08AM +0200, Marek Szyprowski wrote:
>> kvaddr element of the exynos_gem object points to a memory buffer, thus
>> it should not have a __iomem annotation. Then, to avoid a warning or
>> casting on assignment to fbi structure, the screen_buffer element of the
>> union should be used instead of the screen_base.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I expect one of the exynos maintianers (Inki?) to pick it up.

Picked it up.

Thanks,
Inki Dae

> 
> 	Sam
> 
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
>>  drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> index 56a2b47e1af7..5147f5929be7 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
>> @@ -92,7 +92,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>>  	offset = fbi->var.xoffset * fb->format->cpp[0];
>>  	offset += fbi->var.yoffset * fb->pitches[0];
>>  
>> -	fbi->screen_base = exynos_gem->kvaddr + offset;
>> +	fbi->screen_buffer = exynos_gem->kvaddr + offset;
>>  	fbi->screen_size = size;
>>  	fbi->fix.smem_len = size;
>>  
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> index 7445748288da..74e926abeff0 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
>> @@ -40,7 +40,7 @@ struct exynos_drm_gem {
>>  	unsigned int		flags;
>>  	unsigned long		size;
>>  	void			*cookie;
>> -	void __iomem		*kvaddr;
>> +	void			*kvaddr;
>>  	dma_addr_t		dma_addr;
>>  	unsigned long		dma_attrs;
>>  	struct sg_table		*sgt;
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://protect2.fireeye.com/url?k=33cc4690-6e52dd7a-33cdcddf-0cc47a6cba04-3234389cf6ac8e89&q=1&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
> 
