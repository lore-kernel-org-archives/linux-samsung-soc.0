Return-Path: <SRS0=0LAj=CY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C97CC433E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 13:07:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30A8E20684
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Sep 2020 13:07:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ltRv6CNK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgIONHa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Sep 2020 09:07:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58598 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgIONHF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 09:07:05 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200915130637euoutp01be5c94b757a2504dd8b5c1d7b1979acd~09t0VfgMf1244312443euoutp016
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2020 13:06:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200915130637euoutp01be5c94b757a2504dd8b5c1d7b1979acd~09t0VfgMf1244312443euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600175197;
        bh=l/fTqpZOZP8Z3Q9+i1hJ7n94rjLLsExK52fNSenqmaI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ltRv6CNK5HGwQBUN3yZDXKRiKEQJarbyO1mR/v27LQmcK2RJ+pRbQVA0KLXUEFOzj
         pOjejLpL3oEOuePIXg90654F5tBIS85VCrLMmZF1UnGZYlcEJu5fvLfcuxsHpcCbe8
         aEGG7dxSE1OGKO3IR6tIqMwXpQETh1/1HziGdL+c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200915130636eucas1p2c37b61d95221fdd43f485aa283ef97ff~09tzw8wh-1697016970eucas1p2u;
        Tue, 15 Sep 2020 13:06:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 72.4C.05997.C5CB06F5; Tue, 15
        Sep 2020 14:06:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200915130635eucas1p25bae1edd92e5af4b160cf0022a0e20bc~09tzRGPdm1702817028eucas1p2c;
        Tue, 15 Sep 2020 13:06:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200915130635eusmtrp121431724a8dc4a9c5e200f783b7ee8bb~09tzQVcxA2320123201eusmtrp1f;
        Tue, 15 Sep 2020 13:06:35 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-60-5f60bc5c0251
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D6.4B.06017.B5CB06F5; Tue, 15
        Sep 2020 14:06:35 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200915130634eusmtip1c284351c688df26b7cf031625c45af02~09tyaR4660704907049eusmtip1Y;
        Tue, 15 Sep 2020 13:06:34 +0000 (GMT)
Subject: Re: [PATCH 1/3] clk: samsung: Add clk ID definitions for the CPU
 parent clocks
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
Message-ID: <93b6c6ce-7f13-d4a9-4b7e-aaae657cfd49@samsung.com>
Date:   Tue, 15 Sep 2020 15:06:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826171529.23618-1-s.nawrocki@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zln52w4+Zzm3qyMhkGm3SMOKXaVBmkX+pWVbulBJWe2efdH
        RiipS8UkbQle6ObM1FmmKyXEJiVqV6uZic7QNAtTKi9pbkfJf8/7vM/L8zwfH0NIX1FuTGR0
        LKeJVkXJhWKyzjzZsfHUE2XIlqd6GVtTWEWx7ycGKba4pYNic6wjBNvZWU2zRmsXxY7pPlPs
        G1ORkC3sbBKwlS09NPvqhT+b1thCs7NdNSRrMM2gPY6KHx/SaEWDvodWGA0ZQkXtzQuK7AcG
        pBg3uh8VBol9w7ioyHhOs9lPKY7ovVhBxGQQibmVRjoVPRVkIhEDeAdYa8x0JhIzUnwXwd+K
        IQE/TCC4NtGzsBlH8K3jD1o8uT+WRtqwFN9B0JARzIvGEFQPF9oXzvgE5GS8sx+44NVgMU8K
        bSICmwnoKS+1mwvxVrjyLNsukmA/aLJ0z9sxDInXQaUlwUYvx8FgftFP8hIneH59wI5F2Bem
        brUTNkxgGVgGigU8XgOPRosImxfgMRrezjWSfOoDMFQ+SvHYGYZbH9A8XgVtV3Ukf3AJge5x
        N80PuQh6W0sWOvvAp44poS0dgT2hyrSZp/dC3txHZKMBO8KHUSc+hCPk1RUQPC2By+lSXu0B
        04aChXd3g6yBOTIXyfVLqumX1NEvqaP/71uCSAOScXFadTin3RbNJWzSqtTauOjwTaHn1EY0
        /9HaZlsn6pFp5kwzwgySO0iUCSEhUkoVr01SNyNgCLmLZF97W7BUEqZKSuY050I0cVGcthmt
        ZEi5TLK97OtpKQ5XxXJnOS6G0yxuBYzILRVxxKmuZSMC79Avs90BRzxNQStw4O/EdF2q3/7g
        hl0RyrJqp9snx7PyU/Pzn6W4VslxoOjs9O5fxd/XvnQtnfZw8/7ZNxX7ujFZ0R9ZcL5WVnjP
        32/94ePWungfkXtmu2XftiAvSrwlfVByxTUlIPHGw7VzDlGH+tT+XgePOdXvNKbISW2EausG
        QqNV/QPuO4hPZAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7rRexLiDRYsNLbYOGM9q8X1L89Z
        LeYfOcdq0f/4NbPF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Sx9shddouLp1wtWvceYbf4
        d20ji8WqXX8YHfg83t9oZffYOesuu8emVZ1sHpuX1Hv0bVnF6PF5k1wAW5SeTVF+aUmqQkZ+
        cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexv3G1cwFncwVE9ZuYm9g
        PMDUxcjJISFgIrHuYytLFyMXh5DAUkaJSU9Os3cxcgAlpCTmtyhB1AhL/LnWxQZR855R4sbT
        u+wgCWGBSIn+zquMILaIgKzErWM/wYqYBY4xS+yccgpqaj+jxIFPy9hAqtgEDCV6j/aBdfAK
        2Ensu3UbbBuLgKrE2lvlIGFRgTiJMz0v2CBKBCVOznzCAmJzCthI/Fp6lhnEZhZQl/gz7xKU
        LS5x68l8JghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvX
        S87P3cQIjOBtx35u2cHY9S74EKMAB6MSD29CeXy8EGtiWXFl7iFGCQ5mJRFep7On44R4UxIr
        q1KL8uOLSnNSiw8xmgL9NpFZSjQ5H5hc8kriDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRm
        p6YWpBbB9DFxcEo1MIr3fHxnl7RMbyXj2RU6CdfK/10yiuuqX+0pPNU/9EHaieOH2+O2swY5
        FCrda+iZ6/fgHqPqad1p5fsUWqP+6nnorjvhc3mDW2H+nUyFJR9eKjpEnGaXCPCamlypWvnw
        KJM8Y8LFdae3bt0pMHuyN/uab+9U/k27s/Bpz65vinP488W3tt+/NkeJpTgj0VCLuag4EQC4
        DQ5T9gIAAA==
X-CMS-MailID: 20200915130635eucas1p25bae1edd92e5af4b160cf0022a0e20bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87
References: <CGME20200826171539eucas1p2e999972d3e7dd6dd701e312548933e87@eucas1p2.samsung.com>
        <20200826171529.23618-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26.08.2020 19:15, Sylwester Nawrocki wrote:
> Add clock ID definitions for the CPU parent clocks for SoCs
> which don't have such definitions yet. This will allow us to
> reference the parent clocks directly by cached struct clk_hw
> pointers in the clock provider, rather than doing clk lookup
> by name.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Applied.
