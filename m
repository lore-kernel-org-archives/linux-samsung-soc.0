From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 7/9] ARM: multi_v7_defconfig: Enable options for Exynos
 display support
Date: Fri, 15 May 2015 02:58:40 +0200
Message-ID: <CABxcv=kyM8KCp+QtJrrjuBO+hXx1Y-9xYOZGQx8BWyOdLqsCiA@mail.gmail.com>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
	<1431618016-2087-8-git-send-email-javier.martinez@collabora.co.uk>
	<CAJKOXPfSZnrpv2g=T-UyYi-_cSN=g9DG4e8eKszY+a_rVknTqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfSZnrpv2g=T-UyYi-_cSN=g9DG4e8eKszY+a_rVknTqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On Fri, May 15, 2015 at 2:36 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> 2015-05-15 0:40 GMT+09:00 Javier Martinez Canillas
> <javier.martinez@collabora.co.uk>:
>> Many Exynos devices have devices attached to their display ports.
>> This patch enables the needed Kconfig options to support different
>> configuration such as simple panel, embedded DisplayPort (eDP) to
>> LVDS bridges and HDMI displays.
>
> Enabling the display would be nice but for some quite long time we had
> issues with DRM on Exynos. exynos_defconfig has it enabled and most of
> boards boot fine with it. Exception is Arndale 5250:

Yes, like I said in the other thread, the fact that Exynos DRM is
working fine now on most boards is mostly because the bugs were
exposed when the Exynos DRM options were enabled.

> http://storage.kernelci.org/next/next-20150514/arm-exynos_defconfig/lab-khilman/boot-exynos5250-arndale.html
> [    1.630290] [drm:exynos_dp_bind] *ERROR* failed: of_get_videomode() : -22
> [    1.637071] exynos-drm exynos-drm: failed to bind
> 145b0000.dp-controller (ops exynos_dp_ops): -22
> [    1.646504] exynos-drm exynos-drm: master bind failed: -22
> [    1.651391] exynos-drm: probe of exynos-drm failed with error -22
>

Ajay Kumar changed the DT bindings for the Exynos DRM Display Panel
driver some time ago but it seems that the Arndale 5250 DTS was never
updated. Something along the lines of commit [0] is needed.

> Anyway it is not like I am against it... just wondering. On the other
> hand enabling it could help in early detection of errors.
>

I think that not enabling these options will just make latent bugs to
not be exposed. As an example I found that module auto-loading was
broken for the driver of the PTN3460 eDP to LVDS bridge used in the
Exynos5250 Snow Chromebook and already posted a fix [1].

I would had never found that bug if wouldn't had tried enabling these
options in multi_v7 as a module. Also remember that the consumer
version of these machines don't have a serial console so for users
building images with multi_v7, not having display support means that
the machine is pretty useless.

> Best regards,
> Krzysztof

Best regards,
Javier

[0]: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=0a0752c6ee58f28a29e78f1a8c38f2f1b11cba9f
[1]: https://lkml.org/lkml/2015/5/14/363
