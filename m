Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BA4C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF4102245A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 12:46:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ms2uPRn+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbgKCMqi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 07:46:38 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32947 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729057AbgKCMqi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 07:46:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103124626euoutp025fd9cbaae13a378ca6f47477fc97569a~EADL0mVyz1363913639euoutp02y
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 12:46:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103124626euoutp025fd9cbaae13a378ca6f47477fc97569a~EADL0mVyz1363913639euoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604407586;
        bh=i794pLslzJXNiaVJRd7P1/f8MpJnvcoOH/9cT9dgm1A=;
        h=From:To:Cc:Subject:Date:References:From;
        b=ms2uPRn+k+QT4w5mV5n/kQPFF8Z49hdZUwy5UL0WeJGTddjvMegSzRCZOEns6oXyO
         5IKvRlEHU7Dc1t4xKcbxCVAEBycE4CF9QjRX7Y1ps3hGSbsXgddGGtS7dRQmIZ2t40
         fR/EIOnE+fQ6R441P44zSvI8dNaRuqir+bqy7QcE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103124620eucas1p2f487ebc6992b5032c08752a136d7cf1c~EADG6R0983143631436eucas1p2B;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 67.4E.05997.C1151AF5; Tue,  3
        Nov 2020 12:46:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103124620eucas1p169f37e0bd1f30222cdc88de0675adf60~EADGgP1jY0367203672eucas1p1V;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201103124620eusmtrp2c00bef40b04cd540e2a9f1d7e5b8c6fd~EADGfjdBM1156311563eusmtrp2B;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-1e-5fa1511c43a7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.C4.06314.C1151AF5; Tue,  3
        Nov 2020 12:46:20 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103124620eusmtip2d4a398dcd45b8d79615d72be51267547~EADGReObj1136311363eusmtip2h;
        Tue,  3 Nov 2020 12:46:20 +0000 (GMT)
From:   =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH 0/5] Add Ethernet interface description for Odroid boards
Date:   Tue,  3 Nov 2020 13:46:13 +0100
Message-Id: <20201103124618.21358-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm29l2jqut4zR8USlaJjTwUkYcUELFYoWh/azQufSgljfOvGQU
        SmYXKWcaqVOZWeawdDlvOS+seStFp2amoZJayQx/hLM0pHI7Sv573ud93vd5n4+PwMQ6nisR
        n5RKM0mKBAlfwG3pWzd7uZ97Ivcd7POiGkp0PErTM8yjVAvfMcpsfoVTUyYtovQLEzzqvaGc
        T5WYuzhUfcMnnKrrmcGp3M4ePHCXrE09g8v0tff4ssZnWbL8plokW9HvC+ddEATE0Anx6TTj
        cyJKEGccZVJU+NWy/jyUjSy8PORAAHkMNn5UbGIBISa1CG7lPOawhRVBiXUMscUKAv3wEHd7
        ZORhL8Y2ahBUdzfaG2JyEYGx+YYN88kgUFW/te91Jos5UN2hsU9gZBeCttlHmE3lRJ6GubEW
        PA8RBJc8BJ8NEhstJP0hX2XisG774U5NK5/lHeFd6Re72R5SCi9vfrRjbFOT01yGsXoDDuNT
        AhaHgD5ncSuoEyz1N+Esdoe/bRqOzRbILCgqPG47Dcj7CFrK17ZS+sP08G++TYORh0Fn8GHp
        IGi32N7ONiqCyWVH9gIRFLYUYywthLu3xazaA+pVHVsLXeHBkhaxWAZW7TJegA6od+RS78ii
        /u9bibBa5EKnKRNjaeXRJDrDW6lIVKYlxXpHJyfq0eY3GvzTb32NDBuXTIgkkGS3MJCulIt5
        inRlZqIJAYFJnIXBQ4ORYmGMIvMazSTLmbQEWmlCbgRX4iL0q7JEiMlYRSp9haZTaGa7yyEc
        XLPRmYKKvYZuUZPvVGjIcBfHPD2qVpjCOwmK+ZAx7zZ/qjTya5Ej82bt5Iif9FvogKVm0oRe
        GJt/OXguZkjao8OeWjOuB4gmhpaee627r+rkA72Vcx4Sfu/4xWzjT16ap/RsfF3YxMBsxPkx
        iuHkjjaHVEXJLq+ig8jaGixM0Ui4yjjFESnGKBX/ACdgW9xCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7oygQvjDba0C1psnLGe1WL+kXOs
        Fv2PXzNbnD+/gd3i5qEVjBabHl9jtbi8aw6bxYzz+5gs1m28xW6x9shddovWvUfYHbg9ds66
        y+6xaVUnm8fmJfUefVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwe
        a2VkqqRvZ5OSmpNZllqkb5egl3HgYlFBP3vF7ONdjA2ML1m7GDk5JARMJC5MPMrcxcjFISSw
        lFFiz5EWpi5GDqCElMTKuekQNcISf651sYHYQgJPGSX+nq0FsdkEHCX6l55gBekVEZjPJHFq
        dgeYwyywj1Fi/9HF7CBVwgKeEg8vbWMHGcoioCrxYJcSSJhXwFqir/8QE8QCeYn25dvZIOKC
        EidnPmEBKWcWUJdYP08IJMwvoCWxpuk6C4jNDFTevHU28wRGgVlIOmYhdMxCUrWAkXkVo0hq
        aXFuem6xoV5xYm5xaV66XnJ+7iZGYCxtO/Zz8w7GSxuDDzEKcDAq8fA6pC6IF2JNLCuuzD3E
        KMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgbyYyS4km5wPjPK8k3tDU0NzC0tDc2NzY
        zEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2Pvr3De/zy3nvbNDD3H8E91QskqcalX1qYR
        m4rnhjtM4O/59/tJYJtT4jPGg9Eis64p6/u3TXdceEZZKH+V72unJe5qwfPtL26f+ilJ2s1S
        I/vh/zOzZph1OpV/5b3RtcvNe4HZJGbrj7eXOc+x7J3oZnJxT8ftJdZSkg9375slqLWMkb18
        ylQlluKMREMt5qLiRAA92NdJuwIAAA==
X-CMS-MailID: 20201103124620eucas1p169f37e0bd1f30222cdc88de0675adf60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103124620eucas1p169f37e0bd1f30222cdc88de0675adf60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103124620eucas1p169f37e0bd1f30222cdc88de0675adf60
References: <CGME20201103124620eucas1p169f37e0bd1f30222cdc88de0675adf60@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add devicetree description of Ethernet devices on Odroid boards. These
descriptions enable setting MAC addresses with a bootloader.

Łukasz Stelmach (5):
  ARM: dts: exynos: Fix ethernet description for Odroid XU3
  ARM: dts: exynos: Add Ethernet interface description for Odroid X3
    Lite
  ARM: dts: exynos: Add Ethernet interface description for Odroid XU
  ARM: dts: exynos: Add Ethernet interface description for Odroid U3
  ARM: dts: exynos: Add Ethernet interface description for Odroid X/X2

 arch/arm/boot/dts/exynos4412-odroidu3.dts     | 12 ++++++++
 arch/arm/boot/dts/exynos4412-odroidx.dts      | 28 +++++++++++++++++++
 arch/arm/boot/dts/exynos5410-odroidxu.dts     | 15 ++++++++++
 .../boot/dts/exynos5422-odroidxu3-lite.dts    | 22 +++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu3.dts    |  8 ++++--
 5 files changed, 83 insertions(+), 2 deletions(-)

-- 
2.26.2

