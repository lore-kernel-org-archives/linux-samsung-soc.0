From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/6] ARM: dts: Create cros-tps65090 fragment
Date: Tue, 12 Aug 2014 10:26:45 -0700
Message-ID: <CAD=FV=XNsQ_8h-d8epU_gzWRH=A49a8iuirWCUe4TO6VGCvDSw@mail.gmail.com>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk>
	<1407861868-20097-4-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:38124 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754059AbaHLR0q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Aug 2014 13:26:46 -0400
Received: by mail-vc0-f170.google.com with SMTP id lf12so13838212vcb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Aug 2014 10:26:45 -0700 (PDT)
In-Reply-To: <1407861868-20097-4-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Javier,

On Tue, Aug 12, 2014 at 9:44 AM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> The tps65090 PMU is a component used in many ChromeOS devices
> so instead of having the same device tree definitions in many
> files, create a .dtsi fragment that can be included in DTS.
>
> This fragment is based on the DT definitions for Peach boards.
>
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  arch/arm/boot/dts/cros-tps65090.dtsi | 81 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 arch/arm/boot/dts/cros-tps65090.dtsi

I'd probably skip this patch (just have duplication in pit vs. pi), or
make it "peach" specific (like exynos-peach-tps65090.dtsi?).  This is
really board-specific info and trying to guess what the various FETs
are going to be for for all peach variants doesn't seem great.

-Doug
