Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD516C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 15:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351971AbiEDPPk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 11:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351829AbiEDPPj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 11:15:39 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E0B3EBAD
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 08:12:02 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220504151159euoutp01daee6edb639c5ce2449165c4afb6ec71~r75bJZswi0958709587euoutp013
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 15:11:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220504151159euoutp01daee6edb639c5ce2449165c4afb6ec71~r75bJZswi0958709587euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651677119;
        bh=WZmdiOz6cyOlp8fR9Cd7zaPBMN021SRIXeNQW5M5fxg=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=efQWmMNy5eACb4UddIjXLJYCNPDBYGWfXHObw48VfJZKTYdVO75g+31Vo8bedrha3
         +r2msXZ7OsVttUwK1RyZSQEU8/V7mtvwwy1hloEX1tOCpe08FgvafvjWKCHGtETg2u
         /M3eJ+0qQzAyeuEkrkJCBFDRKO06dID6vEE7FSlg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220504151158eucas1p1a9a0efcac45743ff0286366d5eaadca9~r75avAliW0467604676eucas1p1A;
        Wed,  4 May 2022 15:11:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 2B.76.10260.EB792726; Wed,  4
        May 2022 16:11:58 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220504151158eucas1p196f4dfb465303df21957418819173512~r75aNOfyz1915819158eucas1p1s;
        Wed,  4 May 2022 15:11:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220504151158eusmtrp105e6fe5961d8c3f4e4551d23bf2f3ad8~r75aMKmo62594725947eusmtrp1e;
        Wed,  4 May 2022 15:11:58 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-29-627297be5c9b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 21.98.09522.EB792726; Wed,  4
        May 2022 16:11:58 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220504151157eusmtip1b8537a5ae700fe9e7ee941d792e0f190~r75ZgnjtN1845318453eusmtip1Q;
        Wed,  4 May 2022 15:11:57 +0000 (GMT)
Message-ID: <9d3c838c-4cc1-dfc0-4d3d-2387a3f33828@samsung.com>
Date:   Wed, 4 May 2022 17:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: add clock binding
 definitions for Exynos Auto v9
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <4f6bfca2-4591-af7c-4a65-f8b0b59d8076@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djPc7r7phclGVx/oGXxYN42NovL+7Ut
        rn95zmox/8g5Vou+Fw+ZLfa+3spu8bHnHqvFjPP7mCwunnK1aN17hN3i37WNLBbP+4BCq3b9
        YXTg9Xh/o5XdY+esu+wem1Z1snncubaHzaNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyrnYn
        FzxkrZh1eiNbA+Npli5GTg4JAROJ+UdmAdlcHEICKxglXq/cwQjhfGGU+N02nR3C+cwoMX3i
        WyaYliNLuqFaljNKHPnYCVX1kVFi9/RrYIN5Bewkls/+D2azCKhILF03nQkiLihxcuYTsLio
        QJLEr6tzGEFsYYEUiaN7noDVMAuIS9x6Mh/MFhEolujeeJgJZAGzwFxmiafb/oEl2AQMJXqP
        9oE1cwIt65jXB9UsL7H97RxmkAYJgXZOiXsvvjFC3O0iserQf2YIW1ji1fEt7BC2jMTpyT3Q
        4KiXmDzlChuE3cEo8XWvGYRtLTFh0wmgOAfQAk2J9bv0IcKOElcnz2UHCUsI8EnceCsIcQKf
        xKRt05khwrwSHW1CENUqEr9XTYcGopRE95P/LBMYlWYhhcosJN/PQvLMLIS9CxhZVjGKp5YW
        56anFhvnpZbrFSfmFpfmpesl5+duYgQmsdP/jn/dwbji1Ue9Q4xMHIyHGCU4mJVEeJ2XFiQJ
        8aYkVlalFuXHF5XmpBYfYpTmYFES503O3JAoJJCeWJKanZpakFoEk2Xi4JRqYEoxWKS2dMrX
        bbxhV71lCkL5Fk3d7b9bVHyqXt7FsJ3P1yz5ljihpPfhskWGT7boGP9NdPu99qxC8AJL60fr
        lFykGr8tDrxeN2fWqfvLotZcsFObZzj5d2JL7N4FvC5/XmlOP3dI+SBLCFfJwcY3RRL7a6ym
        RxW+FJmld1ZNxu/vj/fMmU89puxibo7xmZI5ZRVX+L/rlZU69z8lvJlRcnh/4aq/QkYXrLf3
        Tu5wMFM+v/uS9tpd86QS77FvK9jxfa6czJlP5xf1Bv5aLXVwl41neeayTykCD1iDrhUcn6do
        dGLu6l0zxeJ3P5p8dOKrc+012+z1Exd5Fxtn8UW0SfHGmovkd5Sc3rTn1VqWqQV9SizFGYmG
        WsxFxYkA/rLpw9EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7r7phclGfy7wW7xYN42NovL+7Ut
        rn95zmox/8g5Vou+Fw+ZLfa+3spu8bHnHqvFjPP7mCwunnK1aN17hN3i37WNLBbP+4BCq3b9
        YXTg9Xh/o5XdY+esu+wem1Z1snncubaHzaNvyypGj8+b5ALYovRsivJLS1IVMvKLS2yVog0t
        jPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyrnYnFzxkrZh1eiNbA+Npli5GTg4J
        AROJI0u6wWwhgaWMElOblboYOYDiUhLzW5QgSoQl/lzrYoMoec8o8XMWWDmvgJ3E8tn/wWwW
        ARWJpeumM0HEBSVOznwCFhcVSJLYc78RLC4skCJxdM8TMJtZQFzi1pP5YLaIQLHEoW0NzF2M
        XEDx+cwSp5u6mSCW/WaUuPSgBMRmEzCU6D3axwhicwIt7pjXxwRyJ7OAusT6eUIQM+Ultr+d
        wzyBUWgWkjNmIVk3C6FjFpKOBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQKjdduxn5t3
        MM579VHvECMTB+MhRgkOZiURXuelBUlCvCmJlVWpRfnxRaU5qcWHGE2BQTGRWUo0OR+YLvJK
        4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpiW7E9///QYx7o3tY7N
        fpbB3c/fN+lJ7Fvw6VPc0Z07mE+0sbF8PMIsr7jCvWTKm+MBK9e/K9uUk6jMZO4cP2O/xHyd
        p+pHnmTPj7/0frnVxh96Eme9yzUu3dmyZIPspRduO1/bXuFTZ9l5/rxT5M5a46veanJG6tt/
        2QnvvnFVeafbx8k8VawNAcfCFrmfO9cTfuPOPZtd3ytfbtnkF33iUcaOzp92GqWf2zyTGpde
        MZq0PmVV1blznRKdp7lu/RUOcr28QDXEnotPyGx/jKyvqHCQxmNOuztPpJ+u5XtnXHY/YM3+
        Oo3ls3v+TrysIscy0ef4s6XGIS6Zv/lnvq5QTW1bFyTLc3B+7lTlPHkPJZbijERDLeai4kQA
        r5wvrl8DAAA=
X-CMS-MailID: 20220504151158eucas1p196f4dfb465303df21957418819173512
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d
References: <20220504075154.58819-1-chanho61.park@samsung.com>
        <CGME20220504075003epcas2p3708d1853dae290bc42cfacd318767c8d@epcas2p3.samsung.com>
        <20220504075154.58819-2-chanho61.park@samsung.com>
        <4f6bfca2-4591-af7c-4a65-f8b0b59d8076@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 04.05.2022 16:36, Krzysztof Kozlowski wrote:
> On 04/05/2022 09:51, Chanho Park wrote:
>> Add device tree clock binding definitions for below CMU blocks.
>>
>> - CMU_TOP
>> - CMU_BUSMC
>> - CMU_CORE
>> - CMU_FYS2
>> - CMU_PERIC0 / C1
>> - CMU_PERIS
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>> ---
>>  .../dt-bindings/clock/samsung,exynosautov9.h  | 299 ++++++++++++++++++
> 
> Hi Sylwester,
> 
> If I am to apply the DTS, which uses this header, I would need to take
> it via my tree and send you a pull request with it.

Let's do it that way, please provide a pull request with the header.


Regards,
Sylwester
