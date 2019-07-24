From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v4 5/5] DT: arm: exynos4412: add event data type which
 is monitored
Date: Wed, 24 Jul 2019 12:09:04 +0200
Message-ID: <694617ed-5c02-40cc-2f27-82e8bb0ac6fe@partner.samsung.com>
References: <20190605091236.24263-1-l.luba@partner.samsung.com>
        <CGME20190605091305eucas1p136332cc3d1a299d90617bddcb365bee0@eucas1p1.samsung.com>
        <20190605091236.24263-6-l.luba@partner.samsung.com>
        <20190723175853.GA29195@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723175853.GA29195@kozik-lap>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, kgene@kernel.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 7/23/19 7:58 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 05, 2019 at 11:12:36AM +0200, Lukasz Luba wrote:
>> The patch adds new field in the PPMU event which shows explicitly
>> what kind of data the event is monitoring. It is possible to change it
>> using defined values in exynos_ppmu.h file.
>>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4412-ppmu-common.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
> 
> I tried to apply this... but prerequisites were not merged into
> v5.3-rc1. This one will have to wait then till next release.
Indeed, I will ask Chanwoo for ack for patch 4/5.

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
> 
> 
