From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V6] ARM: dts: Add dwmmc DT nodes for exynos5420 SOC
Date: Thu, 29 Aug 2013 10:29:45 -0700
Message-ID: <CAD=FV=URu9jJu5nVE871wPKshV1izN2TS5op4Wo11543367DdA@mail.gmail.com>
References: <1377776468-24808-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f42.google.com ([209.85.216.42]:64581 "EHLO
	mail-qa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755933Ab3H2R3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Aug 2013 13:29:55 -0400
Received: by mail-qa0-f42.google.com with SMTP id cm18so1340706qab.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Aug 2013 10:29:54 -0700 (PDT)
In-Reply-To: <1377776468-24808-1-git-send-email-yuvaraj.cd@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, pawel.moll@arm.com, mark.rutland@arm.com, Stephen Warren <swarren@wwwdotorg.org>, ian.campbell@citrix.com, Tomasz Figa <t.figa@samsung.com>, Chris Ball <cjb@laptop.org>, Thomas Abraham <thomas.abraham@linaro.org>, ks.giri@samsung.com, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>

Yuvaraj,

On Thu, Aug 29, 2013 at 4:41 AM, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com> wrote:
> This patch adds the device tree node entries for exynos5420 SOC.
> Exynos5420 has a different version of DWMMC controller,so a new
> compatible string is used to distinguish it from the prior SOC's.
>
> This patch depends on
>         mmc: dw_mmc: exynos: Add a new compatible string for exynos5420
>
> changes since v5:
>         1.removed instance index from node name.
>         2.changed the node name to mshc.
>         3.changed the reg property value for mshc_2.
>
> changes since v4:
>         1.Droppped the bypass-smu binding property.
>         2.Used compatible string "samsung,exynos5250-dw-mshc"
>           for controller instance which does not have SMU.
>
> changes since V3:
>         1.change fifo-depth size from 0x80 to 0x40
>         2.Move the below properties
>                 a.card-detect-delay
>                 b.samsung,dw-mshc-ciu-div
>                 c.samsung,dw-mshc-sdr-timing
>                 d.samsung,dw-mshc-ddr-timing
>         from SOC dts to board dts file as suggested by Doug Anderson
>
> changes since V2:
>         1.dropped num-slots property from node as its not required
>           if number of card slots available is 1.
>
>         2.Move the below properties
>                 a.fifo-depth
>                 b.card-detect-delay
>                 c.samsung,dw-mshc-ciu-div
>                 d.samsung,dw-mshc-sdr-timing
>                 e.samsung,dw-mshc-ddr-timing
>         from board dts to SOC dts,as these are not board specific properties.
>
>         3.Updated the binding document exynos-dw-mshc.txt.
>
> changes since V1:
>         1.disable node by status = disabled in SOC file
>         2.enable node by status = okay in board specific file
>
> Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
> ---
>  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |    2 +
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   33 +++++++++++++++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   39 ++++++++++++++++++++
>  3 files changed, 74 insertions(+)

Reviewed-by: Doug Anderson <dianders@chromium.org>
