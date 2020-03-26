Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19968C2D0E8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAE8720787
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 09:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bp+idzym"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgCZJqk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 05:46:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40650 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgCZJqh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 05:46:37 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200326094635euoutp02d5b55151383d11b8bdf36cfa625e10ba~-0YyAGXeJ2204122041euoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200326094635euoutp02d5b55151383d11b8bdf36cfa625e10ba~-0YyAGXeJ2204122041euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585215995;
        bh=04ZGY2Bca+YUKREYEcngK3GJIT9mmlLdQyqP5Y0zZAE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=bp+idzym+U/oinfujIcDtv6YKv6+RDIwjlOyIB7VnL18s4/4DzlGO5utCHSR+WTmk
         fa3n3vAsg8SwhkckZ9jor5xGMfbkmNcrs9sTHHw3g7ogHpGcS2i+3gtSSxWp2bMThr
         s7q3JtvAdy8UfKvdfKtwiRRkK0824lTEgu/KBp8I=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326094635eucas1p1a481e1da42dcd14bdc7efda22e7f9945~-0YxzgaL90328503285eucas1p1R;
        Thu, 26 Mar 2020 09:46:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A0.4C.61286.AF97C7E5; Thu, 26
        Mar 2020 09:46:34 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094634eucas1p23ee479ba6c38c6baca839375a6751f0e~-0YxeWXp_2077120771eucas1p2e;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326094634eusmtrp17f349f50097af6d29de5e37d9f33f624~-0Yxdy_l93171231712eusmtrp1M;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-ec-5e7c79faab26
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.D2.08375.AF97C7E5; Thu, 26
        Mar 2020 09:46:34 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200326094634eusmtip241ae0ac8d48fec316d802318fad3e047~-0YxHRtXs2258722587eusmtip20;
        Thu, 26 Mar 2020 09:46:34 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 0/4] Enable Broadcom SDIO WLAN for the Exynos boards
Date:   Thu, 26 Mar 2020 10:46:22 +0100
Message-Id: <20200326094626.28308-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djPc7q/KmviDO7MsrHYOGM9q8X1L89Z
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBlz/7kU
        zGSv2D9pBWsD4x3WLkZODgkBE4nmmV+Yuhi5OIQEVjBK7J/4ihHC+cIo0f2yjRXC+cwosWT3
        BkaYlicvv0EllgMl5h9jg2s5PnsB2GA2AUOJrrddbCC2iICqxOe2BewgRcwC2xgltvQ+YAZJ
        CAu4SOzZPZMFxGYBKtp7uhfM5hWwlVj19ggLxDp5idUbDjCDNEsIbGCTmPf8KDNEwkXiwIt3
        UG8IS7w6voUdwpaROD25hwWioZlR4uG5tewQTg+jxOWmGVBfWEvcOfcL6D4OoJs0Jdbv0ocI
        O0p0PlvFChKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1yCOs1D4mnHdLBF
        QgKxEge+n2GfwCg3C2HXAkbGVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIFxfvrf8U87
        GL9eSjrEKMDBqMTDu8GyOk6INbGsuDL3EKMEB7OSCO/TyJo4Id6UxMqq1KL8+KLSnNTiQ4zS
        HCxK4rzGi17GCgmkJ5akZqemFqQWwWSZODilGhg7ZOfvPZQZ6750UbS2qnD3Wv1926dLXWUV
        0bbg0zty4dhyjcMSt1LUui5uLd+mGVJi/vLa+t9OZVFa5X8UtjH26C70rBAzbWsS4i76k/+c
        1T8u5tTrtWdzq7i+Vr17cvUv61ne5lzm3l0PFS1eRDwPmPrnpfPqunPvalhdvgWzfs+eG7/G
        nVuJpTgj0VCLuag4EQARPAJc7wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsVy+t/xe7q/KmviDLo6VCw2zljPanH9y3NW
        i/PnN7BbzDi/j8li7ZG77A6sHptWdbJ59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbcfy4FM9kr9k9awdrAeIe1i5GTQ0LA
        ROLJy29ANheHkMBSRol3m8+xQyRkJE5Oa4AqEpb4c62LDaLoE6PE3I2n2UASbAKGEl1vu8Bs
        EQFVic9tC9hBipgFdjBKbNnxFqxbWMBFYs/umSwgNgtQ0d7TvWA2r4CtxKq3R1ggNshLrN5w
        gHkCI88CRoZVjCKppcW56bnFhnrFibnFpXnpesn5uZsYgcG17djPzTsYL20MPsQowMGoxMO7
        wbI6Tog1say4MvcQowQHs5II79PImjgh3pTEyqrUovz4otKc1OJDjKZAyycyS4km5wMDP68k
        3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6NzHZM492Nx3a1Fp7lz
        uM4ym9jIWYnKKu1mDDBKmm/XWd38+P5nEcv+Vf9mukQmGv/XuhPF+uzDKrb1TpLpjb9f7Dqh
        UbTf/XKNbeisc2tN+K2TFCyNJLolsljvVsuaSOw8xNDgzv7c5um8zadyu0Jy9wquEuiRWsw5
        s4Nl3Y3vVTMW7PrCocRSnJFoqMVcVJwIAPTe3W9EAgAA
X-CMS-MailID: 20200326094634eucas1p23ee479ba6c38c6baca839375a6751f0e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326094634eucas1p23ee479ba6c38c6baca839375a6751f0e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326094634eucas1p23ee479ba6c38c6baca839375a6751f0e
References: <CGME20200326094634eucas1p23ee479ba6c38c6baca839375a6751f0e@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

The recently posted patchset "ARM: DTS: Add devicetree file for the
Galaxy S2" inspired me to enable the SDIO WLAN also for the other
Exynos-based boards, which use Broadcom SDIO chips. Here are the results.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (4):
  ARM: dts: exynos: Enable WLAN support for the UniversalC210 board
  ARM: dts: exynos: Enable WLAN support for the Trats board
  ARM: dts: exynos: Enable WLAN support for the Rinato board
  ARM: exynos_defconfig: Compile MAC80211/CFG80211 as modules

 arch/arm/boot/dts/exynos3250-rinato.dts       | 36 +++++++++++++++++++
 arch/arm/boot/dts/exynos4210-trats.dts        | 29 +++++++++++++++
 .../boot/dts/exynos4210-universal_c210.dts    | 28 +++++++++++++++
 arch/arm/configs/exynos_defconfig             |  6 ++--
 4 files changed, 96 insertions(+), 3 deletions(-)

-- 
2.17.1

