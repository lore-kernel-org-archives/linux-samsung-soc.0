From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 0/4] Add initial support for pinctrl on Exynos7
Date: Sat, 20 Sep 2014 17:43:21 +0530
Message-ID: <CAGOxZ51nWxYePa4R-0wvHy4H0TPxhpJYtZcbauUiGzWfAr4gqg@mail.gmail.com>
References: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f53.google.com ([209.85.213.53]:37940 "EHLO
	mail-yh0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754082AbaITMOC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Sep 2014 08:14:02 -0400
In-Reply-To: <1410598252-30931-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "catalin.marinas" <catalin.marinas@arm.com>, robh <robh@kernel.org>, devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas P Abraham <thomas.ab@samsung.com>

Hi Abhilash,

On Sat, Sep 13, 2014 at 2:20 PM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> The following patches are tested based on Kgene's for-next tree.
> https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next
>
> Following patches are required for this series:
> 1- "tty/serial: fix config dependencies for samsung serial"
>    https://www.mail-archive.com/linux-samsung-soc <at> vger.kernel.org/msg36208.html
> 2- "dts, kbuild: Implement support for dtb vendor subdirs" patchset
>    http://comments.gmane.org/gmane.linux.kbuild.devel/12131
> 3- "arch: arm64: enable support for Samsung Exynos7 SoC" patchset
>    http://www.spinics.net/lists/linux-samsung-soc/msg36728.html
>
> Abhilash Kesavan (2):
>   pinctrl: exynos: Generalize the eint16_31 demux code
>   pinctrl: exynos: Add irq_chip instance for Exynos7 wakeup interrupts
>
> Naveen Krishna Chatradhi (2):
>   pinctrl: exynos: Add initial driver data for Exynos7
>   arm64: dts: Add initial pinctrl support to EXYNOS7
>
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    3 +
>  arch/arm64/Kconfig                                 |    2 +
>  arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  560 ++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos7.dtsi            |   66 +++
>  drivers/pinctrl/samsung/pinctrl-exynos.c           |  161 +++++-
>  drivers/pinctrl/samsung/pinctrl-exynos.h           |    4 +
>  drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
>  8 files changed, 788 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
>
With the nit fix in patch-4 of this series, feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> --
> 1.7.9.5
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Regards,
Alim
