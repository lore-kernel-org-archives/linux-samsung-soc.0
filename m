Return-Path: <SRS0=uzqe=4O=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EB4C4BA0B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2A1220838
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Feb 2020 10:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kjqJ1obC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgBZKNT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Feb 2020 05:13:19 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55153 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgBZKNT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 05:13:19 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200226101317euoutp01035e6e39a3d234aac13759eefdf98f71~27C0P0SDQ1808618086euoutp01Q
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2020 10:13:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200226101317euoutp01035e6e39a3d234aac13759eefdf98f71~27C0P0SDQ1808618086euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582711997;
        bh=O1BFWpWbTwDLNXm1FRjAmKAXsPmqCPdSm166rZilS7M=;
        h=From:To:Cc:Subject:Date:References:From;
        b=kjqJ1obC5+Eqt3peK4GRJ0bvxzrFjacg6qSQEqJ2uPUxMh7w7qdFmX8wbA2lVCxLF
         pMBkBbhQ6/T3xymuuGbdts4JimI3439Tl5M7Cu6bRT4dfF6Z0/FfceT6PeOYzuKBlD
         CU5vjdjP7Va0+2Zk00B0d9ihpUqp/w7MtpceNZy8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200226101316eucas1p2b49f1eabcdac4bdec01ec4c81787feb7~27Czv8x_e3143731437eucas1p2v;
        Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 46.C4.60679.CB4465E5; Wed, 26
        Feb 2020 10:13:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200226101316eucas1p2fd16a7c821632084710167216b78f6c5~27CzP-Ebd3147831478eucas1p21;
        Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200226101316eusmtrp1d4ff0a08dba91cad28178c4c6029d5d9~27CzPWneG1656116561eusmtrp1C;
        Wed, 26 Feb 2020 10:13:16 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-88-5e5644bcdf68
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 26.6C.07950.CB4465E5; Wed, 26
        Feb 2020 10:13:16 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200226101315eusmtip2c4bb9e06902a9feeef244aeed2d0bee2~27CysNvBc0087800878eusmtip25;
        Wed, 26 Feb 2020 10:13:15 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] drm/bridge: sii9234: silence warning about regulators
 during deferred probe
Date:   Wed, 26 Feb 2020 11:13:07 +0100
Message-Id: <20200226101307.16708-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduzned09LmFxBs9f6VrcWneO1WLjjPWs
        Fle+vmezuPr9JbPFyTdXWSw6Jy5ht5hxfh+Txdojd9ktDvVFO3B6vL/Ryu4xu2Mmq8eJCZeY
        PO53H2fy6NuyitHjQO9kFo/Pm+QC2KO4bFJSczLLUov07RK4Mr7u+s5ecIit4u6PAywNjAdZ
        uxg5OSQETCS27nvE1MXIxSEksIJR4uSTs1DOF0aJVdMmsINUCQl8ZpQ4uCiyi5EDrGPGJieI
        muWMEtsP3kRouHR5GthYNgFDia63XWwgtoiAm0TT4ZmsIEXMAnuZJHYcbAJLCAvESZx9eQxs
        A4uAqsSnBf2MIDavgK3Ei2W3GCHuk5dYveEAM0izhMBnNomWbS+YIRIuEi9uP2KDsIUlXh3f
        wg5hy0icntzDAtHQzCjx8Nxadginh1HictMMqLHWEnfO/WIDeYhZQFNi/S59iLCjxI3ePawQ
        f/JJ3HgrCBJmBjInbZvODBHmlehoE4KoVpOYdXwd3NqDFy5BneYhcfraS1ZIyMVKdN68zTqB
        UW4Wwq4FjIyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAlPG6X/Hv+xg3PUn6RCjAAej
        Eg/vC87QOCHWxLLiytxDjBIczEoivBu/AoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzGi96GSsk
        kJ5YkpqdmlqQWgSTZeLglGpg7MpxXBT28KTa4z9H9H679S+Z+jRvwqeid12hrC9qzI4GWrU7
        10XNDL8bN+3l++6AhNeS6wxF3s+OYJKp+ZVxyWf7I+vvMy4de5OgMDcsI/zunaPaPTq2MqLJ
        i7ojnqj6bPIpyNwvcHK9moHXIesdEl18C+6lp69LTrumdXRLceWkPz+7fC86KLEUZyQaajEX
        FScCAAPw3mYVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsVy+t/xe7p7XMLiDM6v57G4te4cq8XGGetZ
        La58fc9mcfX7S2aLk2+uslh0TlzCbjHj/D4mi7VH7rJbHOqLduD0eH+jld1jdsdMVo8TEy4x
        edzvPs7k0bdlFaPHgd7JLB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvH
        WhmZKunb2aSk5mSWpRbp2yXoZXzd9Z294BBbxd0fB1gaGA+ydjFycEgImEjM2OTUxcjFISSw
        lFFi//aFbF2MnEBxGYmT0xpYIWxhiT/Xutggij4xSsx63gSWYBMwlOh62wXWICLgIdH87Tg7
        SBGzwEEmiZOzzjOBJIQFYiRuLF0HZrMIqEp8WtDPCGLzCthKvFh2ixFig7zE6g0HmCcw8ixg
        ZFjFKJJaWpybnltspFecmFtcmpeul5yfu4kRGKrbjv3csoOx613wIUYBDkYlHt4XnKFxQqyJ
        ZcWVuYcYJTiYlUR4N34FCvGmJFZWpRblxxeV5qQWH2I0BVo+kVlKNDkfGEd5JfGGpobmFpaG
        5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYQ/Vje9uCfvKVvuZ/Ocv/0Nwvcj0T
        mKd8d5jud3/lDOfV9xirr5ra7/FwPxKt5fxUvuVBcYpu+xlplvCp52dbSOnNtg3ff9bgQKmZ
        282YPJdrV5YEbXrIHruivWvKL541KdsMdK4/81sfNrkzpyh49x27d4eufAievOUDZ/WC1uYN
        UxfvfMI1X4mlOCPRUIu5qDgRAKg7fHNrAgAA
X-CMS-MailID: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200226101316eucas1p2fd16a7c821632084710167216b78f6c5
References: <CGME20200226101316eucas1p2fd16a7c821632084710167216b78f6c5@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Don't confuse user with meaningless warning about failure in getting
regulators in case of deferred probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/bridge/sii9234.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index f81f81b7051f..b1258f0ed205 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -836,7 +836,8 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
 	if (ret) {
-		dev_err(ctx->dev, "regulator_bulk failed\n");
+		if (ret != -EPROBE_DEFER)
+			dev_err(ctx->dev, "regulator_bulk failed\n");
 		return ret;
 	}
 
-- 
2.17.1

