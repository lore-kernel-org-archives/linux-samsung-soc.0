Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C2AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 12:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B15B611C2
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Sep 2021 12:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233791AbhIOMxS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Sep 2021 08:53:18 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23582 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbhIOMxQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 08:53:16 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210915125156euoutp0255a6c5c713e4126951a0cacbfbc056af~k-_NMt-SK2119221192euoutp02X
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 12:51:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210915125156euoutp0255a6c5c713e4126951a0cacbfbc056af~k-_NMt-SK2119221192euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1631710316;
        bh=03ujAQ/c7ECVsa5KofPPIAP+m4Mo6XF14OM04r2XKJw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mTmqiXMlKCFzFaFmdj7kpvbKxAJqJwQv/djdI5QoSFCt+fb3r5s1J7mY6s0Sa5mAz
         nD9H6d8R/ovBiPwuPAJYQLsHstL4JK8m1vH2qOMjIXsDAb4J36nbafq8R1weowtvpI
         YebgNbwNN+29Rn1TtWXa1gH5a/UE7aVP5Qn9L36Y=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210915125156eucas1p12243ad632605b39bf97dfd841fb56e7c~k-_Mw66VD2997129971eucas1p1S;
        Wed, 15 Sep 2021 12:51:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EF.BF.56448.C6CE1416; Wed, 15
        Sep 2021 13:51:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210915125155eucas1p204553084818cc0e14ea20acc295519cb~k-_MLv-By0821808218eucas1p2U;
        Wed, 15 Sep 2021 12:51:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210915125155eusmtrp1213fd6a52fe4c505cb90093d4c500a95~k-_MKuv6W1149811498eusmtrp1K;
        Wed, 15 Sep 2021 12:51:55 +0000 (GMT)
X-AuditID: cbfec7f5-d53ff7000002dc80-7c-6141ec6cf2b2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AF.69.20981.B6CE1416; Wed, 15
        Sep 2021 13:51:55 +0100 (BST)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210915125154eusmtip2f8cac74da6df926a2f4be386cad6fd07~k-_LLOEb62365823658eusmtip2O;
        Wed, 15 Sep 2021 12:51:54 +0000 (GMT)
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <b44e1c4a-5abc-7a27-e9ae-d4645d04527a@samsung.com>
Date:   Wed, 15 Sep 2021 14:51:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-2-semen.protsenko@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUwbZRjfe3e9XiutR5npE5iOtDOyJYPhTHZGh5CM5Ga2ZRsuMSSOXdiF
        FVogLR9OpzJwCBUQcWOug0DJHF0lQ75HxUWgWNdWKg7pwvjaSsAwiTTMpPtode3FyH+/r+d5
        3l/yUrjiviiW0uQX8fp8TqsipUT/T488O7V/pnG7bNMSZs3Shhjvw2UR02IfFzHuJzuZrtUA
        xnT7pkSMv2ZOxNy2NZHM156bGDPhTGcCjjqcOfeDXcxcCEyTTGiqi2CW656Zztl1MTPprsIY
        q+0pSlWwf905J2ZNZbUkO2iaFbPd1mqSnZkaItmeK5+wdb1WxK53v3SYypS+eZLXakp4fVLK
        CempW5U2VNikfN85OycuQzMKI6IooF+DgUCmEUkpBW1BMDR4UyyQhwh+Di1hAllHYPNex41I
        EpkwL9xFgtGOoNf8CyEQP4JrZi8RTsXQb0HLmC8yvpkOILDf9kdGcHoKh/m+7yIpkk6G2rE6
        FMYyOgU+8w5EdIJ+GSw1RjKMX6CzoTFYjguZaLh1aTGSkdCp0NrhiOg4rYTpxRZMwFthYLUJ
        Dx8DelQCoW/PYkLVfeCeUAodYmDF0SsW8BZwfVVDCPkKBDXf3xULpB7BvKMVCak3YGb8MRle
        hNPbodOWJMhpsPDHMiHsl8Od1WjhDXJo6L+IC7IMqioVQnobPLFexAQcC58v/kPUI5VpQzPT
        hjamDW1M/99tRYQVKfligy6HN+zO50sTDZzOUJyfk5hdoOtGz76hK+T4+wayrPgTRxBGoREE
        FK7aLPv1TBqnkJ3kTn/A6wuy9MVa3jCC4ihCpZTZ+jqyFHQOV8Tn8Xwhr//PxShJbBnW6Hmv
        PjR8PP6eaVAfpTbXLtqz11yUfqV2f/uLHQfOH1w7+2Hsx0dvbG1p7pzUxD9Q7DJ1ve3KW3oK
        wWS59PqwXd1GVkxov8E/7dI9Kj4x+rgSOX/zWDjzmcaCOKCiK3wJQxpJaFMe7yz1+uOWOl3n
        h3ri1PtOF84H28rcr2Tk7lgY2HNhr+aepzX1nZ7RPZn91V/MVJQHm5u9lxo0H+2+LPkSXk0f
        G8/a1vhgqdqp28L6SuPp9Sp/bgmm356rVEcNcz8e26S9GnU54dqVopIjk+XpB+TO5L37+44e
        Vng8vyfo3LlHnk+akL/e/pxvznfoUNCYkuDIyFDzDcffjbmvIgynuOQduN7A/QsgRzDs9QMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKIsWRmVeSWpSXmKPExsVy+t/xe7rZbxwTDdrXKFh8WLGI0eL6l+es
        FvOPnGO1OPNb12Lj2x9MFpseX2O1+Nhzj9Xi8q45bBYzzu9jsrh4ytXix/E+ZovWvUfYLab+
        uMVm8e/aRhaL531AyVN3P7NbXDnTwWSxatcfRgchj/c3Wtk9ZjX0snnsnHWX3WPTqk42jzvX
        9rB5bF5S79G3ZRWjx+dNcgEcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
        +nY2Kak5mWWpRfp2CXoZJ9t2MRbMEa84dfceewPjHaEuRk4OCQETiYUPbjN2MXJxCAksZZTY
        f6GHrYuRAyghJTG/RQmiRljiz7UuNoia94wS7/etYAFJCAvYS8w/+pgJJCEi8INR4uCV38wg
        DrPANWaJLft+sEK0nGSUOPG3jxGkhU3AUKL3KITNK2An0X59O9goFgFViRU9IDs4OUQFkiXe
        vv7OBFEjKHFy5hOwGk4BB4kFa44zg9jMAuoSf+ZdgrLFJW49mc8EYctLbH87h3kCo9AsJO2z
        kLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIHxv+3Yzy07GFe++qh3iJGJ
        g/EQowQHs5II74Uax0Qh3pTEyqrUovz4otKc1OJDjKZA/0xklhJNzgcmoLySeEMzA1NDEzNL
        A1NLM2MlcV6TI2vihQTSE0tSs1NTC1KLYPqYODilGpgC3+g8nPaf61PWlrUzX8TMYtv7VnvV
        5zjvLyum2J97kL2DgzvS/tDFXJ9zJeX7F7Mu+ZlpsWLecumNj1+/fXbzac350ocFpSLObxcy
        3PPk8HJedGG6PvOsuvX+ifpmJ0xPin8umOvcd/CDSUe8dPHG1rbJeSpaasH18441eun/cf2/
        MZBFu73yTMLG65kp/oc3r/L8czBVzuLwtWS+W2fU63b2KClff2r1ULlVMDTgobv19h9mlwU2
        epk6uDjqSIlZJ21N/Fm+7f5cbu4CBUF1jievMxpcNKcFXUh53+ST9YrvieGBlUnLQu7cEXqa
        WM1fY/ttNYfGx8gz68K+WrlozrfZpl4768rKLm1RTS8lluKMREMt5qLiRACKwJ3piAMAAA==
X-CMS-MailID: 20210915125155eucas1p204553084818cc0e14ea20acc295519cb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
        <CGME20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed@eucas1p1.samsung.com>
        <20210914155607.14122-2-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 14.09.2021 17:56, Sam Protsenko wrote:
> By default if bus clock has no users its "enable count" value is 0. It
> might be actually running if it's already enabled in bootloader, but
> then in some cases it can be disabled by mistake. For example, such case
> was observed when dw_mci_probe() enabled bus clock, then failed to do
> something and disabled that bus clock on error path. After that even
> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
> CMU bus clock ended up being disabled and it wasn't possible to access
> CMU registers anymore.
> 
> To avoid such cases, CMU driver must increment the ref count for that
> bus clock by running clk_prepare_enable(). There is already existing
> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> support for runtime PM"). But the clock is actually enabled only in
> Exynos5433 clock driver. Let's mimic what is done there in generic
> samsung_cmu_register_one() function, so other drivers can benefit from
> that `.clk_name' field. As was described above, it might be helpful not
> only for PM reasons, but also to prevent possible erroneous clock gating
> on error paths.
> 
> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
> flag for corresponding gate clocks. But that might be not very good
> design decision, as we might still want to disable that bus clock, e.g.
> on PM suspend.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1949ae7851b2..da65149fa502 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>  
>  	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
>  
> +	/* Keep bus clock running, so it's possible to access CMU registers */
> +	if (cmu->clk_name) {
> +		struct clk *bus_clk;
> +
> +		bus_clk = __clk_lookup(cmu->clk_name);
> +		if (bus_clk) {
> +			clk_prepare_enable(bus_clk);
> +		} else {
> +			pr_err("%s: could not find bus clock %s\n", __func__,
> +			       cmu->clk_name);
> +		}
> +	}
> +
>  	if (cmu->pll_clks)
>  		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
>  			reg_base);

I would suggest to implement runtime PM ops in your driver instead, even though
those would initially only contain single clk enable/disable. Things like 
the clk_summary will work then thanks to runtime PM support in the clk core 
(see clk_pm_runtime_* calls).
We could also make common runtime PM suspend/resume helpers but I wouldn't focus
on that too much now, it could well be done later.
And please avoid introducing new __clk_lookup() calls.

-- 
Regards,
Sylwester
