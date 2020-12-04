Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF18C4361A
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 09:31:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9047225AB
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Dec 2020 09:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgLDJbj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Dec 2020 04:31:39 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:57695 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLDJbh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:31:37 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20201204093054epoutp040806642e1038f9371eca989cc2ec44b5~NeYUQ2gYR0914309143epoutp04X
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Dec 2020 09:30:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20201204093054epoutp040806642e1038f9371eca989cc2ec44b5~NeYUQ2gYR0914309143epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1607074254;
        bh=FJ+B3zIcBgxljhfRxX4OruLMUsDxRsFDGdDKk1UNK/I=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mHQxwmNmcUoCsZOcrxaQHZubI+O7QJqgfhHOyxapvndS2ACqHgT3UIG/GZH9y4Q1E
         lyYSy+B7IgDjZvj2K9tM9+S4ULW00hR5jQtBkBmYG4GXRdhhdiNFvY3gFI1zLQ/gce
         +j3W/yxzPCRa60FreehCZ6QHrp+vhwb5oN87uYn4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20201204093053epcas1p39c6745c23d1f4d7a8464710e3f870336~NeYTzQdSP1217112171epcas1p3E;
        Fri,  4 Dec 2020 09:30:53 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.153]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4CnSB34Q3Wz4x9Pp; Fri,  4 Dec
        2020 09:30:51 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        2C.BD.09577.BC10ACF5; Fri,  4 Dec 2020 18:30:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20201204093051epcas1p39bbc7d2bf9ebdc1811a284774cc6e254~NeYRJgUAv1209212092epcas1p3B;
        Fri,  4 Dec 2020 09:30:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201204093051epsmtrp12c46f11ae6900145943f2141621b1e8a~NeYRDUnUQ1305413054epsmtrp1r;
        Fri,  4 Dec 2020 09:30:51 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-86-5fca01cbdcd6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CD.F3.08745.AC10ACF5; Fri,  4 Dec 2020 18:30:50 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201204093050epsmtip26710b06ca99820b6db330da2e21ad794~NeYQxrKMc2677726777epsmtip24;
        Fri,  4 Dec 2020 09:30:50 +0000 (GMT)
Subject: Re: [PATCH] [v2] clk: samsung: mark PM functions as __maybe_unused
To:     Arnd Bergmann <arnd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <f7df29db-0fc9-016a-6e01-91974014c917@samsung.com>
Date:   Fri, 4 Dec 2020 18:45:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201204091616.4128366-1-arnd@kernel.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRmVeSWpSXmKPExsWy7bCmvu5pxlPxBmt7FC3+TjrGbrFtyyZW
        i/PnN7BbbHp8jdXiY889VovLu+awWcw4v4/J4uIpV4vDb9pZLf5d28hisWrXH0YHbo/fvyYx
        ery/0crusXPWXXaPTas62Tw2L6n36NuyitHj8ya5APaobJuM1MSU1CKF1Lzk/JTMvHRbJe/g
        eOd4UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoBOVFMoSc0qBQgGJxcVK+nY2RfmlJakKGfnF
        JbZKqQUpOQWWBXrFibnFpXnpesn5uVaGBgZGpkCFCdkZ685dZitoFahYf7CFtYFxCW8XIyeH
        hICJROP7RtYuRi4OIYEdjBJnV81jhnA+MUpsuvaTEcL5zCjxdNIMVpiWQze+Q1XtYpTYOmMC
        lPOeUWLb7DPMIFXCAt4SH+/fB0uICHxglPjdv4AJxGEWWA40ePcMJpAqNgEtif0vbrCB2PwC
        ihJXfzxmBLF5BewkXnfPBdvHIqAi8XLPZbC4qECYxMltLVA1ghInZz5hAbE5Bcwlrk1YBzaT
        WUBc4taT+VC2vMT2t3PArpAQOMIhsanhEiPEEy4S/24vZoGwhSVeHd/CDmFLSbzsb4OyqyVW
        njzCBtHcwSixZf8FaAgYS+xfOhloAwfQBk2J9bv0IcKKEjt/z2WEWMwn8e5rDytIiYQAr0RH
        mxBEibLE5Qd3mSBsSYnF7Z1sExiVZiF5ZxaSF2YheWEWwrIFjCyrGMVSC4pz01OLDQtMkSN8
        EyM4BWtZ7mCc/vaD3iFGJg7GQ4wSHMxKIryxqifjhXhTEiurUovy44tKc1KLDzGaAgN4IrOU
        aHI+MAvklcQbmhoZGxtbmBiamRoaKonz/tHuiBcSSE8sSc1OTS1ILYLpY+LglGpgKszl9PYp
        18ppkbiVzcDwLNZJWW9CzUklsfcLNq68lr7GUP3+hXcrwnROhUzs3Lc8+J0p17bre1Iic1Ib
        P/H8mbdK3EDSuMfwWs7jR76b7P9OkBJ/+3s5T9Pmy+sO+k1Ytn96p/3XfWY/Jglkft5gmJRW
        M3vaHXeVe8cKDMNNgjqmSOf43PhTe3jeXnZe9cnZ823WZyzeVH3K9/Ez9uSSY2vnqlrGt+dO
        4kxZ7HhmkcERTSd93+JVtxk1HGbcFOp4ej3p38bLvEz6Gka19/qLIs4rtEtcmHNN7PWF1GuJ
        XVPDRB5p/vCRn5C8KTb/27ld7xSWei3+aHnQ7aCl1YvzrwROBayq0mPPjl7S0l9ySImlOCPR
        UIu5qDgRAMQ9e4pKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSvO4pxlPxBlfumFr8nXSM3WLblk2s
        FufPb2C32PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhaH37SzWvy7tpHFYtWuP4wO3B6/f01i
        9Hh/o5XdY+esu+wem1Z1snlsXlLv0bdlFaPH501yAexRXDYpqTmZZalF+nYJXBnrzl1mK2gV
        qFh/sIW1gXEJbxcjJ4eEgInEoRvfmbsYuTiEBHYwShy5dZwZIiEpMe3iUSCbA8gWljh8uBii
        5i2jxKx3z5hAaoQFvCU+3r8P1iwi8IlR4sXEGUwgDrPAckaJpisdTBAtXYwSHdc+sYC0sAlo
        Sex/cYMNxOYXUJS4+uMxI4jNK2An8bp7LiuIzSKgIvFyz2WwuKhAmMTOJY+ZIGoEJU7OfAI2
        h1PAXOLahHVgcWYBdYk/8y4xQ9jiEreezIeKy0tsfzuHeQKj8Cwk7bOQtMxC0jILScsCRpZV
        jJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBsailtYNxz6oPeocYmTgYDzFKcDArifDG
        qp6MF+JNSaysSi3Kjy8qzUktPsQozcGiJM57oQsoJZCeWJKanZpakFoEk2Xi4JRqYIoSm1rQ
        P8dWlW1NYKBe8wWJ5/6qKzZc0H70Ztec2HPSpwM3OT1hFPHfvv7mA6fMkpDVGl2q/fWPzse7
        r2Pd7JI9/6rnxpy07ZvezU1ayVdy4NatLiE3n1ONCxOX9l1/ZGRUPHtZdt0dh8Ay901LEzRe
        RUs1/tGuNbr99AWrVPovdc9LLWahCi4slaUShhVMh5vsZM/aKskHTBKe1fxdZ2ftf227T4v7
        VPc2cyfyPY5a/PiCtrOkGb9b4P2Uq34FTieXtwtvOPAynvvqdbZOt98LlKQnhMU6lR69euCV
        nZiW6u1LmnEt1kmp8f5f408EHlp3slNX8T2b7V2z7o8lF8x0NQ4LzbF0rJ25bv8kJZbijERD
        Leai4kQAvxybBTQDAAA=
X-CMS-MailID: 20201204093051epcas1p39bbc7d2bf9ebdc1811a284774cc6e254
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201204091801epcas1p2a67474fad16d0c71f6b9a36cc72241ab
References: <CGME20201204091801epcas1p2a67474fad16d0c71f6b9a36cc72241ab@epcas1p2.samsung.com>
        <20201204091616.4128366-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/4/20 6:16 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The use of SIMPLE_DEV_PM_OPS() means that the suspend/resume
> functions are now unused when CONFIG_PM is disabled:
> 
> drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
>   219 | static int exynos_clkout_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
>   210 | static int exynos_clkout_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~
> 
> Mark them as __maybe_unused to shut up the otherwise harmless warning.
> 
> Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: add proper changelog text
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 9ec2f40cc400..e6d6cbf8c4e6 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -207,7 +207,7 @@ static int exynos_clkout_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int exynos_clkout_suspend(struct device *dev)
> +static int __maybe_unused exynos_clkout_suspend(struct device *dev)
>  {
>  	struct exynos_clkout *clkout = dev_get_drvdata(dev);
>  
> @@ -216,7 +216,7 @@ static int exynos_clkout_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int exynos_clkout_resume(struct device *dev)
> +static int __maybe_unused exynos_clkout_resume(struct device *dev)
>  {
>  	struct exynos_clkout *clkout = dev_get_drvdata(dev);
>  
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi
Samsung Electronics
