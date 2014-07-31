From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: Add exynos5250-spring device tree
Date: Thu, 31 Jul 2014 23:09:58 +0200
Message-ID: <53DAB0A6.9030700@gmail.com>
References: <1406822910-6255-1-git-send-email-afaerber@suse.de> <1406822910-6255-5-git-send-email-afaerber@suse.de> <53DA936E.9060004@gmail.com> <53DAA8E6.3010400@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:37335 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906AbaGaVKE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 17:10:04 -0400
In-Reply-To: <53DAA8E6.3010400@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>



On 31.07.2014 22:36, Andreas F=C3=A4rber wrote:
> Am 31.07.2014 21:05, schrieb Tomasz Figa:
>>> +	};
>>> +
>>> +	fixed-rate-clocks {
>>> +		xxti {
>>> +			compatible =3D "samsung,clock-xxti";
>>> +			clock-frequency =3D <24000000>;
>>> +		};
>>> +	};
>>
>> This is also referencing a node from higher level, so it should be d=
one
>> using a reference.
>=20
> Actually this one isn't! Neither fixed-rate-clocks nor xxti exists in
> the .dtsi.

You've got me here. :)

In new dts I actually suggest to specify those on SoC level, since they
are generic SoC inputs and just override their frequencies on board
level, but apparently Exynos5250 doesn't follow this fashion. So this i=
s
fine as is, sorry for noise.

Best regards,
Tomasz
