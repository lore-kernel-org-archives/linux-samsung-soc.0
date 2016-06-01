From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add TMU nodes regulator supply for
 Peach boards
Date: Wed, 1 Jun 2016 09:19:19 -0400
Message-ID: <4ed20897-8409-404f-ce6a-73ce6affeb7e@osg.samsung.com>
References: <1464731280-24588-1-git-send-email-javier@osg.samsung.com>
 <574EA1D1.6020606@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <574EA1D1.6020606@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 06/01/2016 04:50 AM, Krzysztof Kozlowski wrote:
> On 05/31/2016 11:48 PM, Javier Martinez Canillas wrote:

[snip]

>>  
>> +&tmu_cpu0 {
>> +	vtmu-supply = <&ldo10_reg>;
>> +};
>> +
>> +&tmu_cpu1 {
>> +	vtmu-supply = <&ldo10_reg>;
>> +};
>> +
>> +&tmu_cpu2 {
>> +	vtmu-supply = <&ldo10_reg>;
>> +};
>> +
>> +&tmu_cpu3 {
>> +	vtmu-supply = <&ldo10_reg>;
>> +};
>> +
>> +&tmu_gpu {
>> +	vtmu-supply = <&ldo10_reg>;
>> +};
>> +
> 
> Here and for Peach Pi please put the nodes in alphabetical order.
>

Right, sorry. I completely forgot about keeping the order.
 
> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
