From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: Enable USB 3503 hub on exynos5250-snow
Date: Thu, 08 May 2014 18:12:53 +0200
Message-ID: <536BAD05.9070401@samsung.com>
References: <1399293056-17143-1-git-send-email-gautam.vivek@samsung.com>
 <536BA9E8.2030306@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <536BA9E8.2030306-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, arunkk.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08.05.2014 17:59, Andreas F=E4rber wrote:
> Hello,
>=20
> Am 05.05.2014 14:30, schrieb Vivek Gautam:
>> The exynos5250-snow has a SMSC USB3503 connected in
>> hardware only mode like a PHY. Enable support for it,
>> and add necessary 'reset-gpio' for it.
>>
>> This is in correspondance to similar patch by Mark Brown
>> 7c1b0ec ARM: dts: Enable USB hub on Arndale
>>
>> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> ---
>>
>> Based on 'for-next' branch of kgene's linux-samsung tree.
>>
>>  arch/arm/boot/dts/exynos5250-pinctrl.dtsi |    7 +++++++
>>  arch/arm/boot/dts/exynos5250-snow.dts     |   14 ++++++++++++++
>>  2 files changed, 21 insertions(+)
>=20
> The same snippet as for snow also fixed my USB issues on spring.
> Should it go into exynos5250-cros-common.dtsi instead?

The GPIO pins used are different, so I don't think the hub node added b=
y
these patches could be shared.

Also, I believe all you need to add is a simple node as follows

usb_hub {
	compatible =3D "smsc,usb3503a";
	reset-gpios =3D <&gpe1 0 1>;
};

at root level (see my comments to this patch in another reply), which i=
s
affordable to be duplicated for every platform that requires it,
especially if the reset-gpios property differs between boards.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
