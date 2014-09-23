From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH/RFC 0/2] serial: samsung: add support for early console
Date: Tue, 23 Sep 2014 18:23:07 +0530
Message-ID: <CAGOxZ51aghOqbZuv34TuBuQdKjmHdkhaYJvH=VxNjxb-pZKE8w@mail.gmail.com>
References: <1411391655-6291-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f54.google.com ([209.85.213.54]:41720 "EHLO
	mail-yh0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755306AbaIWMxs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Sep 2014 08:53:48 -0400
Received: by mail-yh0-f54.google.com with SMTP id f73so2646447yha.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Sep 2014 05:53:47 -0700 (PDT)
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
Is these really tested?
So that mean we need to wait till __ioremap__ support available for ARM.
How to take this forward then? Here is a platform (exynos7) which
needs earlycon support for debugging some of the early core things and
ARM64 has ioremap support as well. There is no reason why we should
hold earlycon support for exyons7.
I see two solution here:
1> How about re-spin patch-1 which will just add ealrycon support for
__exynos4210__ serial type only? And rest of the types can be added as
incremental patches, as and when ioremap for ARM available.
Atleast this approch will solve exynos7 problem of not having earlycon support.
And This patch can be tested on exynos7 (I can do that).
2> Take  my patch which is working and tested for exynos7 and can be
easily extended and generalized when ioremap for ARM is available.

My preference would be the the first one.
Let me know your thoughts please.
In case you are ok with 1st approach, can you please re-spin patch1
with needed changes?

> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
>
>
> Patch summary:
>
> Tomasz Figa (2):
>   serial: samsung: Add support for of_earlycon
>   ARM: dts: exynos4: Add stdout-path properties
>
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
