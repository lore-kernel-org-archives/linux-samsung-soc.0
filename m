Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:42:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78E4260EB4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhJKKoh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Oct 2021 06:44:37 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40749 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235898AbhJKKoh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 06:44:37 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211011104235euoutp02a4220fbf2d08904bfccde13ae8d9b183~s8_sJK89K0399203992euoutp02U
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Oct 2021 10:42:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211011104235euoutp02a4220fbf2d08904bfccde13ae8d9b183~s8_sJK89K0399203992euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1633948955;
        bh=J7KKnes26YKxIl1DF2YVzhIQDaDB0Ll/DkSnNhmb6nE=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=VB1KyPAFXLcpLgret3VOdriLVw0E21HB2EHlzWSHrB9ZlNQjAicxbq4YdO3LrrKg9
         XNz8UHQN+0aTwL9n864nJZZyb8F4wicTzHkm9oUIb/M33uZ2BGmwqeLquWFx7j0DKM
         DtIGdQygAIi1xTTTKwAsAZaF7g1FbrWm8L5cbxeo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211011104234eucas1p29558b59d525671a011b8c649a0ee99fa~s8_rV19PK0084000840eucas1p2g;
        Mon, 11 Oct 2021 10:42:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AD.A5.45756.A1514616; Mon, 11
        Oct 2021 11:42:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211011104234eucas1p1d6d2a7246b6222f7d293801ec36ec53a~s8_q3TiNE0393503935eucas1p1B;
        Mon, 11 Oct 2021 10:42:34 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211011104234eusmtrp2045ea1f87c4380f870da5406767f96cf~s8_q2YQDl0845608456eusmtrp2d;
        Mon, 11 Oct 2021 10:42:34 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-7f-6164151aa49e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.B1.31287.91514616; Mon, 11
        Oct 2021 11:42:34 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211011104231eusmtip21a6d4a61b1811676394c07ee993920e4~s8_oFAkUI2795627956eusmtip2E;
        Mon, 11 Oct 2021 10:42:31 +0000 (GMT)
Message-ID: <ef781890-76ca-3392-9a17-3856fa1834cf@samsung.com>
Date:   Mon, 11 Oct 2021 12:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Document Exynos850 CMU
 bindings
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <CAPLW+4kJK=kaiCLDXX1EGLhbKJo5pcHQY9QCj0SVyGQP1n7q0g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djP87pSoimJBr2L1Sw+rFjEaHH9y3NW
        i/lHzrFanPmta7Hx7Q8mi02Pr7FafOy5x2pxedccNosZ5/cxWVw85Wrx43gfs0Xr3iPsFlN/
        3GKz+HdtI4vF8z6gZPvTl8wWp+5+Zre4cqaDyWLVrj+MDsIe72+0snvMauhl89g56y67x6ZV
        nWwed67tYfPYvKTeo2/LKkaPz5vkAjiiuGxSUnMyy1KL9O0SuDJ2X37MXvBUsOLk1E72Bsa9
        fF2MHBwSAiYSy24YdDFycQgJrGCUeNK2nBHC+cIo8fRjH1sXIyeQ85lR4s5GQ5iGN6uCIGqW
        M0qs2T8JquEjo8T3E2fZQRp4BewkbjW/ZAGxWQRUJc7f2MgCEReUODnzCZgtKpAkMX/2A3aQ
        ocICgRLLZ6uChJkFxCVuPZnPBGKLCOhJrJv5ih0ivpFN4tJySxCbTcBQovdoHyOIzQnUOv3Q
        DUaIGnmJ7W/nMIPcIyFwilNi+9OLYIMkBFwkHv7+BmULS7w6voUdwpaR+L8TZBlIQzOjRM/u
        2+wQzgRGifvHFzBCVFlL3Dn3iw3kUmYBTYn1u/QhIeEoMWNPAoTJJ3HjrSDEDXwSk7ZNZ4YI
        80p0tAlBzFCR+L1qOtQFUhLdT/6zTGBUmoUUKLOQfD8LyTezENYuYGRZxSieWlqcm55abJiX
        Wq5XnJhbXJqXrpecn7uJEZgMT/87/mkH49xXH/UOMTJxMB5ilOBgVhLhfcuRkijEm5JYWZVa
        lB9fVJqTWnyIUZqDRUmcd9XsNfFCAumJJanZqakFqUUwWSYOTqkGpoTJ7tu0XXSbu+/5NVy6
        K8y14l7FlQf9zmJyVnqyjqnmBzfOZSv8eG5q+8eIifGzXiuufBQo5/9S0/HoYQPD9uqDtTtW
        H6k8s+hwaH1P1Ls5M9aeU+I5Wl928fp6cUbmGTyKfKuX3pQt2flhqiD72dfr43blumaH7ynq
        YJosvKho6/aurvWHLvi+za+5fOiCZWiQ54/L3quu3r7vm56puOVr9HSNksBtt7/NeLz7wSdO
        FstJbwt0F09SfH/gRtoO17mJU3J8j6bfuKskdHuffELS+9Wr+q/7csy0/zV1dzE3U9HXQsEF
        EjI7d5cGKu7+yPJPiKt8z7cvvUcPfDl47I7BbO+9E8Kl/7fefBHbsdRdiaU4I9FQi7moOBEA
        KUv2wPUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xe7pSoimJBvc2M1l8WLGI0eL6l+es
        FvOPnGO1OPNb12Lj2x9MFpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytXix/E+ZovWvUfYLab+
        uMVm8e/aRhaL531AyfanL5ktTt39zG5x5UwHk8WqXX8YHYQ93t9oZfeY1dDL5rFz1l12j02r
        Otk87lzbw+axeUm9R9+WVYwenzfJBXBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqb
        x1oZmSrp29mkpOZklqUW6dsl6GXsvvyYveCpYMXJqZ3sDYx7+boYOTgkBEwk3qwK6mLk4hAS
        WMoo8XnXazaIuJTE/BalLkZOIFNY4s+1LjaImveMEpdblzCDJHgF7CRuNb9kAbFZBFQlzt/Y
        yAIRF5Q4OfMJmC0qkCTxccMMZpCZwgKBEstnq4KEmQXEJW49mc8EYosI6Emsm/mKHWQ+s8Bm
        NomrPa+glh1hkrj/8QzYMjYBQ4neo32MIDYn0KDph24wggxlFlCXWD9PCGKovMT2t3OYJzAK
        zUJyxiwk+2YhdMxC0rGAkWUVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYPxvO/Zz8w7Gea8+
        6h1iZOJgPMQowcGsJML7liMlUYg3JbGyKrUoP76oNCe1+BCjKTAoJjJLiSbnAxNQXkm8oZmB
        qaGJmaWBqaWZsZI479a5a+KFBNITS1KzU1MLUotg+pg4OKUamKrm7405cscidWKUp9aB52Y3
        LXq3PV3h5xzm0B6xQLhdNnfK/NUCpY/43z+M2ve8O8Svpbqm1Fw227j5ra78B17fVqPMiW+z
        Qs0KNQzve2gLVrVePJ0Z07w2aNFVkYndUXsTcy/0qYYaP96WsP/SnIOPxBbNXqckqu4U42Rj
        J3Nu+2IJB23eN9YcbXfmCazR8fm6050/WtMybDfv6a6ak30JT5J3v1ksu9Lw4LcNGR+bqjm+
        rFxSn2flUtpx64DkhJ08x34c2cra7lFW15mY6JNZMn+Px4c9O8+fL5X/6mrXb7vz1e+Uit11
        NzLFRJM21M5+f/3v3eDM7bEz1ohHW0xgXnrP5a4no0Xfct6fSizFGYmGWsxFxYkA0eX15ogD
        AAA=
X-CMS-MailID: 20211011104234eucas1p1d6d2a7246b6222f7d293801ec36ec53a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211011101326eucas1p17e6deeaa2449bf3f0d6306fb930cce17
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211011101326eucas1p17e6deeaa2449bf3f0d6306fb930cce17
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
        <20211008154352.19519-5-semen.protsenko@linaro.org>
        <7049b3a9-dc8f-2ae9-01e6-eb3b6f461400@kernel.org>
        <CGME20211011101326eucas1p17e6deeaa2449bf3f0d6306fb930cce17@eucas1p1.samsung.com>
        <CAPLW+4kJK=kaiCLDXX1EGLhbKJo5pcHQY9QCj0SVyGQP1n7q0g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11.10.2021 12:13, Sam Protsenko wrote:
> On Sat, 9 Oct 2021 at 23:41, Sylwester Nawrocki <snawrocki@kernel.org> wrote:
>>
>> On 08.10.2021 17:43, Sam Protsenko wrote:
>>> Provide dt-schema documentation for Exynos850 SoC clock controller.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
[...]
>>> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
>>> @@ -0,0 +1,185 @@
[...]
>>> +
>>> +title: Samsung Exynos850 SoC clock controller
>>> +
>>> +maintainers:
>>> +  - Sam Protsenko <semen.protsenko@linaro.org>
>>> +  - Chanwoo Choi <cw00.choi@samsung.com>
>>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
>>> +  - Tomasz Figa <tomasz.figa@gmail.com>
>>> +
>>> +description: |
>>> +  Exynos850 clock controller is comprised of several CMU units, generating
>>> +  clocks for different domains. Those CMU units are modeled as separate device
>>> +  tree nodes, and might depend on each other. Root clocks in that clock tree are
>>> +  two external clocks:: OSCCLK (26 MHz) and RTCCLK (32768 Hz). Those external
>>> +  clocks must be defined as fixed-rate clocks in dts.
>>> +
>>> +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
>>> +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
>>> +
>>> +  Each clock is assigned an identifier and client nodes can use this identifier
>>> +  to specify the clock which they consume. All clocks that available for usage
>>
>> s/All clocks that available/All clocks available ?
>> No need to resend, I can amend it when applying.
>>
> 
> Yeah, not a native speaker, I tend to do such mistakes sometimes :)
> Please fix when applying.
> 
> Btw, I can see that you already applied 3 out of 5 patches from this
> patch series here: [1]. Can you please also apply the rest, or is
> there any outstanding comments that I missed?

The patches look good to me, I just wanted to allow some for Rob to have
a look and provide an Ack.

Regards,
-- 
Sylwester Nawrocki
Samsung R&D Institute Poland
