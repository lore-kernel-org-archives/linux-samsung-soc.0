From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Wed, 31 Aug 2016 10:24:59 +0900
Message-ID: <57C631EB.2080401@samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com>
 <CGME20160830171208epcas1p106936bcf8c13e4f96b625cc65c414a4c@epcas1p1.samsung.com>
 <20160830171146.GA22946@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160830171146.GA22946@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Rob,

On 2016년 08월 31일 02:11, Rob Herring wrote:
> On Wed, Aug 24, 2016 at 10:49:10PM +0900, Chanwoo Choi wrote:
>> This patch adds the Device Tree source for Exynos5433-based Samsung TM2 board.
>> This board fully support the all things for mobile target.
>>
>> This patch supports the following devices:
>> 1. basic SoC
>> - Initial booting for Samsung Exynos5433 SoC
>> - DRAM LPDDR3 (3GB)
>> - eMMC (32GB)
>> - ARM architecture timer
>>
>> 2. power management devices
>> - Sasmung S2MPS13 PMIC for the power supply
>> - CPUFREQ for big.LITTLE cores
>> - TMU for big.LITTLE cores and GPU
>> - ADC with thermistor to measure the temperature of AP/Battery/Charger
>> - Maxim MAX77843 Interface PMIC (MUIC/Haptic/Regulator)
>>
>> 3. sound devices
>> - I2S for sound bus
>> - LPASS for sound power control
>> - Wolfson WM5110 for sound codec
>> - Maxim MAX98504 for speaker amplifier
>> - TM2 ASoC Machine device driver node
>>
>> 3. display devices
>> - DECON, DSI and MIC for the panel output
>>
>> 4. usb devices
>> - USB 3.0 DRD (Dual Role Device)
>> - USB 3.0 Host controller
>>
>> 5. storage devices
>> - MSHC (Mobile Storae Host Controller) for eMMC device
>>
>> 6. misc devices
>> - gpio-keys (power, volume up/down, home key)
>> - PWM (Pulse Width Modulation Timer)
>>
>> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Beomho Seo <beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Jaewon Kim <jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Hyungwon Hwang <human.hwang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Ingi kim <ingi2.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  .../bindings/arm/samsung/samsung-boards.txt        |   1 +
>>  arch/arm64/boot/dts/exynos/Makefile                |   5 +-
>>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      | 985 +++++++++++++++++++++
>>  3 files changed, 990 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> index 0ea7f14ef294..c704b4bf6137 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
>> @@ -15,6 +15,7 @@ Required root node properties:
>>  	- "samsung,xyref5260"	- for Exynos5260-based Samsung board.
>>  	- "samsung,smdk5410"	- for Exynos5410-based Samsung SMDK5410 eval board.
>>  	- "samsung,smdk5420"	- for Exynos5420-based Samsung SMDK5420 eval board.
>> +	- "samsung,tm2"		- for Exynos5333-based Samsung TM2 board.
> 
> This does not match...

It is my mistake. Exynos5433 is correct. I'll fix it.

> 
>> +	compatible = "samsung,exynos5433-tm2", "samsung,exynos5433";
> 
> Is it 5433 or 5333?
> 
>> +
>> +	aliases {
>> +		pinctrl0 = &pinctrl_alive;
>> +		pinctrl1 = &pinctrl_aud;
>> +		pinctrl2 = &pinctrl_cpif;
>> +		pinctrl3 = &pinctrl_ese;
>> +		pinctrl4 = &pinctrl_finger;
>> +		pinctrl5 = &pinctrl_fsys;
>> +		pinctrl6 = &pinctrl_imem;
>> +		pinctrl7 = &pinctrl_nfc;
>> +		pinctrl8 = &pinctrl_peric;
>> +		pinctrl9 = &pinctrl_touch;
> 
> Drop all these.

As I said on previous reply on v1 patches,
The alias of both pinctrl and spi are used on the pinctrl/spi driver.
If I drop the alias of both pinctrl and spi, the error happened.

> 
>> +		serial0 = &serial_0;
>> +		serial1 = &serial_1;
>> +		serial2 = &serial_2;
>> +		serial3 = &serial_3;
> 
>> +		spi0 = &spi_0;
>> +		spi1 = &spi_1;
>> +		spi2 = &spi_2;
>> +		spi3 = &spi_3;
>> +		spi4 = &spi_4;
> 
> And these.

ditto.

-- 
Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
