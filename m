From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH/RFC 0/2] serial: samsung: add support for early console
Date: Thu, 25 Sep 2014 04:37:18 +0530
Message-ID: <CAGOxZ53+8g5CKHo5GQUQQd=o6rcdWJEWGdHG6CP8z2eS8cYRXw@mail.gmail.com>
References: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:35467 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750914AbaIXXH7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 19:07:59 -0400
Received: by mail-yk0-f176.google.com with SMTP id 19so2840502ykq.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2014 16:07:58 -0700 (PDT)
In-Reply-To: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alim Akhtar <alim.akhtar@samsung.com>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robherring2@gmail.com>

Hi Marek,

On Mon, Sep 22, 2014 at 6:44 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> This patchset adds support for early console defined in device tree. As
> an example, DTS files for all Exynos4 based machines are updated with
> the correct value for common chosen/sdtout property.
>
> To get it fully functional additional improvements (support for
> early_ioremap) are needed in early console code.
>
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
>
>
> Patch summary:
>
> Tomasz Figa (2):
>   serial: samsung: Add support for of_earlycon
Probably you can re-spin this series without RFC tag and fixing a nit.
Please add command line support also and update the Documentation with
command line param.
>   ARM: dts: exynos4: Add stdout-path properties
>
Have tested this on ARM64 based exynos7, both DT and command line way.
Both works.
Compile tested on ARM.
Probably you can rebase on top of
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html
maybe.
>  arch/arm/boot/dts/exynos4210-origen.dts         |  1 +
>  arch/arm/boot/dts/exynos4210-smdkv310.dts       |  1 +
>  arch/arm/boot/dts/exynos4210-trats.dts          |  1 +
>  arch/arm/boot/dts/exynos4210-universal_c210.dts |  1 +
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  4 +
>  arch/arm/boot/dts/exynos4412-origen.dts         |  1 +
>  arch/arm/boot/dts/exynos4412-smdk4412.dts       |  1 +
>  arch/arm/boot/dts/exynos4412-tiny4412.dts       |  4 +
>  arch/arm/boot/dts/exynos4412-trats2.dts         |  1 +
>  drivers/tty/serial/Kconfig                      |  1 +
>  drivers/tty/serial/samsung.c                    | 97 +++++++++++++++++++++++++
>  11 files changed, 113 insertions(+)
>
> --
> 1.9.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
