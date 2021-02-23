Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52180C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 09:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11ACA64E4D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Feb 2021 09:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhBWJZm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Feb 2021 04:25:42 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55003 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhBWJZk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Feb 2021 04:25:40 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210223092448euoutp02b02909b230ba4bb3ab2836829260f8e6~mVjHMbSAy0385503855euoutp02N
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Feb 2021 09:24:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210223092448euoutp02b02909b230ba4bb3ab2836829260f8e6~mVjHMbSAy0385503855euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1614072288;
        bh=9JEGI2yO7sPdfcR8BEgg49SyW9qFp79juGU7Dd/4g0s=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pIzsiEGdFRMfqNmRh8oFNYcErPSe5U0YrpBv/GTKyncVBJyBQmranS7ORpQSx3DD+
         y3bwtoLbsVky8fII4b/90jXQoEqdIwhSXdGLDY8QjpoP0NF9e/UYGpvIV5Vq2IBIEG
         NIjcQbxgZT6rMXBDWwwTSfr2xfr0PQGN4qwniGYo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210223092443eucas1p14e97c3290f3515e434b584f14baa4c6b~mVjCZcROT0731907319eucas1p1x;
        Tue, 23 Feb 2021 09:24:43 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 11.A0.45488.BD9C4306; Tue, 23
        Feb 2021 09:24:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210223092442eucas1p264d60b5faa665f6047dfc34e3f5e3cba~mVjB5jmhv2571725717eucas1p2B;
        Tue, 23 Feb 2021 09:24:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210223092442eusmtrp24ac4b540c392881baddcbfe827f11531~mVjB45Yqx0733307333eusmtrp2x;
        Tue, 23 Feb 2021 09:24:42 +0000 (GMT)
X-AuditID: cbfec7f5-c77ff7000000b1b0-4f-6034c9db9d6d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.CB.21957.AD9C4306; Tue, 23
        Feb 2021 09:24:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210223092442eusmtip169a72bc7432711a5495ab4f87ed73ef5~mVjBUIPte1800218002eusmtip1b;
        Tue, 23 Feb 2021 09:24:41 +0000 (GMT)
Subject: Re: [PATCH] Revert
 "ARM: dts: exynos: Remove 'opp-shared' from Exynos4412 bus OPP-tables"
To:     Markus Reichl <m.reichl@fivetechno.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1ed8fbd7-4aa6-f053-6627-0922420069ab@samsung.com>
Date:   Tue, 23 Feb 2021 10:24:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210222095405.3109-1-m.reichl@fivetechno.de>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87q3T5okGFyazmpx/ctzVov5R86x
        Wpw/v4HdYtPja6wWl3fNYbOYcX4fk8XLIz8YLVr3HmF34PC4dafeY9OqTjaPzUvqPfq2rGL0
        +LxJLoA1issmJTUnsyy1SN8ugSvj1MoZ7AVtkhXdx+YxNzDOEO5i5OSQEDCRmNPxnqmLkYtD
        SGAFo8TmO9uZIZwvjBLnJhyEcj4zSszo+8DexcgB1rJ7tzxEfDmjxIk509ggnI+MEu1dP9hA
        5goLpEhsaTzCCpIQEVjJKNGxrAGsilmgnVHi1Jwb7CBVbAKGEl1vu8A6eAXsJL5/f8MMYrMI
        qEqcebcbLC4qkCTx9/dNJogaQYmTM5+wgNicAtYSHzsvgNnMAvIS29/OYYawxSVuPZkP9pGE
        wAMOiQ/r1rJCvOoi0b16KzOELSzx6vgWdghbRuL/TpiGZkaJh+fWskM4PYwSl5tmMEJUWUvc
        OfeLDRQCzAKaEut36UOEHSVe7NjEDAkYPokbbwUhjuCTmLRtOlSYV6KjTQiiWk1i1vF1cGsP
        XrjEPIFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzAd
        nf53/OsOxhWvPuodYmTiYDzEKMHBrCTCy3bXKEGINyWxsiq1KD++qDQntfgQozQHi5I4766t
        a+KFBNITS1KzU1MLUotgskwcnFINTCFx7sWxn9SLdlzacKJk7zmpivd/05wF24M5K42PRWcu
        8z3+dI/c/K2x81c5fbim5fUvP3c/j7ypttb5/bvXz2CdxBtVf2cf1yOxQ8ZuioJBqfc9OQtm
        h2d4mTr31S4RX7NOZ6Nh4HJ5a9cF/KdaZ9c3StfMLF/x8E9W1/eENKZ7IaplJw+vWPVeSmFO
        per02dvEA4RNK+J0K8Tyqz+n3N69+4Hm+ZN1RezXfjg/sD67ZMeVzdnJx7bsnm3udmzDAZGr
        YYYCxxzZBRjbctUbW1+fcwpZnj5V6smqiucpXBfmX3rNLZn3U1xA68pjxbj91eJtAnfWPF70
        uHiVqFjqv6vKvabxZa/YPNn1l1/+rMRSnJFoqMVcVJwIAEwaFDm2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xu7q3TpokGPy8q2Rx/ctzVov5R86x
        Wpw/v4HdYtPja6wWl3fNYbOYcX4fk8XLIz8YLVr3HmF34PC4dafeY9OqTjaPzUvqPfq2rGL0
        +LxJLoA1Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8u
        QS/j1MoZ7AVtkhXdx+YxNzDOEO5i5OCQEDCR2L1bvouRi0NIYCmjRN/RHWxdjJxAcRmJk9Ma
        WCFsYYk/17rYIIreM0o82jcXLCEskCKx7/YBVpCEiMBKRoknOzcxgTjMAu2MEnfezoZq6WOU
        uP1uK1gLm4ChRNfbLrAdvAJ2Et+/v2EGsVkEVCXOvNsNFhcVSJJYP/0mE0SNoMTJmU9YQGxO
        AWuJj50XwGxmATOJeZsfMkPY8hLb386BssUlbj2ZzzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR
        1NLi3PTcYkO94sTc4tK8dL3k/NxNjMD423bs5+YdjPNefdQ7xMjEwXiIUYKDWUmEl+2uUYIQ
        b0piZVVqUX58UWlOavEhRlOgfyYyS4km5wMTQF5JvKGZgamhiZmlgamlmbGSOO/WuWvihQTS
        E0tSs1NTC1KLYPqYODilGph2HHLmj2ySLfv7RkoqoD7pad/y118it5l4qLzUCilJunNJXED+
        6tml38L47SoyPrrvsjDhDH4g9WtC+wzDey/4W/4Ghhid9jY3f+9xpF2k5+rqEpkzG0TPP6/P
        lLOeGfNpuvR50dppideOrlbg1eHvPF97Q79Lg+vgYYfDKz09BF3mHi9OnKg2J2KTgdUPJZaJ
        J2qqMwqYvrX8vOWdbMK81r3OJv32aYdJvI+3Vc7jYTshZBzUOvG5RAVLsuWkeG4vZZYwbt25
        Yn5pSQtMmZZMaVwjei+33/PyaaMLkuXJ79Ya39ytFX2qIXqbesuZQwaZ7Rf4vxu+fefYurg+
        YNmtzxsvP7iw5MNGi9SHi5VYijMSDbWYi4oTAbVvY+tIAwAA
X-CMS-MailID: 20210223092442eucas1p264d60b5faa665f6047dfc34e3f5e3cba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210222095419eucas1p2448e782d7df380425ab9bab5db75008d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210222095419eucas1p2448e782d7df380425ab9bab5db75008d
References: <CGME20210222095419eucas1p2448e782d7df380425ab9bab5db75008d@eucas1p2.samsung.com>
        <20210222095405.3109-1-m.reichl@fivetechno.de>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Markus,

On 22.02.2021 10:54, Markus Reichl wrote:
> This reverts commit a23beead41a18c3be3ca409cb52f35bc02e601b9.
>
> I'm running an Odroid-X2 as headless 24/7 server.
> With plain stable 5.10.1 I had 54 up days without problems.
> With opp-shared removed on kernels before and now on 5.11
> my system freezes after some days on disk activity to eMMC
> (rsync, apt upgrade).
>
> The spontaneous hangs are not easy to reproduce but testing this
> for several months now I am quite confident that there is something
> wrong with this patch.
>
> Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>

Thanks for the report.

IMHO a straight revert is a bad idea. I would prefer to keep current opp 
definitions and disable the affected devfreq devices (probably right bus 
would be enough) or try to identify which transitions are responsible 
for that issue. I know that it would take some time to identify them, 
but that would be the best solution. Reverting leads to incorrect 
hardware description, what in turn confuses the driver and framework, 
what in turn hides a real problem.

Another problem related to devfreq on Exynos4412 has been introduced 
recently by the commit 86ad9a24f21e ("PM / devfreq: Add required OPPs 
support to passive governor"). You can see lots of the messages like 
this one:

devfreq soc:bus-acp: failed to update devfreq using passive governor

I didn't have time to check what's wrong there, but I consider devfreq 
on Exynos a little bit broken, so another solution would be just to 
disable it in the exynos_defconfig.

> ---
>   arch/arm/boot/dts/exynos4412.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index a142fe84010b..6246df278431 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -405,6 +405,7 @@
>   
>   		bus_dmc_opp_table: opp-table1 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-100000000 {
>   				opp-hz = /bits/ 64 <100000000>;
> @@ -431,6 +432,7 @@
>   
>   		bus_acp_opp_table: opp-table2 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-100000000 {
>   				opp-hz = /bits/ 64 <100000000>;
> @@ -500,6 +502,7 @@
>   
>   		bus_leftbus_opp_table: opp-table3 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-100000000 {
>   				opp-hz = /bits/ 64 <100000000>;
> @@ -522,6 +525,7 @@
>   
>   		bus_display_opp_table: opp-table4 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-160000000 {
>   				opp-hz = /bits/ 64 <160000000>;
> @@ -533,6 +537,7 @@
>   
>   		bus_fsys_opp_table: opp-table5 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-100000000 {
>   				opp-hz = /bits/ 64 <100000000>;
> @@ -544,6 +549,7 @@
>   
>   		bus_peri_opp_table: opp-table6 {
>   			compatible = "operating-points-v2";
> +			opp-shared;
>   
>   			opp-50000000 {
>   				opp-hz = /bits/ 64 <50000000>;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

