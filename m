From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: set LDO7 regulator as always on
Date: Wed, 25 Jan 2017 08:13:25 +0100
Message-ID: <48fcf959-845e-f601-229d-83b8fb13c121@samsung.com>
References: <CGME20170124124537eucas1p23ef10c2cf3b15ce70682b0cf71ae14a3@eucas1p2.samsung.com>
 <1485261928-10769-1-git-send-email-a.hajda@samsung.com>
 <20170124175206.m2hquaf7eylslydq@kozik-lap>
 <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41700 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbdAYHNb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 02:13:31 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKB00GO2QQGUU30@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2017 07:13:28 +0000 (GMT)
In-reply-to: <587eb6c1-3e39-f160-26f6-40d90b7f13f7@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>

Hi Javier,


On 2017-01-24 18:57, Javier Martinez Canillas wrote:
> Hello Krzysztof,
>
> On 01/24/2017 02:52 PM, Krzysztof Kozlowski wrote:
>> On Tue, Jan 24, 2017 at 01:45:28PM +0100, Andrzej Hajda wrote:
>>> LDO7 regulator beside DSI and HDMI provides power for core blocks in Exynos
>>> 5433 SoC. Disabling it causes serious current leak - about 200mA.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> index 5f1e172..b22bec8 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>>> @@ -432,6 +432,10 @@
>>>   				regulator-name = "VDD18_MIPI2L_1.8V_AP";
>>>   				regulator-min-microvolt = <1800000>;
>>>   				regulator-max-microvolt = <1800000>;
> I see you already applied, but I think it would be good to have some comments
> here explaining why the regulator should be always-on. Otherwise, in future a
> developer might want to disable the regulator since it may think that is not
> needed due dsi and hdmi already enabling it.

If such change is added in a separate commit, one can easily find the reason
using "git blame".

>>> +				regulator-always-on;
>>> +				regulator-state-mem {
>>> +					regulator-off-in-suspend;
>>> +				};
>> Thanks, applied.
>>
>> Just to satisfy my curiosity, how disabling the regulator causes current
>> leak? What happens exactly?

Such leakage usually happens if there is a hw block, which have more 
than one
power supply. Disabling power for the one power supply might turn the hw 
logic
into some meta state, in which it still conduct a current from the other 
source.

The best example of such behavior is Odroid U3 and its problems with 
reset when
HDMI cable is connected. Sometimes the current leaks from the HDMI 
connector to
the board when the main power supply is turned off and the board enters some
kind of a a "meta state".

We still have no idea which hw block causes this leakage in case of TM2/TM2e
though.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
