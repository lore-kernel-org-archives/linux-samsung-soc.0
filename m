From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/9] multi_v7_defconfig: Enable options for Exynos Chromebooks
Date: Fri, 15 May 2015 02:33:55 +0200
Message-ID: <CABxcv=nDb2_vYfR4N0PeK269h=1NbGbL-R-tdAqrtOhujive8g@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
	<CAJKOXPeDV=0agQdJ2G7x3ok4wnX66nZ_SF=cGQOW8N96=GnDJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f43.google.com ([209.85.213.43]:32915 "EHLO
	mail-yh0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423303AbbEOAdz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 20:33:55 -0400
Received: by yhcb70 with SMTP id b70so28230768yhc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2015 17:33:55 -0700 (PDT)
In-Reply-To: <CAJKOXPeDV=0agQdJ2G7x3ok4wnX66nZ_SF=cGQOW8N96=GnDJA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Krzysztof,

On Fri, May 15, 2015 at 2:18 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-15 0:40 GMT+09:00 Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>:
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
>
> I think enabling these config options would help using the multi_v7 on
> Exynos boards. I have doubts only for patch 7 (DRM), so for rest of
> them:
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Thanks a lot for your review. Do you think that there is something
wrong with patch 7 (DRM) or your doubt is given that the Exynos DRM
driver has been so unstable in the past, enabling could cause more
harm than good?

IMHO enabling the Exynos DRM options in exynos_defconfig was worth the
trouble since a lot of bugs were exposed (and fixed!) while before we
had unnoticed broken code laying around.

> Best regards,
> Krzysztof
> --

Best regards,
Javier
