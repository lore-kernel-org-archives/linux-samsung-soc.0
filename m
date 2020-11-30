Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3ACC64E8A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Nov 2020 16:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34D62076E
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 30 Nov 2020 16:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vl6MfZXm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgK3QpE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 30 Nov 2020 11:45:04 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54615 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728652AbgK3QpD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 11:45:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201130164411euoutp01647bb3cf1fe544996753b283fe9134fe~MVtec_IBn0359903599euoutp01Z
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Nov 2020 16:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201130164411euoutp01647bb3cf1fe544996753b283fe9134fe~MVtec_IBn0359903599euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606754651;
        bh=OTtaZLPfmKj7eXq9Lz7ZtSJXclnuz+PP+4DKNUVgc9c=;
        h=From:Subject:To:Cc:Date:References:From;
        b=Vl6MfZXms0JPjNB5WGyQqyNhR8qy1hqKAkzZfH6a4veq6ELrPpQvVZA+PRk2/QW43
         hz+JTIllapvVPJvSjwaUbY9Oh4iYAKWQJuy4Xxo5exIUSz0Vp2Pz4iqTTNEulHHeKh
         ipISH13YQ/ZxnVqdH0CYJgPd929xHKZKdWUx5lis=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201130164405eucas1p160c435b618af8f7e04c4c0a9667bb0a2~MVtZkYsp03261432614eucas1p1Z;
        Mon, 30 Nov 2020 16:44:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 7A.C4.44805.55125CF5; Mon, 30
        Nov 2020 16:44:05 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2~MVtYzPEld2603126031eucas1p2M;
        Mon, 30 Nov 2020 16:44:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201130164405eusmtrp11469a013b6bc963450cf6a186e57e8ee~MVtYyoHw12978629786eusmtrp1g;
        Mon, 30 Nov 2020 16:44:05 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-cb-5fc521550cb5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FC.29.21957.45125CF5; Mon, 30
        Nov 2020 16:44:04 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201130164404eusmtip279952f243c355db2f099336b6cc534e3~MVtYUWZAh1448714487eusmtip2f;
        Mon, 30 Nov 2020 16:44:04 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: samsung: Updates for v5.11
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Message-ID: <1b5b6cdb-d471-b572-546a-552d6a86297a@samsung.com>
Date:   Mon, 30 Nov 2020 17:44:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7djPc7qhikfjDR791bXYOGM9q8X1L89Z
        LT723GO1mHF+H5PFxVOuFv+ubWRxYPN4f6OV3WPTqk42j74tqxg9Pm+SC2CJ4rJJSc3JLEst
        0rdL4Mo4d+o4Y8FWrortG/YyNzBe5Ohi5OSQEDCRuHrhLmsXIxeHkMAKRon+pv9MEM4XRolP
        /V8YIZzPjBJbr65ngmk582oqG0RiOaPE95WHGUESQgIfGSVeTLUEsdkEDCV6j/aBxYUFjCW+
        XprCDGKLCARJ3OlfC9bMLHCIUWLJrttgCV4BO4mlXbOAbA4OFgFViTkfhEDCogJJEgc/PmCD
        KBGUODnzCQuIzSwgLnHryXwmCFteYvvbOcwgMyUE9nBITOkEeYgDyHGR6PtbBXG0sMSr41vY
        IWwZidOTe1gg6psZJXp232aHcCYwStw/voARospa4s65X2wgg5gFNCXW79KHCDtKHDj6Bmo+
        n8SNt4IQN/BJTNo2nRkizCvR0SYEUa0i8XvVdGi4SUl0P/nPAmF7SDy+0M00gVFxFpLPZiH5
        bBaSz2Yh3LCAkWUVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYLI5/e/4lx2My1991DvE
        yMTBCAxjDmYlEV6Wf0fihXhTEiurUovy44tKc1KLDzFKc7AoifMmbVkTLySQnliSmp2aWpBa
        BJNl4uCUamCae6Tss+/6P5m2BzPaamwVuVXOdE7Wtt0jpvDB0mFukPHZiv6givlcv4SD7nTf
        +xdr+WKnkbugN/e8sHMZ+xSsLnUKWp9d29nlsTHlKkfzhC2R3cJ5E5zCtLcFXjFKUjDi6Izc
        YZb/ZNHmpPbl7QdMdws9vf666NnKlWw5L6f/3B+6Ye3tf36Vemltjnpf2SdL2plsfXRRqEZE
        SlZwVrqk3Rn2+9cvvYi57uKrP10nrnAbx+dXnzfdmP9M9fO7m7y2RWYzd0+/Lazjrz/nB4cL
        h16qybm9U6dPql6Q2bv2zJ7erI0MZYpd3Tc4JxkHJpYt18pcdvfc4gmR/Mf8Tx73XBiQXLJX
        y+ltlcqJJHUlluKMREMt5qLiRAAYtU9gpQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeLIzCtJLcpLzFFi42I5/e/4Pd0QxaPxBuv7LS02zljPanH9y3NW
        i48991gtZpzfx2Rx8ZSrxb9rG1kc2Dze32hl99i0qpPNo2/LKkaPz5vkAlii9GyK8ktLUhUy
        8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DLOnTrOWLCVq2L7hr3M
        DYwXOboYOTkkBEwkzryaytbFyMUhJLCUUWLeu3lMXYwcQAkpifktShA1whJ/rnWxgdhCAu8Z
        JWb28YPYbAKGEr1H+xhBbGEBY4mvl6Ywg9giAkESv/bcYwWZySxwiFHiSss2sASvgJ3E0q5Z
        zCDzWQRUJeZ8EAIJiwokSfxeupYNokRQ4uTMJywgNrOAusSfeZeYIWxxiVtP5jNB2PIS29/O
        YZ7AKDALScssJC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmCsbDv2c/MO
        xnmvPuodYmTiYAQ6nYNZSYSX5d+ReCHelMTKqtSi/Pii0pzU4kOMpkAvTGSWEk3OB0ZrXkm8
        oZmBqaGJmaWBqaWZsZI479a5a+KFBNITS1KzU1MLUotg+pg4OKUamBY+mLN+AXOsumDdzbCv
        r7ZMfObKNzdq/dqeX1eeqDNt+fCHc9453qC3WV3MnwvFVHqfJMQsU39cohW++fdh/Y3Hvsia
        i7HlLbe6LFa7/umxF05dCedT4tbv71i/7ohld7n42/joy7HK3Rd69tx5/vB04zXZrM91DX9u
        ndv3/KZw6ixD5ZTFNu8bVAWePvu5kW2mYmJE4Yqlh6Mj1/1811Imd1op9/7amZkX35rWNDy+
        ZFO6frK8r4Or9qTFElM/VwWvW7pcR7hPidGr9l3RH5P8KRNlwg/ptoUIBT8vePl2acD3rpqm
        fe/2uJz6HReT2aUb/5KP+9kMiX9JyY++O8YsW/V+9V3Nhp4Vk+TVo64osRRnJBpqMRcVJwIA
        /zsFMh4DAAA=
X-CMS-MailID: 20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2
References: <CGME20201130164405eucas1p2a202512b7e1e8072019f70f90b972af2@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Stephen, Mike,

Below is my tiny pull request for v5.11. My apologies for being late, I forgot
to send it out last week.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.11-samsung

for you to fetch changes up to 44a9e78f9242872c889f176782777fa2ed535650:

  clk: samsung: Prevent potential endless loop in the PLL ops (2020-11-23 11:14:04 +0100)

----------------------------------------------------------------
clk/samsung updates for 5.11

 - correction of Kconfig dependencies for better compile test coverage,
 - refactoring of the PLL clocks driver.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      clk: samsung: Allow compile testing of Exynos, S3C64xx and S5Pv210

Sylwester Nawrocki (1):
      clk: samsung: Prevent potential endless loop in the PLL ops

 drivers/clk/samsung/Kconfig   |  67 +++++++++++++-
 drivers/clk/samsung/Makefile  |  22 ++---
 drivers/clk/samsung/clk-pll.c | 147 +++++++++++++++----------------
 include/linux/clk/samsung.h   |   4 +-
 4 files changed, 149 insertions(+), 91 deletions(-)

-- 
Thank you,
Sylwester
