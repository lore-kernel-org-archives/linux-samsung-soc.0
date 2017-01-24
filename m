From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Tue, 24 Jan 2017 14:57:00 -0300
Message-ID: <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
 <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
 <20170124175206.m2hquaf7eylslydq@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:37257
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750883AbdAXR53 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 12:57:29 -0500
In-Reply-To: <20170124175206.m2hquaf7eylslydq@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

Hello Krzysztof,

On 01/24/2017 02:52 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 24, 2017 at 01:45:28PM +0100, Andrzej Hajda wrote:
>> LDO7 regulator beside DSI and HDMI provides power for core blocks in Exynos
>> 5433 SoC. Disabling it causes serious current leak - about 200mA.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index 5f1e172..b22bec8 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -432,6 +432,10 @@
>>  				regulator-name = "VDD18_MIPI2L_1.8V_AP";
>>  				regulator-min-microvolt = <1800000>;
>>  				regulator-max-microvolt = <1800000>;

I see you already applied, but I think it would be good to have some comments
here explaining why the regulator should be always-on. Otherwise, in future a
developer might want to disable the regulator since it may think that is not
needed due dsi and hdmi already enabling it.

>> +				regulator-always-on;
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
> 
> Thanks, applied.
>
> Just to satisfy my curiosity, how disabling the regulator causes current
> leak? What happens exactly?
>

I was wondering the same.

> Best regards,
> Krzysztof
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
