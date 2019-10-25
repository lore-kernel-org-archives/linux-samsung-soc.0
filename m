Return-Path: <SRS0=fp8F=YS=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4925CA9EBD
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 15:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB262222BE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Oct 2019 15:39:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q4yd1mRS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395468AbfJYPjF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Oct 2019 11:39:05 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35967 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395467AbfJYPjE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Oct 2019 11:39:04 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191025153903euoutp01b2110441f247b0c9cc016a474b2102bb~Q7f2Qvh0x1028810288euoutp01w
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2019 15:39:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191025153903euoutp01b2110441f247b0c9cc016a474b2102bb~Q7f2Qvh0x1028810288euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1572017943;
        bh=AoLNxt8cPso5JiUcTYfm7nH/qcs705hS2ohZMv3BmiE=;
        h=From:Subject:To:Cc:Date:References:From;
        b=q4yd1mRS8MgexYi8sFL3Z1ITwOh2bKOAQc4Rz3fkveJHt9tVFKJoMLuoKuFKn8VfG
         CRUx0x82j0QxJacTEeCxGn1OL80U1TyHdAr6WEb3dq68XvNgFY7ouhCOyDZFmv0hYB
         Sz23HidyigwHYpAjlhzcTfxvwok1G+S/5E+BoEZs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191025153902eucas1p12031986986d3488e1aca03f7be89c06f~Q7f18T9Fb2191821918eucas1p1W;
        Fri, 25 Oct 2019 15:39:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 42.2E.04374.61713BD5; Fri, 25
        Oct 2019 16:39:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191025153902eucas1p174c36ab6b80d297290181456bebacca2~Q7f1nxCz52433824338eucas1p1F;
        Fri, 25 Oct 2019 15:39:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191025153902eusmtrp24cc9e8b37333c8560322397474f3f218~Q7f1nHBsr2282822828eusmtrp2z;
        Fri, 25 Oct 2019 15:39:02 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-98-5db31716e48f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.98.04117.61713BD5; Fri, 25
        Oct 2019 16:39:02 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191025153902eusmtip1851c93b5c7f79f158216d28ebde475cd~Q7f1S5_jN3202932029eusmtip1L;
        Fri, 25 Oct 2019 15:39:02 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung fixes for v5.4
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Message-ID: <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com>
Date:   Fri, 25 Oct 2019 17:39:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsWy7djP87pi4ptjDX5NNLTYOGM9q8X1L89Z
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ4rJJSc3JLEst
        0rdL4Mo42XSDteAMZ8XmjudsDYw9HF2MnBwSAiYS8++8YO5i5OIQEljBKHF/0lV2COcLo0TT
        m6mMEM5nRomGnbeYYVqevJnPCpFYzijR9f4YWEJI4C2jxIweZRCbTcBQovdoHyOILSygJ/Hh
        0zoWEFtEIEjiTv9aNpBmZoFDjBJrFj1lA0nwCthJfDy+nh3EZhFQldj5pwEozsEhKhAhcfpr
        IkSJoMTJmU/A5jALiEs0fVnJCmHLS2x/OwfsBwmBfnaJG7d3MYL0Sgi4SCxfLAhxtLDEq+Nb
        2CFsGYn/O+czQdQ3M0r07L7NDuFMAAbA8QWMEFXWEoePX2QFGcQsoCmxfpc+RNhR4uf9SSwQ
        8/kkbrwVhLiBT2LStunMEGFeiY42IYhqFYnfq6YzQdhSEt1P/kN1eki86/OawKg4C8ljs5A8
        NgvJY7MQTljAyLKKUTy1tDg3PbXYOC+1XK84Mbe4NC9dLzk/dxMjMNWc/nf86w7GfX+SDjEK
        cDAq8fB+4N0cK8SaWFZcmQsMbw5mJRFe7RObYoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8
        iBYSSE8sSc1OTS1ILYLJMnFwSjUwZm4r+Vni+mb65NmvLy57K6BkX+qz1LHu8LkLcUzb9zUw
        tac3JdVPtfpgcTV0RXrktZ0CvoGTvyWYHRHV+Ny00uut0d4Ey3WBijt+zTbP5HU4Ut+zbHru
        qmor32j3F+7s317bM1Rs5lRzbXS2SuvytNPyfjgv5+B/FdWMPfasH801le5/8HqixFKckWio
        xVxUnAgAh9Wd1DEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsVy+t/xu7pi4ptjDV60KFpsnLGe1eL6l+es
        Fh977rFazDi/j8ni4ilXi3/XNrI4sHm8v9HK7rFpVSebR9+WVYwenzfJBbBE6dkU5ZeWpCpk
        5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GWcbLrBWnCGs2Jzx3O2
        BsYeji5GTg4JAROJJ2/ms3YxcnEICSxllLj7YitbFyMHUEJKYn6LEkSNsMSfa11sEDWvGSW2
        TPnODpJgEzCU6D3axwhiCwvoSXz4tI4FxBYRCJL4tece2FBmgUOMEv93vGAGSfAK2El8PL4e
        rJlFQFVi558GNhBbVCBC4vn2G4wQNYISJ2c+ARvELKAu8WfeJWYIW1yi6ctKVghbXmL72znM
        ExgFZiFpmYWkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjJdtx35u2cHY
        9S74EKMAB6MSD+8H3s2xQqyJZcWVuUCPcDArifBqn9gUK8SbklhZlVqUH19UmpNafIjRFOih
        icxSosn5wFjOK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA2PXG
        pfPsdKdQptZ7F/y0j0d+2P9mTdyy1fkL7eVdvIpS3qyY3Xni8b1evv2bbT2/6yevuhNza+ru
        HScaP92f9CqgVXPGtt/Fa2bvdPkVd2RPsk5j/Yr+kKTeie8WrnPkXOiXpjPJWeXps5QMXT7R
        vRGfb2rv/PB4c8jtmcxXOjcztAtvltzE9EaJpTgj0VCLuag4EQAQ0NvzrQIAAA==
X-CMS-MailID: 20191025153902eucas1p174c36ab6b80d297290181456bebacca2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191025153902eucas1p174c36ab6b80d297290181456bebacca2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191025153902eucas1p174c36ab6b80d297290181456bebacca2
References: <CGME20191025153902eucas1p174c36ab6b80d297290181456bebacca2@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.4-samsung-fixes

for you to fetch changes up to e9323b664ce29547d996195e8a6129a351c39108:

  clk: samsung: exynos5420: Preserve PLL configuration during suspend/resume (2019-10-25 11:20:00 +0200)

----------------------------------------------------------------
 - system suspend related fixes for the exynos542x clocks driver
 - probe() error paths fixes in the exynos5433 CMU driver adding
   proper release of memory and clk resources

----------------------------------------------------------------
Marek Szyprowski (3):
      clk: samsung: exynos5433: Fix error paths
      clk: samsung: exynos542x: Move G3D subsystem clocks to its sub-CMU
      clk: samsung: exynos5420: Preserve PLL configuration during suspend/resume

 drivers/clk/samsung/clk-exynos5420.c | 27 +++++++++++++++++++++++++--
 drivers/clk/samsung/clk-exynos5433.c | 14 ++++++++++++--
 2 files changed, 37 insertions(+), 4 deletions(-)

--
Regards, 
Sylwester
