From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/2] ARM: exynos_defconfig: Enable s5p-secss driver
Date: Mon, 11 Jan 2016 13:04:35 -0300
Message-ID: <5693D293.2050101@osg.samsung.com>
References: <1452132905-8587-1-git-send-email-k.kozlowski@samsung.com>
 <1452132905-8587-2-git-send-email-k.kozlowski@samsung.com>
 <568FD733.8030601@osg.samsung.com>
 <CAJKOXPdie=mAPFxdnn_Ue+kNVTKQ1bFJigti35JMz7hmkYJ9cw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdie=mAPFxdnn_Ue+kNVTKQ1bFJigti35JMz7hmkYJ9cw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, tjakobi@math.uni-bielefeld.de
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 01/08/2016 11:46 PM, Krzysztof Kozlowski wrote:

[snip]

>>> --- a/arch/arm/configs/exynos_defconfig
>>> +++ b/arch/arm/configs/exynos_defconfig
>>> @@ -240,6 +240,7 @@ CONFIG_DEBUG_RT_MUTEXES=y
>>>  CONFIG_DEBUG_SPINLOCK=y
>>>  CONFIG_DEBUG_MUTEXES=y
>>>  CONFIG_DEBUG_USER=y
>>> +CONFIG_CRYPTO_DEV_S5P=y
>>
>> I noticed that this is not enabled in multi_v7_defconfig.
>> Are you planing to do it as well?
> 
> Thanks for feedback and review. I noticed that as well but I am not
> convinced because one of two of supported algorithms fails the
> tests... which makes 50% of driver non-working. :) Maybe it is
> harmless - just pollutes the dmesg... Maybe after fixing it.
>

Agreed that can be done after fixing the driver.
 
> Best regards,
> Krzysztof

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
