Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0388DC43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 23:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FBF420936
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 23:23:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cyrJz8tQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgIOXXc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 19:23:32 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41763 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbgIOOiB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 10:38:01 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200915132047euoutp02f93b35b0a706eb6fa1f09f1af5383e2f~096MNgNZX0422904229euoutp023
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 13:20:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200915132047euoutp02f93b35b0a706eb6fa1f09f1af5383e2f~096MNgNZX0422904229euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600176047;
        bh=V9AlOqxPwxY4S8d5Y22eljC6V4KHy1iNU+4AudaT48I=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cyrJz8tQzjV1YPw4JbjZHF1e9aBf8jKSKPCM+fR59+LY9F3/sF7pMfhvyI+BTWuDq
         H1eYNj3TTddJGXhQLXgj7X8liBY/d5VAODRQ9h5WEZXsaUayFX+RWgNn/X3i9UKpaT
         oliJ+LLruIsZUWjysocwjpqqnUdya8JBDGIQ33sU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200915132046eucas1p19a2165a26efea41ac355ac5055fd3873~096LruAGl0923209232eucas1p14;
        Tue, 15 Sep 2020 13:20:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 72.C3.06456.EAFB06F5; Tue, 15
        Sep 2020 14:20:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915132046eucas1p217e810858d346fb491b2498343dfc622~096LSULhJ0258102581eucas1p2F;
        Tue, 15 Sep 2020 13:20:46 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200915132046eusmtrp258f6d267df6a5c9ea4f34a0b515b7496~096LRfueX1190311903eusmtrp2e;
        Tue, 15 Sep 2020 13:20:46 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-c9-5f60bfae1cb3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1D.BD.06017.EAFB06F5; Tue, 15
        Sep 2020 14:20:46 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200915132044eusmtip1973441b492f8735e7726439bc55811c8~096J8yndw1171511715eusmtip1Y;
        Tue, 15 Sep 2020 13:20:44 +0000 (GMT)
Subject: Re: [PATCH 2/3] clk: samsung: exynos5420/5250: Add IDs to the CPU
 parent clk definitions
To:     linux-clk@vger.kernel.org
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        m.szyprowski@samsung.com, b.zolnierkie@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <944913e7-be99-ff11-615f-4613f19c5973@samsung.com>
Date:   Tue, 15 Sep 2020 15:20:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826171529.23618-2-s.nawrocki@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djP87rr9ifEG7Qe1LDYOGM9q8X1L89Z
        LeYfOcdq0f/4NbPF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Sx9shddouLp1wtWvceYbf4
        d20ji8WqXX8YHfg83t9oZffYOesuu8emVZ1sHpuX1Hv0bVnF6PF5k1wAWxSXTUpqTmZZapG+
        XQJXRtPrg8wFv5kqfm9dxt7AuJ2pi5GTQ0LAROLMrLVsXYxcHEICKxgl9p7YBuV8YZQ4OrWJ
        BcL5DORsPs0C07Jn+nZGiMRyRomF7begqj4CObdXMoNUCQskS0zoew22RERAVuLWsZ9gc5kF
        jjFL3F25ECzBJmAo0Xu0jxHE5hWwk2g48g6smUVAVeJ673d2EFtUIE7i2KlHLBA1ghInZz4B
        szkFbCQ2bLkE1sssIC5x68l8JghbXmL72znMIMskBL6yS0z4ehTqbheJ3hNNUG8LS7w6voUd
        wpaR+L8TpBmkoZlRomf3bXYIZwKjxP3jCxghqqwl7pz7BfQDB9AKTYn1u/Qhwo4Sz9rusYCE
        JQT4JG68FYQ4gk9i0rbpzBBhXomONiGIahWJ36umQ50gJdH95D/LBEalWUhem4XknVlI3pmF
        sHcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwKR2+t/xTzsYv15KOsQowMGoxMOb
        UB4fL8SaWFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQn
        lqRmp6YWpBbBZJk4OKUaGC3FlYxWzcs676zQ3eMeXnxBT48hPDr808UE3+2XFCYeUlmxZeoR
        SaX7yjdVTjqntS04MEkTmA5D18rebRBrLbphoaP6ZZrtXI9rWwv773ldPZJwbKb4OVOemz5/
        en1uBFqek9C6l/3yxwvHlsvCTxcKMP7+IbY5WUckdPXMbe8uvS9+c2mVuRJLcUaioRZzUXEi
        AL1lL9NmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7rr9ifEG0z7w2exccZ6VovrX56z
        Wsw/co7Vov/xa2aL8+c3sFtsenyN1eJjzz1Wi8u75rBZzDi/j8li7ZG77BYXT7latO49wm7x
        79pGFotVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPDYvqffo27KK0ePzJrkAtig9m6L80pJUhYz8
        4hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jKbXB5kLfjNV/N66jL2B
        cTtTFyMnh4SAicSe6dsZuxi5OIQEljJK3Dg5k7WLkQMoISUxv0UJokZY4s+1LjYQW0jgPaPE
        ueOSILawQLLEhL7XYHNEBGQlbh37yQYyh1ngGLPEzimnWCCGHmSU+LH2GVgVm4ChRO/RPkYQ
        m1fATqLhyDtmEJtFQFXieu93dhBbVCBO4kzPCzaIGkGJkzOfsIDYnAI2Ehu2XALrZRZQl/gz
        7xIzhC0ucevJfCYIW15i+9s5zBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswt
        Ls1L10vOz93ECIzgbcd+btnB2PUu+BCjAAejEg9vQnl8vBBrYllxZe4hRgkOZiURXqezp+OE
        eFMSK6tSi/Lji0pzUosPMZoCPTeRWUo0OR+YXPJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmk
        J5akZqemFqQWwfQxcXBKNTBKL57w6tKqzgB+9lyhBYsmTOR4tMeUx8zrJEfU24KHJ46EK1ul
        Ssu5MQiIv8z8WXpCVtRswYnWaQpn//WJXeBOLveYXcdeqcdmYGvB9W9L19Pq7lPPWVbkGxgV
        bslfkrq20apMLvfunql3Mjm+/N61zvG0Fs9Uhw07AibOn1nVkDr98bSGwnAlluKMREMt5qLi
        RACpfJZm9gIAAA==
X-CMS-MailID: 20200915132046eucas1p217e810858d346fb491b2498343dfc622
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200826171552eucas1p28ace6b1efbcdab420aaa4458ac8bad08
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826171552eucas1p28ace6b1efbcdab420aaa4458ac8bad08
References: <20200826171529.23618-1-s.nawrocki@samsung.com>
        <CGME20200826171552eucas1p28ace6b1efbcdab420aaa4458ac8bad08@eucas1p2.samsung.com>
        <20200826171529.23618-2-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26.08.2020 19:15, Sylwester Nawrocki wrote:
> Use non-zero clock IDs in definitions of the CPU parent clocks
> for exynos5420, exynos5250 SoCs. This will allow us to reference
> the parent clocks directly in the driver by cached struct clk_hw
> pointers, rather than doing clk lookup by name.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Applied.
