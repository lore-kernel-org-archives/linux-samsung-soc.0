From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 0/5] Add DRM FIMD DT support for Exynos4 DT Machines
Date: Mon, 28 Jan 2013 11:56:23 +0530
Message-ID: <CAK9yfHzN-n3OisZ-k_Kb2mNW7_mh-r2SfE-q+CTe1WQriTDi+w@mail.gmail.com>
References: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:55308 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334Ab3A1G0Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 01:26:24 -0500
Received: by mail-oa0-f54.google.com with SMTP id n9so2423958oag.27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Jan 2013 22:26:23 -0800 (PST)
In-Reply-To: <1359351872-20518-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Hi Vikas,

You need to CC devicetree-discuss@lists.ozlabs.org for patches adding
new bindings and add documentation related to it.

On 28 January 2013 11:14, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> This patch series adds support for DRM FIMD DT for Exynos4 DT Machines,
> specifically for Exynos4412 SoC.
>
> Is based on branch "for-next"
> http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>
> Vikas Sajjan (5):
>   ARM: dts: Add FIMD node to exynos4
>   ARM: dts: Adds lcd pinctrl node entries for SAMSUNG EXYNOS4412 SoC
>   ARM: dts: Add FIMD node and display timing node to
>     exynos4412-origen.dts
>   ARM: dts: adds FIMD AUXDATA node entry for exynos4 DT
>   ARM: EXYNOS: Enable backlight and PWM support for Exynos4 DT machines
>
>  arch/arm/boot/dts/exynos4.dtsi            |    7 +++++++
>  arch/arm/boot/dts/exynos4412-origen.dts   |   21 +++++++++++++++++++++
>  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   26 ++++++++++++++++++++++++++
>  arch/arm/mach-exynos/Kconfig              |    2 ++
>  arch/arm/mach-exynos/mach-exynos4-dt.c    |    4 ++++
>  5 files changed, 60 insertions(+)
>
> --
> 1.7.9.5
>



-- 
With warm regards,
Sachin
