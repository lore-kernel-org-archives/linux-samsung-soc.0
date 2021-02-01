Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F83EC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Feb 2021 04:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD2A264E2B
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Feb 2021 04:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbhBAEiP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Jan 2021 23:38:15 -0500
Received: from mailout1.samsung.com ([203.254.224.24]:49285 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhBAEfn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Jan 2021 23:35:43 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210201043500epoutp01cee5bb5ba109b2f13fc5038a8c15d808~fhZznHi4H1697416974epoutp01-
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Feb 2021 04:35:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210201043500epoutp01cee5bb5ba109b2f13fc5038a8c15d808~fhZznHi4H1697416974epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1612154100;
        bh=SU5P9sjoxFiX/I0nd/FfMGD5s5MSDPlaCsf2GzDbrBI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=p4ZPk6YiR/aeOYCoNGmp0A/tw7oDpi6bFQDUVSvzqVXterAlJswwLrAazSsyy5xCm
         a7QBX4SbAK5xuXAEl14pYzZsRsXLlaE88o3cTJmXRmxLf39+YDKk/fg47lw0wcpsF5
         GtlxUU7nyrbl7mVSzaFSCX3nvnMC3DfQ+5WeBFpA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210201043459epcas1p2b9f9254198460b16a425887bb37ddeaa~fhZzD3QKK1020110201epcas1p2P;
        Mon,  1 Feb 2021 04:34:59 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4DTZqP0Z62z4x9Px; Mon,  1 Feb
        2021 04:34:57 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        E8.B9.09577.0F487106; Mon,  1 Feb 2021 13:34:57 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210201043455epcas1p4be656aaf6e12a99b1cad55f94f470e55~fhZvHgBxO2277022770epcas1p4I;
        Mon,  1 Feb 2021 04:34:55 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210201043455epsmtrp100dd4504f15c8f7aa7a1fb87b6a37039~fhZvFZjF71405014050epsmtrp1-;
        Mon,  1 Feb 2021 04:34:55 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-96-601784f09fb8
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BF.D1.13470.FE487106; Mon,  1 Feb 2021 13:34:55 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210201043455epsmtip1165d10fb80c36aecd3fcef3a6d13c9fe~fhZupg8MH1236412364epsmtip1l;
        Mon,  1 Feb 2021 04:34:55 +0000 (GMT)
Subject: Re: [PATCH v3] clk: exynos7: Keep aclk_fsys1_200 enabled
To:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2562d6ab-f7ec-8445-7207-a83318dd6402@samsung.com>
Date:   Mon, 1 Feb 2021 13:50:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20210131170428.3290-1-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmvu7HFvEEg/NJFv2PXzNbnD+/gd1i
        0+NrrBYfe+6xWlzeNYfNYsb5fUwWF0+5Wvw43sdscfhNO6vFv2sbWSxW7frD6MDt8f5GK7vH
        zll32T02repk89i8pN6jb8sqRo/Pm+QC2KKybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwM
        dQ0tLcyVFPISc1NtlVx8AnTdMnOAjlNSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTk
        FFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGd8XN/FXnBIoGJS/2XWBsZ9vF2MHBwSAiYSF49q
        dDFycQgJ7GCUeHfrFzuE84lR4vHjT4wQzjdGiX87vjB3MXKCdSxcfZ4FIrGXUaJ1/lyoqvdA
        LZ8vsYBUCQs4SkxZ38EGkhARmMQo8ffBa1YQh1lgO6PEpjvb2EGq2AS0JPa/uMEGYvMLKEpc
        /fGYEcTmFbCTaJ6+nQXkQhYBFYnJa4RAwqICYRInt7VAlQhKnJz5BGwZp4CzxLH5+8BsZgFx
        iVtP5jNB2PISzVtnM4PslRA4wCFx88x2qB9cJG5unMkCYQtLvDq+hR3ClpJ42d8GZVdLrDx5
        hA2iuYNRYsv+C6wQCWOJ/UsnM4EcxyygKbF+lz5EWFFi5++5jBCL+STefe1hhYQwr0RHmxBE
        ibLE5Qd3mSBsSYnF7Z1sExiVZiF5ZxaSF2YheWEWwrIFjCyrGMVSC4pz01OLDQtMkaN7EyM4
        5WpZ7mCc/vaD3iFGJg7GQ4wSHMxKIrynJoklCPGmJFZWpRblxxeV5qQWH2I0BYbvRGYp0eR8
        YNLPK4k3NDUyNja2MDE0MzU0VBLnTTJ4EC8kkJ5YkpqdmlqQWgTTx8TBKdXANKPKLHbyIdFs
        M6YANu1FNye9u3phV0kUg7VZmlTqgtWSxyz3MawWPnLxj4KNZt78ydYfow8zBe1heiesnXlZ
        tFDm7ebaKdlFky7zctTtZ9Q+9Vjqt85nrZ83w1PF10TGyYZGrg7WlV6i/+0Sx/Eq3kWy7eEN
        IS6VKaap1avjkmTmSWia9atoLghS+3Pw7t7NX0Xz1ap6Z7+Sv6VfLaW0cf8NjrQPR2J9/jhM
        EGqUOz57asijn1rXpXu+pXluKDKsndUlwpl4TUbMtGjCi+9sHiU+6tJi3dKbTzfm+KUuiHeY
        r3BLyq0l/90NT5mqjMlyL9QPceu7MtVFCryJ3ikt52Am+O1l1OQEtyrDXUosxRmJhlrMRcWJ
        ANIJyqVCBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRmVeSWpSXmKPExsWy7bCSnO77FvEEg8t9Shb9j18zW5w/v4Hd
        YtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbHH4TTurxb9rG1ksVu36w+jA7fH+Riu7
        x85Zd9k9Nq3qZPPYvKTeo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDI+ru9iLzgkUDGp/zJr
        A+M+3i5GTg4JAROJhavPs3QxcnEICexmlDgz6SobREJSYtrFo8xdjBxAtrDE4cPFEDVvGSWm
        ndzNCFIjLOAoMWV9BxtIQkRgEqPEp4+d7CAOs8B2RomvBw8wQbRMY5TY8H0WC0gLm4CWxP4X
        N8BW8AsoSlz98RhsFK+AnUTz9O0sIOtYBFQkJq8RAgmLCoRJ7FzymAmiRFDi5MwnYGM4BZwl
        js3fB2YzC6hL/Jl3iRnCFpe49WQ+E4QtL9G8dTbzBEbhWUjaZyFpmYWkZRaSlgWMLKsYJVML
        inPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLjT0tzB+P2VR/0DjEycTAeYpTgYFYS4T01SSxB
        iDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2ampBalFMFkmDk6pBqbGJS+Pblo/
        /3fg1bhl2+re3oh4z27xb20I+75jjpE7eIzdAxU8SkX4z3x4tvLQnB6O1GvLQ81+R0UYTrD7
        Wf3yZ96jHvNGL50VpxwTzjFm/ll998Ga5Sc4pR/95jq4tFhxr/Wy6E3BFvfeFpvJaB6+rfmt
        wbjFi//Dov/lv75MS23YqCcrNnHrOYe3ST7RG0rdAlo3LonrXn/xVpX/jYpo7jLDx3tPKnjm
        PFMPDWL0Set6K9SYYs1ox37kwzYJv26D/q1PX8infp6/vWmv0JYa6ZCE7Mq17NIJ+nkZ3bqX
        N6oLM7+7q/nTx9i65hnPEVWD3EDBGWW/n3Qp/Pbj1/k5iaNAp0jfvz/d5nb7PiWW4oxEQy3m
        ouJEAMOkawcuAwAA
X-CMS-MailID: 20210201043455epcas1p4be656aaf6e12a99b1cad55f94f470e55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210131170444epcas1p1244bfbf4e3bf121360e973b719a699c0
References: <CGME20210131170444epcas1p1244bfbf4e3bf121360e973b719a699c0@epcas1p1.samsung.com>
        <20210131170428.3290-1-pawel.mikolaj.chmiel@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/1/21 2:04 AM, Paweł Chmiel wrote:
> This clock must be always enabled to allow access to any registers in
> fsys1 CMU. Until proper solution based on runtime PM is applied
> (similar to what was done for Exynos5433), fix this by calling
> clk_prepare_enable() directly from clock provider driver.
> 
> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
> UFS module is probed before pmic used to power that device.
> In this case defer probe was happening and that clock was disabled by
> UFS driver, causing whole boot to hang on next CMU access.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
> Changes from v2:
>   - Avoid __clk_lookup() call when enabling clock
> Changes from v1:
>   - Instead of marking clock as critical, enable it manually in driver.
> ---
>  drivers/clk/samsung/clk-exynos7.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index c1ff715e960c..24d3fc5c5d0f 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
>  
>  #include "clk.h"
>  #include <dt-bindings/clock/exynos7-clk.h>
> @@ -570,7 +571,18 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
>  
>  static void __init exynos7_clk_top1_init(struct device_node *np)
>  {
> -	samsung_cmu_register_one(np, &top1_cmu_info);
> +	struct samsung_clk_provider *ctx;
> +	struct clk_hw **hws;
> +
> +	ctx = samsung_cmu_register_one(np, &top1_cmu_info);
> +	if (!ctx)
> +		return;
> +	hws = ctx->clk_data.hws;
> +
> +	/*
> +	 * Keep top FSYS1 aclk enabled permanently. It's required for CMU register access.
> +	 */
> +	clk_prepare_enable(hws[CLK_ACLK_FSYS1_200]->clk);
>  }
>  
>  CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
