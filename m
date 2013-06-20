From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH 0/5] ARM: dts: exynos5420: add support for hdmi subsystem
Date: Thu, 20 Jun 2013 11:45:23 +0530
Message-ID: <CANuQgHF6yGTprgxdL=qp6EoUVeSzP39NnFciix23W7n-J5EVjA@mail.gmail.com>
References: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:46827 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790Ab3FTGPY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 02:15:24 -0400
Received: by mail-oa0-f48.google.com with SMTP id f4so7482486oah.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 23:15:23 -0700 (PDT)
In-Reply-To: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <rob.herring@calxeda.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, joshi@samsung.com, r.sh.open@gmail.com

On 20 June 2013 11:11, Rahul Sharma <rahul.sharma@samsung.com> wrote:
> Add dt nodes and clocks for hdmi subsystem. It also add pinctrl
> node for hdmi hpd gpio and update binding documents.
>
> This patch is based on v3.11-next/soc-exynos5420-pinctrl branch
> at http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git
>
> device tree binding document for hdmi compatible type is update at
> http://www.spinics.net/lists/dri-devel/msg39987.html
>
> Andrew Bresticker (1):
>   ARM: dts: exynos5420: add i2c device nodes
>
> Rahul Sharma (4):
>   ARM: dts: exynos5420: add dt nodes for hdmi subsystem
>   ARM: dts: exynos5420: add clocks for hdmi subsystem
>   ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
>   ARM: dts: update binding documentation for hdmi subsystem
While populating exnos5420.dtsi, move nodes with common properties
across exynos5420 and exynos5420 to exynos5.dtsi
>
>  .../devicetree/bindings/video/exynos_hdmi.txt      |   17 ++++-
>  .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
>  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |    7 ++
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          |   17 +++++
>  arch/arm/boot/dts/exynos5420.dtsi                  |   74 ++++++++++++++++++++
>  5 files changed, 116 insertions(+), 3 deletions(-)
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--
with warm regards,
Chander Kashyap
