From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH 2/5] ARM: dts: exynos5250-arndale: Add PMIC node entry
Date: Sun, 10 Feb 2013 16:38:52 -0800
Message-ID: <CADGdYn4LOSc7oa2nMekV+uFpuBTpZu4WaNhfgErmsOgrS2GgJw@mail.gmail.com>
References: <1360214129-4096-1-git-send-email-tushar.behera@linaro.org>
	<1360214129-4096-2-git-send-email-tushar.behera@linaro.org>
	<F3DBB1B3EF102E4994C89758CFCA32412C4DE1@DBDE01.ent.ti.com>
	<51134218.9020603@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:60750 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157Ab3BKAix (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 19:38:53 -0500
Received: by mail-ie0-f173.google.com with SMTP id 9so7110219iec.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Feb 2013 16:38:52 -0800 (PST)
In-Reply-To: <51134218.9020603@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: "Kumar, Anil" <anilkumar.v@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>

The V2 of this patch is posted with comments suggested by Anil and
some missing LDO's.

Thanks,
Amit Daniel

On Wed, Feb 6, 2013 at 9:56 PM, Tushar Behera <tushar.behera@linaro.org> wrote:
> On 02/07/2013 11:19 AM, Kumar, Anil wrote:
>> On Thu, Feb 07, 2013 at 10:45:26, Tushar Behera wrote:
>>> From: Amit Daniel Kachhap <amit.daniel@samsung.com>
>>>
>>> Added S5M8767 PMIC DT nodes to Arndale board.
>>>
>>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/exynos5250-arndale.dts |  213 +++++++++++++++++++++++++++++-
>>>  1 files changed, 212 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
>>> index 9ce40df..b40a02f 100644
>>> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
>>> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
>>> @@ -25,7 +25,218 @@
>>>      };
>>>
>>>      i2c@12C60000 {
>>> -            status = "disabled";
>>> +            status = "okay";
>>
>> Is there any need to change status "okay" here as in dtsi file it is
>> by default okay ?
>>
>
> Right, there is no need for setting it as "okay" explicitly.
>
> --
> Tushar Behera
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
