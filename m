Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE290C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA943611CE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhJUBZf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:25:35 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:11333 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJUBZd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 21:25:33 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20211021012316epoutp0410d9d83e2dc390b2bd85fa41091f3316~v5zMQRwCW1698316983epoutp04D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 01:23:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20211021012316epoutp0410d9d83e2dc390b2bd85fa41091f3316~v5zMQRwCW1698316983epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634779396;
        bh=E+lfGw23EHzQtfurdb3eRfAk7qiM6p/PRiYEIFTTbEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kT/927py52ugC9DR6UdTsmjSQAMZK3I1UbBB9I37qtwDlYPbNKYACOtrDI+Iq3cKV
         kjNf1qoIBafa8rtZ5UhAH/7gnSKsp+bYZKdXwArJCaUrkxB3pqq7ZGYfpnDeTLdqvk
         sZlRFFuQ3y/iShAddfEbCv8Y5se9F9cWTY6rQrDw=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20211021012315epcas2p269744944fbb147c24ef2afc9a82b5900~v5zL-M97e1161311613epcas2p2a;
        Thu, 21 Oct 2021 01:23:15 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4HZV9D6wldz4xC40; Thu, 21 Oct
        2021 01:23:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        0A.DE.10018.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epcas2p339046bfc9c84fba25142ce8b0d4b298f~v5zG81oBr1702417024epcas2p3D;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211021012310epsmtrp1adf80325e4497b1c4d62d2951fe1c43c~v5zG8IjIw1296912969epsmtrp1T;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
X-AuditID: b6c32a46-a25ff70000002722-e8-6170c0febc45
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        EC.77.08738.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epsmtip27c6a82588c59e29b49359f4a6e0652ce~v5zGvzYXk2511325113epsmtip2f;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynos: add chipid node for exynosautov9
 SoC
Date:   Thu, 21 Oct 2021 10:20:17 +0900
Message-Id: <20211021012017.158919-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021012017.158919-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmue6/AwWJBg1NVhaX92tbzD9yjtVi
        49sfTBYzzu9jsnjet4/JgdVjVkMvm8eda3vYPPq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8l
        My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2itkkJZYk4pUCggsbhYSd/Opii/
        tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y/GdjawFv9gqtjz+y9zA
        +JS1i5GTQ0LAROLUmhOMXYxcHEICOxglrt/czwzhfGKUuPdkHjuE85lR4t/332xdjBxgLZdn
        xEPEdzFKHPlzmA3C+cgo0XdvNhvIXDYBXYktz18xgtgiAtYSR7fOBxvLLDCLUWJP/zUWkEnC
        Av4Se/pEQWpYBFQlnr6ZwAxi8wrYS1zubWWGuE9e4sivTjCbU8BBYuGeH+wQNYISJ2c+YQGx
        mYFqmrfOBpsvIXCJXeLtvunMEJe6SHzYWg4xR1ji1fEt7BC2lMTL/jZ2iPpuRonWR/+hEqsZ
        JTobfSBse4lf07ewgsxhFtCUWL9LH2KkssSRW1Br+SQ6Dv9lhwjzSnS0CUE0qksc2D6dBcKW
        leie8xka0h4Snzfdh4bnZEaJuafOM01gVJiF5JtZSL6ZhbB4ASPzKkax1ILi3PTUYqMCI3gE
        J+fnbmIEp0Ittx2MU95+0DvEyMTBeIhRgoNZSYR3d0V+ohBvSmJlVWpRfnxRaU5q8SFGU2BY
        T2SWEk3OBybjvJJ4QxNLAxMzM0NzI1MDcyVxXkvR7EQhgfTEktTs1NSC1CKYPiYOTqkGJsfb
        obFTdHJvrsi0ZlIu+L/RZFHCtMyF1ZmpDT4r5VUmaWn1HPM2WnZ0lRrPrkUeEofCWS/6X2mU
        OiBnfcsuWXHXPps3LW6e1i/PJ0qqvVnC5PosbvaSLWedU/M4nnK/3CiwdqNrHPez5yFir/3u
        37wn0z6ZefoiNrGpt1bfCuq78HW5n8breTFxKqadmxhvf9ybHn9W/PcU1u6vjjvq1u269365
        pmQjQ2zXp2+xUjb/ffxMIxSd9Wz6Ov74lxx2endCQ0tu/n83k6dJPfdcnzKnXU5JkjRNyWPi
        DrtZdGTOTDPTo7Uf2xN372Zxeffb07s9wHXxDLnXB32/M273y7ngkDNJJMRY6Tmn+pb1SizF
        GYmGWsxFxYkA60A73g4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsWy7bCSvO6/AwWJBme3a1lc3q9tMf/IOVaL
        jW9/MFnMOL+PyeJ53z4mB1aPWQ29bB53ru1h8+jbsorR4/MmuQCWKC6blNSczLLUIn27BK6M
        xXc2shb8YqvY8vgvcwPjU9YuRg4OCQETicsz4rsYOTmEBHYwSqy5HwFiSwjISjx7t4MdwhaW
        uN9yhBWi5j2jxMHNsSA2m4CuxJbnrxhBbBEBa4mjW+czdzFycTALzGGUuHXtH1hCWMBXouHh
        VWYQm0VAVeLpmwlgNq+AvcTl3lZmiAXyEkd+dYLZnAIOEgv3/GCHWGYv8WzxE1aIekGJkzOf
        sIDYzED1zVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg
        kNXS2sG4Z9UHvUOMTByMhxglOJiVRHh3V+QnCvGmJFZWpRblxxeV5qQWH2KU5mBREue90HUy
        XkggPbEkNTs1tSC1CCbLxMEp1cB0sffcOiuOXxuXO855diawbPbj0ttfqj4wfN54PYZb6Kh4
        tbSw+wk1g8kXWrYziDd+1Npwv3tvhnog54lDp64/Tf3nMq9ftCjXOWL1Ds31d5edD5nKEnfO
        VdNY1Y/b+n3E7LYNkq9OVO/b1h2YuDL16e6r85ZqfGcVdFBWfiDjPPuipLmUsWuTgMb38zHL
        t1dNm36qgfXGFql73ttVLQyXXdNlta3ews/yM+3q26M3vm5a/LX44d9vos8nl4huf3qdh5dN
        vGPb1ldzp/LePHj/taYbH2dIZ8rmVXyyKuvlpBpdl1Vmvogq0k3zOKTofnj7twNnI2Z0s6j8
        0dKSevLx1KQLPnPbJz44q2DMpzpprRJLcUaioRZzUXEiAC/taCTIAgAA
X-CMS-MailID: 20211021012310epcas2p339046bfc9c84fba25142ce8b0d4b298f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021012310epcas2p339046bfc9c84fba25142ce8b0d4b298f
References: <20211021012017.158919-1-chanho61.park@samsung.com>
        <CGME20211021012310epcas2p339046bfc9c84fba25142ce8b0d4b298f@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It can be compatible with exynos850's chipid. The SoC has eight chipid
registers that can be used for OTP.

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0005444f55df..a960c0bc2dba 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -184,6 +184,11 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		chipid@10000000 {
+			compatible = "samsung,exynos850-chipid";
+			reg = <0x10000000 0x24>;
+		};
+
 		gic: interrupt-controller@10101000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.33.0

