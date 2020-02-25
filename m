Return-Path: <SRS0=sMVI=4N=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2425C35DF5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Feb 2020 11:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B393F20CC7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Feb 2020 11:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z1ucXGHi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgBYLk1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Feb 2020 06:40:27 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46688 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgBYLk1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Feb 2020 06:40:27 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200225114025euoutp01888af934f08cafd983465a9ac525beea~2olnbzYdv1231012310euoutp010
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Feb 2020 11:40:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200225114025euoutp01888af934f08cafd983465a9ac525beea~2olnbzYdv1231012310euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582630825;
        bh=cm0FdX+LKxGSRDS+QRlUDkH8T85C3KUSYY378cH4L3c=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Z1ucXGHiGCNwHEyGEr8Z39ZGsRLHBFDnPL2Zc/9/HE28P2mrHRtcomEH/N7r4pRRF
         lwgtvcfFN5nY4e4sHb7uBstDAQr6/ZDYorm4KrbIsxX2wxpt0qFNH7OLO6p/UyMdJn
         eN00g5THx6fGDDmSwaiVSLgzpIQo8viV9gw8r8J8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200225114025eucas1p2d82aac74c64dd65bf2959b3af28d26fa~2olnGxsBD2889128891eucas1p2i;
        Tue, 25 Feb 2020 11:40:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 7A.C4.61286.9A7055E5; Tue, 25
        Feb 2020 11:40:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba~2olmvVk9b2816028160eucas1p2q;
        Tue, 25 Feb 2020 11:40:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200225114025eusmtrp2029f25babd3b5ee3c6c6670db0108ce1~2olmuuhe-3159331593eusmtrp2_;
        Tue, 25 Feb 2020 11:40:25 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-21-5e5507a9452d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D0.72.07950.8A7055E5; Tue, 25
        Feb 2020 11:40:25 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200225114024eusmtip1631066bbe3772f99ba39e1f53fb4d129~2olmU1tEM3123831238eusmtip1g;
        Tue, 25 Feb 2020 11:40:24 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Fix memory on Artik5 evaluation boards
Date:   Tue, 25 Feb 2020 12:40:17 +0100
Message-Id: <20200225114017.29267-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsWy7djPc7or2UPjDCZelrbYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvj1H+bguVsFVd+
        rWBpYFzC2sXIySEhYCJx58wlIJuLQ0hgBaPEhsa9TBDOF0aJdz8XsUA4nxklzqx9wgTTcuXE
        baiq5YwSu/81s8C1bL6/igWkik3AUKLrbRcbiC0ioCrxuW0BO0gRs0Afo8T1vXOZQRLCAp4S
        Dxr+gxWxABW92vCbEcTmFbCVWDn1N9SF8hKrNxxgBmmWEFjDJjFtzVdmiISLRPPRQ+wQtrDE
        q+NboGwZif875zNBNDQzSjw8t5YdwulhlLjcNIMRospa4s65X0CrOYBu0pRYv0sfIuwoMfdU
        OytIWEKAT+LGW0GQMDOQOWnbdGaIMK9ER5sQRLWaxKzj6+DWHrxwCeo0D4k/revB/hISiJX4
        vukG+wRGuVkIuxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQIjO7T/45/2sH49VLS
        IUYBDkYlHl6JvcFxQqyJZcWVuYcYJTiYlUR4vRmD4oR4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        Gi96GSskkJ5YkpqdmlqQWgSTZeLglGpgnMDZPKVT1d/lY9YPpf1SGfYzv88yTdruUnvX9O3i
        e99rVfaH+zX77S66bVzrN3tLwvTcydPLFWV3Raou+8qjtr70fO5644rt4tYappn6p2VP8Kq+
        vXh2Z0LKdncD5qavynMeTIlN7bbsSvw8cdb/yUoMYUW8kg77I+KnB4aY1p20+9KW8eevEktx
        RqKhFnNRcSIAN7Gc3uoCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsVy+t/xu7or2UPjDJ40MFlsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFn
        ZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdx6r9NwXK2iiu/VrA0MC5h7WLk5JAQMJG4cuI2
        UxcjF4eQwFJGiYlrPjBDJGQkTk5rgCoSlvhzrYsNougTo8TjlhNsIAk2AUOJrrddYLaIgKrE
        57YF7CBFzAITGCXOd84ASwgLeEo8aPgPZrMAFb3a8JsRxOYVsJVYOfU31AZ5idUbDjBPYORZ
        wMiwilEktbQ4Nz232EivODG3uDQvXS85P3cTIzCkth37uWUHY9e74EOMAhyMSjy8EnuD44RY
        E8uKK3MPMUpwMCuJ8HozBsUJ8aYkVlalFuXHF5XmpBYfYjQFWj6RWUo0OR8Y7nkl8YamhuYW
        lobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhj9pjotn9qoU5Vx8tGSFpOJ63X8
        dXsO7mGIFbpYLf6Ho/90/dGf1/0nCm/df89kK+861uVNiR+8p3wRk9ms88TQQWzm7YAQxsMt
        eys+PM37XLBB0O/P5M5dcmmratYGl4r3/3o1/ZwuC6NvxcRPC4znSbJmpCV5L+X598rZhNXB
        5snmwLCJ1jZKLMUZiYZazEXFiQDJHb9aPwIAAA==
X-CMS-MailID: 20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba
References: <CGME20200225114025eucas1p2f34775ccb42b2892edf732f8eb0722ba@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The last 8MB of physical memory on Artik520 family boards is reserved for
secure firmware. Adjust the total amount of the memory defined in
exynos3250-artik5.dtsi to match the memory available for the Linux kernel.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index dee35e3a5c4b..b27a82072365 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -23,7 +23,7 @@
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0x40000000 0x1ff00000>;
+		reg = <0x40000000 0x1f800000>;
 	};
 
 	firmware@205f000 {
-- 
2.17.1

