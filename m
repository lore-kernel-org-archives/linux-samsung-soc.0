Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B86BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:06:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58F2461264
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbhJSIIb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:08:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25373 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235086AbhJSIHs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:07:48 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211019080532euoutp01da091221e0061a32e7e2ec98b9393201~vX-2ywWyx0627406274euoutp01l
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:05:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211019080532euoutp01da091221e0061a32e7e2ec98b9393201~vX-2ywWyx0627406274euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634630733;
        bh=NEn4FshOOnDIdlhQWIpQEOPQGh3uPFEWbrtqfmrDCrY=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=K5i1cAbVt1/LgDUGYUgGwZ3btoFZsfvJQ0hh+GWQj24GvYNYNdCeaSZg3ezk5v1ak
         h5s1OAnJwWK9YuLCpfW8Zjvek5v67Ftj7FmzpDlbh7CdXYfFYYuOTYG1fCB3iPcukW
         SheyUBVsEmeDWMtPhauM6ouamSi5thBw1PrQHnns=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211019080532eucas1p106832d45027f90101c0c7c271eb387f3~vX-2fX3fQ2547725477eucas1p19;
        Tue, 19 Oct 2021 08:05:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id FE.D0.42068.C4C7E616; Tue, 19
        Oct 2021 09:05:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211019080532eucas1p181b54b8a8cb42f089313d211ea0a8421~vX-2Fy3JP0167201672eucas1p1S;
        Tue, 19 Oct 2021 08:05:32 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211019080532eusmtrp1fb35ef9363eba8255fe9ecae115428e0~vX-2FJZxt0600406004eusmtrp1V;
        Tue, 19 Oct 2021 08:05:32 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-60-616e7c4ce90c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 55.26.31287.C4C7E616; Tue, 19
        Oct 2021 09:05:32 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211019080531eusmtip1844806844d6ac8e311f3129328dcbe5d~vX-1rMLwO2762527625eusmtip1l;
        Tue, 19 Oct 2021 08:05:31 +0000 (GMT)
Message-ID: <6cd2815a-3dca-4373-8c4f-bae2522a36bd@samsung.com>
Date:   Tue, 19 Oct 2021 10:05:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk: samsung: Updates for v5.16
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CGME20210409182228eucas1p108c01fc7b0feba23d53b812aa8d15202@eucas1p1.samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzneV2fmrxEg6f/VS2uf3nOavGx5x6r
        xYzz+5gsLp5ytfh3bSOLA6vH+xut7B6bVnWyefRtWcXo8XmTXABLFJdNSmpOZllqkb5dAlfG
        tJ6zjAXTxCpuPHvL1sC4QLCLkZNDQsBE4uukSWxdjFwcQgIrGCVapzxmgXC+MEo82nmRCcL5
        zCjx9cBGNpiWj4veM4LYQgLLGSWOTdeFKPrIKLFz9jawIl4BO4lP+5uYQWwWAVWJGQu+M0PE
        BSVOznzCAmKLCiRJzJ/9gB3EZhMwlOg92gc2VFjAWGLnlfVgc0QEgiTu9K8Fu49ZoItR4vDv
        o2CDmAXEJW49mc8EYnMKxEkcuT6bESIuL7H97RxmiEsvcEj8XwkU5wCyXSR+zpaECAtLvDq+
        hR3ClpE4PbkH7GUJgWZGiZ7dt9khnAmMEvePL2CEqLKWuHPuFxvIIGYBTYn1u/QhZjpKbH3h
        BGHySdx4KwhxAZ/EpG3TmSHCvBIdbUIQM1Qkfq+azgRhS0l0P/nPMoFRaRZSoMxC8tcsJL/M
        Qli7gJFlFaN4amlxbnpqsVFearlecWJucWleul5yfu4mRmCCOf3v+JcdjMtffdQ7xMjEwXiI
        UYKDWUmEN8k1N1GINyWxsiq1KD++qDQntfgQozQHi5I4b9KWNfFCAumJJanZqakFqUUwWSYO
        TqkGJu7ahfkPp/AaC1aYrFu6oVnlaKqy6bm8bW5dRhqndpswfJpt4KhSo7TpxNprz05v4lHt
        dj6zNOfHc/VwFuOQ+69Vj3QFvV4zvUT08bTVF5sc/qlve7aD+dmc21YJn26rW3Aax31Vvn+C
        4UNYVpH4QqkpfqtLeAUM1aIblT51Vto+WStgy7hvsntRUaGjkcJqhry9h9vLJ1sqznEIb3jM
        ljFn4qXfwmcsU9kWLIksS7t77MLzRB3rf0ydV9daGh1bxiZUydel3XB8oez6d+U+r8X3C97Z
        +aYtt6bEf32Msm68ZMfityd7KsQDFgtIy+4xeS+T/mriDwfDj3PKVhS/0QxjUdXUORY0r757
        m0aqEktxRqKhFnNRcSIAmYAs9p8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRmVeSWpSXmKPExsVy+t/xu7o+NXmJBt+2cVlc//Kc1eJjzz1W
        ixnn9zFZXDzlavHv2kYWB1aP9zda2T02repk8+jbsorR4/MmuQCWKD2bovzSklSFjPziElul
        aEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MaT1nGQumiVXcePaWrYFxgWAX
        IyeHhICJxMdF7xm7GLk4hASWMkp8/feMqYuRAyghJTG/RQmiRljiz7UuNoia94wSG76sZQdJ
        8ArYSXza38QMYrMIqErMWPCdGSIuKHFy5hMWEFtUIEni44YZYHE2AUOJ3qN9jCC2sICxxM4r
        69lAbBGBIIlfe+6xgixgFugCWjD1E9gCIYFYifnnVoDZzALiEreezGcCsTkF4iSOXJ/NCHIo
        s4C6xPp5QhAl8hLb385hnsAoNAvJGbOQdM9C6JiFpGMBI8sqRpHU0uLc9NxiQ73ixNzi0rx0
        veT83E2MwIjaduzn5h2M81591DvEyMTBeIhRgoNZSYQ3yTU3UYg3JbGyKrUoP76oNCe1+BCj
        KTAoJjJLiSbnA2M6ryTe0MzA1NDEzNLA1NLMWEmcd+vcNfFCAumJJanZqakFqUUwfUwcnFIN
        TPuu63dxLeCfsf6UdJbrqtM7j779mnp3Yhp/4keXa+2zfN1/tGhNy0jOPPXm4LLUvyfSdRdW
        2a3/PFOHa337ibKY7+uz/ZgbSo3T5d4crFpXNNed54n6I9e+LbcKk18bpeScOPdm0Ymfn/ts
        5B/l/c6YYDwhq9597ZUKm5XKucX37Kw2H5/Sb77t3+Ew7hUKfnfsDlw+dj7L8fOTj9vig4s/
        2qzT3Zp7aM1G+W/XJlrfD12yzv5Ed0D5oylsfzwmf/Fe+TXY4vS8tFRGZgGXpKIT7bNts+cE
        T6+fM6O0dleB9mXWOX/7Kk/ay+ZHTzU906L1J6faWm3O8iOX2r7KX7fYcE06euG9i/WrD+/+
        +mSiEktxRqKhFnNRcSIAlt1dXjEDAAA=
X-CMS-MailID: 20211019080532eucas1p181b54b8a8cb42f089313d211ea0a8421
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

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v5.16-samsung

for you to fetch changes up to 9fe667af61d22fbeec823843962a77cd39993966:

  clk: samsung: describe drivers in Kconfig (2021-10-18 10:12:48 +0200)

----------------------------------------------------------------
clk/samsung updates for v5.16

- Initial clock driver for the Exynos850 SoC
- Refactoring of the CPU clock code and conversion of Exynos5433
  CPU clock driver to the platform driver
- A few conversions to devm_platform_ioremap_resource()
- Updates of the Kconfig help text

----------------------------------------------------------------
Cai Huoqing (4):
      clk: samsung: exynos-audss: Make use of devm_platform_ioremap_resource()
      clk: samsung: exynos4412-isp: Make use of devm_platform_ioremap_resource()
      clk: samsung: exynos5433: Make use of devm_platform_ioremap_resource()
      clk: samsung: s5pv210-audss: Make use of devm_platform_ioremap_resource()

Krzysztof Kozlowski (1):
      clk: samsung: describe drivers in Kconfig

Sam Protsenko (5):
      clk: samsung: clk-pll: Implement pll0822x PLL type
      clk: samsung: clk-pll: Implement pll0831x PLL type
      dt-bindings: clock: Add bindings definitions for Exynos850 CMU
      dt-bindings: clock: Document Exynos850 CMU bindings
      clk: samsung: Introduce Exynos850 clock driver

Will McVicker (2):
      clk: samsung: add support for CPU clocks
      clk: samsung: exynos5433: update apollo and atlas clock probing

 .../clock/samsung,exynos850-clock.yaml        | 185 ++++
 drivers/clk/samsung/Kconfig                   |  30 +-
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-cpu.c                 |  18 +
 drivers/clk/samsung/clk-exynos-audss.c        |   4 +-
 drivers/clk/samsung/clk-exynos4412-isp.c      |   4 +-
 drivers/clk/samsung/clk-exynos5433.c          | 124 +--
 drivers/clk/samsung/clk-exynos850.c           | 835 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 | 196 ++++
 drivers/clk/samsung/clk-pll.h                 |   2 +
 drivers/clk/samsung/clk-s5pv210-audss.c       |   4 +-
 drivers/clk/samsung/clk.c                     |   2 +
 drivers/clk/samsung/clk.h                     |  26 +
 include/dt-bindings/clock/exynos850.h         | 141 +++
 14 files changed, 1478 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos850.c
 create mode 100644 include/dt-bindings/clock/exynos850.h

-- 
Regards,
Sylwester

