Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AE4C2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Nov 2020 02:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5D69206B7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Nov 2020 02:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FollUK0Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKXCNz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Nov 2020 21:13:55 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:43959 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgKXCNy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 21:13:54 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201124021351epoutp038378f68a0fac8e482c2e74c228d17380~KT93mGEX-2797427974epoutp03S
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2020 02:13:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201124021351epoutp038378f68a0fac8e482c2e74c228d17380~KT93mGEX-2797427974epoutp03S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606184031;
        bh=REJZ6VBK7WJywsWVwQhl2cC21ZUNl7aTEHGVaQ0QBQI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=FollUK0Yw9ndMMtJcHtbk9F4VDWVyVknFapIdFNxwBcULregb2l3VFrpXVkLYvyjC
         lRp/fG2hA2AREnd6a0I4MDq2QVo3g76Ppo1KSFQxtFT91btYl+Zbij+dAIStbqgdj6
         8E+6IgrrkMY7Q2PKVmOPMRncLOpSYNojYf63reFc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20201124021350epcas1p4d924c5a8cb6e617a7729568e9728d595~KT920Zjzg1373713737epcas1p4J;
        Tue, 24 Nov 2020 02:13:50 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.155]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Cg6yN2YRwzMqYkh; Tue, 24 Nov
        2020 02:13:48 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        FF.08.09577.85C6CBF5; Tue, 24 Nov 2020 11:13:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201124021344epcas1p35cdaad81e2682f4b59ae3f611e6176ea~KT9woMY3a2086520865epcas1p3-;
        Tue, 24 Nov 2020 02:13:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201124021344epsmtrp14d9f436641238f101dc12ed2fcc66ad4~KT9wnhEGe0360303603epsmtrp1M;
        Tue, 24 Nov 2020 02:13:44 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-4c-5fbc6c589a12
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        27.15.08745.75C6CBF5; Tue, 24 Nov 2020 11:13:43 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201124021343epsmtip11a8d61c9f0a9f5795652cbad35ede2b0~KT9wX1v9o1094010940epsmtip1B;
        Tue, 24 Nov 2020 02:13:43 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Tue, 24 Nov 2020 11:21:18 +0900
Message-Id: <1606184478-23384-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIKsWRmVeSWpSXmKPExsWy7bCmgW5Ezp54g13/pCx6z51ksrjy9T2b
        xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
        hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
        lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGYsubWIsuMdZse7UEtYGxgUcXYwcHBICJhKT5jJ3
        MXJxCAnsYJTof3qeFcL5xCix4e9Vxi5GTiDnM6PEpznCIDZIw/Y7NxghinYxSuz48w2q/Quj
        xP0N3ewgVWwCqhITV9xnA7FFBEQkji/7C2YzC7hJ/Fl6lgVktbCAisSBiXwgYRag8qZ528GW
        8Qq4SOxrfMgGsUxO4ua5TrD5EgLN7BI/r11jhUi4SCy61c8OYQtLvDq+BcqWknjZ38YO1cAo
        MXHGaSYIp4NR4u7j6ywQVcYS+5dOZgK5gllAU2L9Ln2IsKLEzt9zGSEO5ZN497WHFRJGvBId
        bUIQJUoSxy7eYISwJSQuLJkIdaiHxI3tj9ggoRUr8XDtIvYJjLKzEBYsYGRcxSiWWlCcm55a
        bFhgihxJmxjBaUfLcgfj9Lcf9A4xMnEwHmKU4GBWEuFtldsZL8SbklhZlVqUH19UmpNafIjR
        FBhiE5mlRJPzgYkvryTe0NTI2NjYwsTQzNTQUEmc9492R7yQQHpiSWp2ampBahFMHxMHp1QD
        k51ywjaeSc8EY9NPNM++dHuH2p2za/covwuvEM6K/2cd9enSI02pBWFTjBQ0u0I2iHz5wpQl
        zB3UPoMj8sWWLtb9Hz90HJWd81fT/5LWI4b2t2rTjXIecr4KkZkvHrCjKmTBj4JZd3YmL/u4
        s9qXS2iS7ap9Fhz7Uq3PlS9or2Xl5+5o+e+W/fOQZnf9FWGme4qv3rC9es/3QcZlyrznZivt
        myZ3b5sna74liIPrqwhP7kTmhgdmH8+WF/F7dby1tvq2Pt7kYiL3l6gp9/e/v9ETvddCfNuv
        w7Omvlvjk8+6qyK7U19pyr0o7wV8MXc5lmotnSox28TleMyrkNZlaxn4T29jUC45EKB6Zsvx
        +UosxRmJhlrMRcWJAP5Nj+nEAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHJMWRmVeSWpSXmKPExsWy7bCSnG54zp54gzufrCx6z51ksrjy9T2b
        xYzz+5gcmD22f3vA6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZiy5tYiy4x1mx7tQS1gbG
        BRxdjJwcEgImEtvv3GDsYuTiEBLYwSixpnMiUxcjB1BCQmLLVg4IU1ji8OFiiJJPjBJ3d05i
        AullE1CVmLjiPhuILSIgInF82V8wm1nAQ+L9ntXsIL3CAioSBybygYRZgMqb5m1nBLF5BVwk
        9jU+ZIM4QU7i5rlO5gmMPAsYGVYxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+duYgQHgZbW
        DsY9qz7oHWJk4mA8xCjBwawkwtsqtzNeiDclsbIqtSg/vqg0J7X4EKM0B4uSOO/XWQvjhATS
        E0tSs1NTC1KLYLJMHJxSDUyrnnonHk6vf/dEeHGw+WGuNesVci8o2jM2GIR8mmwaLvSEPXOy
        pvGCVazzlxgtXr/5IK8046LXJmnTp78zm7jzAteWH9tLf/27uUt189ffUtxThYNnLLLnffnl
        5e4KRY8vDs9k8v/tf7/qRVai+vcFy84FuC6P8w4JSLUW33SN9feZZL15s8q92v0s1E141odL
        Ggud2s/otDJkz4S/e7Omuxr1f7vftrLdbNXaD2oNp7YeDetqYraw7Enr+m3uv6/Go9dfVaJy
        qrvR7OyNktnXBVnj0xru/GubL/162rl6trlxXZ82XGBaeuPDjZkG2q4JPom/17vXX6vtfDRB
        zXDZZ9ayNrcKx7iIpVvf+f5TYinOSDTUYi4qTgQAxw2DaXECAAA=
X-CMS-MailID: 20201124021344epcas1p35cdaad81e2682f4b59ae3f611e6176ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201124021344epcas1p35cdaad81e2682f4b59ae3f611e6176ea
References: <CGME20201124021344epcas1p35cdaad81e2682f4b59ae3f611e6176ea@epcas1p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one bug fix to a build error due to common framework dependency.

   Please kindly let me know if there is any problem.


Thanks,
Inki Dae


The following changes since commit 6600f9d52213b5c3455481b5c9e61cf5e305c0e6:

  Merge tag 'drm-intel-fixes-2020-11-19' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2020-11-20 11:21:54 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.10-rc6

for you to fetch changes up to e2d3d2e904ad3d381753798dcd5cae03e3c47242:

  drm/exynos: depend on COMMON_CLK to fix compile tests (2020-11-23 10:01:32 +0900)

----------------------------------------------------------------
One bug fix
. Add COMMON_CLK dependency to fix a build error below,
	/usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/exynos/exynos_mixer.o: in function `mixer_bind':
	exynos_mixer.c:(.text+0x958): undefined reference to `clk_set_parent'

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      drm/exynos: depend on COMMON_CLK to fix compile tests

 drivers/gpu/drm/exynos/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
