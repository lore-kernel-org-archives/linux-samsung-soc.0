From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v13 5/8] drivers: memory: add DMC driver for Exynos5422
Date: Fri, 6 Sep 2019 10:44:21 +0200
Message-ID: <72d1096b-b81e-ee21-d4e1-8b40a69ca2fe@partner.samsung.com>
References: <20190821104303.32079-1-l.luba@partner.samsung.com>
        <CGME20190821104323eucas1p1ab979133de45373866e9db1a5f63fb76@eucas1p1.samsung.com>
        <20190821104303.32079-6-l.luba@partner.samsung.com>
        <20190904183510.GC12918@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904183510.GC12918@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org



On 9/4/19 8:35 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2019 at 12:43:00PM +0200, Lukasz Luba wrote:
>> This patch adds driver for Exynos5422 Dynamic Memory Controller.
>> The driver provides support for dynamic frequency and voltage scaling
>> for DMC and DRAM. It supports changing timings of DRAM running with
>> different frequency. There is also an algorithm to calculate timigns
>> based on memory description provided in DT.
>> The patch also contains needed MAINTAINERS file update.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   MAINTAINERS                             |    8 +
>>   drivers/memory/samsung/Kconfig          |   13 +
>>   drivers/memory/samsung/Makefile         |    1 +
>>   drivers/memory/samsung/exynos5422-dmc.c | 1257 +++++++++++++++++++++++
>>   4 files changed, 1279 insertions(+)
>>   create mode 100644 drivers/memory/samsung/exynos5422-dmc.c
> 
> Thanks, applied... or almost. Let's fix it incrementally.
> 
> You have two smatch warnings:
>    CHECK   ../drivers/memory/samsung/exynos5422-dmc.c
> drivers/memory/samsung/exynos5422-dmc.c:272 exynos5_init_freq_table() warn: passing devm_ allocated variable to kfree. 'dmc->opp'
>    CHECK   ../drivers/memory/jedec_ddr_data.c
> drivers/memory/samsung/exynos5422-dmc.c:565 exynos5_dmc_get_volt_freq() warn: passing zero to 'PTR_ERR'
> 
> The second looks like false positive, but first seems to be real.
Right, I will fix it.
> 
> You have also sparse warning to fix:
> ../drivers/memory/samsung/exynos5422-dmc.c:736:1: warning: symbol 'exynos5_dmc_align_init_freq' was not declared. Should it be static?
Yes, it should be static but due to the artificial line break I have
missed it.

It will be sent in the follow up patch.

Thank you!

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
> 
> 
