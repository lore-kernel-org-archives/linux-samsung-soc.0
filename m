From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v13 7/8] ARM: dts: exynos: add DMC device for exynos5422
Date: Fri, 6 Sep 2019 10:41:02 +0200
Message-ID: <c178d316-a6b8-5b0a-af97-e6a049da14ca@partner.samsung.com>
References: <20190821104303.32079-1-l.luba@partner.samsung.com>
        <CGME20190821104324eucas1p16bdeb27250c8c9fa87591d6bd9743a17@eucas1p1.samsung.com>
        <20190821104303.32079-8-l.luba@partner.samsung.com>
        <20190904182502.GA12918@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904182502.GA12918@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 9/4/19 8:25 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 21, 2019 at 12:43:02PM +0200, Lukasz Luba wrote:
>> Add description of Dynamic Memory Controller and PPMU counters.
>> They are used by exynos5422-dmc driver.
>> There is a definition of the memory chip, which is then used during
>> calculation of timings for each OPP.
>> The algorithm in the driver needs these two sets to bound the timings.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5420.dtsi             |  71 +++++++++++
>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 116 ++++++++++++++++++
>>   2 files changed, 187 insertions(+)
> 
> Thanks, applied conditionally. Please send a follow up fixing the
> checkpatch error about undocumented binding:
> https://krzk.eu/#/builders/26/builds/392
> 
> You should not skip such checkpatch warning.
Right, I will keep it in mind next time. I have just ignore it based on
Elpida lpddr2 memory which is also missing DT binding documentation.
https://elixir.bootlin.com/linux/v5.3-rc7/source/arch/arm/boot/dts/elpida_ecb240abacn.dtsi

I will send a follow up patch based on your 'for-next' branch.

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
> 
> 
