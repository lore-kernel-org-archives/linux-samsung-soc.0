Return-Path: <SRS0=rJke=7B=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EE2C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 16:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C0D820823
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 May 2020 16:00:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nPSlUeVW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgESQAs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 May 2020 12:00:48 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52740 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729055AbgESQAr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 May 2020 12:00:47 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200519160044euoutp0116af6b12b2d66fc92888971af2e7302a~QeU4Aa9-92684026840euoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 May 2020 16:00:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200519160044euoutp0116af6b12b2d66fc92888971af2e7302a~QeU4Aa9-92684026840euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589904044;
        bh=mfv7qvHfvq45NpEaYxxDp0Uspu0tWQaNUJ4rn5up5Mg=;
        h=To:Cc:From:Subject:Date:References:From;
        b=nPSlUeVWolwIm6939hSEVePIGEy1aIiZ1ODrZbvWR1anqZlyew2b9LrUqSrrN7o0q
         Rzu4GkjClSQSwg6q6L5YH6CWk7TS1STdUjDarvaoXgAkkbaEom5GBnqH4nsauNFS54
         9UCf2wKrKMJXdawlXl7qzfE0MGZktaVk9L25Bdd4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200519160044eucas1p1ab7ee2150575ab8521eb51b43a032e0d~QeU30I1Nh1186011860eucas1p1h;
        Tue, 19 May 2020 16:00:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BD.A0.60679.CA204CE5; Tue, 19
        May 2020 17:00:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1~QeU3fXhz_1203412034eucas1p1j;
        Tue, 19 May 2020 16:00:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200519160043eusmtrp12cadbc1abbfce6bcd05081456d3fb98e~QeU3ewtaW3256032560eusmtrp17;
        Tue, 19 May 2020 16:00:43 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-3d-5ec402aca0d7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E6.FA.07950.BA204CE5; Tue, 19
        May 2020 17:00:43 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200519160043eusmtip2c1c10482d84f760512d6c9a739c8bd2a~QeU25pZkK2923329233eusmtip2S;
        Tue, 19 May 2020 16:00:43 +0000 (GMT)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates for 5.8
Message-ID: <72d1868f-65c0-5dd7-b497-ebc5f78bc34b@samsung.com>
Date:   Tue, 19 May 2020 18:00:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87prmI7EGRz6wGaxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJVxa9c6poL1XBXfV2xlbWA8w9HFyMkhIWAiMffgGxYQW0hgBaPEx6ueXYxcQPYXRon1
        /xcyQzifGSX2vmligel4sXcKK0RiOaPEuqkzWSCcj4wS3y/3sYJUiQgESdzpX8sGkmAWOMAo
        0bF+DVg7m4ChRO/RPkYQW1hAX2Lbkn1sIDavgJ1Ew8NZYHEWAVWJS7OOgtWLCsRKnF68mRGi
        RlDi5MwnYHFmAXGJW0/mM0HY8hLb384Bu1VCoJtd4vbUG2wQt7pITHv1B8oWlnh1fAs7hC0j
        cXpyDwtEQzOjRM/u2+wQzgRGifvHFzBCVFlL3Dn3C6ibA2iFpsT6XfoQYUeJte+ugYUlBPgk
        brwVhDiCT2LStunMEGFeiY42IYhqFYnfq6YzQdhSEt1P/rNAlHhIvGnOm8CoOAvJZ7OQfDYL
        yWezEE5YwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDdnP53/MsOxl1/kg4xCnAw
        KvHwGuw5HCfEmlhWXJl7iFGCg1lJhHfCi0NxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72M
        FRJITyxJzU5NLUgtgskycXBKNTDGdzPdc7ojkSDT/1LvXfevAhO5hqLe1J03H7QHtLO0lnP/
        F/wRtZ/7jV7QnIQ9dhsmzWr6erf/7/FOkfZ3voc+/V22j/GTicxj+f2Mm20LI4sVnk2ZYuoi
        vHpDUO3KHa33v0/iOzwvb+Z+df62U2I33CWcZa72Vx04ni7j5yfUOskz8s3De5ZKLMUZiYZa
        zEXFiQDEvm1/MwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsVy+t/xe7qrmY7EGez7q2OxccZ6VovrX56z
        WnzsucdqMeP8PiaLi6dcLf5d28jiwObx/kYru8emVZ1sHn1bVjF6fN4kF8ASpWdTlF9akqqQ
        kV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJdxa9c6poL1XBXfV2xl
        bWA8w9HFyMkhIWAi8WLvFFYQW0hgKaPEhSbBLkYOoLiUxPwWJYgSYYk/17rYuhi5gEreM0ps
        e7WRHSQhIhAk8WvPPVaQBLPAIUaJixf3gw1iEzCU6D3axwhiCwvoS2xbso8NxOYVsJNoeDgL
        LM4ioCpxadZRFhBbVCBWYvW1VkaIGkGJkzOfgMWZBdQl/sy7xAxhi0vcejKfCcKWl9j+dg7z
        BEaBWUhaZiFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo2XbsZ9bdjB2
        vQs+xCjAwajEw2uw53CcEGtiWXFlLtCDHMxKIrwTXhyKE+JNSaysSi3Kjy8qzUktPsRoCvTQ
        RGYp0eR8YCTnlcQbmhqaW1gamhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgtKkM
        ddn85vDC1An+68MdbRMVnkvlnS996lXCEm2moBn9IMHm/DNx0eO2DsuP7O+VNS6IqNmm9eaa
        /E7zCcyGmf8/uMi71Jqf+fBEb/rz0oVV+kX6RsUxO/j6QqcY5G/7/5pz3+7K575VxlZMf47N
        uPmoINLT/ljcLJNbsrnT58+bmvMqqfiBEktxRqKhFnNRcSIAmqxL5qwCAAA=
X-CMS-MailID: 20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1
References: <CGME20200519160043eucas1p11d34223ddaddaf00e136abacc9f351e1@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.8-samsung

for you to fetch changes up to 25bdae0f1c6609ceaf55fe6700654f0be2253d8e:

  clk: samsung: exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1 (2020-05-19 16:58:42 +0200)

----------------------------------------------------------------
clk/samsung updates for 5.8

 - Regression fixes for exynos542x and exynos5433 SoCs,
 - use of fallthrough; attribute for s3c24xx.

----------------------------------------------------------------
Joe Perches (1):
      ARM/SAMSUNG EXYNOS ARM ARCHITECTURES: Use fallthrough;

Marek Szyprowski (3):
      clk: samsung: Mark top ISP and CAM clocks on Exynos542x as critical
      clk: samsung: Fix CLK_SMMU_FIMCL3 clock name on Exynos542x
      clk: samsung: exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1

 drivers/clk/samsung/clk-exynos5420.c | 18 ++++++++++--------
 drivers/clk/samsung/clk-exynos5433.c |  3 ++-
 drivers/clk/samsung/clk-s3c2443.c    |  2 +-
 drivers/i2c/busses/i2c-s3c2410.c     |  3 +--
 4 files changed, 14 insertions(+), 12 deletions(-)

-- 
Regards,
Sylwester
