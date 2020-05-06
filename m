Return-Path: <SRS0=uRyq=6U=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD4DC47257
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 May 2020 13:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49DC720752
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 May 2020 13:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ErgG0OBx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgEFN1X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 May 2020 09:27:23 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36210 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgEFN1W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 May 2020 09:27:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200506132720euoutp026738fafc8d35ba63fc0e0dcd23a5fc86~Mc2OUDvTO1750817508euoutp02Z
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2020 13:27:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200506132720euoutp026738fafc8d35ba63fc0e0dcd23a5fc86~Mc2OUDvTO1750817508euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588771640;
        bh=7cVe9FNoEY7vct4ZEZCp84vawtIaH7A0TmBskq/XhEg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ErgG0OBxDhUYvvTUjQiMu+OlmWbAoaI9n3DMLZjF9PMJWAs1T7q+DeHTW0Pg3iskL
         fUb6x8dJ6vRSFvfOetdz4ORzRIol0qwjSfHQEc8fzbgDxO6xZCXSlx0daUVxP6AeJ4
         4ljxy2fy7yz2w6nCYtVyxu0DojMATSWGDt2DIIgo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200506132719eucas1p273a130ab6a5d7d2406538a50d99442a0~Mc2N5kWl31505615056eucas1p2M;
        Wed,  6 May 2020 13:27:19 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id A5.02.61286.73BB2BE5; Wed,  6
        May 2020 14:27:19 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591~Mc2NbXCgw2703327033eucas1p2G;
        Wed,  6 May 2020 13:27:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200506132719eusmtrp27c32b66c833a62ae7b438ee8da68c919~Mc2Nati1u2008420084eusmtrp2e;
        Wed,  6 May 2020 13:27:19 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-15-5eb2bb37d22c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.8C.07950.73BB2BE5; Wed,  6
        May 2020 14:27:19 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200506132718eusmtip26ca2f9d124286a5ba9aea510fc16243f~Mc2M45YKF0881508815eusmtip2d;
        Wed,  6 May 2020 13:27:18 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 2/2] clk: samsung: Fix CLK_SMMU_FIMCL3 clock name on
 Exynos542x
Date:   Wed,  6 May 2020 15:26:59 +0200
Message-Id: <20200506132659.17162-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506132659.17162-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleLIzCtJLcpLzFFi42LZduzneV3z3ZviDNbPVLXYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi3/XNrJYtD99yezA6bFz1l12j02rOtk8+ras
        YvT4vEkugCWKyyYlNSezLLVI3y6BK6Pn7T/mguXsFTsv3WFpYFzG1sXIySEhYCLx784iIJuL
        Q0hgBaPE/ZZWFgjnC6PE6TcnoJzPjBJHmi8xwrTc2b6BCSKxnFHi6L/HzHAtW/9/YAapYhMw
        lOh62wW2RETAQeLzp9eMIEXMApuYJK6s2QJWJCwQKLF0ykdWEJtFQFWi+dp/MJtXwFbi2+fT
        TBDr5CVWbzgAVs8pYCfxsnc52E0SAt/ZJLbOuwFV5CKx69VKqPuEJV4d38IOYctI/N85nwmi
        oZlR4uG5tewQTg+jxOWmGVAd1hJ3zv0CupUD6D5NifW79CHCjhLbFn8EC0sI8EnceCsIEmYG
        Midtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFD2B4S768ugIbjREaJvz8bGCcwys9CWLaAkXEV
        o3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYNI4/e/4px2MXy8lHWIU4GBU4uE9sGxTnBBr
        YllxZe4hRgkOZiURXp4fG+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpa
        kFoEk2Xi4JRqYNx0+NzdjwtY7AX2vv9wo8RMNWUjy6ylFaslD0vu2nfRSSWCPfI24/1VU86f
        P6jDezPHlrVTzlrt2ETusH1LT99h+LA1d1NnHftZVYNpC7imtB1YYJk8wc2iVO2EaiCr0f1z
        4gvP33dgKqjfrCqncevYFf3NL3htVPZ/kN1xYP2nHUeTg3JYK+YosRRnJBpqMRcVJwIAtEbG
        xRYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsVy+t/xe7rmuzfFGcybzGqxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFv+ubWSxaH/6ktmB02PnrLvsHptWdbJ59G1Z
        xejxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
        vl2CXkbP23/MBcvZK3ZeusPSwLiMrYuRk0NCwETizvYNTF2MXBxCAksZJV7t3MkIkZCRODmt
        gRXCFpb4c62LDaLoE6PEpxP7wYrYBAwlut52gU0SEXCSeLDuDTtIEbPANiaJndvvg3ULC/hL
        XL23mxnEZhFQlWi+9h8szitgK/Ht82kmiA3yEqs3HACr4RSwk3jZu5wFxBYCqpk65xfzBEa+
        BYwMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQIDeNuxn1t2MHa9Cz7EKMDBqMTDe2DZpjgh
        1sSy4srcQ4wSHMxKIrw8PzbGCfGmJFZWpRblxxeV5qQWH2I0BTpqIrOUaHI+MLrySuINTQ3N
        LSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwlmbceaUu9/N87yun8OZ5b0pE
        9/v5HJlw9XTnHsWlj4/6p6paLvMTaPP/2mRxxsPo23+3f0tqN9+69UCj973FP8WFZupnls6b
        aKk18WhhECfr05/7j/3htN9nNpnpoEkkx6SvAScnLuY6ufpG0WmXrZKG81y25kesFVr1cNt1
        k8CNdVFKwUkuckosxRmJhlrMRcWJAPaAOdJ2AgAA
X-CMS-MailID: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591
References: <20200506132659.17162-1-m.szyprowski@samsung.com>
        <CGME20200506132719eucas1p258d3a6979ab111a7db4baf95c85c2591@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The proper name for CLK_SMMU_FIMCL3 is "smmu_fimcl3". Remove obvious
typo.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index edb2363c735a..fea33399a632 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1165,7 +1165,7 @@ static const struct samsung_gate_clock exynos5x_gate_clks[] __initconst = {
 			CLK_IS_CRITICAL, 0),
 	GATE(CLK_GSCL_WB, "gscl_wb", "sclk_gscl_wb", GATE_IP_GSCL1, 13,
 			CLK_IS_CRITICAL, 0),
-	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3,", "dout_gscl_blk_333",
+	GATE(CLK_SMMU_FIMCL3, "smmu_fimcl3", "dout_gscl_blk_333",
 			GATE_IP_GSCL1, 16, 0, 0),
 	GATE(CLK_FIMC_LITE3, "fimc_lite3", "aclk333_432_gscl",
 			GATE_IP_GSCL1, 17, 0, 0),
-- 
2.17.1

