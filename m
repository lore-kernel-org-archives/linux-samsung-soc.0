From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: dts: Update lid and power pin-functions for exynos5250-spring
Date: Wed, 18 Mar 2015 01:33:12 +0900
Message-ID: <55085748.8050905@kernel.org>
References: <1424276245-7028-1-git-send-email-afaerber@suse.de> <54E5CDB7.6050002@collabora.co.uk> <5506EEBA.6050509@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37555 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753562AbbCQQdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 12:33:23 -0400
In-Reply-To: <5506EEBA.6050509@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>

On 03/16/15 23:54, Andreas F=C3=A4rber wrote:
> Kukjin,
>=20
> Am 19.02.2015 um 12:49 schrieb Javier Martinez Canillas:
>> Hello Andreas,
>>
>> On 02/18/2015 05:17 PM, Andreas F=C3=A4rber wrote:
>>> Configure the pins in external interrupt mode, as done for Snow in
>>> e5e5c6d14e39 ("ARM: dts: Add power and lid GPIO keys pinctrl for
>>> exynos5250-snow").
>>>
>>> Reported-by: Kukjin Kim <kgene@kernel.org>
>>> Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>>> Fixes: 53dd4138bb0a ("ARM: dts: Add exynos5250-spring device tree")
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>> ---
>>
>> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.=
uk>
>=20
> Ping?
>=20
Thanks, applied.

- Kukjin
