From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: dts: Modify SPI nodes according generic DMA DT
 bindings
Date: Tue, 05 Mar 2013 11:24:08 +0100
Message-ID: <5135C7C8.9030601@samsung.com>
References: <1362477862-352-1-git-send-email-padma.v@samsung.com>
 <CAK9yfHwmjwN4ceCQ719Y2DY9keTEX8mt65bHkoHcTTRJc5p9rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55565 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752694Ab3CEKYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 05:24:12 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJ60043WNI3L960@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Mar 2013 10:24:10 +0000 (GMT)
Received: from [106.116.147.32] by eusync2.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJ60009XNK9WMA0@eusync2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Mar 2013 10:24:10 +0000 (GMT)
In-reply-to: <CAK9yfHwmjwN4ceCQ719Y2DY9keTEX8mt65bHkoHcTTRJc5p9rA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca

On 03/05/2013 11:06 AM, Sachin Kamat wrote:
> On 5 March 2013 15:34, Padmavathi Venna <padma.v@samsung.com> wrote:
>> This patch removes custom way of adding spi dma channels and
>> adds according to new generic DMA DT bindings on samsung exynos4
>> and exynos5440 platforms.
>>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  arch/arm/boot/dts/exynos4.dtsi    |   15 +++++++++------
>>  arch/arm/boot/dts/exynos5440.dtsi |    5 +++--
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
...
>> @@ -246,8 +247,9 @@
>>                 compatible = "samsung,exynos4210-spi";
>>                 reg = <0x13930000 0x100>;
>>                 interrupts = <0 67 0>;
>> -               tx-dma-channel = <&pdma1 7>; /* preliminary */
>> -               rx-dma-channel = <&pdma1 6>; /* preliminary */
>> +               dmas = <&pdma0 7
>> +                       &pdma0 6>;
> 
> Shouldn't these be pdma1 as was earlier?

Yes, it should. And this is also what the SoC documentation says - SPI1 is
assigned to Peri DMA1.
