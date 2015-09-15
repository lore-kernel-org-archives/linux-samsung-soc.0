From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: Fix LEDs on exynos5422-odroidxu3
Date: Wed, 16 Sep 2015 08:54:20 +0900
Message-ID: <55F8AFAC.5090305@samsung.com>
References: <1442136736-28672-1-git-send-email-k.kozlowski.k@gmail.com>
 <55F8AB56.1010900@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <55F8AB56.1010900@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 16.09.2015 08:35, Kukjin Kim wrote:
> On 09/13/15 18:32, Krzysztof Kozlowski wrote:
>> The LEDs on Odroid XU3 family boards could not properly probe because PWM
>> outputs were reduced only to PWM for fan. Fix it for Odroid XU3 and
>> XU3-Lite boards by switching to usage of all 4 outputs (although the PWM
>> for MIPI probably is redundant because board does not have MIPI
>> connector available).
>>
>> This fixes warnings on dmesg:
>> [    4.838712] samsung-pwm 12dd0000.pwm: tried to request PWM channel 1 without output
>> [    4.838725] leds_pwm pwmleds: unable to request PWM for green:mmc0: -22
>> [    4.838767] leds_pwm: probe of pwmleds failed with error -22
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
>>
>> ---
>>
>> Changes since v1:
>> 1. Do not rebase on patchset adding support for Odroid XU4 board. Rebase
>>    just on current next.
>> ---
> 
> Applied, thanks.
> 

Thanks. This is actually a candidate for current v4.3 cycle. It fixes
issue with LEDs for Odroid XU3 caused by Anand's b685d540cc26:
The offending commit b685d540cc26 was merged in v4.3.
I forgot to add "fixes" tag.
	Fixes: b685d540cc26 ("ARM: dts: Add pwm-fan node for exynos5422-odroidxu3")

Can you send it to arm-soc during this cycle?

For current v4.3 Bartlomiej's patch is also an important candidate:
"ARM: dts: add suspend opp to exynos4412"

Best regards,
Krzysztof
