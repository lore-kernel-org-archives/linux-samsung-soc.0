Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4830BC43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 08:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F8AA20719
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 08:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XmwL8GM/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCZIfd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 04:35:33 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48873 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgCZIfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 04:35:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326083532euoutp010be3720fb1b18397cd53c0deffbdd1a4~-zav0KSx51696016960euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 08:35:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326083532euoutp010be3720fb1b18397cd53c0deffbdd1a4~-zav0KSx51696016960euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585211732;
        bh=tcppJKNW3LmBMrqqfCzyQMDr7dW2ujrIIqS+xhPY6Ds=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XmwL8GM/sdwK4p8fjHWZVk0MhSbEwu6Gf8m6hz4gU0X7CBAYsm1+HjjuZl7Ckdlnr
         ATa1crVt7Db+7tCnCTS0hij9K9NHpi3INk6diKdEhpL8U9OMAwFanaVejoRxogkf6e
         FIuV2WAeDuAuAp6jSbBQVOSgkjyXz0zxPiyTRjkk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326083532eucas1p14e1cb6ae1b04b72588191d2c7199a801~-zavmW9bN0433004330eucas1p1X;
        Thu, 26 Mar 2020 08:35:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id AB.C3.60679.3596C7E5; Thu, 26
        Mar 2020 08:35:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe~-zavMT2k_2180421804eucas1p1F;
        Thu, 26 Mar 2020 08:35:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200326083531eusmtrp2db0c6665e6ef8001f106d4a8787a000f~-zavLuSJE2835928359eusmtrp2N;
        Thu, 26 Mar 2020 08:35:31 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-c6-5e7c6953ee9e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F5.76.08375.3596C7E5; Thu, 26
        Mar 2020 08:35:31 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326083531eusmtip138939a219f52170cc90c7aa25e5886ac~-zau3AtF81681316813eusmtip1k;
        Thu, 26 Mar 2020 08:35:31 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/2] ARM: exynos_defconfig: enable serial bus and BCM
 HCIUART drivers
Date:   Thu, 26 Mar 2020 09:35:24 +0100
Message-Id: <20200326083524.19577-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326083524.19577-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djPc7rBmTVxBksXWFlsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErowzW5cx
        Fixgr7j1bAVLA+M6ti5GTg4JAROJ/stvmEFsIYEVjBLTPodC2F8YJd5u0O1i5AKyPzNKXJu8
        nRWm4dSy1awQieWMEkuff2ODcIA6pi5fDTaKTcBQouttF9gKEQFVic9tC9hBipgFtjFKbOl9
        AFYkLBAuMeX2QyYQmwWoqPfdY3YQm1fAVqJ59hMmiHXyEqs3HACr5xSwk7j/6DEjRPwym8Sv
        HYYQtovE8XUNUP8IS7w6voUdwpaR+L9zPhPIYgmBZkaJh+fWskM4PYwSl5tmQE2ylrhz7hdQ
        NwfQeZoS63fpQ4QdJTb0nmEGCUsI8EnceCsIEmYGMidtmw4V5pXoaBOCqFaTmHV8Hdzagxcu
        MUPYHhJNPxqhoTWRUWLm0z9MExjlZyEsW8DIuIpRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93
        EyMw+k//O/5lB+OuP0mHGAU4GJV4eDdYVscJsSaWFVfmHmKU4GBWEuF9GlkTJ8SbklhZlVqU
        H19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAOjcHCf84JeU9XrjV3LTjkv
        XX3hx6wPghaH3rjWL7iovyMxccG7/z8cJ1yb0Pvg1VTj3tg0rr/582d/fViSWeBTcXVHdvnH
        vy8Kz7VoS5nPnDutV0F6+lxOlaOSmyc/5+JYEr00u/8aq9QJpud5jg0z9D1UdD8/PlV722Vu
        Z1jsZJNp7BU6/7++U2Ipzkg01GIuKk4EAIptDcX6AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xu7rBmTVxBk03lS02zljPanH9y3NW
        i/PnN7BbzDi/j8li7ZG77A6sHptWdbJ59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaZrcsYCxawV9x6toKlgXEdWxcjJ4eE
        gInEqWWrWbsYuTiEBJYySnz7dJodIiEjcXJaAyuELSzx51oXG0TRJ0aJ50/vM4Mk2AQMJbre
        doFNEhFQlfjctoAdpIhZYAejxJYdb8G6hQVCJT7cXMUCYrMAFfW+ewy2gVfAVqJ59hMmiA3y
        Eqs3HAAbyilgJ3H/0WNGEFsIqGb2gg3MExj5FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/d
        xAgMx23Hfm7ewXhpY/AhRgEORiUe3g2W1XFCrIllxZW5hxglOJiVRHifRtbECfGmJFZWpRbl
        xxeV5qQWH2I0BTpqIrOUaHI+MFbySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphak
        FsH0MXFwSjUw9syZe+ELt4e717V/jHsatiZYWV8US/y21k8seHGN6g0Fc/tDP504e//yC6z2
        uMRkeNqXyVzxmsLOxqCcRZLMeeZ3zS/zb/ksdmPJlAfycm45E7dK79oaKyG5WEHj6ro3P6by
        zlSQVM1wKe48lpRTdcZ5oX6hX3LX6mmlK5X4S5qnxHv7muYrsRRnJBpqMRcVJwIAg6k8RF0C
        AAA=
X-CMS-MailID: 20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe
References: <20200326083524.19577-1-m.szyprowski@samsung.com>
        <CGME20200326083531eucas1p166688e4a513fd919e92dd14d65c715fe@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable serial bus and BCM HCIUART Bluetooth drivers available on the
Exynos3250-based Rinato board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 032d3d21c4fa..2ef1dbb4ea80 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -68,6 +68,7 @@ CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_BCSP=y
 CONFIG_BT_HCIUART_ATH3K=y
 CONFIG_BT_HCIUART_INTEL=y
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_HCIUART_AG6XX=y
 CONFIG_BT_HCIUART_MRVL=y
 CONFIG_BT_HCIBCM203X=m
@@ -132,6 +133,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SAMSUNG=y
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS_I2C_INFINEON=y
-- 
2.17.1

