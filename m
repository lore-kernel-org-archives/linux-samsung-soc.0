Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC7EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09D7A60F9B
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Sep 2021 16:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345510AbhIMQOp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:14:45 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53319 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242347AbhIMQOp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 12:14:45 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210913161328euoutp02bf3525243807469b2c20dace3d786ec9~kbbl6V53L2139121391euoutp025
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Sep 2021 16:13:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210913161328euoutp02bf3525243807469b2c20dace3d786ec9~kbbl6V53L2139121391euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631549608;
        bh=BODmo/i72TYAK/I18Eqv+IGEzjgXS7CIritZ3TIQpMk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dTpTjfEnRcmr60va5s/8cTGDC+jEmGOmO5YFN2acrO+trC7cgWHxjG6qNFn4WPwJP
         LfANZ03DL2RtkW/Ms2AJh/kkenDpyoJaBng50SlHGxzviPfcxJIxAL6NzcKoasN0vr
         XnGb+bak7DNOw6WrVio06+ZsTvOoNwEia2/cnljo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210913161328eucas1p1dc58c1a75741dc32d1ca5a9b425ac169~kbbloUPfD2008520085eucas1p1w;
        Mon, 13 Sep 2021 16:13:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 2F.0F.42068.7A87F316; Mon, 13
        Sep 2021 17:13:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210913161327eucas1p173a416725e7887f9055aa1b14f0e5431~kbblO-4e62217222172eucas1p1l;
        Mon, 13 Sep 2021 16:13:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210913161327eusmtrp1deba27eec153aa6bff2a1b5712992cc9~kbblOR4Ns1032710327eusmtrp1W;
        Mon, 13 Sep 2021 16:13:27 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-44-613f78a779f9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 3A.A1.20981.7A87F316; Mon, 13
        Sep 2021 17:13:27 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210913161327eusmtip2a70ab0989200572ebae9af6abec3c4ec~kbbkpmgef2640426404eusmtip2Y;
        Mon, 13 Sep 2021 16:13:27 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <458402ea-8986-60fe-5d34-e8eacdd638a5@samsung.com>
Date:   Mon, 13 Sep 2021 18:13:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210907085115.4254-1-caihuoqing@baidu.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djP87rLK+wTDbbtt7FYc+8vm8X1L89Z
        LTa+/cFksenxNVaLjz33WC0u75rDZjHj/D4mi4unXC3+XdvIYrFq1x9GBy6PL0ubmT3e32hl
        95jV0MvmsXPWXXaPTas62Tw2L6n36NuyitHj8ya5AI4oLpuU1JzMstQifbsEroxJ/38zFzxl
        qth8I72BcQ1TFyMnh4SAicTej9cZuxi5OIQEVjBKnL7WxwbhfGGU2HH5HiNIlZDAZ0aJxtkV
        XYwcYB1d2zQgapYzSkzcuhCq+yOjxOL9D1lAGoQFCiW+HjzLBmKLCKhJTJk0nR2kiFngAZPE
        rdVPwHazCRhK9B7tA9vAK2An8fnFfhaQDSwCqhIzr6aChEUFkiWm/W1ihigRlDg58wnYfE4B
        S4lHrd1gY5gFxCVuPZkPZctLbH87hxlkl4RAO6fE6lX/2CH+dJE4N7EPyhaWeHV8C5QtI3F6
        cg8LREMzo0TP7tvsEM4ERon7xxcwQlRZS9w594sN5DpmAU2J9bv0IUHhKHHlXBqEySdx460g
        xA18EpO2TWeGCPNKdLQJQcxQkfi9ajo01KUkup/8Z5nAqDQLyWezkHwzC8k3sxDWLmBkWcUo
        nlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYtk7/O/5lB+PyVx/1DjEycTAeYpTgYFYS4d32
        xjZRiDclsbIqtSg/vqg0J7X4EKM0B4uSOG/SljXxQgLpiSWp2ampBalFMFkmDk6pBqZN13/c
        zdBa6zaV2+fUAfH/FxlvtT1MWRx91fyk4E+2OO0oy51r2MMYWXzNLzJMyP1k+7zyAIOzn0dV
        i/5LsTt8uz0W3F/Hc0aRPbu6qOCT6PlP+7znfGnssmEoejOj/E366a0bf4a9Xe70jPFkV37O
        7D1bT8ml6b1IuSW392J1xI585+Lwh9y+eydIH6uN7ws1FjtpvO3NDZZ/ucJnQjuDvn+tF7B5
        oXDSOrww4syk6+GlRjHVE196Sq9iMDp7zVR7Qnt3Q/3bXR6Jha2Xpry5Z/n2mQrHqvnagafs
        d9T27d3uHC+n9yNZ9eqR603vLsetYm/4qXxpswir47X5b+pvs5kGWz+JLvjxQ4rrQ6ASS3FG
        oqEWc1FxIgC43xMTygMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7rLK+wTDVpPKlmsufeXzeL6l+es
        Fhvf/mCy2PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhb/rm1ksVi16w+jA5fHl6XNzB7vb7Sy
        e8xq6GXz2DnrLrvHplWdbB6bl9R79G1ZxejxeZNcAEeUnk1RfmlJqkJGfnGJrVK0oYWRnqGl
        hZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsak/7+ZC54yVWy+kd7AuIapi5GDQ0LARKJr
        m0YXIxeHkMBSRondU9pZIOJSEvNblLoYOYFMYYk/17rYIGreM0p8etPHBpIQFiiU6Pn1mRXE
        FhFQk5gyaTo7SBGzwAMmiSm/zrBDdPQwSrxo/MAIUsUmYCjRe7QPzOYVsJP4/GI/2DYWAVWJ
        mVdTQcKiAskSb19/Z4IoEZQ4OfMJC4jNKWAp8ai1GyzOLKAu8WfeJWYIW1zi1pP5UHF5ie1v
        5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwUrcd+7ll
        B+PKVx/1DjEycTAeYpTgYFYS4d32xjZRiDclsbIqtSg/vqg0J7X4EKMp0DsTmaVEk/OBqSKv
        JN7QzMDU0MTM0sDU0sxYSZzX5MiaeCGB9MSS1OzU1ILUIpg+Jg5OqQYmvzX/lPce3TXn1a7G
        +Q2Pklad277o73f3xPm75dfW32Bf3MQUEjfpG3v5qqw1HN1Ji9xWTLh58Er2O+d1t89duTdf
        Z/0Jlj1GXFv2S/yNDjL50LegIfm5ndhbBtlz689xcXZ3H5jWHrww+aql69EFrSlH+48u3+lz
        +XVmiUaE68S2KRUfOHsyb1euyLC24NvKvlk+T4190TvumUXsl/8Xb71+lrVhOWeOwynL5P7K
        aHPFzse6+z9ttI89fPEPs/S1oD+Kwdu42xae3rk0TcP07tno6d/+Fbwvc/Xb3PTskVlmVF7S
        PKneA3qXN1mENrhslQ+wfF/0pn5raburzdcq5pnfU9sum+6TmFL466lvhhJLcUaioRZzUXEi
        AJkSNS9dAwAA
X-CMS-MailID: 20210913161327eucas1p173a416725e7887f9055aa1b14f0e5431
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210907085123eucas1p22c14a324393cade0c7b9cc6b1565ab84
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210907085123eucas1p22c14a324393cade0c7b9cc6b1565ab84
References: <CGME20210907085123eucas1p22c14a324393cade0c7b9cc6b1565ab84@eucas1p2.samsung.com>
        <20210907085115.4254-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.09.2021 10:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately

Thanks for the patch. I have applied it with summary line shortened to
"clk: samsung: exynos5433: Make use of devm_platform_ioremap_resource()".

-- 
Regards,
Sylwester
