From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/5] mfd: sec: Add support for S2MPS15 PMIC
Date: Wed, 28 Oct 2015 22:47:58 +0900
Message-ID: <5630D20E.6010409@samsung.com>
References: <1445863883-5187-1-git-send-email-alim.akhtar@samsung.com>
 <1445863883-5187-3-git-send-email-alim.akhtar@samsung.com>
 <20151026143411.GL597@x1> <563021AF.6030100@samsung.com>
 <20151028084609.GG5828@x1> <5630AFC7.2030901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:36300 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932384AbbJ1NsD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Oct 2015 09:48:03 -0400
In-Reply-To: <5630AFC7.2030901@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: k.kozlowski.k@gmail.com, broonie@kernel.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>

W dniu 28.10.2015 o 20:21, Alim Akhtar pisze:
> Hello,
> 
> On 10/28/2015 02:16 PM, Lee Jones wrote:
>> On Wed, 28 Oct 2015, Krzysztof Kozlowski wrote:
>>
>>> On 26.10.2015 23:34, Lee Jones wrote:
>>>> On Mon, 26 Oct 2015, Alim Akhtar wrote:
>>>>
>>>>> From: Thomas Abraham <thomas.ab@samsung.com>
>>>>>
>>>>> Add support for S2MPS15 PMIC which is similar to S2MPS11 PMIC. The
>>>>> S2MPS15
>>>>> PMIC supports 27 LDO regulators, 10 buck regulators, RTC, three
>>>>> 32.768KHz
>>>>> clock outputs and battery charger. This patch adds initial support for
>>>>> LDO and buck regulators of S2MPS15 device.
>>>>>
>>>>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>>>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>>>> [Alim: Added s2mps15_devs like rtc and clk and related changes]
>>>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>>> ---
>>>>>   drivers/mfd/sec-core.c              |   31 +++++++
>>>>>   drivers/mfd/sec-irq.c               |    8 ++
>>>>>   include/linux/mfd/samsung/core.h    |    1 +
>>>>>   include/linux/mfd/samsung/s2mps15.h |  158
>>>>> +++++++++++++++++++++++++++++++++++
>>>>>   4 files changed, 198 insertions(+)
>>>>>   create mode 100644 include/linux/mfd/samsung/s2mps15.h
>>>>
>>>> I replied to the previous set and won't be reviewing this one until
>>>> all of the open points are solved.
>>>
>>> The naming and compatibles used by the driver are confusing but how it
>>> was at beginning. Beside the confusion, the names are correct:
>>>
>>> 1. Main mfd driver:
>>>   - compatible: samsung,s2mps1*-pmic
>>>   - driver name: sec_pmic
>>>
>>> 2. Regulator driver:
>>>   - no compatible (because it always searches for "regulators"
>>> subnode of
>>> its parent... that is the convention/legacy behaviour)
>>>   - driver name: s2mps1*-pmic
>>>
>>> I hope that explains your concerns.
>>
>> It explains *why*, but doesn't ease my concerns in any way.
>>
>> Unfortunately I've only just realised the disparity we have between
>> MFD and the Regulator subsystem, which is annoying because it's now
>> almost impossible to rectify.
>>
>> We should have taken one of two views.  Either a) The MFD is the PMIC
>> device which encompasses regulator control.  In which case the MFD
>> and it's corresponding compatible string would be named *-pmic and the
>> regulator driver would be called *-regulator. Or b) The MFD could be
>> considered a normal MFD and be named after the model number, then the
>> regulator 'could' be named *-pmic.
>>
>> However, with reference to b), how much other Power Management does
>> the regulator driver do besides control regulators?  I suspect not
>> much.  Therefore my preference would be for a).  My second choice
>> would be a mixuture of the two where nothing gets named *-pmic.  The
>> last option on my list would be the current situation where we seem to
>> be calling both the MFD (PMIC) itself and the Regulator driver
>> *-pmic, which is not good.
>>
> Well, I would have also preferred option a), but keeping existing DT
> bindings, looks like we need to go with the current situation.
> Krzysztof any thought on this?
> 

Looks good to me. Please, go ahead.

Best regards,
Krzysztof
