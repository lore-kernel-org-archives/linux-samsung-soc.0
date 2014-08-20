From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 5/6] ARM: dts: Add vmmc and vqmmc supplies for Peach Pit
 and Pi boards
Date: Wed, 20 Aug 2014 12:21:58 +0200
Message-ID: <53F476C6.9030809@collabora.co.uk>
References: <1408460913-13863-1-git-send-email-javier.martinez@collabora.co.uk> <1408460913-13863-6-git-send-email-javier.martinez@collabora.co.uk> <53F39978.3080901@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53F39978.3080901@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andreas,

Thanks a lot for your feedback.

On 08/19/2014 08:37 PM, Andreas F=E4rber wrote:
>>  &mmc_2 {
>> +	vmmc-supply =3D <&tps65090_fet4>;
>> +	vqmmc-supply =3D <&vqmmc_sdcard>;
>>  	status =3D "okay";
>>  	num-slots =3D <1>;
>>  	supports-highspeed;
>=20
> A convention that I picked up was to place overridden status property
> first. Do your new properties really need to go before that?
>

OF doesn't care about the order of the child nodes but I do agree that
consistency is a good thing so I'll change that on v2.

> Also, if you look at today's for-next, then supports-highspeed should=
 be
> cap-{sd,mmc}-highspeed, so it may be worth to rebase.
>=20

You are right, this patch used to be part of an older series so I didn'=
t
realize that "[PATCHv10 3/5] ARM: dts: exynos: unuse the slot-node and
deprecate the supports-highspeed for dw-mmc" was already merged. Thanks
for the reminder!

> Regards,
> Andreas
>=20

Best regards,
Javier
