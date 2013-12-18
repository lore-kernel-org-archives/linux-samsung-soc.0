From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 3/3] ARM: dts: Fix MDMA0 clock number
Date: Thu, 19 Dec 2013 03:06:24 +0900
Message-ID: <52B1E420.3080000@samsung.com>
References: <1386817322-11265-1-git-send-email-a.kesavan@samsung.com> <1386817322-11265-3-git-send-email-a.kesavan@samsung.com> <2082327.zpbOvCVe5P@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:37350 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061Ab3LRSGa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Dec 2013 13:06:30 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so8559741pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Dec 2013 10:06:30 -0800 (PST)
In-Reply-To: <2082327.zpbOvCVe5P@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, dianders@chromium.org, tomasz.figa@gmail.com, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org

On 12/18/13 23:49, Tomasz Figa wrote:
> Hi Kukjin,
>
Hi,

> On Thursday 12 of December 2013 08:32:02 Abhilash Kesavan wrote:
>> Fix wrong clock number in mdma0 node.
>>
>> Signed-off-by: Abhilash Kesavan<a.kesavan@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos5250.dtsi |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
>> index 9db5047..177becd 100644
>> --- a/arch/arm/boot/dts/exynos5250.dtsi
>> +++ b/arch/arm/boot/dts/exynos5250.dtsi
>> @@ -559,7 +559,7 @@
>>   			compatible = "arm,pl330", "arm,primecell";
>>   			reg =<0x10800000 0x1000>;
>>   			interrupts =<0 33 0>;
>> -			clocks =<&clock 271>;
>> +			clocks =<&clock 346>;
>>   			clock-names = "apb_pclk";
>>   			#dma-cells =<1>;
>>   			#dma-channels =<8>;
>>
>
> Can we have your ack for this patch?
>
Sure, please feel free to add my ack on this series.

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

> I'd like to apply the whole series into samsung-clk fixes branch and
> send a pull request to Mike to get it and one more fix into his tree.
>
I'm fine, thanks.

- Kukjin
