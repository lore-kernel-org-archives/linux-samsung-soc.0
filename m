Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058CBC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 11:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C62B161181
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Apr 2021 11:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDILxt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Apr 2021 07:53:49 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15077 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhDILxt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 07:53:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210409115335euoutp02afeac8356cf22a8602b29af0d32d431b~0Lm3LvEAB2700427004euoutp02c
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Apr 2021 11:53:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210409115335euoutp02afeac8356cf22a8602b29af0d32d431b~0Lm3LvEAB2700427004euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1617969215;
        bh=WUcuHZ6VgPz15F8vE8VEBr1CeshM1mlwFAB6sZmaFgM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=juWhRDhnYiTc5dkzS893uXlZ/VG3Ur5O6LCRvy55K1Mk8VqWjyT/pyjUYiTB/r8f/
         mXO4CK9P+lhs3K82WUsHAWM5P3uaTN0KwoxE1WXaP+0JB7jPpPO8DEvIkJ1o4SVVHB
         YQ4PJWblVGLMODWHtYvG4UlhQsxMvrnwthKw2cFo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210409115334eucas1p1cab831eeda01b939122711919021c3d3~0Lm2y-jGl1681016810eucas1p1q;
        Fri,  9 Apr 2021 11:53:34 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 01.F0.09444.E3040706; Fri,  9
        Apr 2021 12:53:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210409115334eucas1p1165144f4f072a2f330ccb5c79618f266~0Lm2VWIoK1681016810eucas1p1p;
        Fri,  9 Apr 2021 11:53:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210409115334eusmtrp2d1e66dc2f03c723925a25a823bdffc22~0Lm2Ua8id2860828608eusmtrp2L;
        Fri,  9 Apr 2021 11:53:34 +0000 (GMT)
X-AuditID: cbfec7f4-dbdff700000024e4-e3-6070403ec059
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.37.08696.E3040706; Fri,  9
        Apr 2021 12:53:34 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210409115333eusmtip1777579c808c2a456ee4e8787d91e1a90~0Lm1tVGy80348403484eusmtip1G;
        Fri,  9 Apr 2021 11:53:33 +0000 (GMT)
Subject: Re: [PATCH] pinctrl: samsung: use 'int' for register masks in
 Exynos
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <3b8d0145-bf01-9ec0-acb3-54081fb57d7f@samsung.com>
Date:   Fri, 9 Apr 2021 13:53:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djPc7p2DgUJBvc26FlsnLGe1WLj2x9M
        FlP+LGey2PT4GqvF5vl/GC0u75rDZjHj/D4mi7VH7rJbrNr1h9GB02NWQy+bx85Zd9k97lzb
        w+axeUm9R9+WVYwenzfJBbBFcdmkpOZklqUW6dslcGVsnnGCreAMe8XDvVsYGxinsHUxcnJI
        CJhI/J63iamLkYtDSGAFo8S/5RtYIJwvjBLf3vczQjifGSUOTmkHKuMAa+mYaQjSLSSwnFHi
        x1YjiJqPjBILZ95lBEkIC/hLPHq7nhUkISJwiFHi8JFedhCHWWAHo8SzjRPAqtgEDCV6j/aB
        2bwCdhKHv89iBtnAIqAi0bgE7D5RgSSJpY/+QZUISpyc+YQFxOYUcJd4dXgiK4jNLCAucevJ
        fCYIW15i+9s5zCC7JAR+cEj83HOAGeJRF4k3f7eyQNjCEq+Ob2GHsGUk/u+czwTR0Mwo0bP7
        NjuEM4FR4v7xBYwQVdYSd879YgO5jllAU2L9Ln2IsKNE26seNkiw8EnceCsIcQSfxKRt05kh
        wrwSHW1CENUqEr9XTWeCsKUkup/8Z5nAqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyU
        l1quV5yYW1yal66XnJ+7iRGYoE7/O/5lB+PyVx/1DjEycTACQ5+DWUmEt7k5P0GINyWxsiq1
        KD++qDQntfgQozQHi5I4b9KWNfFCAumJJanZqakFqUUwWSYOTqkGphVzL/Dpi6841r70tPzW
        zJaGENuphcobpUWid+kt+lH6a7X+tBjp7QHv0j/tWLp9Z3qC2bt370VZF7Qft7GWEDQ0/RFy
        7ULapHiXDSWq8+W7DszQ+zfX+rn9gW3zauoyo4qrE7Of38wTSvDc9vPHZrVlhj2G/IKlzzdG
        Kq8tVg668vrQo6SzIQuCW+K2lopuWRbnenrmG6+Uonv5iWkqMeGmzXzaDNnvm+s1vofEWp+7
        1mbVcLNOyk2iPzy5t1B8YceTY9GCF68vCy71vmanuPqg8i/Zbby8UVxHjloxWxTNL136QueN
        vhfL9TetEetmrHscb893eWvM/B23nnJ+uR0imLhhG0tieoxM54QOJZbijERDLeai4kQAAzQc
        D78DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsVy+t/xu7p2DgUJBldO81tsnLGe1WLj2x9M
        FlP+LGey2PT4GqvF5vl/GC0u75rDZjHj/D4mi7VH7rJbrNr1h9GB02NWQy+bx85Zd9k97lzb
        w+axeUm9R9+WVYwenzfJBbBF6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp
        29mkpOZklqUW6dsl6GVsnnGCreAMe8XDvVsYGxinsHUxcnBICJhIdMw07GLk4hASWMoo8etP
        FytEXEpifotSFyMnkCks8edaFxtEzXtGiTtTnoP1Cgv4SjzYlAUSFxE4xChxZdNLdhCHWWAH
        o8SX1buYQbqFBGYxSiz8Eg9iswkYSvQe7WMEsXkF7CQOf5/FDDKIRUBFonEJG0hYVCBJom33
        THaIEkGJkzOfsIDYnALuEq8OT2QFsZkF1CX+zLvEDGGLS9x6Mp8JwpaX2P52DvMERqFZSNpn
        IWmZhaRlFpKWBYwsqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQKjcduxn1t2MK589VHvECMT
        ByPQrxzMSiK8zc35CUK8KYmVValF+fFFpTmpxYcYTYHemcgsJZqcD0wHeSXxhmYGpoYmZpYG
        ppZmxkrivCZH1sQLCaQnlqRmp6YWpBbB9DFxcEo1MGXPT+SfIDjh38LkiVKXl7BMXeTS0G6Q
        cbk5KsRVuPZrhWB+1E/JS1axlavEVy9/22WtKlk3/56lyVPbyH/np9is3xEft9V7TbGWmsIe
        fwFPpm/z/ta0yUUcv3br98mUFovDGrcmBz87q99S8O/24gRXiQk5as/0PN8/9XoSfVTyxtv1
        Esyeasfcr3My+0/7OO3X0jNnr7yWOLL78nymI9MSOXmuaMjdd03gcf04UUuCaZ1N7vabWstv
        uC07/zUl4vTFD9cqNJe+l1ywJXlPp+Ue5f3t7MfsNXbtntF72DWfVyKHfZ3c6XUHV4WG/62X
        2e3CU39Q3ezjny23VIMv3tFaHqVV4uMvkLSvvoSth0uJpTgj0VCLuag4EQAxOOYBTwMAAA==
X-CMS-MailID: 20210409115334eucas1p1165144f4f072a2f330ccb5c79618f266
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210408195041eucas1p1b63616039af4e1156aa4cfd8101b1362
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210408195041eucas1p1b63616039af4e1156aa4cfd8101b1362
References: <CGME20210408195041eucas1p1b63616039af4e1156aa4cfd8101b1362@eucas1p1.samsung.com>
        <20210408195029.69974-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08.04.2021 21:50, Krzysztof Kozlowski wrote:
> The Special Function Registers on all Exynos SoC, including ARM64, are
> 32-bit wide, so entire driver uses matching functions like readl() or
> writel().  On 64-bit ARM using unsigned long for register masks:
> 1. makes little sense as immediately after bitwise operation it will be
>    cast to 32-bit value when calling writel(),
> 2. is actually error-prone because it might promote other operands to
>    64-bit.
> 
> Addresses-Coverity: Unintentional integer overflow
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> 
> Not tested on ARM64.

I have tested it on exynos5433/tm2e and didn't notice any issues
as we could expect. 
The patch looks good to me, however I would personally use u32
rather than "unsigned int", like in other places for the register
value variables.

--
Regards, 
Sylwester
