From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 04/10] ARM: dts: Clean up exynos5250-snow
Date: Sat, 02 Aug 2014 14:21:43 +0200
Message-ID: <53DCD7D7.2070208@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:59918 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971AbaHBMVt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 08:21:49 -0400
In-Reply-To: <1406940750-15880-5-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Vincent Palatin <vpalatin@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, open list <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kumar Gala <galak@codeaurora.org>, Stephan van Schaik <stephan@synkhronix.com>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org

On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
> Use the new style of referencing inherited nodes and use symbolic nam=
es.
> Reorder one pinctrl node in GPIO order.
>=20
> Goal is the alignment of all exynos5250 based device trees for compar=
ison.
>=20
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v5 -> v6:
>  * Split off label additions (Doug Anderson)
>  * Fixed alphabetical order of sd3_* nodes (Doug Anderson)
> =20
>  v4 -> v5:
>  * Introduced labels to consistently use new referencing style (Tomas=
z Figa)
>  * Use IRQ_TYPE_* constants
>  * Use some more GPIO_ACTIVE_*
>=20
>  v3 -> v4: Unchanged
> =20
>  v3: New (Doug Anderson)
>=20
>  arch/arm/boot/dts/exynos5250-snow.dts | 291 +++++++++++++++++-------=
----------
>  1 file changed, 145 insertions(+), 146 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
