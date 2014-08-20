From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/6] ARM: dts: Add Peach Pit and Pi dts entry for max77802
 PMIC
Date: Wed, 20 Aug 2014 12:27:53 +0200
Message-ID: <53F47829.5040708@collabora.co.uk>
References: <1408460913-13863-1-git-send-email-javier.martinez@collabora.co.uk> <1408460913-13863-2-git-send-email-javier.martinez@collabora.co.uk> <53F39CE3.8040303@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:42988 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910AbaHTK17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 06:27:59 -0400
In-Reply-To: <53F39CE3.8040303@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Andreas,

On 08/19/2014 08:52 PM, Andreas F=E4rber wrote:
>> +
>> +	max77802-pmic@9 {
>> +		compatible =3D "maxim,max77802";
>> +		interrupt-parent =3D <&gpx3>;
>> +		interrupts =3D <1 0>;
>=20
> <1 IRQ_TYPE_NONE>?
>=20

Indeed, I'll change both on v2. Thanks a lot.

>=20
> Cheers,
> Andreas
>=20

Best regards,
Javier
