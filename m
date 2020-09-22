Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C9C4363D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 15:04:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E449E23A1E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 15:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="u4idhqW1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbgIVPEE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 11:04:04 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44001 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgIVPEE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 11:04:04 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200922150402euoutp02e4d20b4f29b4547b280dce925b72b91e~3I1VuY15i0963409634euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 15:04:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200922150402euoutp02e4d20b4f29b4547b280dce925b72b91e~3I1VuY15i0963409634euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600787042;
        bh=TA8KdVZEMiZJAKoBsZ3goa5LlI8k6WjcwRZijqsGF08=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=u4idhqW1jGsOh7RVYib4F4y0xVGD1OLf6HJsQ0kOg31jWwpHjphonsYknrHnltJCx
         SJEMZugIpqHjaKRXCf1GBaGh92mCVJw610uljjAvlCE/suDh/ge9b4uCkiTAT/Bkcy
         rhbvTz6AezCV/fktkAeQF6DJbl/bUIhLj2HxJXyM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200922150402eucas1p1014d72c6f2c553193132053cc2a5cf5d~3I1VYPfVa2357523575eucas1p1H;
        Tue, 22 Sep 2020 15:04:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 9F.58.06318.1621A6F5; Tue, 22
        Sep 2020 16:04:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200922150401eucas1p12ae27b7693544ca79e5cc1408b9c8211~3I1VBpG8m2356723567eucas1p15;
        Tue, 22 Sep 2020 15:04:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200922150401eusmtrp2488d2684a41d9a9a1e180b7ed412e304~3I1VA6tgr0660306603eusmtrp2L;
        Tue, 22 Sep 2020 15:04:01 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-9f-5f6a12615539
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 55.A9.06017.1621A6F5; Tue, 22
        Sep 2020 16:04:01 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200922150401eusmtip262eb2f56a0c92dc58f350ce6649c738f~3I1UfmMbK2556925569eusmtip2U;
        Tue, 22 Sep 2020 15:04:00 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos4: mark 'chipid' clock as
 CLK_IGNORE_UNUSED
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <ef790668-d981-072f-d3f9-b4cbd5c9be1f@samsung.com>
Date:   Tue, 22 Sep 2020 17:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922124046.10496-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87qJQlnxBieuWFpsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt/h3bSOLRfvTl8wOHB6bVnWyefRtWcXo8XmTXABzFJdN
        SmpOZllqkb5dAlfG5TsrGAvmsFZ8OLaLrYFxGUsXIyeHhICJRMeWS4xdjFwcQgIrGCU+f25j
        hnC+MErsfvSXHcL5zCixZsosuJaDO3qhEssZJVYteg/V/5FR4tS0x8wgVcICYRIbu+aA2SIC
        QRJz7lwH62AGmTt9wgmwUWwChhK9R/sYQWxeATuJid9OsYLYLAKqEvuO/QOrERWIkzh26hEL
        RI2gxMmZT8BsTqD6x5P7wBYwC4hL3HoynwnClpfY/nYO2BMSAuvYJc703WKGuNtF4uSUA1C2
        sMSr41vYIWwZif87QZpBGpoZJXp232aHcCYwStw/voARospa4s65X2xdjBxAKzQl1u/Shwg7
        Ssx/foQVJCwhwCdx460gxBF8EpO2TWeGCPNKdLQJQVSrSPxeNZ0JwpaS6H7yn2UCo9IsJK/N
        QvLOLCTvzELYu4CRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZg+jn97/jXHYz7/iQd
        YhTgYFTi4X3xJDNeiDWxrLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
        jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUwTq0JyLI+/pxPIK1EyGtVonDAsYlMDUWPWToVH7RO
        0dj7Xf6G7n0NxYI39f96Dx+tqdF1m1W++v72r5IH/le9/V14PTvLNIxnheV29Zmeenn7s+f0
        bfOOO7Lj92ajSHaf+EhOw7cb/pUaKt8S5U/KtZ51+CTPfk27tR7qFirHVXq9GoMr/3EosRRn
        JBpqMRcVJwIAWs2sMTsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7qJQlnxBpceqlhsnLGe1eL6l+es
        FufPb2C3+Nhzj9Vixvl9TBZrj9xlt/h3bSOLRfvTl8wOHB6bVnWyefRtWcXo8XmTXABzlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G5TsrGAvm
        sFZ8OLaLrYFxGUsXIyeHhICJxMEdvexdjFwcQgJLGSWmtt1m7mLkAEpIScxvUYKoEZb4c62L
        DaLmPaPEqaYeRpCEsECYxMauOcwgtohAkMSh2R+YQYqYBb4wSvz89hisSEhgIqPE+Y4sEJtN
        wFCi92gfWJxXwE5i4rdTrCA2i4CqxL5j/8AuEhWIkzjT84INokZQ4uTMJ2BxTqD6x5P7wJYx
        C6hL/Jl3CcoWl7j1ZD4ThC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvp
        FSfmFpfmpesl5+duYgTG2rZjP7fsYOx6F3yIUYCDUYmH98WTzHgh1sSy4srcQ4wSHMxKIrxO
        Z0/HCfGmJFZWpRblxxeV5qQWH2I0BXpuIrOUaHI+MA3klcQbmhqaW1gamhubG5tZKInzdggc
        jBESSE8sSc1OTS1ILYLpY+LglGpgVPz75c1Cs5PtNwSY2CaplF+1Kj58ZXZZaGKoYG3B7P1d
        Tol6+2NF1WZryYicWC4W9tPGY4di7a7dDxnaL/gI7ZAtYHppVTPZIvNo60Kp58L1rlaRikpK
        lZH/2tafP96Yk33neKLUByZR+YO7ZA2Tny6cN/tmj81GFQbT0glK+madps6Cn1qVWIozEg21
        mIuKEwFRrsu2ywIAAA==
X-CMS-MailID: 20200922150401eucas1p12ae27b7693544ca79e5cc1408b9c8211
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64
References: <CGME20200922124053eucas1p200d7381abf1d14e932f41ebc0f458c64@eucas1p2.samsung.com>
        <20200922124046.10496-1-m.szyprowski@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.09.2020 14:40, Marek Szyprowski wrote:
> The ChipID IO region has it's own clock, which is being disabled while
> scanning for unused clocks. It turned out that some CPU hotplug, CPU idle
> or even SOC firmware code depends on the reads from that area. Fix the
> mysterious hang caused by entering deep CPU idle state by ignoring the
> 'chipid' clock during unused clocks scan, as there are no direct clients
> for it which will keep it enabled.
> 
> Fixes: e062b571777f ("clk: exynos4: register clocks using common clock framework")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
