From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 7/9] ARM: multi_v7_defconfig: Enable options for Exynos
 display support
Date: Fri, 15 May 2015 10:08:56 +0900
Message-ID: <CAJKOXPdWb3onJcTOSGJpaqwE4NWd=QN4FDarWj1jVZM1sTv1VQ@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
	<1431618016-2087-8-git-send-email-javier.martinez@collabora.co.uk>
	<CAJKOXPfSZnrpv2g=T-UyYi-_cSN=g9DG4e8eKszY+a_rVknTqw@mail.gmail.com>
	<CABxcv=kyM8KCp+QtJrrjuBO+hXx1Y-9xYOZGQx8BWyOdLqsCiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f42.google.com ([209.85.216.42]:46635 "EHLO
	mail-vn0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933661AbbEOBI5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 21:08:57 -0400
In-Reply-To: <CABxcv=kyM8KCp+QtJrrjuBO+hXx1Y-9xYOZGQx8BWyOdLqsCiA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

2015-05-15 9:58 GMT+09:00 Javier Martinez Canillas <javier@dowhile0.org>:
> Hello Krzysztof,
>
> On Fri, May 15, 2015 at 2:36 AM, Krzysztof Kozlowski
> <k.kozlowski@samsung.com> wrote:
>> 2015-05-15 0:40 GMT+09:00 Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk>:
>>> Many Exynos devices have devices attached to their display ports.
>>> This patch enables the needed Kconfig options to support different
>>> configuration such as simple panel, embedded DisplayPort (eDP) to
>>> LVDS bridges and HDMI displays.
>>
>> Enabling the display would be nice but for some quite long time we had
>> issues with DRM on Exynos. exynos_defconfig has it enabled and most of
>> boards boot fine with it. Exception is Arndale 5250:
>
> Yes, like I said in the other thread, the fact that Exynos DRM is
> working fine now on most boards is mostly because the bugs were
> exposed when the Exynos DRM options were enabled.

I saw your response in email 0/9 but let us stick to one thread.
So these are my only concerns - instability in the past.

>> http://storage.kernelci.org/next/next-20150514/arm-exynos_defconfig/lab-khilman/boot-exynos5250-arndale.html
>> [    1.630290] [drm:exynos_dp_bind] *ERROR* failed: of_get_videomode() : -22
>> [    1.637071] exynos-drm exynos-drm: failed to bind
>> 145b0000.dp-controller (ops exynos_dp_ops): -22
>> [    1.646504] exynos-drm exynos-drm: master bind failed: -22
>> [    1.651391] exynos-drm: probe of exynos-drm failed with error -22
>>
>
> Ajay Kumar changed the DT bindings for the Exynos DRM Display Panel
> driver some time ago but it seems that the Arndale 5250 DTS was never
> updated. Something along the lines of commit [0] is needed.

Thanks,

>
>> Anyway it is not like I am against it... just wondering. On the other
>> hand enabling it could help in early detection of errors.
>>
>
> I think that not enabling these options will just make latent bugs to
> not be exposed. As an example I found that module auto-loading was
> broken for the driver of the PTN3460 eDP to LVDS bridge used in the
> Exynos5250 Snow Chromebook and already posted a fix [1].

Right, enabling the options helps in exposing problems so they could
be spotted and fixed.


> I would had never found that bug if wouldn't had tried enabling these
> options in multi_v7 as a module. Also remember that the consumer
> version of these machines don't have a serial console so for users
> building images with multi_v7, not having display support means that
> the machine is pretty useless.

That is indeed good reason.

FWIW, I tested multi_v7 with your patches on Exynos4412 Trats2 board
and it worked fine.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
