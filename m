Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7733C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 09:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239204AbhKVJ5q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 04:57:46 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53531 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239200AbhKVJ5q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 04:57:46 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211122095439euoutp01b65e87657011f9ea6445aef3d8814bc0~51a0uoBbU2170221702euoutp01H
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 09:54:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211122095439euoutp01b65e87657011f9ea6445aef3d8814bc0~51a0uoBbU2170221702euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637574879;
        bh=MRPGcvLQlo8KtyewSfkdbMJy1scWhdHHOm6M3SxEdko=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=aT1KVBlVjJF/cEO8YV2kMRX/jV5wZvbdMiD488JdK80pv5sWaC0F1/9Zq7oLo+Dtn
         GGH4wAMZJbdSN9gVWNWgofpeacrCb2BcnrjhlMn+d1m7GBGdI63x+l/eRUEf3x9qer
         2NYXiD9B1OzSzu8/pqMOH6JJPrpFC8YJZMj2mm0c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122095438eucas1p100a2e90cde9899b18c8873f040e6d556~51a0Wi2NW1463414634eucas1p1v;
        Mon, 22 Nov 2021 09:54:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 29.16.09887.ED86B916; Mon, 22
        Nov 2021 09:54:38 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211122095438eucas1p202403e849791a578b9b04303fbf7c8c1~51az0tebc1626616266eucas1p2Y;
        Mon, 22 Nov 2021 09:54:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211122095438eusmtrp1ac06a4576ea99d00ebb4ddfd79666b11~51azyum1m2007420074eusmtrp1w;
        Mon, 22 Nov 2021 09:54:38 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-48-619b68de4cde
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id ED.9F.09522.ED86B916; Mon, 22
        Nov 2021 09:54:38 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211122095437eusmtip2a490d540b87f41ca18df9c6398e56eb0~51azIjE760164001640eusmtip2m;
        Mon, 22 Nov 2021 09:54:37 +0000 (GMT)
Message-ID: <10138d79-bb29-3609-3fb2-890cf2f9328f@samsung.com>
Date:   Mon, 22 Nov 2021 10:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 3/6] dt-bindings: clock: Add bindings for Exynos850
 CMU_CMGP
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
In-Reply-To: <20211121232741.6967-4-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87r3MmYnGizp1LO4/uU5q8X8I+dY
        LTa+/cFksenxNVaLjz33WC0u75rDZjHj/D4mi4unXC1+HO9jtmjde4Td4t+1jSwWz/uA4qt2
        /WG0OP7+MaMDn8f7G63sHrMaetk8ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkAjigu
        m5TUnMyy1CJ9uwSujHdP3rEUHGeuuPJzDWsD43+mLkZODgkBE4nnm2YwdjFycQgJrGCU+Ljm
        DwuE84VR4s6yU8wQzmdGiY0bTjDCtJxqOMgCYgsJLGeUePBEAaLoI6PE7re9bCAJXgE7iVtX
        W8CKWARUJXpXbGOBiAtKnJz5BMwWFUiSON06iRnEFhYIkpg09xE7iM0sIC5x68l8JpChIgIr
        mCQeTJ/FCuIwC/QxSZz5AnE5m4ChRO/RPrCTOAXsJSa3L2eF6JaX2P52DtjdEgKrOSXm/HnL
        DHG3i8SL89/ZIGxhiVfHt7BD2DISpyf3sEA0NDNK9Oy+zQ7hTGCUuH98AdTX1hJ3zv0C6uYA
        WqEpsX6XPkTYUeJRw0MmkLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtIvF71XRoyEtJdD/5
        zzKBUWkWUsDMQgqAWUjemYWwdwEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzARHf6
        3/EvOxiXv/qod4iRiYPxEKMEB7OSCC/HhumJQrwpiZVVqUX58UWlOanFhxilOViUxHlF/jQk
        CgmkJ5akZqemFqQWwWSZODilGpjSG67zLxDdmqpoyLdGW5vnYc+OBK0wv16NJ8b31tuXrLqi
        o9quaXXrZ6LrvBMvHi9KtdGd8OrI4xgL1YZVB+a1Vt1UmuSXF5Oym/9Hnu/xzFfGR9Ls/ty7
        +LDIrmiX2rol+z99Cd6QOju69vgT48lT0lKiZix/W/8tP/7iofbAN3uEYz1e70ieU+QYW9d9
        T239/ujNE0SKWE8wJOYpmPOK+jDw1uUulXSSurPvSoGF5a6n/t9NHG2q/LvPuttXGle9WrRf
        Zrrk/dVSEgk7rN/yGD6v8G58Z5Hi7Lbrt42W1+vAV0t6Xn5ftmStwLWM4IW+k/2dP2v9uOxb
        ci+ly3B3Vvwk1qxrMrzWXX4X4pRYijMSDbWYi4oTASUxwQPjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsVy+t/xe7r3MmYnGvzo4rW4/uU5q8X8I+dY
        LTa+/cFksenxNVaLjz33WC0u75rDZjHj/D4mi4unXC1+HO9jtmjde4Td4t+1jSwWz/uA4qt2
        /WG0OP7+MaMDn8f7G63sHrMaetk8ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkAjig9
        m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jHdP3rEU
        HGeuuPJzDWsD43+mLkZODgkBE4lTDQdZuhi5OIQEljJK9JzcBZTgAEpIScxvUYKoEZb4c62L
        DaLmPaPEl57HbCAJXgE7iVtXW1hAbBYBVYneFdtYIOKCEidnPgGzRQWSJPq/72IGsYUFgiQm
        zX3EDmIzC4hL3HoynwlkqIjAKiaJFw/6GEEcZoEJTBJzOvcyQqw7zijRuuc02Cg2AUOJ3qMg
        VZwcnAL2EpPbl7OCnMosoC6xfp4QxFR5ie1v5zBPYBSaheSQWUgWzkLomIWkYwEjyypGkdTS
        4tz03GJDveLE3OLSvHS95PzcTYzAqN527OfmHYzzXn3UO8TIxMF4iFGCg1lJhJdjw/REId6U
        xMqq1KL8+KLSnNTiQ4ymwMCYyCwlmpwPTCt5JfGGZgamhiZmlgamlmbGSuK8ngUdiUIC6Ykl
        qdmpqQWpRTB9TBycUg1Maf7iE7VeZKwrfb8xPKJ4n/2kyW0S/r6iLY4iNxmPJ9muOTKl3kZj
        2+OtNfWPO6Zwm7mVnTtmaV+mpmVrl205bcnPj3NU6iJ2dVs4tdtfPbPyptlqxmf7f8XfO/s5
        +WTnbaWd6jte3E6S3PotNPXrjnd2mr/5JlpzONmtjXZiOSz47i9TQNGT+uTw95uFZ84tcsxf
        fD9GaNEtjom5E6zNzv0+duyyzJ6Kg8tKJyyfcEDt+gLn1RvfcqusO7uVszB7QtfF61ozVxeu
        NT7z/zXju4KDOW7S6X/sjd/8itXYKeCfe+lR+sywKxLTz5xWnlXZ8PuKSRpzsp3V5IWpoprs
        Jcfne/OeTV2ieTN2pUTGKyWW4oxEQy3mouJEALnBFCxzAwAA
X-CMS-MailID: 20211122095438eucas1p202403e849791a578b9b04303fbf7c8c1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232752eucas1p1d1402531905dc7e3b1c88818638e61a8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232752eucas1p1d1402531905dc7e3b1c88818638e61a8
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232752eucas1p1d1402531905dc7e3b1c88818638e61a8@eucas1p1.samsung.com>
        <20211121232741.6967-4-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> CMU_CMGP generates USI and ADC clocks for BLK_ALIVE. In particular USI
> clocks are needed for HSI2C_3 and HSI2C_4 instances.
> 
> Add clock indices and bindings documentation for CMU_CMGP domain.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied, thanks.

