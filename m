From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 1/4] ARM: dts: Fix MMC pinctrl for exynos5250-snow
Date: Thu, 31 Jul 2014 21:20:15 +0200
Message-ID: <53DA96EF.8050203@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:41027 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750781AbaGaTUW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 15:20:22 -0400
In-Reply-To: <1406822910-6255-2-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 31.07.2014 18:08, Andreas F=C3=A4rber wrote:
> The pinctrl properties should be on the device directly and not on th=
e
> slot sub-node.
>=20
> Reported-by: Doug Anderson <dianders@chromium.org>
> Cc: Jaehoon Chung <jh80.chung@samsung.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v3 -> v4: Unchanged
> =20
>  v3: New (Doug Anderson)
>  Redundant with Jaehoon Chung's general slot@0 deprecation,
>  in case that hits the tree earlier.
>=20
>  arch/arm/boot/dts/exynos5250-snow.dts | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
