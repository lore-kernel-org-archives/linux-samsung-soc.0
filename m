Return-Path: <SRS0=6Xyg=EJ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D85C55179
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A46C22264
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Nov 2020 18:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WepNZyM1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgKCSpC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:45:02 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45328 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729446AbgKCSou (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:44:50 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201103184428euoutp029f460aa0247cb9e3b4ba7842d9d36ea2~EE7ywKHt32226222262euoutp02c
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Nov 2020 18:44:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201103184428euoutp029f460aa0247cb9e3b4ba7842d9d36ea2~EE7ywKHt32226222262euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1604429068;
        bh=NRc40O7dPMD4Kia7QJrNgj+GWRZloqQwkJKFlJSEraI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=WepNZyM1bb1twBeYLuC7QwTIGRY8v4eqHhsRFDt+CJK5ZqPgLwUYOTsTtZi0EOUMl
         3koufmvckjIxlLobgOOxvCOhLxY+W97Ac++rbGQurYuZ7Jow1f8nOMeYgChi5W4+3w
         pyaB+wcb7jQELmiVLAKaNoIr5bkQO/ll6W3dj30A=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201103184417eucas1p21da0633e1b03ea9c494328633db793cc~EE7pFJQQA0668706687eucas1p2k;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 9A.0F.06318.105A1AF5; Tue,  3
        Nov 2020 18:44:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201103184417eucas1p197b77670a32843abc1340b0979017bca~EE7okuZDe1969619696eucas1p1k;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201103184417eusmtrp11b7fa6f1d69b862fbe67ca4952962bfc~EE7okDS0W0237602376eusmtrp1g;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-09-5fa1a501e992
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.BB.06314.105A1AF5; Tue,  3
        Nov 2020 18:44:17 +0000 (GMT)
Received: from localhost (unknown [106.120.51.46]) by eusmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20201103184417eusmtip2bd84b53de809e7b1808e87d4ae701948~EE7obabI10993609936eusmtip2e;
        Tue,  3 Nov 2020 18:44:17 +0000 (GMT)
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
Subject: [PATCH v2 0/6] Add Ethernet interface description for Odroid boards
Date:   Tue,  3 Nov 2020 19:44:06 +0100
Message-Id: <20201103184412.18874-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87qMSxfGG5xstbbYOGM9q8X8I+dY
        Lfofv2a2OH9+A7vFzUMrGC02Pb7GanF51xw2ixnn9zFZrNt4i91i7ZG77Bate4+wO3B77Jx1
        l91j06pONo/NS+o9+rasYvT4vEkugDWKyyYlNSezLLVI3y6BK+PJiX/MBZ2cFduvBTcwrmHv
        YuTkkBAwkfgw4RVbFyMXh5DACkaJ6WeOsUI4XxglVuzbyA7hfGaUeNN7kAmmZdaCU8wQieWM
        Eht2nYSqes4o8WXPLLAqNgFHif6lJ8BmiQhMZ5JYumc+WAuzwD5GiZ33pjCDVAkL+Eh82trE
        BmKzCKhKXPz4ghHE5hWwljje8J8RYp+8RPvy7WwQcUGJkzOfsIDY/AJaEmuaroPZzEA1zVtn
        gy2QENjGLnFgwmGoY10kpp+awgZhC0u8Or4F6m8ZidOTe4CaOYDseonJk8wgensYJbbN+cEC
        UWMtcefcLzaQGmYBTYn1u/Qhwo4Skw5sYYZo5ZO48VYQ4gQ+iUnbpkOFeSU62oQgqlUk1vXv
        gRooJdH7agXUVx4Sk6dOYZnAqDgLyWOzkDwzC2HvAkbmVYziqaXFuempxcZ5qeV6xYm5xaV5
        6XrJ+bmbGIEp6fS/4193MO77k3SIUYCDUYmH1yF1QbwQa2JZcWXuIUYJDmYlEV6ns6fjhHhT
        EiurUovy44tKc1KLDzFKc7AoifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamBcfEV+grPRgv1B
        tdkMk/cIrMg+Z7ju6gsD9+Pphd6+VRdYtv9pvrC24vC1O/ePTWoLvDgj6abjepVTX5VEw/lO
        sTEbmO6u9QwJnaJxy+5rt/qFBQuN2U/7sUZ7M0f0qwVy75V4sUPgwTu/7Y5OZ77MVtBX8Ixx
        Zq3e8FbsxeqyLxN0cnb/i12nxFKckWioxVxUnAgAF7LHBUUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xe7qMSxfGG3w6LmmxccZ6Vov5R86x
        WvQ/fs1scf78BnaLm4dWMFpsenyN1eLyrjlsFjPO72OyWLfxFrvF2iN32S1a9x5hd+D22Dnr
        LrvHplWdbB6bl9R79G1ZxejxeZNcAGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5
        rJWRqZK+nU1Kak5mWWqRvl2CXsaTE/+YCzo5K7ZfC25gXMPexcjJISFgIjFrwSnmLkYuDiGB
        pYwSO1dcZO1i5ABKSEmsnJsOUSMs8edaFxtEzVNGiRnfT7CAJNgEHCX6l55gBUmICMxnkjg1
        uwPMYRbYxyix/+hisBXCAj4Sn7Y2sYHYLAKqEhc/vmAEsXkFrCWON/xnhFghL9G+fDsbRFxQ
        4uTMJywgVzALqEusnycEEuYX0JJY03QdbDEzUHnz1tnMExgFZiHpmIXQMQtJ1QJG5lWMIqml
        xbnpucWGesWJucWleel6yfm5mxiB8bTt2M/NOxgvbQw+xCjAwajEw+uQuiBeiDWxrLgy9xCj
        BAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYTYHemcgsJZqcD4z1vJJ4Q1NDcwtLQ3Njc2Mz
        CyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjBZecZlP/Ys1RJbV/uruz/s1+75T+TLLa7Vc
        Ozlrp61hW7ZPLTDz7NGHE9cnivtJx6x6eMTaUO7oTuea59d9JsVZWmo17rItr3LWerplg+Ci
        tW+NVk0umL5JzXNxid1N28x9DkuKf/uaa7+4dCHfVHe54BaLGJ+5rxPe/tt3WN2r4lNb/o+o
        00osxRmJhlrMRcWJADX5dBm9AgAA
X-CMS-MailID: 20201103184417eucas1p197b77670a32843abc1340b0979017bca
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201103184417eucas1p197b77670a32843abc1340b0979017bca
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201103184417eucas1p197b77670a32843abc1340b0979017bca
References: <CGME20201103184417eucas1p197b77670a32843abc1340b0979017bca@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add devicetree description of Ethernet devices on Odroid boards. These
descriptions enable setting MAC addresses with a bootloader.

Changes in v2:
  - fixed compatible for hub@1 on X/X2 (: -> ,)
  - split the patch for Odroid XU3 into two
  - explained the purpose of aliases in commit messages

Łukasz Stelmach (6):
  ARM: dts: exynos: Fix Ethernet interface description for Odroid XU3
  ARM: dts: exynos: Add an alias for the Ethernet interface on Odroid XU3
  ARM: dts: exynos: Add Ethernet interface description for Odroid XU3 Lite
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

