From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 3/4] regulator: s2mps11: add support for S2MPS15
 regulators
Date: Thu, 29 Oct 2015 14:04:44 +0530
Message-ID: <5631DA24.10303@samsung.com>
References: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
 <1446094723-6212-4-git-send-email-alim.akhtar@samsung.com>
 <20151029080835.GM4058@x1> <5631D533.6070807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5631D533.6070807@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: broonie@kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 10/29/2015 01:43 PM, Krzysztof Kozlowski wrote:
> On 29.10.2015 17:08, Lee Jones wrote:
>> On Thu, 29 Oct 2015, Alim Akhtar wrote:
>>
>>> From: Thomas Abraham <thomas.ab@samsung.com>
>>>
>>> The S2MPS15 PMIC is similar in functionality to S2MPS11/14 PMIC. It contains
>>> 27 LDO and 10 Buck regulators and allows programming these regulators via a
>>> I2C interface. This patch adds initial support for LDO/Buck regulators of
>>> S2MPS15 PMIC.
>>>
>>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>> ---
>>>   drivers/regulator/Kconfig   |    4 +-
>>>   drivers/regulator/s2mps11.c |  135 ++++++++++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 136 insertions(+), 3 deletions(-)
>>
>> [...]
>>
>>> @@ -1070,6 +1202,7 @@ static const struct platform_device_id s2mps11_pmic_id[] = {
>>>   	{ "s2mps11-pmic", S2MPS11X},
>>>   	{ "s2mps13-pmic", S2MPS13X},
>>>   	{ "s2mps14-pmic", S2MPS14X},
>>> +	{ "s2mps15-regulator", S2MPS15X},
>>>   	{ "s2mpu02-pmic", S2MPU02},
>>>   	{ },
>>>   };
>>
>> Are you going to s/pmic/regulator/ for the existing devices too?
>
> Yeah, I expected that as well... but of course it is orthogonal to this
> patchset.
>
Agree with Krzysztof here. Noted, will send a separate patch to rename 
other S2MPxxx-pmic to *-regulator.

> Best regards,
> Krzysztof
>
>
