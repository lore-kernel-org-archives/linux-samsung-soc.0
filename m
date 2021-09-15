Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155CCC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 13:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E643C611C4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 13:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233325AbhIONIq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 09:08:46 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16957 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbhIONIp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 09:08:45 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210915130725euoutp01fee62e53eec5d300589c8b85c8c7ecca~lALuJH-qs0417704177euoutp01B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 13:07:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210915130725euoutp01fee62e53eec5d300589c8b85c8c7ecca~lALuJH-qs0417704177euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631711245;
        bh=7JUEMvLJ7EzT05xMWppWHbthLnYcH45wwJbxKBR7B+o=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=s5I3sAZDeTFzJ5dlIhAlTuAwcu4Z49MkuJ344RIHyZFkouVn0r8f1ukn438C2X79Z
         TPDRuSNWY9csnr+MapL6xsW7xRjsVHkjljVcSW9513DCdqVTiHgA5/rR0Ln1k3CKNR
         kslMWJ+Rko9xOAWblcu/Y9/4yv+2Eo0LSsrFHsQA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210915130724eucas1p1bf3f9ccf15bd73a983c55e65991dc053~lALs9qHK51221912219eucas1p1n;
        Wed, 15 Sep 2021 13:07:24 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A1.82.56448.C00F1416; Wed, 15
        Sep 2021 14:07:24 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210915130723eucas1p1c78e991e4c5c360a7f84ab524018564e~lALsT_OAB2425024250eucas1p1g;
        Wed, 15 Sep 2021 13:07:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210915130723eusmtrp15a4829c41ece59982c9307ca065206c9~lALsS8iBh2247422474eusmtrp1Z;
        Wed, 15 Sep 2021 13:07:23 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-bf-6141f00c513c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.FB.20981.B00F1416; Wed, 15
        Sep 2021 14:07:23 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210915130722eusmtip208339a5ed16f7badb7155c943480274f~lALrQyaE13211632116eusmtip2C;
        Wed, 15 Sep 2021 13:07:22 +0000 (GMT)
Subject: Re: [PATCH 6/6] clk: samsung: Introduce Exynos850 clock driver
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <1d884e38-ac8c-6f0c-ad27-243c5c4b9b9b@samsung.com>
Date:   Wed, 15 Sep 2021 15:07:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-7-semen.protsenko@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7djPc7o8HxwTDb6sZbP4sGIRo8X1L89Z
        LeYfOcdqcea3rsXGtz+YLDY9vsZq8bHnHqvF5V1z2CxmnN/HZHHxlKvFj+N9zBate4+wW0z9
        cYvN4t+1jSwWz/uAkqfufma3uHKmg8li1a4/jA5CHu9vtLJ7zGroZfPYOesuu8emVZ1sHneu
        7WHz2Lyk3qNvyypGj8+b5AI4orhsUlJzMstSi/TtErgy2vf8Yy44z1xxveUrYwNjK3MXIyeH
        hICJxJstk1m6GLk4hARWMEq8b1jBCOF8YZQ48fgpO0iVkMBnRol7O9lhOiYunc4OUbScUeLr
        9e+sEM5HRolXEw4yglQJC7hLfHjynAXEFhHQk1g38xVYB7PAAlaJJ6uWgo1iEzCU6D3aB9bA
        K2AnMXHBDSYQm0VAVaK9dzobiC0qkCwx7W8TM0SNoMTJmU/AhnIKOEjM+rIHrIZZQFzi1pP5
        TBC2vMT2t3OYQZZJCBzmlJh4fyobxN0uEn2zFkF9LSzx6vgWqH9kJE5P7mGBaGhmlOjZfZsd
        wpnAKHH/+AJGiCpriTvnfgFN4gBaoSmxfpc+RNhR4vDpY4wgYQkBPokbbwUhjuCTmLRtOjNE
        mFeio00IolpF4veq6UwQtpRE95P/LBMYlWYheW0WkndmIXlnFsLeBYwsqxjFU0uLc9NTi43z
        Usv1ihNzi0vz0vWS83M3MQKT4el/x7/uYFzx6qPeIUYmDsZDjBIczEoivBdqHBOFeFMSK6tS
        i/Lji0pzUosPMUpzsCiJ8+7auiZeSCA9sSQ1OzW1ILUIJsvEwSnVwCTy/kvHzBzFkBXHH33Y
        YT1ZdrZFmPmc736ytjxZP6YmfXghOM/uu8zbt6nTH5v92txyIbcmR0n4g5LNjXf/Aq0t8yOO
        +qhutRNrP5GumKmUMMPiS1HMg60d8QyHL8z6tfzL+f9FEy/KaIrkdXJqNmjzzxFbaz57c+nN
        WVdNZvG6WxnJ8ycn6ev0aKXY7vS+6KKWK2KR+I6vXOJAcWdsmL/s0xmfwivDopbfD/2nOiV7
        5+9XO5R57NkWrGmNNWSp0HY9k3u4ILtGUdlr3/V3VyYZ6O713XXkhpP3UW5L99vx5Ss+MJ6z
        fH+YycUytDUx8jtTrcse1urrFRkPThTOCKjKmeXtYRnYrsn2sqRQiaU4I9FQi7moOBEAB/hL
        7/UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsVy+t/xe7rcHxwTDc58ErP4sGIRo8X1L89Z
        LeYfOcdqcea3rsXGtz+YLDY9vsZq8bHnHqvF5V1z2CxmnN/HZHHxlKvFj+N9zBate4+wW0z9
        cYvN4t+1jSwWz/uAkqfufma3uHKmg8li1a4/jA5CHu9vtLJ7zGroZfPYOesuu8emVZ1sHneu
        7WHz2Lyk3qNvyypGj8+b5AI4ovRsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV
        9O1sUlJzMstSi/TtEvQy2vf8Yy44z1xxveUrYwNjK3MXIyeHhICJxMSl09lBbCGBpYwSy85x
        dDFyAMWlJOa3KEGUCEv8udbF1sXIBVTynlHi5YdtLCAJYQF3iQ9PnoPZIgJ6EutmvmIHKWIW
        WMAqMW3+JDaIoScZJTa3+YDYbAKGEr1H+xhBbF4BO4mJC24wgdgsAqoS7b3TwepFBZIl3r7+
        zgRRIyhxcuYTsAWcAg4Ss77sAathFlCX+DPvEjOELS5x68l8JghbXmL72znMExiFZiFpn4Wk
        ZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjPxtx35u2cG48tVHvUOMTByM
        hxglOJiVRHgv1DgmCvGmJFZWpRblxxeV5qQWH2I0BfpnIrOUaHI+MPXklcQbmhmYGpqYWRqY
        WpoZK4nzmhxZEy8kkJ5YkpqdmlqQWgTTx8TBKdXAZFGpp3Hpl8Zu9bboCdVNqxgTi1dqGvaX
        9hm+27x2qtoT/p3PPipN2sC55XbHQ9YfuTyPJ7xfqx8Raxhh7biFzZtRaod3aQz33b6tqpsY
        X03x9Hv6OK9J0cDs3uqv8c/aZz+5/cD809UAzdPrRIpdD3o8/Hj0ruq8r1ar0jYfMxK5HjNL
        QkTvCeM0N7nLTEHfTumuOb97/ZFwc5/eq1vXcbbpTq48+uRL4DHNEmvjyB82iS1Hj595t36O
        +vv03/kqWguq/654M32/ScvHq8vfHwthjhXx23nyWdmypvTiQ2kZ50Wu6JwU5mlr5laRfryX
        QePUnIW7z099o6JUHeb/d52V2r37no8fqGpu4BApNlJiKc5INNRiLipOBACGefYJhQMAAA==
X-CMS-MailID: 20210915130723eucas1p1c78e991e4c5c360a7f84ab524018564e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210914155639eucas1p2b65f35fcbd2b3fde7d4e7541ac6d76d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210914155639eucas1p2b65f35fcbd2b3fde7d4e7541ac6d76d3
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
        <CGME20210914155639eucas1p2b65f35fcbd2b3fde7d4e7541ac6d76d3@eucas1p2.samsung.com>
        <20210914155607.14122-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14.09.2021 17:56, Sam Protsenko wrote:
> +static void __init exynos850_cmu_top_init(struct device_node *np)
> +{
> +	exynos850_init_clocks(np, top_clk_regs, ARRAY_SIZE(top_clk_regs));
> +	samsung_cmu_register_one(np, &top_cmu_info);
> +}
> +
> +CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
> +	       exynos850_cmu_top_init);

Was there anything preventing you from making it a platform driver instead?

-- 
Regards,
Sylwester
