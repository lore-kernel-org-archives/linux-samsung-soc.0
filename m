Return-Path: <SRS0=b06D=C2=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102E9C35263
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 10:23:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B401E21D7F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Sep 2020 10:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gjeggAwd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgIQKW7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 06:22:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45783 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgIQKWz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 06:22:55 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200917101430euoutp025c5dd743a6272d71abd9ff78d11cd1ef~1iqHrfWHG1492114921euoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Sep 2020 10:14:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200917101430euoutp025c5dd743a6272d71abd9ff78d11cd1ef~1iqHrfWHG1492114921euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600337670;
        bh=8z0Q/zllco9taX8DhGAyt2E9g1QJtkv+J7GHxLWbFa4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=gjeggAwdEFrG3xjxo0/ItWd+aDLmg151TLik934UCQynZMz0rEWcmIslJxegXqfM0
         KX+0Qu3i7kx+N+ulBjlix5ntX9lCqjWPcm7kTwTOXQaU9LF8WK5rUKR/gwyt/hqccT
         MN1xge6VD14a4jTDNaWb3CFy8E4hre1kp27W1oBM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200917101430eucas1p115b36c9a44d1aaf4e42c1d47b53844ce~1iqHdDa-i0221902219eucas1p1Z;
        Thu, 17 Sep 2020 10:14:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DD.D4.06456.607336F5; Thu, 17
        Sep 2020 11:14:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200917101429eucas1p20d6a56a9856cd0e1296496f650ae33cf~1iqHEsMVW0645206452eucas1p2p;
        Thu, 17 Sep 2020 10:14:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200917101429eusmtrp1db6072aed6347d0942fe07718290909f~1iqHEBF3a0383903839eusmtrp1P;
        Thu, 17 Sep 2020 10:14:29 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-76-5f6337060210
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6F.BE.06017.507336F5; Thu, 17
        Sep 2020 11:14:29 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200917101429eusmtip1c5764a956b50d084bfef5e98d28f2bbd~1iqGgMZfB1685116851eusmtip1A;
        Thu, 17 Sep 2020 10:14:29 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos5420: Avoid __clk_lookup()
 calls when enabling clocks
To:     linux-clk@vger.kernel.org
Cc:     tomasz.figa@gmail.com, cw00.choi@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <534c401e-611e-4cb4-644d-8ed9d00ce36d@samsung.com>
Date:   Thu, 17 Sep 2020 12:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200811151251.31613-2-s.nawrocki@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0gUURjt7szszkpr11XxQ3vQplGZmig4lthmBZtI+EcII3XVQcV1lR21
        7JcSSj6zhLTFR4WRLZkPNi0jhSXXx6amlZpl4qMyS81HhFaa4yj575zznXPu98GlCXkt5UjH
        aZNZnVatUYityAbzUreb2Ccq/EjtnA1TV1JDMQOLXyhmLu8jxbxuKhUzJT3NIqb6xbCE6e08
        zaz015GMoekPUkpVs4OZEtVT/bBEVW/IFqsKjAakWqjfHUyFWvlFs5q4VFbn4R9hFfv5wbgo
        aRJfMhqbReko0zoHSWnA3jCT3yLKQVa0HFcheJUxTAhkEUHlWyOZg+g1soBgfO9mYGWmc8Nz
        H8Fse6VEIHMIbloWKT5gi2PAWBzHB+zwLhgyL4l5D4H7EZiuG8T8QIw9Ib+1APF+GfaHrF/7
        eZnELmAun0c8tsdhYO4cI3kswzbQcWtiHUuxH7Rmv1v3ENgBhiYqRALeA43TpYSwqFkCPVOB
        fD3gU5D/0EOQbWGqzSgR8E6wFOWR/GqAryDIe/ZeIpBCBCNtt5HgOgYfupfFfBGBD0JN00bR
        CegrmqaEfmsYnLYRVrCGGw3FhCDL4GqWXHA7w29DsUjAjpA7sUoWIoV+y2H6Lcfotxyj///u
        bUQakAObwiXEsJynlr3ozqkTuBRtjHtUYkI9WvtHlpW2+SfoZ1+kCWEaKbbLau0jw+WUOpVL
        SzAhoAmFnSygyxIml0Wr0y6zusRwXYqG5UzIiSYVDjKvu18vyHGMOpmNZ9kkVrc5FdFSx3Sk
        7GBPtvgXmw6fbXzJXvu06tb7PeKMzai2J3lpuLJlAIVoQs8f1YxW5XqlNlVRymDnN3GotDoj
        qGzsh7f+QNJcisk/XRof8vxxoMIy1VW+PF4tD+IyXc45b2u7027cYe9TVl/1TWlQ/3XSuyjv
        7Tte4esx6Vvi6mpfmE8vBzwaUZBcrNrzEKHj1P8AetigBEMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsVy+t/xu7qs5snxBjPWWFlsnLGe1eL6l+es
        Fh977rFaXN41h81ixvl9TBZrj9xlt7h4ytXi37WNLBardv1hdOD0eH+jld1j56y77B6bVnWy
        efRtWcXo8XmTXABrlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpO
        Zllqkb5dgl7Gs5WPmQpeCFRs2bKPqYGxla+LkZNDQsBE4t+7U8xdjFwcQgJLGSU2n97M1sXI
        AZSQkpjfogRRIyzx51oXG0TNe0aJ1zcvsILUCAukS2yZnglSIyIgK3Hr2E+wGmaBa4wSy7dt
        g2o4yChxd8FfVpAqNgFDid6jfYwgzbwCdhJt39VAwiwCqhLH5n1iBLFFBeIkzvS8YAOxeQUE
        JU7OfMICYnMK2Egc7bwJVsMsoC7xZ94lZghbXOLWk/lMELa8xPa3c5gnMArNQtI+C0nLLCQt
        s5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iREYhduO/dyyg7HrXfAhRgEORiUe3g2i
        SfFCrIllxZW5hxglOJiVRHidzp6OE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YILIK4k3
        NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAuMckb7FXX1VU7IaHk499
        93adueBOT9jXd1dXTLM868Kxhsv384fQUwtm1LXmTbY9IfrO0UZGSiAjZkFru6nnqhR7d1PZ
        subAk6lvLnn0aTalL2i/229fzOn/JYmRef++b98Srj3ldT/+ST27zVV58R275vSfIhvexL3c
        fI37htKtoqCIh8fjlViKMxINtZiLihMB+feusNgCAAA=
X-CMS-MailID: 20200917101429eucas1p20d6a56a9856cd0e1296496f650ae33cf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200811151304eucas1p2c113097f89229b51bb55329c38990830
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200811151304eucas1p2c113097f89229b51bb55329c38990830
References: <20200811151251.31613-1-s.nawrocki@samsung.com>
        <CGME20200811151304eucas1p2c113097f89229b51bb55329c38990830@eucas1p2.samsung.com>
        <20200811151251.31613-2-s.nawrocki@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11.08.2020 17:12, Sylwester Nawrocki wrote:
> This patch adds a clk ID to the mout_sw_aclk_g3d clk definition so related
> clk pointer gets cached in the driver's private data and can be used
> later instead of a __clk_lookup() call.
> 
> With that we have all clocks used in the clk_prepare_enable() calls in the
> clk provider init callback cached in clk_data.hws[] and we can reference
> the clk pointers directly rather than using __clk_lookup() with global names.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v2:
>  - added missing part of the patch lost during rebase of the previous version

Actually that conflict resolution was incorrect and I squashed 
below patch as a correction.

-----------------8<--------------------
From 1594bdb8fd1ab85e994d638256d214adff4e9d40 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Thu, 17 Sep 2020 11:42:14 +0200
Subject: [PATCH] clk: samsung: exynos5420: Fix assignment of hws

Fix incorrect rebase conflict resolution.

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index ba4e0a4..3ccd4ea 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1574,6 +1574,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 	exynos5x_soc = soc;
 
 	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
+	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
 			ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
@@ -1651,7 +1652,6 @@ static void __init exynos5x_clk_init(struct device_node *np,
 				     exynos5x_subcmus);
 	}
 
-	hws = ctx->clk_data.hws;
 	/*
 	 * Keep top part of G3D clock path enabled permanently to ensure
 	 * that the internal busses get their clock regardless of the
-- 
2.7.4
-----------------8<--------------------
