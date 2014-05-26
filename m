From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4th 1/2] Samsung Exynos multiplatform for 3.16
Date: Mon, 26 May 2014 15:29:30 -0700
Message-ID: <CAOesGMiM=Yc__EoWUPwyV3YRuQ83CSK8v8W==yt2Z9zoPNSwRA@mail.gmail.com>
References: <5383BC62.6040005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:47196 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231AbaEZW3b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 18:29:31 -0400
Received: by mail-qg0-f54.google.com with SMTP id q108so12835909qgd.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 15:29:30 -0700 (PDT)
In-Reply-To: <5383BC62.6040005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, May 26, 2014 at 3:12 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof, Kevin
>
> Sorry for late support multiplatform on exynos and now it's possible. Thanks
> for many guys' effort and time :-)
>
> BRs,
> Kukjin
>
> The following changes since commit dfacdfef06090ca0c131f45dfd3f3ca3452a8ed3:
>
>   Merge branch 'v3.16-next/dt-samsung' into v3.16-next/multiplatform
> (2014-05-26 06:19:01 +0900)
>
> are available in the git repository at:
>
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/exynos-multiplatform
>
> for you to fetch changes up to 43baa7dcb5fa0c95b1e443d2a739c14de1fbbe07:
>
>   cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
> (2014-05-27 06:22:53 +0900)
>
> ----------------------------------------------------------------
> Exynos mutiplatform support for 3.16
>
> Here is enabling the exynos platform as part of a multiplatform
> kernel. This is including ARCH_EXYNOS related Kconfig entries
> consolidation and update multi_v7_defconfig accordingly. And
> fixes exynos-cpufreq driver compilation with ARCH_MULTIPLATFORM.
>
> Note that this is based on tags/exynos-soc. And tags/samsung-dt,
> tags/samsung-clk are merged on top of that.
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       ARM: EXYNOS: Enable multi-platform build support
>
> Sachin Kamat (2):
>       ARM: EXYNOS: Consolidate Kconfig entries
>       ARM: multi_v7_defconfig: Enable Exynos platform
>
> Tomasz Figa (1):
>       cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
>
>  arch/arm/Kconfig                     | 20 ---------
>  arch/arm/configs/multi_v7_defconfig  | 12 ++++++

Please send multi_v7_defconfig updates as patches to arm@kernel.org,
and don't include them in branches. They often conflict and we want to
apply them directly for that reason.


Thanks,

-Olof
