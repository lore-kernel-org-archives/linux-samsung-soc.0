From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v4 1/4] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Fri, 01 Aug 2014 03:41:37 +0900
Message-ID: <53DA8DE1.10601@samsung.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:45074 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751350AbaGaSlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 14:41:46 -0400
In-Reply-To: <1406822910-6255-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 08/01/14 01:08, Andreas F=C3=A4rber wrote:
> The pinctrl properties should be on the device directly and not on th=
e
> slot sub-node.
>
> Reported-by: Doug Anderson<dianders@chromium.org>
> Cc: Jaehoon Chung<jh80.chung@samsung.com>
> Signed-off-by: Andreas F=C3=A4rber<afaerber@suse.de>
> ---
>   v3 ->  v4: Unchanged
>
>   v3: New (Doug Anderson)
>   Redundant with Jaehoon Chung's general slot@0 deprecation,
>   in case that hits the tree earlier.
>
>   arch/arm/boot/dts/exynos5250-snow.dts | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dt=
s/exynos5250-snow.dts
> index f2b8c4116541..eb437f6afec1 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -240,10 +240,8 @@
>   	 */
>   	mmc@12230000 {
>   		status =3D "okay";
> -		slot@0 {
> -			pinctrl-names =3D "default";
> -			pinctrl-0 =3D<&sd3_clk&sd3_cmd&sd3_bus4>;
> -		};
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D<&sd3_clk&sd3_cmd&sd3_bus4>;
>   	};
>
>   	i2c@12CD0000 {

Once I get Doug's reviewed tag on exynos5250-snow dt changes, I will=20
take this series :) Though Doug suggested or reported...

Thanks,
Kukjin
