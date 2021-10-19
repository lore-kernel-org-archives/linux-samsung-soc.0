Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A9EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 089BD6138B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 08:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234275AbhJSINR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 04:13:17 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31584 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234794AbhJSINR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 04:13:17 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211019081103euoutp02ea1676602bc2c80eb0412ddefa2f7c7a~vYEqTQ-my2647926479euoutp02p
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 08:11:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211019081103euoutp02ea1676602bc2c80eb0412ddefa2f7c7a~vYEqTQ-my2647926479euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634631063;
        bh=9apSehRHSRxMK6eRKvWD2KT1MA0v8VITO48RwmDrWm8=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=BRH7LtdgRf1YfQx5n0ubg+EYjMGJ07EVx+Iu2asVEcBRwtuG1UMib1JwB6ollSvqy
         tUvuKitFDRW1i0VUzlX/by16sjXWZtdRieA05cKVS5wNf01KrRerdGlKNaLZizcCrE
         gCfbueJRkIgmdws9+eKuWXP9Xk9Xda5ixk835a7A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211019081102eucas1p1d1adc0a656f95dc55b89059ae641ae63~vYEpnTA3g2592625926eucas1p1P;
        Tue, 19 Oct 2021 08:11:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 93.02.42068.69D7E616; Tue, 19
        Oct 2021 09:11:02 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211019081101eucas1p21212da3edda0c0a6fdc832ae4db001a1~vYEo4nz5R3171431714eucas1p20;
        Tue, 19 Oct 2021 08:11:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211019081101eusmtrp1dbbcb10fd460f7811ce82a145045155e~vYEo3tCCN0963209632eusmtrp1a;
        Tue, 19 Oct 2021 08:11:01 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-4a-616e7d967a4e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.F0.20981.59D7E616; Tue, 19
        Oct 2021 09:11:01 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211019081100eusmtip1326a2b0e4d06f57e8f162be1b0142857~vYEoOA0ry0955409554eusmtip1D;
        Tue, 19 Oct 2021 08:11:00 +0000 (GMT)
Message-ID: <b4f3ca29-2d8f-c117-1ce9-457b3290e109@samsung.com>
Date:   Tue, 19 Oct 2021 10:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: samsung: add IDs for some
 core clocks
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211018125456.8292-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURT1zQydKdr6KDXcoBFtNCiJQF0rCsHEBbdo4gdGE2srI6Cl0A4o
        GveFoIJWjdQWhMZE1EYUCSJClViXtjZa44KVxS0VDYqIghsKUgYjf+eee8479948hpSYAkKZ
        VG0mq9eqNDJBIFV196dnUsF2rSra2ypVPOt8F6DweMppRUfeiwDFSc8NQlF2u5lW9NRfphTW
        mt8onk64Zm6mEyqsBwQJhyutKOFrxejl1KrA2UmsJnUTq4+KWxuY4vp8C2XcQ9nOMiO1C5Wi
        g0jIAJ4KD1uqiIMokJHgcwgK7uWQfNGJoLf5LeVXSfBXBFX5w/85LM4CmhedRfDBVzRQdPTZ
        29v7HSIcB3+cTYQfU3g8vHY6EM8Hgcvk69eMwGooKXxF+3EwToScb0aBH5M4BBp8Jf1eKU4H
        Z20L5Q8gsQnBkzcXSH9DgOWQf+dw36MMI8SxYC5leG8YXG0r6l8BsJeBVz+8BD/2XCjs3E3x
        OBhaHZU0j0eB+3gexRv2IsirbaT5woDgpcMycKZZ0PTgl8CfRuKJcKkmiqfnQPu364SfBiwG
        b1sQP4QYjlUZSZ4WQW6OhFePg26rcWCcUDjk66UMSGYedBbzoPXNg9Yx/8+1IMqKQtgsLi2Z
        5SZr2c2RnCqNy9ImR65LT6tAfb/H3ePorEZnWzsi7YhgkB0BQ8qkIvW8NJVElKTaspXVpyv1
        WRqWs6ORDCULEakrLyglOFmVyW5k2QxW/69LMMLQXcRYLakrVsbEjrkZvUFdeOnNU9kwUZPj
        09jsU+oJybYZp6KiV5S/3ffwu3xPhOC55fH+0fMX6Lo7zgh7YeXFu2Hrh2Z8ic/MP3lCPPuj
        qdkw3VhWtPjL+4WNRw17bX/c9TFU0hKX21m9ynXALa1Z0lS/v8V1P9wXFlmrjQ1ixKeVs2x1
        vbt7xBr9Um71wpmYuxof/sh2beOVKbZ53flx2cs+z6F3jqx7pxzSFuyZduJIuOH3mhelz6iX
        rTt3WNcVd40oPi9clJWou9iQVJfe87hLExMhl3rsRwjLIXtJ4oIn2xxqQfmO1fLTkHpuyozc
        +8erdYbECp03pb6hq3FxbmobYZJRXIpKHkHqOdVf+CtNFqwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7pTa/MSDY4vUbS4/uU5q8X58xvY
        LT723GO1mHF+H5PF2iN32S3+XdvIYrFq1x9GB3aPnbPusntsWtXJ5tG3ZRWjx+dNcgEsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZJz8cZiw4
        xVhxYu10lgbGZYxdjJwcEgImEgtOTGPvYuTiEBJYyihxc2EvkMMBlJCSmN+iBFEjLPHnWhcb
        RM17RolHf16zgyR4Bewk/p64wwRiswioSjw8cZwRIi4ocXLmExYQW1QgSeLjhhnMILawQLjE
        0+2fwWqYBcQlbj2ZD9YrIpAvsWzxVhaQBcwCMxklpl6fDnXRBEaJe18mgW1jEzCU6D3axwhy
        HaeArcSsZRwgJrOAusT6eUIQM+Ultr+dwzyBUWgWkjNmIVk3C6FjFpKOBYwsqxhFUkuLc9Nz
        i430ihNzi0vz0vWS83M3MQLjbNuxn1t2MK589VHvECMTB+MhRgkOZiUR3iTX3EQh3pTEyqrU
        ovz4otKc1OJDjKbAoJjILCWanA+M9LySeEMzA1NDEzNLA1NLM2MlcV6TI2vihQTSE0tSs1NT
        C1KLYPqYODilGpj60/fbRGt9YjacM+1jkE+72/sdypsb5mVwvlpQExj5Ic3E1/hmZJFO2gnN
        qDNnH4Svmhby+7+lFOuP0M7tR18xeIWqTV+4JcvWk1dry56HAjPWX2WId2LoOXb/pcO15683
        tqiW+3p3a08vvlRz8tSq45Hi2m08heqdN499f8DIzqGUt9iq6LJK2gu5w1tFHLatMq0KqnDR
        TSyue2in+n91LZdW0/K+nt0cXAJvj7R23nHpUFxwuybq2r9PGuetTW2CQw8vyH6/QzPkibFe
        y0OtK/HO9cZS05jYik/tnHO8fJbj0kPWMtyTBfmjj6bovQhu29XAKnRMprBWzOL27dp5jmX3
        16mcceC+rmOtq8RSnJFoqMVcVJwIAD0YRpE8AwAA
X-CMS-MailID: 20211019081101eucas1p21212da3edda0c0a6fdc832ae4db001a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8
References: <CGME20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8@eucas1p1.samsung.com>
        <20211018125456.8292-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18.10.2021 14:54, Marek Szyprowski wrote:
> Add IDs for some core clocks referenced during the boot process.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.

