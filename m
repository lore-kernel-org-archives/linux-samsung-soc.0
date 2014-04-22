From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: dts: disable MDMA1 node for smdk5420 board
Date: Tue, 22 Apr 2014 09:55:35 +0530
Message-ID: <CAHbNUh3G1NUUfAwh=B+rDwVkfsAetUpDspiPS-JbK3oYuxSd_A@mail.gmail.com>
References: <001a01cf5b0c$5ddc7d60$19957820$%jun@samsung.com>
	<021301cf5dd1$1d0ec910$572c5b30$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:42929 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbaDVEZf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Apr 2014 00:25:35 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so5127410oah.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Apr 2014 21:25:35 -0700 (PDT)
In-Reply-To: <021301cf5dd1$1d0ec910$572c5b30$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Seungwon Jeon <tgih.jun@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Javi Merino <javi.merino@arm.com>

On 22 April 2014 07:48, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Seungwon Jeon wrote:
>>
>
> + Javi Merino and Tushar Behera
>
>> This change is similar to commit 3da355c(ARM: dts: Disable MDMA1 node
>> for arndale-octa board). If MDMA1 region is configured with secure mode,
>> it makes the boot failure with the following.
>>
>> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
>>
> If so, how about adding the 'disabled' status in 5420 dtsi file? Then if 'enabling' is required, we can enable in each board dt file...
>

That should be okay. While at it, we can remove the node disabling
code from Arndale-Octa board DTS file.


> - Kukjin
>
>> Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    6 ++++++
>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> index 6910485..9a48e3f 100644
>> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
>> @@ -373,4 +373,10 @@
>>                       };
>>               };
>>       };
>> +
>> +     amba {
>> +             mdma1: mdma@11C10000 {
>> +                     status = "disabled";
>> +             };
>> +     };
>>  };
>> --
>> 1.7.0.4
>



-- 
Tushar Behera
