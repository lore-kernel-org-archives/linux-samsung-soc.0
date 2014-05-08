From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v2 2/5] ARM: dts: enable fimd for exynos5250 based snow board
Date: Thu, 8 May 2014 14:45:08 +0530
Message-ID: <CAPdUM4N-vYkN_hjT1oW_pXL83nMqFHv8ADohSVMLk9iSP_6bsQ@mail.gmail.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
	<1399529995-8656-3-git-send-email-rahul.sharma@samsung.com>
	<002701cf6a8d$ef7b4540$ce71cfc0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:37404 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753343AbaEHJPK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 05:15:10 -0400
In-Reply-To: <002701cf6a8d$ef7b4540$ce71cfc0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tomasz Figa <t.figa@samsung.com>

On 8 May 2014 12:50, Jingoo Han <jg1.han@samsung.com> wrote:
> On Thursday, May 08, 2014 3:20 PM, Rahul Sharma wrote:
>>
>> From: Rahul Sharma <Rahul.Sharma@samsung.com>
>>
>> Enable fimd node for snow board.
>>
>> Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos5250-snow.dts |    6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
>> index 1ce1088..796954c 100644
>> --- a/arch/arm/boot/dts/exynos5250-snow.dts
>> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
>> @@ -206,4 +206,10 @@
>>                       clock-frequency = <24000000>;
>>               };
>>       };
>> +
>> +     fimd@14400000 {
>> +             status = "okay";
>
> (+cc Sachin Kamat, Tomasz Figa)
>
> For readability, how about moving 'status' to the last entry of
> the node? The same comment applies to other patches, too.
>

I just followed the nodes in rest of the file for peach and snow. This
looks consistent to me. But let me know if you want me to change
this.

Regards,
Rahul Sharma.

> Best regards,
> Jingoo Han
>
>> +             samsung,invert-vclk;
>> +     };
>> +
>>  };
>> --
>> 1.7.9.5
>
>
