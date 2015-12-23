From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [GIT PULL 7/9] ARM: EXYNOS: dts: DeviceTree for v4.5
Date: Wed, 23 Dec 2015 20:04:43 +0900
Message-ID: <567A7FCB.1040304@samsung.com>
References: <1449020386-20250-1-git-send-email-k.kozlowski@samsung.com>
 <1449020386-20250-8-git-send-email-k.kozlowski@samsung.com>
 <20151222045221.GH30172@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33970 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257AbbLWLEr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Dec 2015 06:04:47 -0500
In-Reply-To: <20151222045221.GH30172@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: k.kozlowski.k@gmail.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Tomasz Figa <tomasz.figa@gmail.com>

W dniu 22.12.2015 o 13:52, Olof Johansson pisze:
> On Wed, Dec 02, 2015 at 10:39:44AM +0900, Krzysztof Kozlowski wrote:
>> Hi Kukjin,
>>
>> A lot of stuff here, mostly cleanups. Description in tag.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:
>>
>>   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
>>
>> are available in the git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-4.5
>>
>> for you to fetch changes up to 2cf107f1033e0343d45b59d06f16487c8362702f:
>>
>>   ARM: dts: Unify G2D device node with other devices on exynos4 (2015-11-30 17:00:43 +0900)
>>
>> ----------------------------------------------------------------
>> Samsung DeviceTree updates and improvements for 4.5:
>> 1. Pinctrl for Exynos5410.
>> 2. eMMC/SDIO minor fixes usage of bindings on Snow and Peach
>>    Chromebooks.
>> 3. Remove FIMD from Odroid XU3-family because on XU3 it cannot be used
>>    yet and on XU3-Lite and XU4 it is not supported.
>> 4. Remove deprecated since June 2013 samsung,exynos5-hdmi.
>> 5. Add support for Pseudo Random Generator on Exynos4 (Trats2 for now).
>>    This depends on new SSS clock.
>> 6. Add rotator nodes for Exynos4 and Exynos5.
>> 7. Switch DWC3_1 on Odroid XU3 and XU3-Lite to peripheral mode because
>>    now it cannot be used as OTG.
>> 8. Cleanup the G2D usage on Exynos4 and add it to a proper domain
>>    in case of Exynos4210.
>> 9. Put MDMA1 in proper domain on Exynos4210 as well.
>> 10. Minor cleanups.
> 
> Given the request to get acks for the pinctrl changes, can you respin this
> branch without those pieces so we can merge in the rest of it?
> 
The pinctrl changes here are only DTS changes. I reviewed the pinctrl
DTSI. Why do you want an additional ack for them?

However this contains the previous clock dependency (the SSS clock acked
by Stephen Boyd). I responded about this already so let's don't
duplicate the discussion.

Best regards,
Krzysztof
