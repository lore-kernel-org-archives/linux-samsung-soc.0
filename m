From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/4] ARM: multi_v7_defconfig: Stuff for Exynos
Date: Mon, 18 May 2015 09:03:44 +0200
Message-ID: <CABxcv=ns1B+qm01n-LegXz3=sxxwD8gFccVNghgB_RaU-pd7sQ@mail.gmail.com>
References: <1431913636-31854-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f177.google.com ([209.85.160.177]:36385 "EHLO
	mail-yk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196AbbERHDo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 03:03:44 -0400
Received: by ykep21 with SMTP id p21so50809180yke.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 May 2015 00:03:44 -0700 (PDT)
In-Reply-To: <1431913636-31854-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Hello Krzysztof,

On Mon, May 18, 2015 at 3:47 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Dear Kukjin,
>
>
> Changes since v1:
> =================
> 1. Select drivers as modules, whenever possible. Suggested by Javier.
> 2. Patch 2: The I2C_GPIO is already enabled as module.
>
>
> Description
> ===========
> The patchset enables various config options on multi_v7 config
> for Exynos boards.
>
> Arnd suggested [0] that this can go through your tree.
>
> Patchset is rebased on next-20150515 and Javier's patchset [1]
> (to avoid conflicts around regulators and clocks).
>
> Please let me know if this should be rebased on other commit.
>
> [0] http://www.spinics.net/lists/kernel/msg1991518.html
> [1] http://www.spinics.net/lists/kernel/msg1990767.html
>
>
> Best regards,
> Krzysztof
>
> Krzysztof Kozlowski (4):
>   ARM: multi_v7_defconfig: Enable CPU idle for Exynos
>   ARM: multi_v7_defconfig: Enable PMIC and MUIC drivers for Exynos
>     boards
>   ARM: multi_v7_defconfig: Enable TMU for Exynos
>   ARM: multi_v7_defconfig: Enable OHCI on Exynos
>
>  arch/arm/configs/multi_v7_defconfig | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

For all the series:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
