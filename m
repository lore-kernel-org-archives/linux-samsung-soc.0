From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v6 00/10] ARM: dts: exynos: Prepare Spring
Date: Sat, 02 Aug 2014 04:34:41 +0200
Message-ID: <53DC4E41.4050200@collabora.co.uk>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60581 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723AbaHBCer (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 22:34:47 -0400
In-Reply-To: <1406940750-15880-1-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hello Andreas

On 08/02/2014 02:52 AM, Andreas F=C3=A4rber wrote:
>=20
> Based on the preinstalled 3.8 based ChromeOS kernel and previous 3.15=
=20
> based attempts by Stephan and me that broke for 3.16, I've prepared a=
=20
> device tree for the HP Chromebook 11 aka Google Spring.
>=20
> v6 renames a node and reverts dp_hpd.
>=20
> Not yet enabled are trackpad, Wifi and sound.
>=20
> My rebasing branch for testing is here:
> https://github.com/afaerber/linux/commits/spring-next
>=20
> Regards,
> Andreas
>=20

I made a comment on patch 05/10 but the rest of the series looks good t=
o me. So
for the remaining patches:

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

NOTE: I thought that Tomasz Figa gave you his Reviewed-by on v5 for the=
 whole
series as well but I didn't see his tag on the v6 patches.

Best regards,
Javier
