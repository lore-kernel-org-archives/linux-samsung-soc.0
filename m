Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488C2C433E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 12:59:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C926C20872
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 12:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FKU64WC5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgIOM7b (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:59:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54654 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgIOM7B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 08:59:01 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915125900euoutp01cd21ce311cc12c3e44d9831d66ea0f9c~09nK2fVJ60568705687euoutp01D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 12:59:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915125900euoutp01cd21ce311cc12c3e44d9831d66ea0f9c~09nK2fVJ60568705687euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600174740;
        bh=LjMlZqWfN//ybv/ftfoW2nB5Zs+Ze6Pkj/B0htL86fs=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=FKU64WC5d23qvrBfaOvxnlGAH0PgRrumuoCL288JdPPCy0sjZ0OgbizXafgmoTaGm
         vEramRHanFgXMLrnztBRpAYZRWilRIdsCAFGczaZnXRs33xRVMPZ7Tb9qcojT4qX+Y
         iQPwHIdbGObEcRAohQUT+qpQAMmAm/EKXSp1C54E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915125838eucas1p2e5bee0e8a59a2976e843571c254796b2~09m3ID49B2925029250eucas1p2a;
        Tue, 15 Sep 2020 12:58:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id FA.42.06318.E7AB06F5; Tue, 15
        Sep 2020 13:58:38 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915125838eucas1p24902fcee351207486d3d8c8be545867a~09m2aji220381803818eucas1p2I;
        Tue, 15 Sep 2020 12:58:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915125838eusmtrp192dc79a9638178f890691cfa0ee71375~09m2YFPdy1707317073eusmtrp18;
        Tue, 15 Sep 2020 12:58:38 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-25-5f60ba7e42ef
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.D9.06017.E7AB06F5; Tue, 15
        Sep 2020 13:58:38 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200915125837eusmtip2b09d22297190411b1251818016054868~09m1Y3pkZ1272112721eusmtip2c;
        Tue, 15 Sep 2020 12:58:37 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] clk: samsung: exynos5420: Add definition of
 clock ID for mout_sw_aclk_g3d
To:     linux-clk@vger.kernel.org
Cc:     tomasz.figa@gmail.com, cw00.choi@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <d3d7f0d2-d21b-0b7b-7546-5161db01f44d@samsung.com>
Date:   Tue, 15 Sep 2020 14:58:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200811151251.31613-1-s.nawrocki@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsWy7djP87p1uxLiDTb8NLfYOGM9q8X1L89Z
        LT723GO1uLxrDpvFjPP7mCzWHrnLbnHxlKvFv2sbWSxW7frD6MDp8f5GK7vHzll32T02repk
        8+jbsorR4/MmuQDWKC6blNSczLLUIn27BK6MK4+bmQr+MlU8u72NvYFxD1MXIyeHhICJxIXj
        T9i6GLk4hARWMEpc33SBBcL5wijRcm4bK4TzmVFi/8pnQGUcYC2b7leAdAsJLGeUONqVAmF/
        ZJR49E8IxBYWSJf4dwlig4iArMStYz/BNjALXGOUODRxFRtIgk3AUKL3aB8jiM0rYCfx4/Bb
        sDiLgKpE387TYHFRgTiJY6cesUDUCEqcnPkEzOYUsJE48/cmWA2zgLjErSfzmSBseYntb+cw
        gyyTEDjGLjHl2zx2iD9dJGbf3gdlC0u8Or4FypaROD25hwWioZlRomf3bXYIZwKjxP3jCxgh
        qqwl7pz7BfY+s4CmxPpd+hBhR4mtl+6xQkKFT+LGW0GII/gkJm2bzgwR5pXoaBOCqFaR+L1q
        OjTYpSS6n/xnmcCoNAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpec
        n7uJEZiUTv87/nUH474/SYcYBTgYlXh4OUrj44VYE8uKK3MPMUpwMCuJ8DqdPR0nxJuSWFmV
        WpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU7NTUgtQimCwTB6dUAyO/g9ja3UVprKLSCrun
        Tr7As07syvszQlE3jqyTNxT5sLtZ0cXh5PRW/h+xcR0f8wxKfiyTagx79OO1qJZm5Sd99cUT
        0o6YN5zaVcetwHq44qJIulT2/1XLpY1/LnC4lbvjovIcj0OxJq+VKuvv3V76j4c3KeR9mvYE
        lrA95f0+1+/MD9XP6VNiKc5INNRiLipOBACsyZjnRgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xe7p1uxLiDT5/Z7PYOGM9q8X1L89Z
        LT723GO1uLxrDpvFjPP7mCzWHrnLbnHxlKvFv2sbWSxW7frD6MDp8f5GK7vHzll32T02repk
        8+jbsorR4/MmuQDWKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSc
        zLLUIn27BL2MK4+bmQr+MlU8u72NvYFxD1MXIweHhICJxKb7FV2MXBxCAksZJb7ObGKDiEtJ
        zG9R6mLkBDKFJf5c62IDsYUE3jNKXP8WC2ILC6RL/Ph1nxHEFhGQlbh17CcbyBxmgWuMEsu3
        bWODGNrPKDHx4EwmkCo2AUOJ3qN9YB28AnYSPw6/BZvKIqAq0bfzNFhcVCBO4kzPCzaIGkGJ
        kzOfsIDYnAI2Emf+3gSrYRZQl/gz7xIzhC0ucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZ
        SFoWMLKsYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIzCbcd+btnB2PUu+BCjAAejEg9vQnl8
        vBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YIPJK4g1N
        Dc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTAKlx+UZN97Q8WKdeWhKaHR
        D9pPGW/OeNDZubDUYkrnRL0lv+okxWXK0k34XTdveiThf+uSv1f/+vm7esXZd9g9UjN+J1HB
        eOa96n5P37kGZ9cU5fgeSF2jP7XUTzT3euLSO0Hake6VlakczSp6t/tOfI9amiDtUbcn67LI
        iyWWxzf0Tty0arMSS3FGoqEWc1FxIgCjLGV42AIAAA==
X-CMS-MailID: 20200915125838eucas1p24902fcee351207486d3d8c8be545867a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200811151259eucas1p19d1f6a21e46ac9382a89cd3d3cb0b6c8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200811151259eucas1p19d1f6a21e46ac9382a89cd3d3cb0b6c8
References: <CGME20200811151259eucas1p19d1f6a21e46ac9382a89cd3d3cb0b6c8@eucas1p1.samsung.com>
        <20200811151251.31613-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11.08.2020 17:12, Sylwester Nawrocki wrote:
> This patch adds ID for the mout_sw_aclk_g3d (SW_CLKMUX_ACLK_G3D) clock,
> mostly for internal use in the CMU driver. It will allow to avoid the
> __clk_lookup() call when setting up the clock during the clock provider
> initialization.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Applied both patches.
