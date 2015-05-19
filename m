From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2 0/4] ARM: multi_v7_defconfig: Stuff for Exynos
Date: Tue, 19 May 2015 15:14:16 +0900
Message-ID: <555AD4B8.3010505@kernel.org>
References: <1431913636-31854-1-git-send-email-k.kozlowski@samsung.com> <CABxcv=ns1B+qm01n-LegXz3=sxxwD8gFccVNghgB_RaU-pd7sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABxcv=ns1B+qm01n-LegXz3=sxxwD8gFccVNghgB_RaU-pd7sQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/18/15 16:03, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On Mon, May 18, 2015 at 3:47 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> Dear Kukjin,
>>
>>
>> Changes since v1:
>> =================
>> 1. Select drivers as modules, whenever possible. Suggested by Javier.
>> 2. Patch 2: The I2C_GPIO is already enabled as module.
>>
>>
>> Description
>> ===========
>> The patchset enables various config options on multi_v7 config
>> for Exynos boards.
>>
>> Arnd suggested [0] that this can go through your tree.
>>
>> Patchset is rebased on next-20150515 and Javier's patchset [1]
>> (to avoid conflicts around regulators and clocks).
>>
>> Please let me know if this should be rebased on other commit.
>>
>> [0] http://www.spinics.net/lists/kernel/msg1991518.html
>> [1] http://www.spinics.net/lists/kernel/msg1990767.html
>>
>>
>> Best regards,
>> Krzysztof
>>
>> Krzysztof Kozlowski (4):
>>   ARM: multi_v7_defconfig: Enable CPU idle for Exynos
>>   ARM: multi_v7_defconfig: Enable PMIC and MUIC drivers for Exynos
>>     boards
>>   ARM: multi_v7_defconfig: Enable TMU for Exynos
>>   ARM: multi_v7_defconfig: Enable OHCI on Exynos
>>
>>  arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
> 
> For all the series:
> 
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
Applied, thanks.

- Kukjin
