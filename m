From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 07/10] ARM: dts: Clean up exynos5250-arndale
Date: Fri, 01 Aug 2014 23:03:52 +0200
Message-ID: <53DC00B8.3050008@gmail.com>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de> <1406868897-26874-8-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:52798 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754825AbaHAVD5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Aug 2014 17:03:57 -0400
In-Reply-To: <1406868897-26874-8-git-send-email-afaerber@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>

Just wanted to report one issue unrelated to your changes I spotted
while reviewing this patch. See below.

On 01.08.2014 06:54, Andreas F=C3=A4rber wrote:
> Use the new style of referencing inherited nodes, use symbolic names,
> tidy indentation and reorder includes.
>=20
> Goal is the alignment of all exynos5250 based device trees for compar=
ison.

[snip]

> -	fimd: fimd@14400000 {
> -		status =3D "okay";
> -		display-timings {
> -			native-mode =3D <&timing0>;
> -			timing0: timing@0 {
> -				/* 2560x1600 DP panel */
> -				clock-frequency =3D <50000>;

This apparently makes little sense as I doubt anybody would be willing
to run a DP panel with refresh rate of 0,012 Hz...

Anyway, your patch just moves it, so this is just an unrelated report.

Best regards,
Tomasz
