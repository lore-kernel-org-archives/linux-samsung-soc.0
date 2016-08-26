From: Chanwoo Choi <chanwoo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Sat, 27 Aug 2016 05:46:30 +0900
Message-ID: <CAGTfZH2M1LD+cE3shcr2RMC-0PVkkjzqUZ7ORjvq=CNmHg6T+w@mail.gmail.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com> <20160826163236.GC15511@kozik-book>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160826163236.GC15511@kozik-book>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, beomho.seo-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jaewon02.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, human.hwang@sam
List-Id: linux-samsung-soc@vger.kernel.org

HI Krzysztof,

2016-08-27 1:32 GMT+09:00 Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
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
>
> Not fixed. Mobile Storage.
>
> Everything else looks fine, so fix above only if you are going to resend
> everything. If there won't be resend, I can fix it when applying.

Sorry for that. My mistake. Just I fixed the 'Mobile'.
I'll fix it and then resend it.

>
> For the record:
> Reviewed-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks for the review.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
