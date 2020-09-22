Return-Path: <SRS0=odV2=C7=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E43C2D0E2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 08:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AC64239D2
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Sep 2020 08:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dF+Dqn99"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIVIEg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:04:36 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58868 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgIVIEe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 04:04:34 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200922080432euoutp01d22c0c97297305ecf6a6a046d1ac1091~3DHEcHao63141231412euoutp01e
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Sep 2020 08:04:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200922080432euoutp01d22c0c97297305ecf6a6a046d1ac1091~3DHEcHao63141231412euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600761872;
        bh=t5JgHuaA0LpHPq4LbftovBXGuGuzQ1cQIB+yPo9jjcs=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=dF+Dqn99CopSxq1ozccMHygJgkX9xFlCP23wGeXqtrS5UeMsxhJMFW6R7ljaeCwFs
         VnUqqKUREeeFzTOpWEhH0Y0hCcNFR5l7jk7jFoyJ5QBk6FwJIBws86b7gVizntUofB
         Fw+kr57Ksb+jtcfsi4fk4XKXNcoxuPThG/hnbCHM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200922080432eucas1p2937967313737d3aacd37477a069791f9~3DHEHaiiS2319723197eucas1p2b;
        Tue, 22 Sep 2020 08:04:32 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 76.DC.06318.F00B96F5; Tue, 22
        Sep 2020 09:04:31 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200922080431eucas1p23ff07fa3bb202e7d3ab90a55aa833d48~3DHDqRS-x0085000850eucas1p2v;
        Tue, 22 Sep 2020 08:04:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200922080431eusmtrp1d7fab84d77fa82174f81f89cb23a7f5e~3DHDplAdy1146911469eusmtrp1V;
        Tue, 22 Sep 2020 08:04:31 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-49-5f69b00f8bbf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.71.06314.F00B96F5; Tue, 22
        Sep 2020 09:04:31 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200922080431eusmtip1759b71075b7ca2ba90c31bf9521834c9~3DHDLncnh0969309693eusmtip1O;
        Tue, 22 Sep 2020 08:04:31 +0000 (GMT)
Subject: Re: [PATCH] clk: s2mps11: initialize driver via
 module_platform_driver
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fc06b97d-a2b4-f263-fba4-505dfc75c43f@samsung.com>
Date:   Tue, 22 Sep 2020 10:04:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921203558.19554-1-krzk@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7djP87r8GzLjDX5usbbYOGM9q8X58xvY
        LT723GO1uLxrDpvFjPP7mCwunnK1uLjiC5PFv2sbWRw4PN7faGX32LSqk82jb8sqRo/Pm+QC
        WKK4bFJSczLLUov07RK4Mr5fnMRU0MtTceXTHtYGxhlcXYycHBICJhKHnu1jA7GFBFYwSrQ2
        mELYXxglnq2Wh7A/M0rsOK4MU79jRSN7FyMXUHw5o8TuZetZIZz3jBKHv35jBKkSFgiU+H3s
        OhNIQkRgK5PExhmdYCvYBAwlut52gdm8AnYSkw9sZAKxWQRUJZZc6gFrFhWIkzh26hELRI2g
        xMmZT4BsDg5OAVOJHe85QcLMAvIS29/OYYawxSVuPZkPtktCYBW7xOPj71khTnWRuLRnBROE
        LSzx6vgWdghbRuL05B4WiIZmRomH59ayQzg9jBKXm2YwQlRZS9w594sNZDOzgKbE+l36EGFH
        iWfPvjKDhCUE+CRuvBWEOIJPYtK26VBhXomONiGIajWJWcfXwa09eOESVImHxN17BRMYFWch
        eXIWks9mIflsFsIJCxhZVjGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgQmn9P/jn/dwbjv
        T9IhRgEORiUe3gNTM+KFWBPLiitzDzFKcDArifA6nT0dJ8SbklhZlVqUH19UmpNafIhRmoNF
        SZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVAOjaefe5nA9bbf/6cfyZa6ybeBmUN7uvfnkjnv6
        t69vWvP0g+3qx8obdjNMuZn+7Py3vGntH9QZHktsN27btin9985V+R55c3z87q3w0v+TNSNs
        gZNatnPdtAVXgty5St9JWjIftZhtFtC222E7g5qs66vFtdF1G3eYbbKNDshuM16R27bHlddM
        iaU4I9FQi7moOBEAqLuKzjoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7r8GzLjDab/UrHYOGM9q8X58xvY
        LT723GO1uLxrDpvFjPP7mCwunnK1uLjiC5PFv2sbWRw4PN7faGX32LSqk82jb8sqRo/Pm+QC
        WKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr5f
        nMRU0MtTceXTHtYGxhlcXYycHBICJhI7VjSydzFycQgJLGWU+Hb1PhtEQkbi5LQGVghbWOLP
        tS42iKK3jBLTf+xnBkkICwRK/D52nQkkISKwlUmib3c7WEJIoINRYv87FxCbTcBQouttF9hU
        XgE7ickHNjKB2CwCqhJLLvUwgtiiAnESZ3peQNUISpyc+YSli5GDg1PAVGLHe06QMLOAmcS8
        zQ+ZIWx5ie1v50DZ4hK3nsxnmsAoOAtJ9ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xoV5xYm5x
        aV66XnJ+7iZGYGxtO/Zz8w7GSxuDDzEKcDAq8fAemJoRL8SaWFZcmXuIUYKDWUmE1+ns6Tgh
        3pTEyqrUovz4otKc1OJDjKZAv01klhJNzgfGfV5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0
        xJLU7NTUgtQimD4mDk6pBsYJ33327vCdM3PuB9MPWeI7mI9e/xe52+yw4PziKdmpAaXWB6zC
        9kYefBN86ocIS9cc1SfCZTm3w7ZLXDL12VdnI1XivP9w0cVfbgeSp3VUPN3dfC/I9LehqtWP
        bZO6eJYmazQFvjrjO+/jjlLDXEFnUXGRhl7OV/6nmxJjt8pOWOToNM0qea4SS3FGoqEWc1Fx
        IgC1xMfPwwIAAA==
X-CMS-MailID: 20200922080431eucas1p23ff07fa3bb202e7d3ab90a55aa833d48
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200921203614eucas1p19b9203eb6bbd7b80647f7e48705c731a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200921203614eucas1p19b9203eb6bbd7b80647f7e48705c731a
References: <CGME20200921203614eucas1p19b9203eb6bbd7b80647f7e48705c731a@eucas1p1.samsung.com>
        <20200921203558.19554-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 21.09.2020 22:35, Krzysztof Kozlowski wrote:
> The driver was using subsys_initcall() because in old times deferred
> probe was not supported everywhere and specific ordering was needed.
> Since probe deferral works fine and specific ordering is discouraged
> (hides dependencies between drivers and couples their boot order), the
> driver can be converted to regular module_platform_driver.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/clk/clk-s2mps11.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 2ce370c804aa..aa21371f9104 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -267,18 +267,7 @@ static struct platform_driver s2mps11_clk_driver = {
>   	.remove = s2mps11_clk_remove,
>   	.id_table = s2mps11_clk_id,
>   };
> -
> -static int __init s2mps11_clk_init(void)
> -{
> -	return platform_driver_register(&s2mps11_clk_driver);
> -}
> -subsys_initcall(s2mps11_clk_init);
> -
> -static void __exit s2mps11_clk_cleanup(void)
> -{
> -	platform_driver_unregister(&s2mps11_clk_driver);
> -}
> -module_exit(s2mps11_clk_cleanup);
> +module_platform_driver(s2mps11_clk_driver);
>   
>   MODULE_DESCRIPTION("S2MPS11 Clock Driver");
>   MODULE_AUTHOR("Yadwinder Singh Brar <yadi.brar@samsung.com>");

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

