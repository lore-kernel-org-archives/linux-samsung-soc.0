Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF78C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 18:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCE5360241
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 18:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhDISWr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Apr 2021 14:22:47 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61506 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbhDISWp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 14:22:45 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210409182230euoutp01921cab0128a29578474e45dc46a9bfb0~0Q6b0KoYx0868508685euoutp01k
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Apr 2021 18:22:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210409182230euoutp01921cab0128a29578474e45dc46a9bfb0~0Q6b0KoYx0868508685euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617992550;
        bh=fytKTL69qeAlhWxNOUpC7kU0dKgNNFQ5XRTAmIOvU8k=;
        h=From:Subject:To:Cc:Date:References:From;
        b=stNWW+ag5zVds+0ydP6r93G/VbVA7VRadVLWeSjLzgvMWNJv6Ze2WrzBkzVVlASld
         1CH7U7o1ROX4HzFm/OhNrO9mdNBl0RwPI4T7bTpT+fq5RKHPXUP3mPi7QeIPQEd7LN
         NrGvcB7oice0VaOegPaAgGSYT2mYgTvWzUKUu1rM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210409182229eucas1p1f8e4d4488cf29cd9061e5fa2dcfd675f~0Q6bTJ-461013010130eucas1p1a;
        Fri,  9 Apr 2021 18:22:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4F.C0.09439.56B90706; Fri,  9
        Apr 2021 19:22:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202~0Q6aDa-Nd1013010130eucas1p1Z;
        Fri,  9 Apr 2021 18:22:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210409182228eusmtrp1e5a721a757bb54ae0b6b57017883e354~0Q6Z-0uca2273122731eusmtrp1O;
        Fri,  9 Apr 2021 18:22:28 +0000 (GMT)
X-AuditID: cbfec7f5-c03ff700000024df-f0-60709b653ef5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 64.DE.08705.46B90706; Fri,  9
        Apr 2021 19:22:28 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210409182227eusmtip23ed611a083b829749d27f512d3c45dee~0Q6ZZWxpC2658126581eusmtip2_;
        Fri,  9 Apr 2021 18:22:27 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: samsung: Updates for v5.13
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Message-ID: <915aada1-34ff-4419-2352-c99b3de5f368@samsung.com>
Date:   Fri, 9 Apr 2021 20:22:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djPc7qpswsSDM7eN7TYOGM9q8X1L89Z
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ4rJJSc3JLEst
        0rdL4MqY2dHBWPCVo2LF527WBsZt7F2MnBwSAiYSc+/3MXYxcnEICaxglHjbch7K+cIo8X/V
        XTaQKiGBz4wSD35UwXRM713IClG0nFHi99KVTBDOR0aJmd/+sIJUsQkYSvQeBZnLySEsYCzx
        5OhOsEkiAkESd/rXsoE0MAscYpRYsus2M0iCV8BOYt30lywgNouAisTJ021gcVGBJImlj/4x
        QtQISpyc+QSshllAXOLWk/lMELa8RPPW2cwgQyUEtnBI/L19jAXiVheJts2b2CBsYYlXx7dA
        fS0jcXpyDwtEQzOjRM/u2+wQzgRGifvHFzBCVFlL3Dn3C6ibA2iFpsT6XfogpoSAo8TWF04Q
        Jp/EjbeCEDfwSUzaNp0ZIswr0dEmBDFDReL3qulMELaURPeT/1CXeUjsP7KbfQKj4iwkn81C
        8tksJJ/NQjhhASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMB0c/rf8a87GFe8+qh3
        iJGJgxEYyBzMSiK8zc35CUK8KYmVValF+fFFpTmpxYcYpTlYlMR5d21dEy8kkJ5YkpqdmlqQ
        WgSTZeLglGpgmhMY0NFeUWd/dtLNnMuOzd+Nu5ed09cQLEgOefzASNZBd1Ff6fLpkiXn3uQc
        adx4l0Nn7fQ1D6TUXX2ux1ycH7rmw/S4tyYdIk3yqRZXfq78Wtl5691zL03WfcFVsj9EXO4f
        tLymKNgosyDURnN/33ujo1wXKleITY2cW2cTrOJQ0b/BY2mMrsa7Lbm5z4WjG0UUcubXZwd3
        xy1+MOO1z727jxbKiiz1yZjhu1qqa5XhcdPHux/cbfd88/uwo2thVh77q+gn7fuld7nViAu6
        9Xtx1yapmIZkL9Hf1RXzrd32OEed6M6K3VMtdWcqvV6pm6g/jeHaHYZ3XDOMCqJ31PV93nX5
        qv+zIrXPdycosRRnJBpqMRcVJwIALG9kTKYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42I5/e/4Pd2U2QUJBldbJCw2zljPanH9y3NW
        i48991gtZpzfx2Rx8ZSrxb9rG1kc2Dze32hl99i0qpPNo2/LKkaPz5vkAlii9GyK8ktLUhUy
        8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJmdnQwFnzlqFjxuZu1
        gXEbexcjJ4eEgInE9N6FrF2MXBxCAksZJT4/bGPqYuQASkhJzG9RgqgRlvhzrYsNouY9o8Sm
        lZvAmtkEDCV6j/YxgtjCAsYST47uZAOxRQSCJH7tuQc2lFngEKPElZZtzCAJXgE7iXXTX7KA
        2CwCKhInT7eBxUUFkiTads9kh6gRlDg58wlYDbOAusSfeZeYIWxxiVtP5jNB2PISzVtnM09g
        FJiFpGUWkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBeth37uXkH47xX
        H/UOMTJxMALdzsGsJMLb3JyfIMSbklhZlVqUH19UmpNafIjRFOiHicxSosn5wIjNK4k3NDMw
        NTQxszQwtTQzVhLn3Tp3TbyQQHpiSWp2ampBahFMHxMHp1QDU3L8XLe1WmsnzLRa1/8k/sNs
        zeB3y1OrLP9JKE94Hxgzp/Krxf8ll0uvLnRfyajstFhCKMOq1e7d9/4Zk1sU3LQs5czcYqRM
        5kscu1UnfbHF7ryvkq5Kr0PhG+05Jm/+rfuw1TKivFRni2zJJl1ne3WN1UcXC0ofL1QtLrDW
        Upn+gEH9+fYtCmrXbz/efe2CuuLz5CzWi34amaKnn3WFPzJTYJh859uhbbKVK88si9nrkXK8
        N7fr470L713OtRmVWglxd8Y/5pjtl3G5KmzRq3P+rd9Xhbzm1n2Q1mkpbqDSLX1Es7W5+90r
        g4M3teO2Xv4w9UTmjv9CHAV8G17r8CU8s1m3b7fjyZVpIb+dlViKMxINtZiLihMBN1T48yAD
        AAA=
X-CMS-MailID: 20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202
References: <CGME20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,


The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.13-samsung

for you to fetch changes up to 7f32917642c7ea486c1bae5dfdebeeb56c35b29b:

  clk: samsung: Remove redundant dev_err calls (2021-04-08 19:35:26 +0200)

----------------------------------------------------------------
clk/samsung updates for 5.13

- clean up of redundant dev_err() calls after dev_ioremap_resource()
- fix for the clk-exynos7 driver (part of upcoming Galaxy S6 device
  support)

----------------------------------------------------------------
Chen Hui (1):
      clk: samsung: Remove redundant dev_err calls

Paweł Chmiel (1):
      clk: exynos7: Mark aclk_fsys1_200 as critical

 drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
 drivers/clk/samsung/clk-exynos7.c        | 7 ++++++-
 drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
Regards,
Sylwester
