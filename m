Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19754C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 22 Nov 2021 10:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbhKVKFH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 22 Nov 2021 05:05:07 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49574 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239092AbhKVKFG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:05:06 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211122100159euoutp02ed6234844c0b917282d59e98d0509c36~51hORupGD1187611876euoutp027
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Nov 2021 10:01:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211122100159euoutp02ed6234844c0b917282d59e98d0509c36~51hORupGD1187611876euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1637575319;
        bh=izJPFDq6gJoHKSNSUhfTnX2QS0k0c79bz/RasiifgC8=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=cj18HsxWMduVzmm2Oav3I87LYMMtMPE+YdoC3mn161U8g44AcTCNo8/IlsxWC2bEW
         msdzJHqpuw5b9l1J3MDoK0GqBJmI7nRmcakr6GpV11rHk8Wei7tK02qBAtN3ZGqex2
         ZhKm6Z04RnTmM7WbXtRNVTmz5A/u3uaskr9rjliM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211122100158eucas1p16caf4868a630f4181542134fbee5179a~51hN-GXtX0053800538eucas1p1I;
        Mon, 22 Nov 2021 10:01:58 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7A.E9.10260.69A6B916; Mon, 22
        Nov 2021 10:01:58 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211122100158eucas1p198528016b824d3c428fbd64b5ce9b526~51hNiLZmh0114501145eucas1p1T;
        Mon, 22 Nov 2021 10:01:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211122100158eusmtrp14e31df5798217051c7d02c251e4e25e6~51hNhLWFa2552225522eusmtrp1Q;
        Mon, 22 Nov 2021 10:01:58 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-b6-619b6a962d81
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.21.09522.69A6B916; Mon, 22
        Nov 2021 10:01:58 +0000 (GMT)
Received: from [106.210.134.141] (unknown [106.210.134.141]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211122100157eusmtip22ad39c90e0dfce9559e2fa20b24bfe6b~51hMxdwM90393903939eusmtip2k;
        Mon, 22 Nov 2021 10:01:57 +0000 (GMT)
Message-ID: <80a4e869-0a88-a523-2abd-37a0375e75c4@samsung.com>
Date:   Mon, 22 Nov 2021 11:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 6/6] clk: samsung: exynos850: Keep some crucial clocks
 running
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
In-Reply-To: <20211121232741.6967-7-semen.protsenko@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHKsWRmVeSWpSXmKPExsWy7djP87rTsmYnGvy5omFx/ctzVov5R86x
        Wmx8+4PJYtPja6wWH3vusVpc3jWHzWLG+X1MFhdPuVr8ON7HbNG69wi7xb9rG1ksnvcBxVft
        +sNocfz9Y0YHPo/3N1rZPWY19LJ57Jx1l91j06pONo871/aweWxeUu/Rt2UVo8fnTXIBHFFc
        NimpOZllqUX6dglcGUc+/mMt+MVccXjPHeYGxsnMXYycHBICJhKrznwEs4UEVjBKvN+Z0sXI
        BWR/YZQ4NaOdHcL5zChxfPU3NpiOjlM3GSESyxklWn9eZYZwPjJKdHxdzdLFyMHBK2AnceOB
        BkgDi4CqxO9XkxhBbF4BQYmTM5+wgNiiAkkSp1snga0WFgiRmHPrNSuIzSwgLnHryXwmEFtE
        IFxiyaf9YPOZBd4yS9zY8IAdJMEmYCjRe7QPbCingL3Ezd2roJrlJba/nQPWICGwnlPi2O+j
        UI+6SOzecATqBWGJV8e3sEPYMhKnJ/ewQDQ0M0r07L7NDuFMYJS4f3wBI0SVtcSdc7/YQF5j
        FtCUWL9LHyLsKHFm+X5WkLCEAJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtIvF71XQmCFtKovvJ
        f5YJjEqzkMJlFpL/ZyF5ZxbC3gWMLKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECk9zp
        f8e/7mBc8eqj3iFGJg7GQ4wSHMxKIrwcG6YnCvGmJFZWpRblxxeV5qQWH2KU5mBREucV+dOQ
        KCSQnliSmp2aWpBaBJNl4uCUamCSXHqu/NLmtnmbq09Gbw1fr3kngiXaPnBi+8qAjINSCrE1
        jrwHrtWGm6hXT+7fYvqp9sHrY1v2maY93MXWe/L3LKuwr60nj15zOzXhuek9H6O2f4469bby
        rgfq3t336OSpu+X7KJrnbKe82/yKBfy/S3YHnNoRPLvp08n672s0SpZ6Pwtc1nxe5vqauasD
        +5dkXfnx+Iza/aYlWQvUJD3DJf/8y/+4+9q35l8XXR0YDvX9kDzZo3WdPVX30ln3WUeNRO+p
        V19f820qw5nalocHfDOcJ+zP59F+4BDP4sxmb/TIvn6+xfI3+o5WSzr87tXeFj69//W3n728
        rYxJaxTMJ5f/Ydy+8toCv+mGpTvnK7EUZyQaajEXFScCALhpao3hAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xe7rTsmYnGjR/Zre4/uU5q8X8I+dY
        LTa+/cFksenxNVaLjz33WC0u75rDZjHj/D4mi4unXC1+HO9jtmjde4Td4t+1jSwWz/uA4qt2
        /WG0OP7+MaMDn8f7G63sHrMaetk8ds66y+6xaVUnm8eda3vYPDYvqffo27KK0ePzJrkAjig9
        m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jCMf/7EW
        /GKuOLznDnMD42TmLkZODgkBE4mOUzcZuxi5OIQEljJKbG87wdLFyAGUkJKY36IEUSMs8eda
        FxtEzXtGiW1fOllBangF7CRuPNAAqWERUJX4/WoSI4jNKyAocXLmExYQW1QgSaL/+y6wXcIC
        IRJzbr1mBbGZBcQlbj2ZzwQyRkQgXGLxPl2Q8cwC75klJne+BasREjjOKHH4nzeIzSZgKNF7
        tA9sPqeAvcTN3avATmAWUJdYP08IYqS8xPa3c5gnMArNQnLFLCTbZiF0zELSsYCRZRWjSGpp
        cW56brGhXnFibnFpXrpecn7uJkZgNG879nPzDsZ5rz7qHWJk4mA8xCjBwawkwsuxYXqiEG9K
        YmVValF+fFFpTmrxIUZTYEhMZJYSTc4HppO8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS
        1OzU1ILUIpg+Jg5OqQam/bvPyWlyrPhk9Id3Wmx68M1Ns5bOi047+uxsYqTn91jG5X2bt9ru
        WPc48E7izYJZk15/XtpjwxX7Xt069FXbNbW909+ZdMs8XKj5ftG7T1t1+WYfv5fBaCj9trZN
        uLfzcnhnwkmb6b/s/93mbDpfG9dm+HrGjMKmxiP3XG8VT2Ff7lK0XfTQMXYeDaOKn+KGyrt2
        +h+43X64Pvy2yUfTNfFHzCr+K+kk1TyrdXu5rjle/6jk3r1Tz8SKdN6fOnt9m66pnPKiVy9v
        uc07+YKvcH7oglXP+1W4rm43NC7a1/g0ZENwQegJtcO1R/s+NFj+Cd2/orj9bqDVd5vCv4dZ
        Hi+2n3ioad9e7XcLwz75BiqxFGckGmoxFxUnAgApa4ZibwMAAA==
X-CMS-MailID: 20211122100158eucas1p198528016b824d3c428fbd64b5ce9b526
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211121232755eucas1p123f1ca7278430865e5585abd1ded8b45
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211121232755eucas1p123f1ca7278430865e5585abd1ded8b45
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
        <CGME20211121232755eucas1p123f1ca7278430865e5585abd1ded8b45@eucas1p1.samsung.com>
        <20211121232741.6967-7-semen.protsenko@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22.11.2021 00:27, Sam Protsenko wrote:
> Some clocks shouldn't be automatically disabled in clk_disable_unused(),
> otherwise kernel hangs. Mark those clocks with:
>   - CLK_IS_CRITICAL flag, when there won't be any consumers for that
>     clock, but system can't function when it's gated
>   - CLK_IGNORE_UNUSED flag, when consumer driver will be probably added
>     later
> 
> That makes it possible to run the kernel without passing the
> "clk_ignore_unused" param.

Applied, thanks.

