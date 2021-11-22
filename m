Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CC9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 09:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbhKVJ5Z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 04:57:25 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42056 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239150AbhKVJ5Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:57:24 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211122095417euoutp0250281470cb68e33acf97d271a4ba825e~51agYSkkH0087200872euoutp02f
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:54:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211122095417euoutp0250281470cb68e33acf97d271a4ba825e~51agYSkkH0087200872euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637574857;
        bh=68rnbGQJvudgz/GzPbQaVBz3JE4R7GWCtYkfEa5HInc=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=Pl7RA7qLOX11iGZKHgmHipeTLvBILqkbUXNM1pevbHVUaS34hzsyKrxKzwyNlhA9H
         39kdfDeYDoP7TtmwvalEcafbl06pGX5w2SE9mRnIuqf2SMKXi9BUtuZ7KorxkWvOHb
         J8cpYWgR1tjmlbzV4xQVZ5BhTGRPgevWq0z22yjo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122095416eucas1p18d00efb139a37e3e538fc905e374ba92~51af6-nH81249712497eucas1p1p;
        Mon, 22 Nov 2021 09:54:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 82.48.10260.8C86B916; Mon, 22
        Nov 2021 09:54:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211122095416eucas1p2db4e0d5794ca293b6dc082b99e2719e7~51afeISef1298512985eucas1p2D;
        Mon, 22 Nov 2021 09:54:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211122095416eusmtrp1b819f742971f8b85f0735e13126a57a3~51afdJG_k1892418924eusmtrp1R;
        Mon, 22 Nov 2021 09:54:16 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-07-619b68c8468f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F9.8F.09522.8C86B916; Mon, 22
        Nov 2021 09:54:16 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211122095415eusmtip2fdfbbfa831eb6913e22389bbba125790~51aeu1mt20285002850eusmtip2N;
        Mon, 22 Nov 2021 09:54:15 +0000 (GMT)
Message-ID: <a4dd7688-a66f-3fd1-8696-e13b47244f56@samsung.com>
Date:   Mon, 22 Nov 2021 10:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 2/6] clk: samsung: exynos850: Implement CMU_APM domain
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211121232741.6967-3-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7onMmYnGiy8Z2Zx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFFc
        NimpOZllqUX6dglcGS2bupgKHjJXLDjVy97A+Iepi5GTQ0LARGJn517mLkYuDiGBFYwS80/s
        hHK+MErs+XiKHcL5zCjRen8xG0zL1653YO1CAssZJRZ2SUAUfWSUeNvwiAUkwStgJ7Ft/m6w
        BhYBVYkrlw6zQ8QFJU7OfAJWIyqQJHG6dRIziC0s4CWxe8k0sBpmAXGJW0/mM4EMFRFYwSTx
        YPosVhCHWaCPSeLMl/9gq9kEDCV6j/YxgticAvYS2/ruM0F0y0tsfzsH7AkJgdWcEnNnT4R6
        1UVi2tFXLBC2sMSr41vYIWwZidOTe1ggGpoZJXp232aHcCYwStw/voARospa4s65X0APcQCt
        0JRYv0sfIuwocePvdkaQsIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0i8XvVdKhzpCS6n/xn
        mcCoNAspYGYhBcAsJO/MQti7gJFlFaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCiO/3v
        +NcdjCtefdQ7xMjEwXiIUYKDWUmEl2PD9EQh3pTEyqrUovz4otKc1OJDjNIcLErivCJ/GhKF
        BNITS1KzU1MLUotgskwcnFINTIlvhPO+latt5V6TEfdkSdqFvHKGVcoCN1l3sys7KbCfak08
        8mDPGp5FLe8nb/ay5tpUI3lx27yKF8FBb640P2G7q3Tkj/Vz4RrLW9Pi5lru6H9ot2WxyYXd
        m5zLzKL62b+vWuBl/O2Cut0DjROXZum/VVW0a8+4d5nNfI7J3Y37GfgMVSaE/fHPif6xS+7c
        1IQJhoXrrwlzvDdv/a7Wn6YTJn9+v9scywPRkt/V7j1/tWRfl9H5th6Fn9LtG9KvLqtwP1jg
        uaZd5H6a+ZWuIytaCz+cmK2uc3Pmguqyq3N2tO+ozou1XNkxYfXFcweCxSsTV/ybNyd9C3tq
        k9Vr655nt+2uWf+sNjT8ocRjt0SJpTgj0VCLuag4EQC/VU3/4wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xe7onMmYnGtw9L2Fx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFF6
        NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GS2bupgK
        HjJXLDjVy97A+Iepi5GTQ0LAROJr1zswW0hgKaPE9dm5XYwcQHEpifktShAlwhJ/rnWxdTFy
        AZW8Z5RYcmMNO0iCV8BOYtv83WwgNouAqsSVS4eh4oISJ2c+YQGxRQWSJPq/72IGsYUFvCR2
        L5kGVsMsIC5x68l8JpChIgKrmCRePOhjBHGYBSYwSczp3MsIse44o8S6Z1fBzmMTMJToPQpS
        xcnBKWAvsa3vPhPIqcwC6hLr5wlBTJWX2P52DvMERqFZSA6ZhWThLISOWUg6FjCyrGIUSS0t
        zk3PLTbUK07MLS7NS9dLzs/dxAiM6W3Hfm7ewTjv1Ue9Q4xMHIyHGCU4mJVEeDk2TE8U4k1J
        rKxKLcqPLyrNSS0+xGgKDIyJzFKiyfnApJJXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliS
        mp2aWpBaBNPHxMEp1cCU6ndi3onP90WPJQl6n9+4oUBH+dive9fCul7d38dw885dZcXMSwuP
        7vFL3jvlV0TEK/NTmz1/K/ZznlsVWanaF9/cynV/s8S+5i2R4XlpCjmWyY0ibeL+R1de+jcp
        emXcfb/dZ8W9GwRtWhtfnaqU+DlZ99iOpYc+HZ+4+Yj21JhY/ZhzNva+S/JfmR/guOb4YrFZ
        YiH/R2vPQ9qlS3s6HgvJb311Pmuu7+ZrTbHanR9f2e7dsuSU1L1qrutGUYIMKjPVHwg12DoF
        b734KW7HvGN6Ampv3MKiipcHTLttG3vASWSOXHWysciU/mC35mSOf492+e+bt+2evrKYz86p
        q/5aJU798fz7ztcmXFd1lViKMxINtZiLihMBDo5cMHIDAAA=
X-CMS-MailID: 20211122095416eucas1p2db4e0d5794ca293b6dc082b99e2719e7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232752eucas1p12ae842ea868eb7ecfd5f4015000ba15d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232752eucas1p12ae842ea868eb7ecfd5f4015000ba15d
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232752eucas1p12ae842ea868eb7ecfd5f4015000ba15d@eucas1p1.samsung.com>
        <20211121232741.6967-3-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> CMU_APM clock domain provides clocks for APM IP-core (Active Power
> Management). According to Exynos850 TRM, CMU_APM generates I3C, Mailbox,
> Speedy, Timer, WDT, RTC and PMU clocks for BLK_ALIVE.
> 
> This patch adds next clocks:
>   - bus clocks in CMU_TOP needed for CMU_APM
>   - all internal CMU_APM clocks
>   - leaf clocks for I3C, Speedy and RTC IP-cores
>   - bus clocks for CMU_CMGP and CMU_CHUB

Applied, thanks.
