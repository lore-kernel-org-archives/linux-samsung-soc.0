From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 06/10] ARM: dts: Clean up exynos5250-smdk5250
Date: Sat, 02 Aug 2014 14:57:46 +0200
Message-ID: <53DCE04A.1040803@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-7-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:37791 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbaHBM5u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 08:57:50 -0400
In-Reply-To: <1406940750-15880-7-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
> Use the new style for referencing inherited nodes and use symbolic na=
mes.
>=20
> Goal is the alignment of all exynos5250 based device trees for compar=
ison.
>=20
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v5 -> v6:
>  * Renamed node label codec -> mfc for alignment with "add System MMU=
 nodes"
>  * Rebased for leaving dp_hpd in .dtsi
> =20
>  v5: New
>  Follow-up after adding dp_hpd pinctrl node new-style.
>=20
>  arch/arm/boot/dts/exynos5250-smdk5250.dts | 632 +++++++++++++++-----=
----------
>  1 file changed, 318 insertions(+), 314 deletions(-)

This in fact ends up with empty diff after compiling and decompiling th=
e
dts, so obviously will not break anything. :)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
