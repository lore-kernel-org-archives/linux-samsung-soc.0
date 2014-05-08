From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 2/5] ARM: dts: enable fimd for exynos5250 based snow board
Date: Thu, 8 May 2014 14:57:01 +0530
Message-ID: <CAK9yfHxC9-y57PyJHj1W7ys8RMA8fVcWM4UT2AOfMHt3KmSbMw@mail.gmail.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
	<1399529995-8656-3-git-send-email-rahul.sharma@samsung.com>
	<002701cf6a8d$ef7b4540$ce71cfc0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:64722 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273AbaEHJ1C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 05:27:02 -0400
Received: by mail-ob0-f170.google.com with SMTP id uy5so2719598obc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 May 2014 02:27:01 -0700 (PDT)
In-Reply-To: <002701cf6a8d$ef7b4540$ce71cfc0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, Rahul Sharma <r.sh.open@gmail.com>, Tomasz Figa <t.figa@samsung.com>

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

Either at the top or bottom is fine rather than somewhere in between.
However no need to re-spin the patch just for this change.

-- 
With warm regards,
Sachin
