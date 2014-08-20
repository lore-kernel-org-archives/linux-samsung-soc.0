From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 5/6] ARM: dts: Add vmmc and vqmmc supplies for Peach Pit
 and Pi boards
Date: Wed, 20 Aug 2014 12:36:11 +0200
Message-ID: <53F47A1B.2030204@collabora.co.uk>
References: <1408460913-13863-1-git-send-email-javier.martinez@collabora.co.uk> <1408460913-13863-6-git-send-email-javier.martinez@collabora.co.uk> <53F39978.3080901@suse.de> <53F476C6.9030809@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:43009 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939AbaHTKgT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Aug 2014 06:36:19 -0400
In-Reply-To: <53F476C6.9030809@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Andreas,

On 08/20/2014 12:21 PM, Javier Martinez Canillas wrote:
> Hello Andreas,
>=20
> Thanks a lot for your feedback.
>=20
> On 08/19/2014 08:37 PM, Andreas F=E4rber wrote:
>>>  &mmc_2 {
>>> +	vmmc-supply =3D <&tps65090_fet4>;
>>> +	vqmmc-supply =3D <&vqmmc_sdcard>;
>>>  	status =3D "okay";
>>>  	num-slots =3D <1>;
>>>  	supports-highspeed;
>>=20
>> A convention that I picked up was to place overridden status propert=
y
>> first. Do your new properties really need to go before that?
>>
>=20
> OF doesn't care about the order of the child nodes but I do agree tha=
t
> consistency is a good thing so I'll change that on v2.
>=20

Actually I meant that I'll change this for a future re-post since I'm
completely dropping this patch from the series due Doug's explanation
about the CD line and VCCQ/VDD_IO being in the same power rail on Exyno=
s5
SoCs.

Sorry for the noise...

Best regards,
Javier
