From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 0/4] iio: exynos-adc: use syscon instead of ioremap
Date: Tue, 15 Jul 2014 19:15:13 +0100
Message-ID: <53C56FB1.2040700@kernel.org>
References: <1405069589-10388-1-git-send-email-ch.naveen@samsung.com> <53C56F40.1070304@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:45296 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932306AbaGOSM7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 14:12:59 -0400
In-Reply-To: <53C56F40.1070304@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-iio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, cw00.choi@samsung.com, gregkh@linuxfoundation.org, naveenkrishna.ch@gmail.com, lars@metafoo.de, cpgs@samsung.com, grundler@chromium.org, Kukjin Kim <kgene.kim@samsung.com>

On 15/07/14 19:13, Jonathan Cameron wrote:
> On 11/07/14 10:06, Naveen Krishna Chatradhi wrote:
>> This patch does the following
>> 1. Use the syscon and Regmap API instead of ioremappaing the
>>     ADC_PHY register from PMU.
>> 2. Moves the exynos-adc.txt from bindings/arm/samsung/
>>     to bindings/iio/adc/.
>> 3. Updates the Documentation in exynos-adc.txt with syscon phandle
>>     for the ADC nodes.
>> 4. Updates the Dts files for Exynos3250, Exynos4x12, Exynos5250,
>>     Exynos5420 with the syscon phandle.
>>
>> Tested on Exynos5420 based Peach PIT and Exynos5800 based Peach PI
>> by verifying sysfs entries provided by HWMON based NTC thermistors.
>>
>> Tested-By for Exynos3250, Exynos4x12 would be appreciated.
>>
> This series all looks fine to me.  Took me a minute to work out what the point
> of the syscon change was (perhaps a little description in the cover letter
> would have been nice ;)
>
> Anyhow, with the device tree changes in here we'll have to let it sit for
> a while.  I'll also definitely want an ack from
> Kukjin Kim <kgene.kim@samsung.com> for the device tree changes.
Although I haven't tried it, I'd imagine this might cause a little bit
of merging fun with the other exynos series waiting for Kukjin to
ack...
[PATCHv5 0/4] iio: adc: exynos_adc: Support Exynos3250 ADC and code clean
>
> Jonathan
>> Naveen Krishna Chatradhi (4):
>>    iio: exyno-adc: use syscon for PMU register access
>>    Documentation: dt-bindings: move exynos-adc.txt to more iio/adc/
>>    Documentation: dt-bindings: update exynos-adc.txt with syscon handle
>>    ARM: dts: exynos: Add sysreg phandle to ADC node
>>
>>   .../devicetree/bindings/arm/samsung/exynos-adc.txt |   82 ------------------
>>   .../devicetree/bindings/iio/adc/exynos-adc.txt     |   87 ++++++++++++++++++++
>>   arch/arm/boot/dts/exynos3250.dtsi                  |    3 +-
>>   arch/arm/boot/dts/exynos4x12.dtsi                  |    3 +-
>>   arch/arm/boot/dts/exynos5250.dtsi                  |    3 +-
>>   arch/arm/boot/dts/exynos5420.dtsi                  |    3 +-
>>   drivers/iio/adc/exynos_adc.c                       |   29 +++++--
>>   7 files changed, 115 insertions(+), 95 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-adc.txt
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/exynos-adc.txt
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
