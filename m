From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos5420: add ADC device tree node
Date: Fri, 2 Aug 2013 10:28:04 +0530
Message-ID: <CAHfPSqCnhejs9HapBLSWJJvqs=uhRsq8ukYnycQu5cSKhPgaSg@mail.gmail.com>
References: <1375349321-18646-1-git-send-email-ch.naveen@samsung.com> <CANruHrQXh=aE5-DkaNzdd=PpByTqyszyh2G0cvcW2iBGH8VH4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANruHrQXh=aE5-DkaNzdd=PpByTqyszyh2G0cvcW2iBGH8VH4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sunil joshi <sjoshi.open@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2 August 2013 10:20, sunil joshi <sjoshi.open@gmail.com> wrote:
> Hi Naveen,
> exynos5250.dtsi also needs this entry.
> Pls consider adding adc node in exynos5250.dtsi as well, and move the
> common content of adc node to exynos5.dtsi.
Sure, sunil will run a boot test and submit the code
>
> Regards
> Sunil
>
>
> On Thu, Aug 1, 2013 at 2:58 PM, Naveen Krishna Chatradhi
> <ch.naveen@samsung.com> wrote:
>> From: Jaehoon Kim <jh228.kim@samsung.com>
>>
>> Add device tree node for ADC in exynos5420.dtsi
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>>  arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
>> index 8c54c4b..074e1bc 100644
>> --- a/arch/arm/boot/dts/exynos5420.dtsi
>> +++ b/arch/arm/boot/dts/exynos5420.dtsi
>> @@ -145,4 +145,15 @@
>>                 clocks = <&clock 260>, <&clock 131>;
>>                 clock-names = "uart", "clk_uart_baud0";
>>         };
>> +
>> +       adc: adc@12D10000 {
>> +               compatible = "samsung,exynos-adc-v2";
>> +               reg = <0x12D10000 0x100>, <0x10040720 0x4>;
>> +               interrupts = <0 106 0>;
>> +               #io-channel-cells = <1>;
>> +               io-channel-ranges;
>> +               clocks = <&clock 270>;
>> +               clock-names = "adc";
>> +               status = "disabled";
>> +       };
>>  };
>> --
>> 1.7.9.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
Shine bright,
(: Nav :)
