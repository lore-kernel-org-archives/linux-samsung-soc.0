Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6623CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 May 2022 18:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348510AbiEJSMI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 May 2022 14:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348521AbiEJSMG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 May 2022 14:12:06 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691491EE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 May 2022 11:08:00 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220510180754euoutp01f7c6542fb1024af5088aba86d9a1147b~t0KvHouFZ3258132581euoutp016
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 May 2022 18:07:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220510180754euoutp01f7c6542fb1024af5088aba86d9a1147b~t0KvHouFZ3258132581euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1652206074;
        bh=EIxhLP+tIlQHP4st26qWqlxBxjq78NkAByLwLQ8nxTo=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=TpPxOu+wV/Odg3Vg/pUb2MQoq1GRlmorBZ9I9t/eVnQXdGejcaJyJsAmvhswfJgmR
         I/kpXqTmjlq3In6YEDpdBtbXmcvm/4oX6QHY6hsFEnrzcxrSYyKJ/Q3P/FD/QYFhAJ
         DlVTbL+XMLYf5ZAW//LXfAJE1zdCvMEAiHL9Nkds=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220510180753eucas1p157579d265b6fcc9ef89ce3f830906a88~t0KuG-GpE3030430304eucas1p1v;
        Tue, 10 May 2022 18:07:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 27.19.10009.9F9AA726; Tue, 10
        May 2022 19:07:53 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220510180752eucas1p26e120d9c4026d6a2d7a24744460bea25~t0KtdRC3h2520125201eucas1p2K;
        Tue, 10 May 2022 18:07:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220510180752eusmtrp279ccfe98192aa84ca9815c709573d277~t0KtcgMlS1333413334eusmtrp2g;
        Tue, 10 May 2022 18:07:52 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-e6-627aa9f9be4f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id B9.60.09522.8F9AA726; Tue, 10
        May 2022 19:07:52 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220510180751eusmtip2a03a4b379a0f677a5c7b35171686f09a~t0KswbWxT1510215102eusmtip2k;
        Tue, 10 May 2022 18:07:51 +0000 (GMT)
Message-ID: <1f2b528d-4b2e-1ba7-5f90-7a0bf78a1869@samsung.com>
Date:   Tue, 10 May 2022 20:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 00/12] initial clock support for exynosauto v9 SoC
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20220504075154.58819-1-chanho61.park@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLKsWRmVeSWpSXmKPExsWy7djP87o/V1YlGew+K2TxYN42NovL+7Ut
        rn95zmox/8g5Vou+Fw+ZLfa+3spu8bHnHqvFjPP7mCwunnK1aN17hN3i37WNLBbP+4BCq3b9
        YXTg9Xh/o5XdY+esu+wem1Z1snncubaHzaNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyGr93
        MhbsZKyY3dLK3MA4lbGLkZNDQsBE4vONNcxdjFwcQgIrGCU23XrMCOF8YZRobljIBuF8ZpSY
        9GUxM0zLsQdHoFqWM0rc+PCeHcL5yCgxd9YbsCpeATuJW/Na2UFsFgFViQOn9rFAxAUlTs58
        AmaLCiRJvHlzFaxeWMBT4v2HTrB6ZgFxiVtP5jOB2CICbcwS29/xQcS7GCUaPhuA2GwChhK9
        R/uAbuXg4BSwl3i8wQKiRF5i+9s5YMdJCEzmlJg+bzvUoy4SLze0s0DYwhKvjm9hh7BlJP7v
        hNglIVAvMXnKFTYIu4NR4uteMwjbWmLCphNsILuYBTQl1u/Shwg7Sry/sgssLCHAJ3HjrSDE
        CXwSk7ZNZ4YI80p0tAlBVKtI/F41HWqRlET3k/8sExiVZiGFySwkv89C8swshL0LGFlWMYqn
        lhbnpqcWG+allusVJ+YWl+al6yXn525iBKaw0/+Of9rBOPfVR71DjEwcjIcYJTiYlUR49/dV
        JAnxpiRWVqUW5ccXleakFh9ilOZgURLnTc7ckCgkkJ5YkpqdmlqQWgSTZeLglGpgsjxyLcur
        YuNFLVb3RWyqdzJ1meuilWQW/Tgw39bpcnIPd2uNotn95KuMmrrt/1+eeBN0fJk+n7TbX4+4
        i1f+m0hwlS68Yc/DrBJzd5ax4sqWCZOPvI+cFx62+eJOsZba2iiTeXrmEXdma6hXXl6wm3Nl
        Mzv72kjFU05rP+4X1fo4Y8JhT9a4oPSr39Wcnjodtou6b3eAv/CPkvAFjaakliLNXfnrttQa
        WPPG/gs213r5zfb6x9/TuPzt/n3jXZw71/xlxNssK71ZvXrZv9QuPjv67VL/Jl+N5g4LB5G9
        rD3pr2Mcl384bSRd5HYvPiBgdXvjl7MibQ9EzTrnlS/7u7BltlZNxT+LI0G1TV5KLMUZiYZa
        zEXFiQBs+ExP0AMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xe7o/VlYlGfw7pmLxYN42NovL+7Ut
        rn95zmox/8g5Vou+Fw+ZLfa+3spu8bHnHqvFjPP7mCwunnK1aN17hN3i37WNLBbP+4BCq3b9
        YXTg9Xh/o5XdY+esu+wem1Z1snncubaHzaNvyypGj8+b5ALYovRsivJLS1IVMvKLS2yVog0t
        jPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyGr93MhbsZKyY3dLK3MA4lbGLkZND
        QsBE4tiDI8xdjFwcQgJLGSWmPr3B0sXIAZSQkpjfogRRIyzx51oXG0TNe0aJa9t7WEASvAJ2
        ErfmtbKD2CwCqhIHTu2DigtKnJz5BGyOqECSxJHD/CBhYQFPifcfOsHKmQXEJW49mc8EMlNE
        oINZ4uPMZ2ALmAW6GCU2/n7CBlIlJDCJUeLfM7ChbAKGEr1H+xhBhnIK2Es83mABYjILqEus
        nycEMVNeYvvbOcwTGIVmIbliFpJ1sxA6ZiHpWMDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93
        EyMwYrcd+7l5B+O8Vx/1DjEycTAeYpTgYFYS4d3fV5EkxJuSWFmVWpQfX1Sak1p8iNEUGBIT
        maVEk/OBKSOvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoGJ/aSD
        8tQdd5MOiM/TMrlQZvWriLFTtfnB+5+7C/XfVAnvm3tyajCfU4OBeVPyOpu9G15d9/R6adfw
        MO+WwJsr36w5TyuzvHnItGDWDf2ImiyhxOAZV+5d1/CvNm0M9BMot3hrGPKtTLri3yv3R4vL
        NKycT8pL/9VscOSYbM1qYvmyfhHj4lOT5s5ycY0T9D+zbOnZvZ+D/ip35iysXxArx7Pq82Im
        YfvzZzR5eloK3ub3f/XMWpS8LvFi0ZIE+R63V99ZxL2uTOn3kIw6sJllWiHrTJn/8i4/ONPL
        YiJNxRcWf47IfHb4/tzqft2ju26GP64LW9uY5m7c3FniUij4IOuw0Wy3N+JfHbq2bVZiKc5I
        NNRiLipOBADC94CwYQMAAA==
X-CMS-MailID: 20220510180752eucas1p26e120d9c4026d6a2d7a24744460bea25
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80
References: <CGME20220504075003epcas2p3f6f002e444cab4e39c025b169cba1b80@epcas2p3.samsung.com>
        <20220504075154.58819-1-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04.05.2022 09:51, Chanho Park wrote:
> This patchset adds initial clock driver support for Exynos Auto v9 SoC.

Thanks, I have applied patches 04...09/12.

Regards,
Sylwester
