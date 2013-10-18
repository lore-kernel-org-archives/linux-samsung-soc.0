From: Yuvaraj Kumar <yuvaraj.cd@gmail.com>
Subject: Re: [PATCH V4 0/4] exynos dwmmc device tree node cleanup
Date: Fri, 18 Oct 2013 16:37:50 +0530
Message-ID: <CAKuRcO+1FXZ+JCebcxv-CE4XunbctFMR1KwQDzfRUdafz4CYpQ@mail.gmail.com>
References: <1378188264-22382-1-git-send-email-yuvaraj.cd@samsung.com>
	<1530001.y8QaeTojjb@flatron>
	<CA+NduCDRJwt=583ETOM0Tb+eNHJi-Pr7+-AwrAtFgvi+gi6JFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f44.google.com ([209.85.128.44]:47411 "EHLO
	mail-qe0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753128Ab3JRLHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Oct 2013 07:07:51 -0400
In-Reply-To: <CA+NduCDRJwt=583ETOM0Tb+eNHJi-Pr7+-AwrAtFgvi+gi6JFA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Cd <yuvaraj.lkml@gmail.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Tomasz Figa <t.figa@samsung.com>, Douglas Anderson <dianders@chromium.org>, Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, "ks.giri@samsung.com" <ks.giri@samsung.com>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Gentle Ping...

On Thu, Sep 26, 2013 at 10:51 AM, Yuvaraj Cd <yuvaraj.lkml@gmail.com> wrote:
> Hi Kukjin,
>  Can you please take this series to your tree?
>
> Best Regards
> Yuvaraj
>
> On Tue, Sep 3, 2013 at 1:41 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Yuvaraj,
>>
>> On Tuesday 03 of September 2013 11:34:20 Yuvaraj Kumar C D wrote:
>>> changes from V3:
>>>       1.Added two new patch in the series
>>>               [1] ARM: dts: Move fifo-depth property from board dts
>>>               [2] ARM: dts: rename mmc dts node for exynos5 series
>>> changes from V2:
>>>       1.remove from exynos5.dtsi and add in exynos5250.dtsi
>>>         in single patch.Suggested by Tomasz Figa.
>>>       2.Separate patch for changing status property of dwmmc node
>>>         in smdk5250 and arndale board dts file.
>>>
>>> V1 Patches:
>>> 1.[PATCH 1/2] ARM: dts: remove dwmmc nodes from exynos5 common dts file.
>>> http://www.spinics.net/lists/linux-samsung-soc/msg21602.html
>>> 2.[PATCH 2/2] ARM: dts: Add dwmmc nodes in SOC specific dts file
>>>       http://www.spinics.net/lists/linux-samsung-soc/msg21603.html
>>>
>>> Yuvaraj Kumar C D (4):
>>>   ARM: dts: Move dwmmc nodes from exynos5.dtsi to exynos5250.dtsi
>>>   ARM: dts: exynos: change status property of dwmmc nodes
>>>   ARM: dts: Move fifo-depth property from board dts
>>>   ARM: dts: rename mmc dts node for exynos5 series
>>>
>>>  arch/arm/boot/dts/cros5250-common.dtsi    |    8 +++----
>>>  arch/arm/boot/dts/exynos5.dtsi            |   21 -----------------
>>>  arch/arm/boot/dts/exynos5250-arndale.dts  |   16 ++++---------
>>>  arch/arm/boot/dts/exynos5250-smdk5250.dts |   16 ++++---------
>>>  arch/arm/boot/dts/exynos5250-snow.dts     |    2 +-
>>>  arch/arm/boot/dts/exynos5250.dtsi         |   36
>>> ++++++++++++++++++++++------- 6 files changed, 41 insertions(+), 58
>>> deletions(-)
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>>
>> Best regards,
>> Tomasz
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
