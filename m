From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 5/5] arm64: dts: exynos: TM2 - remove unused UART3 and set
 clocks directly on CMU
Date: Thu, 17 Nov 2016 07:38:20 +0100
Message-ID: <8074c9e5-9175-f9eb-bb47-331b3a712254@samsung.com>
References: <CGME20161116130709eucas1p1fcf3fbb43f313d53bef47616a789dac4@eucas1p1.samsung.com>
 <1479301615-11240-1-git-send-email-m.szyprowski@samsung.com>
 <1479301615-11240-6-git-send-email-m.szyprowski@samsung.com>
 <CAGTfZH2yNRG1uoszq1OBpZ8wHLbOpcQh1StAJ9vovFPH8=Poww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45367 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938318AbcKQGi0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Nov 2016 01:38:26 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGR00BEZX3ZV740@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Nov 2016 06:38:23 +0000 (GMT)
In-reply-to: <CAGTfZH2yNRG1uoszq1OBpZ8wHLbOpcQh1StAJ9vovFPH8=Poww@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cwchoi00@gmail.com
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Chanwoo,


On 2016-11-16 17:51, Chanwoo Choi wrote:
> Hi Marek,
>
> 2016-11-16 22:06 GMT+09:00 Marek Szyprowski <m.szyprowski@samsung.com>:
>> UART3 device is not really needed for enabling audio block on TM2.
>> Enabling it made it working by enabling some common parent clocks,
>> what is now handled by improved exynos5433 clocks driver. Thus the UART3
>> device node can be safetly disabled. The assigned-clocks entries are
>> however still needed, so move them under the respective CMU node.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> index 506f8ab..5ab1028 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>> @@ -891,10 +891,9 @@
>>          status = "okay";
>>   };
>>
>> -&serial_3 {
>> +&cmu_aud {
>>          assigned-clocks = <&cmu_aud CLK_MOUT_AUD_PLL_USER>;
>>          assigned-clock-parents = <&cmu_top CLK_FOUT_AUD_PLL>;
>> -       status = "okay";
>>   };
>
> Looks good to me.
>
> The UART3 of TM2 was used for bluetooth device. CLK_MOUT_AUD_PLL_USER
> clock is the parent clock of CLK_SCLK_AUD_UART of uart3 for bluetooth.
> So, in the legacy, we assigned the parent clock in the uart3
> Device-tree node.
>
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Selecting AUD_PLL as a parent affects the whole audio block and it is needed
to get it working, so it is not only related to bluetooth device.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
