From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: krzysztof/for-next boot bisection: v5.4-rc1-48-g0bc9c79979ea on
 peach-pi
Date: Tue, 8 Oct 2019 12:21:01 +0200
Message-ID: <b62e8793-a428-6a06-fb30-c0a9c1322fa9@samsung.com>
References: <5d9a8a3c.1c69fb81.14b6f.10d1@mx.google.com>
        <CGME20191007170946epcas3p2e91287115265a9efc7038b762cc8e17e@epcas3p2.samsung.com>
        <CAJKOXPeZQ_hZqUdtFrr-wGiwdM4KVjD_7CArEWhZgo+1EJPqew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPeZQ_hZqUdtFrr-wGiwdM4KVjD_7CArEWhZgo+1EJPqew@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, "kernelci.org bot" <bot@kernelci.org>
Cc: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com, mgalka@collabora.com, Chanwoo Choi <cw00.choi@samsung.com>, broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com, Kamil Konieczny <k.konieczny@partner.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 07.10.2019 19:09, Krzysztof Kozlowski wrote:
> On Mon, 7 Oct 2019 at 02:43, kernelci.org bot <bot@kernelci.org> wrote:
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>> * This automated bisection report was sent to you on the basis  *
>> * that you may be involved with the breaking commit it has      *
>> * found.  No manual investigation has been done to verify it,   *
>> * and the root cause of the problem may be somewhere else.      *
>> *                                                               *
>> * If you do send a fix, please include this trailer:            *
>> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
>> *                                                               *
>> * Hope this helps!                                              *
>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>
>> krzysztof/for-next boot bisection: v5.4-rc1-48-g0bc9c79979ea on peach-pi
>>
>> Summary:
>>    Start:      0bc9c79979ea Merge branch 'for-v5.5/memory-samsung-dmc-dt' into for-next
>>    Details:    https://protect2.fireeye.com/url?k=57d30a4c-0ab44e6a-57d28103-0cc47a31384a-5c0d93fa4eb95f2e&u=https://kernelci.org/boot/id/5d9a50af59b5141ce5857c07
>>    Plain log:  https://protect2.fireeye.com/url?k=7e18d090-237f94b6-7e195bdf-0cc47a31384a-b693d6da384e8a14&u=https://storage.kernelci.org//krzysztof/for-next/v5.4-rc1-48-g0bc9c79979ea/arm/multi_v7_defconfig/gcc-8/lab-collabora/boot-exynos5800-peach-pi.txt
>>    HTML log:   https://protect2.fireeye.com/url?k=e9c39b5b-b4a4df7d-e9c21014-0cc47a31384a-5f31e671f969cef8&u=https://storage.kernelci.org//krzysztof/for-next/v5.4-rc1-48-g0bc9c79979ea/arm/multi_v7_defconfig/gcc-8/lab-collabora/boot-exynos5800-peach-pi.html
>>    Result:     0899a480ac65 ARM: dts: exynos: Add initial data for coupled regulators for Exynos5422/5800
> Thanks for the report. Marek Szyprowski reported it on last Friday. I
> dropped the patch as of now as it exposes some deadlock in regulator
> code.

Thanks for dropping this patch.

This turned out to be an issue in the regulator core logic, not the 
deadlock as I initially suspected. See 
https://lkml.org/lkml/2019/10/8/265 for more details.

I will send an updated version of this patch, because it turned out that 
the v7 had incorrectly resolved conflicts and in case of Odroids 
coupling were added to wrong regulators, what hide the issue in my 
initial tests on Odroid XU4.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
