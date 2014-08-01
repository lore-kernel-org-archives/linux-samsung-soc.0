From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [PATCH v5 06/10] ARM: dts: Clean up exynos5250-smdk5250
Date: Fri, 01 Aug 2014 13:42:57 +0200
Message-ID: <53DB7D41.2070000@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de> <1406868897-26874-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52464 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752491AbaHALnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 07:43:04 -0400
In-Reply-To: <1406868897-26874-7-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Ajay Kumar <ajaykumar.rs@samsung.com>

Am 01.08.2014 06:54, schrieb Andreas F=C3=A4rber:
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/ex=
ynos5250.dtsi
> index ff1c09607631..30482fc523f9 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -215,7 +215,7 @@
>  		clock-names =3D "fimg2d";
>  	};
> =20
> -	codec@11000000 {
> +	codec: codec@11000000 {
>  		compatible =3D "samsung,mfc-v6";
>  		reg =3D <0x11000000 0x10000>;
>  		interrupts =3D <0 96 0>;

I notice that Ajay's iommu patch uses mfc here, so let's use it here,
too. Affects patches 7 and 10.

Andreas

> @@ -258,7 +258,7 @@
>  		clock-names =3D "uart", "clk_uart_baud0";
>  	};
> =20
> -	sata@122F0000 {
> +	sata: sata@122F0000 {
>  		compatible =3D "snps,dwc-ahci";
>  		samsung,sata-freq =3D <66>;
>  		reg =3D <0x122F0000 0x1ff>;

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
