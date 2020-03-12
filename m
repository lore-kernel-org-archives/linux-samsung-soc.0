Return-Path: <SRS0=z6PS=45=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD99C10DCE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Mar 2020 09:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 218602067C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 12 Mar 2020 09:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="J1357269"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgCLJRo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 12 Mar 2020 05:17:44 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58799 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLJRo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Mar 2020 05:17:44 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200312091742euoutp01c9423fbb16190f235608fed898f79768~7g9kE3qqg2031320313euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Mar 2020 09:17:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200312091742euoutp01c9423fbb16190f235608fed898f79768~7g9kE3qqg2031320313euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1584004662;
        bh=EgS01AJXAw4endn2MFPkJtrJ+FnKs9oauKWXYk0E9U8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=J13572691O9weXCYqecVBaEDb0e4y9ZGzKghkfJGCyDuzAPPOpDfYbJ2EHd5gUjdW
         gXdnMJoC+tz9P9Zt3pFOJMEIDw9wf32+vWMZwq5TZWmizken+DGic2Es2WOqhuTAm/
         VidwOEz5icNnrll64vavshkjEor5Q8U6sukVCxNA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200312091741eucas1p15a6dae6117ac10c11c0b3738443f7a37~7g9jo2vB_1355513555eucas1p1q;
        Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E6.FE.60698.53EF96E5; Thu, 12
        Mar 2020 09:17:41 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200312091741eucas1p118c87eb8c223a5ab31e9db488f84779c~7g9jVhzAP1341313413eucas1p1v;
        Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200312091741eusmtrp141683eb301109c34e832289bf0ad5233~7g9jUvkSI3209432094eusmtrp1U;
        Thu, 12 Mar 2020 09:17:41 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-04-5e69fe35a71b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.28.08375.53EF96E5; Thu, 12
        Mar 2020 09:17:41 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200312091740eusmtip1e3dbb8be0b0654dc26f698eb262acdb3~7g9ioN8F20994209942eusmtip1d;
        Thu, 12 Mar 2020 09:17:40 +0000 (GMT)
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Split bind() into probe()
 and real bind()
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andy Yan <andy.yan@rock-chips.com>
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <78cf2af3-3fbe-c381-b96d-fb14d959f6e8@samsung.com>
Date:   Thu, 12 Mar 2020 10:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310103427.26048-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHeXfOtrPR5Hg0fNRMGwTd1MSMQxcr6sMhIcQPEZWXlYcp6ZRN
        nRresGxpmTlKd1QqcbXEsryVQsuGecEroaCiGWjRMjO8haLW5pnkt9/z/p/n/zx/eAmM+iz0
        IGJVSaxapYiTi6R4U/tyn2/QemzEweYKOX2vfwTRr0trhfTg4qyIrijOoIf+WDHatGAQ010/
        h3D69v0qMT335S9Gl/abBfSLtnExbSm8RJfqraKTMmZ2+KaYaebGxUyZziBkOos+CZiJgg4B
        U1+Vxaxx73GmsKEaMa139TgzX7czVHpReiyajYtNYdX+wVHSmKWWeUFiHZm6pnuAZaNJWT6S
        EEAegtapGVE+khIUaUJgLuFwvlhAYBjrcyjzCCZXirDNEYN51CE8Q/CyZlXIFzMIPuimbQpB
        uJCXYdiA2d9dyTIEo+3fNnwxcl0A32vmkN1KRO6FtfoRkZ1lZDCYKnLFdsbJ3fDbko/beTt5
        AR6+WUd8jzN0GaY23iW2fuu7no1+jPSG3MYyjGc3GJ16JLAvAzKHgLxZ+92ErTgDPeVhfAQX
        +NHRIOZ5B3Tr7+A8Z8GE6QbGz+oQNL5qdmQ+CmN9KxvJMNvRtS3+vOUp+DWdyaMTDM848xc4
        QXFTiWOpDHR5FO+xCyZ6Gx1+bmAcWBQVITm3JRe3JQu3JQv3f+1jhFcjNzZZE69kNYEqVuun
        UcRrklVKv6sJ8XXI9uu61zsW3yLz6hULIgkk3yYrmo+JoISKFE1avAUBgcldZZHeyghKFq1I
        S2fVCZHq5DhWY0GeBC53kwVWWsMpUqlIYq+xbCKr3lQFhMQjG+UEK2Pblr8+9xnkhg7vGS/G
        nUpvaRs6loyU5HyYiftYub9ca+w+kuxnrQ0QaLVYRroqQ18WqsurAtNpycCKU/H0gbnI66Er
        ZizavaWntWHCd66z3yuz4Fx3b7WxPlXZHhX+VBlwfFWJvEJ8gkI8Kaq+wD1ssVmPnTWeeLIm
        xzUxioB9mFqj+AcjJbeacQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7qm/zLjDObv4bboP3+T0WLjjPWs
        Fle+vmezmDup1uLq95fMFiu+zGS3OPnmKotF58Ql7BafHvxntphxfh+Txdojd9ktDvVFW8yY
        /JLNgdfj/Y1Wdo+ds+6ye8zumMnqcWLCJSaP+93HmTw2L6n3+DtrP4tH35ZVjB4HeiezeHze
        JBfAFaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX
        8W3XZ6aCTQIVfzumMjcwPubtYuTkkBAwkZi57xZbFyMXh5DAUkaJSwufsUMkxCV2z3/LDGEL
        S/y51gVV9JpR4sPS04wgCWGBGIk1e16AJUQEZjNKrDuwih3EYRZoYJY41fOfGaJlIqPEzfOn
        weayCWhK/N18kw3E5hWwk1gxtxksziKgKvHhUBcLiC0qECHxeGI7I0SNoMTJmU/A4pxA9S/3
        ngGrZxZQl/gz7xIzhC0v0bx1NpQtLnHryXymCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem
        5xYb6hUn5haX5qXrJefnbmIExvi2Yz8372C8tDH4EKMAB6MSD++EzxlxQqyJZcWVuYcYJTiY
        lUR44+XT44R4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5h+8kriDU0NzS0sDc2NzY3NLJTE
        eTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MEZMK+au0FvdtXmBZdjSznfS0xSk3L5W/o/aH/N5
        UddNy8XvbN4WPUpZc6dpteb7yxPYddXvxwc+Tf+lLZbr32tp0h7UNPnz6rafk6cpmcTxpzIp
        Xd3Ovse554XkqfY5B1l2GNsvnfbDaIWuffyUx2/XnHk1ybTu3KKVe/MnFxR8/f126TM+6XtK
        LMUZiYZazEXFiQAPfudBBwMAAA==
X-CMS-MailID: 20200312091741eucas1p118c87eb8c223a5ab31e9db488f84779c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f
References: <CGME20200310104049eucas1p107e1ec61456fce4c830d3232a400b32f@eucas1p1.samsung.com>
        <20200310103427.26048-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10.03.2020 11:34, Marek Szyprowski wrote:
> Analogix_dp driver acquires all its resources in the ->bind() callback,
> what is a bit against the component driver based approach, where the
> driver initialization is split into a probe(), where all resources are
> gathered, and a bind(), where all objects are created and a compound
> driver is initialized.
>
> Extract all the resource related operations to analogix_dp_probe() and
> analogix_dp_remove(), then call them before/after registration of the
> device components from the main Exynos DP and Rockchip DP drivers. Also
> move the plat_data initialization to the probe() to make it available for
> the analogix_dp_probe() function.
>
> This fixes the multiple calls to the bind() of the DRM compound driver
> when the DP PHY driver is not yet loaded/probed:
>
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops fimd_component_ops [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops mixer_component_ops [exynosdrm])
> exynos-dp 145b0000.dp-controller: no DP phy configured
> exynos-drm exynos-drm: failed to bind 145b0000.dp-controller (ops exynos_dp_ops [exynosdrm]): -517
> exynos-drm exynos-drm: master bind failed: -517
> ...
> [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> exynos-drm exynos-drm: bound 14400000.fimd (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14450000.mixer (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 145b0000.dp-controller (ops hdmi_enable [exynosdrm])
> exynos-drm exynos-drm: bound 14530000.hdmi (ops hdmi_enable [exynosdrm])
> [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> Console: switching to colour frame buffer device 170x48
> exynos-drm exynos-drm: fb0: exynosdrmfb frame buffer device
> [drm] Initialized exynos 1.1.0 20180330 for exynos-drm on minor 1
> ...
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej



