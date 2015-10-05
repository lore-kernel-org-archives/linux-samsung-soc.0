From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 3/3] mfd: sec-core: Disable buck voltage reset on watchdog
 falling edge
Date: Tue, 06 Oct 2015 08:49:16 +0900
Message-ID: <56130C7C.6000207@samsung.com>
References: <1443774351-28766-1-git-send-email-k.kozlowski@samsung.com>
 <1443774351-28766-3-git-send-email-k.kozlowski@samsung.com>
 <2375080.1KPJ21Fk4I@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <2375080.1KPJ21Fk4I@amdc1976>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05.10.2015 22:35, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Friday, October 02, 2015 05:25:51 PM Krzysztof Kozlowski wrote:
>> The WRSTBI bit (disabled by default but enabled by bootloader), when
>> set, is responsible for resetting voltages to default values of
>> certain bucks on falling edge of Warm Reset Input pin from AP.
>>
>> However on some boards (with S2MPS13) the pin is pulled down so any
>> suspend will effectively trigger the reset of bucks supplying the power
>> to the little and big cores. In the same time when resuming, these bucks
>> must provide voltage greater or equal to voltage before suspend to match
>> the frequency chosen by cpufreq. If voltage (default value of voltage
>> after reset) is lower than one set by cpufreq before suspend, then
>> system will hang during resuming.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> I tested this (with some additional Exynos5433 patches) and it works
> like expected (suspend/resume issue is fixed).
> 
> Tested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 

Thanks!

> You could also add:
> 
> Reported-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> (since the issue got narrowed down and reported to you by me :).

I didn't put it because I wasn't sure who was the author of our report.
I'll wait a one more day for any comments and add it in v2/resend.

BTW, any comments on the binding itself?
Actually I had hard time choosing the name for binding because unlike
the ACOKB the WRSTBI pin is not grounded but pulled down. However it is
quite similar so I stick to the same convention:
 - samsung,s2mps11-acokb-ground
 - samsung,s2mps11-wrstbi-ground


Best regards,
Krzysztof
