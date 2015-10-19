From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 5/7] ARM: exynos_defconfig: Normalize exynos defconfig
Date: Mon, 19 Oct 2015 18:38:05 +0200
Message-ID: <56251C6D.9000708@osg.samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-6-git-send-email-alim.akhtar@samsung.com>
 <5624EF5D.7080403@osg.samsung.com>
 <CAGOxZ52bGrHo0DzjhyjGPXwX0CWUn0Oqkx-EGZY51zC5FWcAKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34338 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751358AbbJSQiL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 12:38:11 -0400
In-Reply-To: <CAGOxZ52bGrHo0DzjhyjGPXwX0CWUn0Oqkx-EGZY51zC5FWcAKw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=c5=82owski?= <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello Alim,

On 10/19/2015 05:58 PM, Alim Akhtar wrote:
> Hi Javier,
> 
> On Mon, Oct 19, 2015 at 6:55 PM, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
>> Hello Alim,
>>
>> On 10/19/2015 08:03 AM, Alim Akhtar wrote:
>>> make savedefconfig result in some difference, lets normalize the
>>> defconfig.
>>>
>>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>>> ---
>>
>> Did you make savedefconfig against v4.3-rc6 or tot linux-next?
>>
> These are based on v4.3-rc5.
> 
>> I remember we had issues in the past due savedefconfig made against
>> linux-next but then some of the patches in linux-next not making it
>> to the next release. So I think it should be good to mention what's
>> the base used for this patch.
>>
> Ah, ok I didn't follow that, will check again on Linux-next as well as

IIRC the problem was in that case that a patch was adding a new select
that made the symbol not necessary in the defconfig. So a patch against
linux-next was posted removing the unneeded symbol but at the end the
select patch didn't make it to the release but the one removing the
symbol did.

> on 4.3-rc5
>

OK, using 4.3-rcX should be safe AFAICT.

>>>  arch/arm/configs/exynos_defconfig |    8 ++------
>>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>>> index 1ff2bfa2e183..3349713e6c63 100644
>>> --- a/arch/arm/configs/exynos_defconfig
>>> +++ b/arch/arm/configs/exynos_defconfig
>>> @@ -99,10 +99,8 @@ CONFIG_SENSORS_LM90=y
>>>  CONFIG_SENSORS_NTC_THERMISTOR=y
>>>  CONFIG_SENSORS_PWM_FAN=y
>>>  CONFIG_SENSORS_INA2XX=y
>>> -CONFIG_THERMAL=y
>>>  CONFIG_CPU_THERMAL=y
>>>  CONFIG_THERMAL_EMULATION=y
>>> -CONFIG_EXYNOS_THERMAL=y
>>
>> I would prefer to split all the changes that removes symbols into a
>> separate patch explaining why these are not needed anymore (i.e: it
>> is selected now by symbol $foo).
>>
> Ok ..let me rebase my patches and check these config changes again....


Thanks, the changes looks good to me though so please feel free
to add my Reviewed-by tag if you re-spin and split the changes.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
