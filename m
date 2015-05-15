From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
Date: Fri, 15 May 2015 21:00:02 +0900
Message-ID: <CAJKOXPer-GF1QuZ7-3J+WKQ=VUQoGmGxSSscf9t32iHzevtK3g@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
	<8715756.FNaYjNk3ol@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8715756.FNaYjNk3ol@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, arm@kernel.org, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-15 20:37 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Thursday 14 May 2015 17:40:07 Javier Martinez Canillas wrote:
>> Hello arm-soc maintainers,
>>
>> This series is an attempt to reduce the delta between exynos_defconfig
>> and multi_v7_defconfig. Primarily to enable the needed Kconfig symbols
>> to make all Exynos Chromebooks peripherals to be working when building
>> an image using the ARMv7 multi-platform default config.
>>
>> Since the policy is now to now enable as much as possible, I did build
>> as a module all the Kconfig symbols that were tristate and only enable
>> as built-in those that can't be a module because are boolean options.
>>
>> A nice side effect of this series is that I found that many drivers
>> were not working properly when built as a module because the modalias
>> information was not filled properly or at all. I've posted patches to
>> fix the issues I found when testing this series.
>>
>> The patches have been tested on an Exynos5250 Snow, Exynos5420 Peach
>> Pit and Exynos5800 Peach Pi Chromebooks but most config options will
>> be useful for others Exynos5 or other Samsung SoCs.
>>
>> The series is composed of the following patches that can be applied on
>> top of your next/defconfig branch [0].
>
> Looks good to me. My preferred approach for merging would be to have
> Kukjin pick up these patches and send a pull request, along with other
> defconfig changes he might have for exynos.

I have some other old patches in the same topic - related to important
stuff for Exynos boards. I'll rebase them and ask Kukjin for picking.

Best regards,
Krzysztof
