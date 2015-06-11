From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [GIT PULL 4/5] Samsung another DT updates for v4.2
Date: Thu, 11 Jun 2015 14:41:45 -0700
Message-ID: <7hr3phdism.fsf@deeprootsystems.com>
References: <5571E4E4.1070900@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:35674 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750958AbbFKVls (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 17:41:48 -0400
Received: by pdbnf5 with SMTP id nf5so10710437pdb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2015 14:41:48 -0700 (PDT)
In-Reply-To: <5571E4E4.1070900@kernel.org> (Kukjin Kim's message of "Sat, 06
	Jun 2015 03:05:24 +0900")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Kukjin Kim <kgene@kernel.org> writes:

> Hi,
>
> Here is another Samsung DT updates for v4.2 but this is based on
> v4.1-rc6 + previous tags/samsung-dt-3 because this touches all of exynos
> DT stuff and some fixes have been merged until -rc6...

In the future, it would be helpful to describe what fixes from -rc6 this
series depends on.

> I thought this is the best way to avoid useless merge conflicts.
>
> Please pull and if any problems, please kindly let me know.
>
> Thanks,
> Kukjin
>
>
> The following changes since commit b9974fa208d9175a6d1d21f6b1068e1779295934:
>
>   Merge branch 'v4.2-next/dt-samsung-3rd' into v4.2-next/dt-samsung-4th
> (2015-06-03 09:56:00 +0900)
>
> are available in the git repository at:
>
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-dt-4
>
> for you to fetch changes up to b7004516781503c0e4782288025ca2ce4a78f020:
>
>   ARM: dts: add sysmmu nodes for exynos5420 (2015-06-04 08:09:42 +0900)
>
> ----------------------------------------------------------------
> Samsung another DT udpates for v4.2
>
> - use labels for overriding nodes for all of exynos stuff
>   (by Krzysztof Kozlowski)
>
> - add sysmmu nodes for exynos SoCs (by Marek Szyprowski)
>
> - for exynos5422-odroidxu3
>   : enalbe wake alarm of S2MPS11 RTC
>   : Hook up PWM and use it for LEDs
>   : add support for Odroid XU3 Lite
>
> - remove duplicated i2c7 for exynos5250-snow
> - add JPEG codec nodes for exynos5420
> - add vendor prefix for Hardkernel
>
> ----------------------------------------------------------------

Pulled into next/dt,

Thanks,

Kevin
