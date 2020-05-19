Return-Path: <SRS0=rJke=7B=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D361BC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 10:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8995F207E8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 10:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dIq7kzXJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgESK1H (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 May 2020 06:27:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51184 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgESK1G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 May 2020 06:27:06 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200519102705euoutp01e97a9813fe9c913c8ee71c93d31691a5~QZxjltAr60727107271euoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2020 10:27:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200519102705euoutp01e97a9813fe9c913c8ee71c93d31691a5~QZxjltAr60727107271euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589884025;
        bh=ZKT5i8ZwRi4zvF/m9X+xF/4p2k/qj6EshKkaUfn86Pk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=dIq7kzXJkIAvCMDFS5aSniUeiibeKV4MlsHQSF6OvzNXEexrsLpQcsSp6rZ2WZGU8
         8lnS2dElrrC1Ks6zaPozh24SmUVUgr8lmH/MI6u6Aq9qUC34cJgqgBGt+S3L2TSDh4
         T3uJzlLCAJpD0Jr5k2qwZtVNv/QGvA8Rwy7OscgE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200519102704eucas1p275a5b9c6f67687f182de879503edcca1~QZxjZlrgR0280802808eucas1p2V;
        Tue, 19 May 2020 10:27:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 04.4F.60679.874B3CE5; Tue, 19
        May 2020 11:27:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39~QZxi90oHw3036330363eucas1p1m;
        Tue, 19 May 2020 10:27:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200519102704eusmtrp1f3bb8e53d7387cd858978d96f38fdf15~QZxi9AD2v0347803478eusmtrp1i;
        Tue, 19 May 2020 10:27:04 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-f7-5ec3b47848cb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id F3.8C.07950.874B3CE5; Tue, 19
        May 2020 11:27:04 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200519102703eusmtip2e76f0c0eceac89da6594c907f994bc2f~QZxigo_4G0281602816eusmtip2O;
        Tue, 19 May 2020 10:27:03 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH] clk: samsung: exynos5433: Add IGNORE_UNUSED flag to
 sclk_i2s1
Date:   Tue, 19 May 2020 12:26:52 +0200
Message-Id: <20200519102652.10219-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87oVWw7HGXx8ZGKxccZ6VovrX56z
        Wpw/v4Hd4mPPPVaLGef3MVmsPXKX3eLftY0sFu1PXzI7cHhsWtXJ5tG3ZRWjx+dNcgHMUVw2
        Kak5mWWpRfp2CVwZ/e3/mQp2C1bMXrCJqYGxjb+LkZNDQsBEYtusrawgtpDACkaJpuMmXYxc
        QPYXRokFy8+zQzifGSVW9PSywXSc6pjABJFYzijx4885driWm3fXMoFUsQkYSnS97QLrEBFw
        kPj86TUjSBGzQAuTxNPeNewgCWGBAIm7F/aBLWcRUJV4c2kCUAMHB6+ArcSO1kyIbfISqzcc
        YAbplRA4wyZx6M5XRoiEi8TpKytZIWxhiVfHt7BD2DISpyf3sEA0NDNKPDy3lh3C6WGUuNw0
        A6rbWuLOuV9g25gFNCXW79KHCDtKXFj/lB0kLCHAJ3HjrSBImBnInLRtOjNEmFeio00IolpN
        YtbxdXBrD164xAxhe0hMbZ3MBgnTWIlj/ZcYJzDKzULYtYCRcRWjeGppcW56arFRXmq5XnFi
        bnFpXrpecn7uJkZgCjj97/iXHYy7/iQdYhTgYFTi4U3IPxQnxJpYVlyZe4hRgoNZSYR3wgug
        EG9KYmVValF+fFFpTmrxIUZpDhYlcV7jRS9jhQTSE0tSs1NTC1KLYLJMHJxSDYzt2g9/qGeW
        r2rfxFk/Sb64yTPJ6t3d5z9v3t+/Q0G65Qr3lZkli0IPvus/r/vgXfZ26VcMhmncdT6Vbhyv
        ygpPbN/2bX+vtlenb6pWwY/A6OUnL8cZ3X311cBkpqyf4IqZ/8xmJnF9io0MWJrxofrrxhn2
        V2f9yrxvuvt9+Jbt1Tt3Pd5So2imxFKckWioxVxUnAgARuT2Iv0CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPLMWRmVeSWpSXmKPExsVy+t/xe7oVWw7HGXQ1CVtsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt/h3bSOLRfvTl8wOHB6bVnWyefRtWcXo8XmTXABzlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5Gf/t/poLd
        ghWzF2xiamBs4+9i5OSQEDCRONUxgamLkYtDSGApo8T0J/eZIRIyEienNbBC2MISf651sUEU
        fWKUOHD5IjtIgk3AUKLrLUiCk0NEwEniwbo3YHFmgQ4mifUfK0BsYQE/iWm9B8HiLAKqEm8u
        TQCq5+DgFbCV2NGaCTFfXmL1hgPMExh5FjAyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAgM
        vG3Hfm7Zwdj1LvgQowAHoxIPb0L+oTgh1sSy4srcQ4wSHMxKIrwTXgCFeFMSK6tSi/Lji0pz
        UosPMZoC7Z7ILCWanA+MirySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1M
        HJxSDYxZOksl4n3Z2d+1PrQ9ISUc5KzN2re/bN7PmxWvG65Wn5n8O62IUea18rSOvuoAz03u
        JnYbbN88OLEwnqe4o6CdzW7J0aArU5YteW+Q8viYjcrppO1ceW4Wjj4T31dOmZi42ffSxl/Z
        /dX8ibvPmskxan86/L2dZ5HHnMe3PqfLqV+addfhq6QSS3FGoqEWc1FxIgB2EQJyUgIAAA==
X-CMS-MailID: 20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39
References: <CGME20200519102704eucas1p1e1169d593154c4e3c4dc0d35282d5b39@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mark the SCLK clock for Exynos5433 I2S1 device with IGNORE_UNUSED flag to
match its behaviour with SCLK clock for AUD_I2S (I2S0) device until
a proper fix for Exynos I2S driver is ready.

This fixes the following synchronous abort issue revealed by the probe
order change caused by the commit 93d2e4322aa ("of: platform: Batch fwnode
parsing when adding all top level devices"):

Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 50 Comm: kworker/0:1 Not tainted 5.7.0-rc5+ #701
Hardware name: Samsung TM2E board (DT)
Workqueue: events deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO)
pc : samsung_i2s_probe+0x768/0x8f0
lr : samsung_i2s_probe+0x688/0x8f0
...
Call trace:
 samsung_i2s_probe+0x768/0x8f0
 platform_drv_probe+0x50/0xa8
 really_probe+0x108/0x370
 driver_probe_device+0x54/0xb8
 __device_attach_driver+0x90/0xc0
 bus_for_each_drv+0x70/0xc8
 __device_attach+0xdc/0x140
 device_initial_probe+0x10/0x18
 bus_probe_device+0x94/0xa0
 deferred_probe_work_func+0x70/0xa8
 process_one_work+0x2a8/0x718
 worker_thread+0x48/0x470
 kthread+0x134/0x160
 ret_from_fork+0x10/0x1c
Code: 17ffffaf d503201f f94086c0 91003000 (88dffc00)
---[ end trace ccf721c9400ddbd6 ]--- 

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ed159beab34e..a111fc29352c 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1706,7 +1706,8 @@ static const struct samsung_gate_clock peric_gate_clks[] __initconst = {
 	GATE(CLK_SCLK_PCM1, "sclk_pcm1", "sclk_pcm1_peric",
 			ENABLE_SCLK_PERIC, 7, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_I2S1, "sclk_i2s1", "sclk_i2s1_peric",
-			ENABLE_SCLK_PERIC, 6, CLK_SET_RATE_PARENT, 0),
+			ENABLE_SCLK_PERIC, 6,
+			CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_SCLK_SPI2, "sclk_spi2", "sclk_spi2_peric", ENABLE_SCLK_PERIC,
 			5, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_SPI1, "sclk_spi1", "sclk_spi1_peric", ENABLE_SCLK_PERIC,
-- 
2.17.1

