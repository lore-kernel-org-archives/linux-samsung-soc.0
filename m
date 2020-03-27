Return-Path: <SRS0=2lPF=5M=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E67C43331
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 07:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9485520714
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Mar 2020 07:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="H43wiQVR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgC0Hon (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Mar 2020 03:44:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46919 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgC0Hom (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Mar 2020 03:44:42 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200327074439euoutp02253472c0a12caa749c594cc323a067ea~AGXnF-B681608916089euoutp02W
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Mar 2020 07:44:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200327074439euoutp02253472c0a12caa749c594cc323a067ea~AGXnF-B681608916089euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585295079;
        bh=/saM3byIZvfXG+T7y4Al0/135Ja5jfEK/cijvzHBurw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=H43wiQVRZMEhMpcOveazAJzk5WVLhXPDJsOzJAwFBngDeKPceEchcvFYGP58FHoHs
         bgwBwLD9gnV4UG8HC8yZHtmwjZRoggbKLajv2dAxAAz2C/5xHR+AHyPjTL39goodxK
         K7BprqggZxRLbueXVbi2L+GajLv4zpjsGeRpG7U8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200327074439eucas1p1ecdd5313a25deeabad0a3873a1e757cb~AGXmohhRG3126931269eucas1p1y;
        Fri, 27 Mar 2020 07:44:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E0.45.60698.7EEAD7E5; Fri, 27
        Mar 2020 07:44:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200327074438eucas1p1aa7d1f0f07814a6d77114b6cc1b5dcf8~AGXmPjcaC2921029210eucas1p1V;
        Fri, 27 Mar 2020 07:44:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200327074438eusmtrp2ea01d6038b27ddf280835d5b90738b01~AGXmO06E42463624636eusmtrp2S;
        Fri, 27 Mar 2020 07:44:38 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-b9-5e7daee75331
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B4.F4.08375.6EEAD7E5; Fri, 27
        Mar 2020 07:44:38 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200327074438eusmtip27ac22e5f2743ef860347087c9c86a9f8~AGXloYKrH1556715567eusmtip2S;
        Fri, 27 Mar 2020 07:44:38 +0000 (GMT)
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
Message-ID: <1386cf0a-7359-c1c5-35bc-c86ce944f035@samsung.com>
Date:   Fri, 27 Mar 2020 08:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310103427.26048-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHKsWRmVeSWpSXmKPExsWy7djP87rP19XGGcx/zGbRf/4mo8XGGetZ
        La58fc9mMXdSrcXV7y+ZLVZ8mclucfLNVRaLzolL2C0+PfjPbDHj/D4mi7VH7rJbHOqLtpgx
        +SWbA6/H+xut7B47Z91l95jdMZPV48SES0we97uPM3lsXlLv8XfWfhaPvi2rGD0O9E5m8fi8
        SS6AK4rLJiU1J7MstUjfLoErY+vDx0wFzQIVS1fsYW1g3MnbxcjJISFgIrH0ywPWLkYuDiGB
        FYwS8+9uY4dwvjBKvFo4lQnC+cwoce/jfMYuRg6wlnl/HSHiyxkl3lx7A9XxllFi+q/1rCBF
        wgIxEjdmMoPERQRmM0rcOvaMBcRhFvjHJPFizSdGkOVsApoSfzffZAOxeQXsJO4feMACYrMI
        qEp8uv4QrEZUIEJi2vZ/jBA1ghInZz4Bq+EEqn+59ww7iM0sIC+x/e0cZghbXOLWk/lgZ0sI
        tHJIfJs5gx3iUxeJJX9WsEDYwhKvjm+BistI/N8J0gBi10vcX9HCDNHcwSixdcNOZoiEtcSd
        c7/YQF5jBrp6/S59SFA4Srx7XQdh8knceCsIcQKfxKRt05khwrwSHW1CEDMUJe6f3Qo1T1xi
        6YWvbBMYlWYheWwWkmdmIXlmFsLaBYwsqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQJT
        3el/x7/uYNz3J+kQowAHoxIPb0NbTZwQa2JZcWXuIUYJDmYlEd6nkUAh3pTEyqrUovz4otKc
        1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUaGMX6HiTe23Tsyt4ZnZU/t2a62D7+
        tTfHTruLX7u4LpI7a79lab1C/7Wl4gGFF9qfntOYysoYvIrhWrt+cL5SblMIX0IoR5htQpbo
        j5Aa3vOaId1uHd7+8c3X+yQzd/vUndy4kqvz9+r874usGbedOJax7MT7687eTyc0Gjps3hVp
        yRPEIJioxFKckWioxVxUnAgA1iL4EXEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsVy+t/xe7rP1tXGGczYpWHRf/4mo8XGGetZ
        La58fc9mMXdSrcXV7y+ZLVZ8mclucfLNVRaLzolL2C0+PfjPbDHj/D4mi7VH7rJbHOqLtpgx
        +SWbA6/H+xut7B47Z91l95jdMZPV48SES0we97uPM3lsXlLv8XfWfhaPvi2rGD0O9E5m8fi8
        SS6AK0rPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv
        Y+vDx0wFzQIVS1fsYW1g3MnbxcjBISFgIjHvr2MXIxeHkMBSRokta3qYuxg5geLiErvnv4Wy
        hSX+XOtigyh6zSgx9dMpVpCEsECMxJo9L8ASIgKzGSXWHVjFDuIwCzQwS5zq+c8M0TKRUeLm
        +dPsIC1sApoSfzffZAOxeQXsJO4feMACYrMIqEp8uv6QEcQWFYiQeDyxnRGiRlDi5MwnYDWc
        QPUv954Bm8MsoC7xZ94lZghbXmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiS
        Wlqcm55bbKhXnJhbXJqXrpecn7uJERjh24793LyD8dLG4EOMAhyMSjy8Gi01cUKsiWXFlbmH
        GCU4mJVEeJ9GAoV4UxIrq1KL8uOLSnNSiw8xmgI9N5FZSjQ5H5h88kriDU0NzS0sDc2NzY3N
        LJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MGpdUitp7PxvGpa9V+FS5P10wyOTNv+f2fS9
        sUhvyuGtCeq+Gp/+KjpKyTC+ONBz8fEktQf5t4Kdbz5nS9sz7VYUy+7Ptea/u3wNPiz9FBH4
        9cBV87Bzj6Q1v9vp1jdONff7uVUqu6F3Vt2Ku2F5LLbLN6/Y4PIsmXVFyfMV/o+ZT0Qc3bFE
        XkSJpTgj0VCLuag4EQBNfC7pBgMAAA==
X-CMS-MailID: 20200327074438eucas1p1aa7d1f0f07814a6d77114b6cc1b5dcf8
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


Queued to fixes.


Andrzej


