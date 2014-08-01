From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 04/10] ARM: dts: Fill in bootargs for exynos5250-snow
Date: Fri, 1 Aug 2014 13:28:17 -0700
Message-ID: <CAD=FV=V4hQeGvE9+O2EY8KGvDj3SJKfOZGes4gKpHfg=xz1h4A@mail.gmail.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
	<1406868897-26874-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:56249 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822AbaHAU2S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 16:28:18 -0400
Received: by mail-vc0-f174.google.com with SMTP id la4so7632954vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Aug 2014 13:28:18 -0700 (PDT)
In-Reply-To: <1406868897-26874-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Hi,

On Thu, Jul 31, 2014 at 9:54 PM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> exynos5250-cros-common.dtsi had an empty /chosen node.
> Fill in exemplary boot arguments.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v5: New
>  Cleanup for /chosen node moved into -snow.dts.
>
>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dt=
s/exynos5250-snow.dts
> index 7680d5e03fb3..c4b0c73c736d 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -27,6 +27,7 @@
>         };
>
>         chosen {
> +               bootargs =3D "console=3Dtty1";

As mentioned earlier, I don't think this is a particularly useful
change.  Just this boot argument is not enough to boot with anyway, so
listing it doesn't really help anyone.  In theory you could make some
assertion about what the "most popular" boot device and filesystem is,
but it seems unlikely to cover the majority of the cases.

I won't NAK this change myself, but I certainly won't push for it.

-Doug
