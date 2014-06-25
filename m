From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: exynos4412-odroidx: add support for USB
 (phy, host, device)
Date: Wed, 25 Jun 2014 19:28:31 +0530
Message-ID: <CAFp+6iHScs_wycE9XcDN46xg_N8hYf_BtJKNdtUVwg36sfZqMA@mail.gmail.com>
References: <1403702773-9141-1-git-send-email-m.szyprowski@samsung.com>
	<1403702773-9141-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:45442 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754202AbaFYN6c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 09:58:32 -0400
Received: by mail-qc0-f175.google.com with SMTP id i8so1707029qcq.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 06:58:31 -0700 (PDT)
In-Reply-To: <1403702773-9141-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

On Wed, Jun 25, 2014 at 6:56 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Kamil Debski <k.debski@samsung.com>
>
> This patch adds basic support for USB modules (host and device) on
> OdroidX board.
>
> Signed-off-by: Kamil Debski <k.debski@samsung.com>
> [removed incorrect port@2 node]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroidx.dts | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
> index fda9ac23dd55..4c853fbf7202 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidx.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
> @@ -148,6 +148,16 @@
>                 pinctrl-names = "default";
>                 status = "okay";
>
> +               usb3503@08 {
> +                       compatible = "smsc,usb3503";
> +                       reg = <0x08>;
> +
> +                       intn-gpios = <&gpx3 0 0>;
> +                       connect-gpios = <&gpx3 4 0>;
> +                       reset-gpios = <&gpx3 5 0>;
> +                       initial-mode = <1>;
> +               };
> +
>                 max77686: pmic@09 {
>                         compatible = "maxim,max77686";
>                         reg = <0x09>;
> @@ -338,4 +348,21 @@
>                         };
>                 };
>         };
> +
> +       exynos-usbphy@125B0000 {
> +               status = "okay";
> +       };
> +
> +       hsotg@12480000 {
> +               status = "okay";
> +               vusb_d-supply = <&ldo15_reg>;
> +               vusb_a-supply = <&ldo12_reg>;

Can you please point me to the documentation for these two properties
in the DT bindings ?
Which tree i should grep to find that ?
We have similar supplies for ehci/ohci and other host controllers too,
so just wondering
if we can use similar nomenclature for hsotg as well as host.

I have posted driver side patches for host (with DT documentation) a
while back :
https://lkml.org/lkml/2014/6/25/363

[snip]


-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
