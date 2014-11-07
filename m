From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v5 0/5] regulator: of: Add initial and suspend modes support
Date: Fri, 07 Nov 2014 16:26:33 +0100
Message-ID: <1415373993.31102.29.camel@AMDC1943>
References: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:59969 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338AbaKGP0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 10:26:37 -0500
In-reply-to: <1415365205-27630-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Olof Johansson <olof@lixom.net>, Chris Zhong <zyw@rock-chips.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On pi=C4=85, 2014-11-07 at 14:00 +0100, Javier Martinez Canillas wrote:
> Hello Mark,
>=20
> This is the fifth version of the series that adds regulator initial
> and suspend operating modes support. It relies on the existing work
> that added suspend states bindings. The opmodes are parsed by the
> regulator core and drivers should only define a translation function
> to map between hardware specific to standard modes.
>=20
> The series adds a "regulator-initial-mode" property to configure at
> startup, the operating mode for the regulators that support changing
> its mode during normal operation and a "regulator-mode" property for
> the regulators that supports changing its operating mode when the
> system enters in a suspend state. These properties were originally
> part of Chanwoo Choi's regulator suspend state series [0] but were
> removed since there wasn't a way to define the operating modes in a
> generic way.
>=20
> The generic regulator DT binding doc explains that each device has
> to document what their valid operating modes are and drivers must
> add a translation function so the core knows how to map the opmodes.
>=20
> Older versions of this series were meant to add initial and suspend
> modes for the max77802 regulator driver but the feedback was that
> this should had been done in a generic way. The latest version was
> "[PATCH v4 00/14] Add Maxim 77802 PMIC support" [1] but that series
> mixed core changes, bugfixes and new driver features.
>=20
> This series instead contains only the patches that add the support
> to the regulator core and drivers are only modified when a function
> signature is changed to maintain git bisect-ability.
>=20
> If the patches are merged, following series will change the drivers
> using of_regulator_match() to pass the regulator description in the
> match table and another series will add the new opmode feature in
> the max77802 regulator driver.
>=20
> The series is composed of the following patches:
>=20
> Javier Martinez Canillas (5):
>   regulator: Document binding for initial and suspend modes
>   regulator: Add function to map modes to struct regulator_desc
>   regulator: of: Add regulator desc param to
>     of_get_regulator_init_data()
>   regulator: of: Pass the regulator description in the match table
>   regulator: of: Add support for parsing initial and suspend modes

I see my previous thoughts were addressed. I had few minor questions
about patch 3/5 but still whole patchset looks fine to me.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
