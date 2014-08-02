From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v6 10/10] ARM: dts: Add exynos5250-spring device tree
Date: Sat, 02 Aug 2014 15:18:09 +0200
Message-ID: <53DCE511.3070404@gmail.com>
References: <1406940750-15880-1-git-send-email-afaerber@suse.de> <1406940750-15880-11-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:33959 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752255AbaHBNSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Aug 2014 09:18:14 -0400
In-Reply-To: <1406940750-15880-11-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>

On 02.08.2014 02:52, Andreas F=C3=A4rber wrote:
> Adds initial support for the HP Chromebook 11.
>=20
> Cc: Vincent Palatin <vpalatin@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Stephan van Schaik <stephan@synkhronix.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---
>  v5 -> v6:
>  * Updated for mfc node label
>  * Reverted to dp-hpd-gpio node in pinctrl_0 (Doug Anderson)
>  * Fixed alphabetical order of sd1_* nodes (Doug Anderson)
> =20

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
