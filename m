Return-Path: <SRS0=fp8F=YS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C94CA9EA0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C47221D7F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 09:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gPk3Tl1j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408647AbfJYJCP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Oct 2019 05:02:15 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36698 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408064AbfJYJCO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 05:02:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191025090212euoutp012f70e2fbf7518c98e2688ecc8552e352~Q2FW-dCLr0419704197euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2019 09:02:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191025090212euoutp012f70e2fbf7518c98e2688ecc8552e352~Q2FW-dCLr0419704197euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571994132;
        bh=FYT2QZtALNZsHIRM0dwYVe/iO/f0eMf0dbLJRE5epa8=;
        h=From:To:Cc:Subject:Date:References:From;
        b=gPk3Tl1jvPxfO6OWNTbow3q2SUFsYDv/xD7JBSQBdSbEjKcmBh40O3qWnW7wWzSR8
         T+EnPUZsqBjSUegyPxC20crjEf+1sNtsq13B72Uh/l2ogWeFV93sXodRBoKDa3dJwu
         U4rKixnTtUY2DPfgzM8wHKAYNo7ureU0lZBi8w+U=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191025090212eucas1p1a8b8295706f9eb158685ddf0bc27bdac~Q2FWreziq0790207902eucas1p1i;
        Fri, 25 Oct 2019 09:02:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 87.95.04469.41AB2BD5; Fri, 25
        Oct 2019 10:02:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6~Q2FWasBZZ1933219332eucas1p1H;
        Fri, 25 Oct 2019 09:02:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191025090212eusmtrp2cdfe7cf3fdbd973d89658b0f08c2f31d~Q2FWaBXM_0078000780eusmtrp2G;
        Fri, 25 Oct 2019 09:02:12 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-36-5db2ba14b0a4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C1.76.04117.41AB2BD5; Fri, 25
        Oct 2019 10:02:12 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191025090211eusmtip1b623e75260a2589aad1c657a84124369~Q2FWDD8Si0234802348eusmtip1L;
        Fri, 25 Oct 2019 09:02:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos5420: Preserve PLL configuration during
 suspend/resume
Date:   Fri, 25 Oct 2019 11:02:01 +0200
Message-Id: <20191025090201.30246-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsWy7djP87oiuzbFGlz5L26xccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3WL9tJ+sFu1PXzI7cHjsnHWX3WPTqk42j74tqxg9Pm+S
        C2CJ4rJJSc3JLEst0rdL4MpoXP2FpeAmZ8WPe0+YGhgncXQxcnJICJhILLy2jb2LkYtDSGAF
        o8Sldb2sIAkhgS+MEm/XhUEkPjNKzDvYzAbT8fbUblaIxHJGiTVntrBAOEAd3d/bwKrYBAwl
        ut52gdkiAg4Snz+9ZgQpYhboZ5Lo67vKDJIQFoiVmHv9Ntg+FgFViRtn3wM1cHDwCthK3NiS
        ALFNXmL1hgPMEPZ1NokXdyogbBeJd1+3sEPYwhKvjsPYMhL/d85nAtklIdDMKPHw3Fp2CKeH
        UeJy0wxGiCpricPHL7KCLGMW0JRYv0sfIuwose35DRaQsIQAn8SNt4IgYWYgc9K26cwQYV6J
        jjYhiGo1iVnH18GtPXjhEtSZHhKdN9pYIKEYKzH94EbGCYxysxB2LWBkXMUonlpanJueWmyY
        l1quV5yYW1yal66XnJ+7iRGYCk7/O/5pB+PXS0mHGAU4GJV4eF/0b4wVYk0sK67MPcQowcGs
        JMK7Ww0oxJuSWFmVWpQfX1Sak1p8iFGag0VJnLea4UG0kEB6YklqdmpqQWoRTJaJg1OqgXFV
        Tktl8JT5hzfWtpxTWLLRhlHnVOOtCpfVhm9uTrmyK03RepHdY0XhKU9yjjbH9M/fUHVCRPDj
        nN7vSTN4OZxlfs+zbrizJufdkfUzihSunJgUExtu12pcm67b+8tnxSaR92JXmn4pFhVWPgnr
        LfyyYJOBZdlGIaOnftJ2LnnrPlcrVNbP+qXEUpyRaKjFXFScCACw2FJTAQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKLMWRmVeSWpSXmKPExsVy+t/xu7oiuzbFGjSsZrPYOGM9q8X1L89Z
        Lc6f38Bu8bHnHqvFjPP7mCzWHrnLbrF+2k9Wi/anL5kdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GU0
        rv7CUnCTs+LHvSdMDYyTOLoYOTkkBEwk3p7azdrFyMUhJLCUUWLJs/tsEAkZiZPTGlghbGGJ
        P9e62CCKPjFKfLz6FizBJmAo0fW2C6xBRMBJ4sG6N+wgRcwCk5kktjctZQFJCAtES2y/MgGs
        iEVAVeLG2fdANgcHr4CtxI0tCRAL5CVWbzjAPIGRZwEjwypGkdTS4tz03GIjveLE3OLSvHS9
        5PzcTYzAINx27OeWHYxd74IPMQpwMCrx8DpM2hgrxJpYVlyZe4hRgoNZSYR3txpQiDclsbIq
        tSg/vqg0J7X4EKMp0O6JzFKiyfnACMkriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2a
        WpBaBNPHxMEp1cA4M2GWs4SxEMfnWqUX7xzVYxJnfyrIO63nxC7yL/xIz5I/ieyrf7l/Clja
        8mLbGQFTtoYNWTd3PC765HLoatqVFdN7RKc8/cOkc7F43s3vUoblBUm1VVMjHmc+E+rdHPJw
        DV+kYMRx0fB16zQjzixsMUyQ81wX28nNVimpdv74i+Mt+teeRjYosRRnJBpqMRcVJwIAiuiP
        DlgCAAA=
X-CMS-MailID: 20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6
References: <CGME20191025090212eucas1p10ef782af07e01470b185e4fb190d3ce6@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Properly save and restore all top PLL related configuration registers
during suspend/resume cycle. So far driver only handled EPLL and RPLL
clocks, all other were reset to default values after suspend/resume cycle.
This caused for example lower G3D (MALI Panfrost) performance after system
resume, even if performance governor has been selected.

Reported-by: Reported-by: Marian Mihailescu <mihailescu2m@gmail.com>
Fixes: 773424326b51 ("clk: samsung: exynos5420: add more registers to restore list")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index d2e06ce58fb5..0aca98492029 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -165,12 +165,18 @@ static const unsigned long exynos5x_clk_regs[] __initconst = {
 	GATE_BUS_CPU,
 	GATE_SCLK_CPU,
 	CLKOUT_CMU_CPU,
+	CPLL_CON0,
+	DPLL_CON0,
 	EPLL_CON0,
 	EPLL_CON1,
 	EPLL_CON2,
 	RPLL_CON0,
 	RPLL_CON1,
 	RPLL_CON2,
+	IPLL_CON0,
+	SPLL_CON0,
+	VPLL_CON0,
+	MPLL_CON0,
 	SRC_TOP0,
 	SRC_TOP1,
 	SRC_TOP2,
-- 
2.17.1

