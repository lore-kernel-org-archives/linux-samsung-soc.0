Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BA1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 22:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239807AbhKVWH1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 17:07:27 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61598 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239646AbhKVWHZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 17:07:25 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211122220416euoutp0197f63cf61241d2ee34e32f59a60d227e~5-X3VZkVo2261722617euoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 22:04:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211122220416euoutp0197f63cf61241d2ee34e32f59a60d227e~5-X3VZkVo2261722617euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637618656;
        bh=ynjXecPy+x67xYtTl2zbxpDhdENHt074ow1WT4E9cBU=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=OawMEl5As2nOSeQqux2L/uF4pLlxegHJhPp4DzXNXUUankmL4e4JIfTssqBXH5wgK
         c8ViAGt016gtOUz4XIRcBM3fVN4pvaX/hMgZTMRqedmd5HZxFlzt3MBLf3xkswSTLY
         25epVBwnbJNMm7B2rOQajfOo7t03CB8VmcymDpLg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211122220415eucas1p228be94b02883e594aa747b4808d1ba11~5-X2W2yAI2755827558eucas1p20;
        Mon, 22 Nov 2021 22:04:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id F6.2B.10260.FD31C916; Mon, 22
        Nov 2021 22:04:15 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211122220414eucas1p2aed07333fea9caccf343404365a8a0f5~5-X1tGKi32755827558eucas1p2x;
        Mon, 22 Nov 2021 22:04:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211122220414eusmtrp25b1be8ede9a482596ccfef5ecb53d3ef~5-X1sL7y11106011060eusmtrp2J;
        Mon, 22 Nov 2021 22:04:14 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-5c-619c13dfae7b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.69.09522.ED31C916; Mon, 22
        Nov 2021 22:04:14 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211122220413eusmtip183fbf441f0a72e3fa73503374721a174~5-X1AhJ9u1648416484eusmtip1D;
        Mon, 22 Nov 2021 22:04:13 +0000 (GMT)
Message-ID: <95864889-e80b-e627-7b63-1079caa0fa12@samsung.com>
Date:   Mon, 22 Nov 2021 23:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20211122144206.23134-1-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7djP87r3heckGix7xGtx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFFc
        NimpOZllqUX6dglcGe3f/zEXrGKvOHhlDVMDYyNbFyMHh4SAicT19QZdjFwcQgIrGCWmNp1m
        hXC+MEqcvP2FCcL5zCjx/uc0oAwnWMepowsYIRLLGSUWLTzHBuF8BGp5tJsJpIpXwE5i1e7P
        YDaLgKpE/9JHLBBxQYmTM5+A2aICSRKnWycxg9jCAl4S3Tfvg8WZBcQlbj2ZD9YrIhAuseTT
        fmaQBcwCb5klbmx4wA6SYBMwlOg92scIYnMKOEhsWNTLDNEsL7H97RywBgmB5ZwSXx+sYIG4
        20Wib8dNZghbWOLV8S3sELaMxP+d85kgGpoZJXp232aHcCYwStw/voARospa4s65X+AwYxbQ
        lFi/Sx8SfI4SE17kQph8EjfeCkLcwCcxadt0Zogwr0RHmxDEDBWJ36umM0HYUhLdT/6zTGBU
        moUULLOQvD8LyTezENYuYGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZjkTv87/nUH
        44pXH/UOMTJxMB5ilOBgVhLhvbZkdqIQb0piZVVqUX58UWlOavEhRmkOFiVxXpE/DYlCAumJ
        JanZqakFqUUwWSYOTqkGJsN7X65e95kiYbRwxYLsnMRjPx71fr8o9d5MddVm880zSxRXy26V
        PecoKZPh2nJL0vDNep74XtsqpfQwR43so/+2XIiIkTwSw6AQqfSrK7PV82CExuXnJlsLciJO
        7+Rp1eDcvalUNohJcc21m4tnfI9fUxbHM2HWop06YSIMO9eIO9bflmR8E8zr89VkpnXWkuCY
        h/FBh67d1JjQ8MJ1sbJbc0fV+/vlj8VOpKzf+mlhg9NCBdbbxXdLV5w1M12ZkcXTE2i4ZQ9T
        SZJGgyaP+co1yxn6El9WJ+zI19X7m5QYlJlu2ivzRXDKHt2v/CZtTO8WLPU/qvh3YcLp23o/
        G+bn/Qm/LLRAIz2cNcZbiaU4I9FQi7moOBEA3Qxlh+EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRmVeSWpSXmKPExsVy+t/xu7r3hOckGmy7LWNx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFF6
        NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Ge3f/zEX
        rGKvOHhlDVMDYyNbFyMnh4SAicSpowsYQWwhgaWMEr87C7oYOYDiUhLzW5QgSoQl/lzrAirn
        Aip5zyjxaftisF5eATuJVbs/M4HYLAKqEv1LH7FAxAUlTs58AmaLCiRJ9H/fxQxiCwt4SXTf
        vA8WZxYQl7j1ZD4TyC4RgXCJxft0QeYzC7xnlpjc+ZYVYtlkRokZR9rAlrEJGEr0Hu0DO5RT
        wEFiw6JeZpBmZgF1ifXzhCBmyktsfzuHeQKj0CwkZ8xCsm4WQscsJB0LGFlWMYqklhbnpucW
        G+oVJ+YWl+al6yXn525iBMbztmM/N+9gnPfqo94hRiYOxkOMEhzMSiK815bMThTiTUmsrEot
        yo8vKs1JLT7EaAoMionMUqLJ+cCEklcSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpa
        kFoE08fEwSnVwNS2NOXMz+kM9kUVK/dfmtc+f3Hb5w+PfO0tPeT4pspe4amd1prQHO1cNzGf
        xT0o+eui3Wsst5f5ZsYYJT9NnnXX6HHGPAXvp+Wsj6TUWl9f91+/ak3NdE6XL2Vz6z59WTX1
        3bof5UeTk4ycfHoWTt63fuKOOXzNjZlT5vXemvT0X9LNmj+1jpeiZ3e+MIr7fKgjMLz7ebBt
        xsM39ifEBJPEC58Xh0YxaNvqqkw2YV+78DTjg4qIH2uF5aesnHFg/2YvFxOBZfkbL75vPTyr
        qGpr4skvlTwFz97q2Z/8NrXsR+h7jql8Ec9v/H1WdKHiQa5d6jmmtPmerh9jyp1kJX4dcJ9a
        PHEa/3rPCZYTNLKVWIozEg21mIuKEwE5jDC+cAMAAA==
X-CMS-MailID: 20211122220414eucas1p2aed07333fea9caccf343404365a8a0f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211122144217eucas1p21c5f4930563ee051d625bb8e3a932a4a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211122144217eucas1p21c5f4930563ee051d625bb8e3a932a4a
References: <CGME20211122144217eucas1p21c5f4930563ee051d625bb8e3a932a4a@eucas1p2.samsung.com>
        <20211122144206.23134-1-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 15:42, Sam Protsenko wrote:
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register CMU_PERI clocks early, using CLK_OF_DECLARE(). CMU_TOP
> generates clocks needed for CMU_PERI, but it's already registered early.
> 
> While at it, let's cleanup the code a bit, by extracting everything
> related to CMU initialization and registration to the separate function.

Applied, thanks.
