From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] platform/chrome: Don't make CHROME_PLATFORMS depends
 on X86 || ARM
Date: Wed, 22 Jul 2015 08:16:40 +0100
Message-ID: <20150722071640.GR3061@x1>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:36789 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932478AbbGVHQp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jul 2015 03:16:45 -0400
Received: by wicgb10 with SMTP id gb10so84506931wic.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jul 2015 00:16:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1435191645-6022-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:

> The Chrome platform support depends on X86 || ARM because there are
> only Chromebooks using those architectures. But only some drivers
> depend on a given architecture, and the ones that do already have
> a dependency on their specific Kconfig symbol entries.
>=20
> An option is to also make CHROME_PLATFORMS depends on || COMPILE_TEST
> but is more future proof to remove the dependency and let the drivers
> be built in all architectures if possible to have more build coverage=
=2E
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
>  drivers/platform/chrome/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied for v4.2, thanks.

> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrom=
e/Kconfig
> index cb1329919527..3271cd1abe7c 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -4,7 +4,6 @@
> =20
>  menuconfig CHROME_PLATFORMS
>  	bool "Platform support for Chrome hardware"
> -	depends on X86 || ARM
>  	---help---
>  	  Say Y here to get to see options for platform support for
>  	  various Chromebooks and Chromeboxes. This option alone does

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
