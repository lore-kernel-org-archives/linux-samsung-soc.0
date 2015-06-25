From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: Remove MFD_CROS_EC depends on X86 || ARM
Date: Thu, 25 Jun 2015 09:38:54 +0100
Message-ID: <20150625083854.GV15013@x1>
References: <1435191645-6022-1-git-send-email-javier.martinez@collabora.co.uk>
 <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:32935 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752029AbbFYIi6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jun 2015 04:38:58 -0400
Received: by wiwl6 with SMTP id l6so10812187wiw.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jun 2015 01:38:57 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1435191645-6022-3-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, Gwendal Grignou <gwendal@google.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>

On Thu, 25 Jun 2015, Javier Martinez Canillas wrote:

> A dependency on X86 || ARM for MFD_CROS_EC was added to fix the warni=
ng:
>=20
> (MFD_CROS_EC) selects CHROME_PLATFORMS which has unmet direct depende=
ncies (X86 || ARM)
>=20
> This happened because CHROME_PLATFORMS had a dependency on X86 || ARM=
 but
> that dependency was removed since there isn't a reason why the option=
 can
> not be selected on other architectures. So now the above warning will=
 not
> happen and the MFD_CROS_EC dependency can be removed since is not nee=
ded.
>=20
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
>  drivers/mfd/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied for v4.3, thanks.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index d3235e6f1953..653815950aa2 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -94,7 +94,6 @@ config MFD_AXP20X
> =20
>  config MFD_CROS_EC
>  	tristate "ChromeOS Embedded Controller"
> -	depends on X86 || ARM
>  	select MFD_CORE
>  	select CHROME_PLATFORMS
>  	select CROS_EC_PROTO

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
