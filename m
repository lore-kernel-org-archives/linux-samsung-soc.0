From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 1/1] ARM: exynos_defconfig: Enable options for display
 panel support
Date: Mon, 25 Aug 2014 13:54:07 +0200
Message-ID: <53FB23DF.70809@collabora.co.uk>
References: <1408956336-17376-1-git-send-email-javier.martinez@collabora.co.uk> <5825205.70RuHaSG5p@amdc1032> <53FB22E4.8040906@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:46081 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932172AbaHYLyM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Aug 2014 07:54:12 -0400
In-Reply-To: <53FB22E4.8040906@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Andreas,

On 08/25/2014 01:49 PM, Andreas F=E4rber wrote:
>>=20
>> Could you please also do corresponding update to multi_v7_defconfig?
>=20
> As was mentioned in v1 (but now below), some of these options depend =
on

Sorry for missing the mention about the dependencies on v2...

> patches yet to be respun and be accepted into drm, so I would conside=
r
> this an RFC patch and suggest to wait with multi_v7.
>=20

Agreed, I just sent an email to Bartlomiej saying the same.

> It could of course be split, as CONFIG_DRM_EXYNOS* and backlight part=
s
> are certainly okay.
>

Also agreed.

> Regards,
> Andreas

Best regards,
Javier
