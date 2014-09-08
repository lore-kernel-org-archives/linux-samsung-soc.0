From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/2] ARM: exynos_defconfig: Enable Control Groups support
Date: Mon, 08 Sep 2014 14:43:10 +0200
Message-ID: <540DA45E.1040702@collabora.co.uk>
References: <1409137341-20516-1-git-send-email-javier.martinez@collabora.co.uk> <53FE02E6.3030302@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:33665 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784AbaIHMnP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 08:43:15 -0400
In-Reply-To: <53FE02E6.3030302@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Hello Andreas,

On 08/27/2014 06:10 PM, Andreas F=E4rber wrote:
> Am 27.08.2014 13:02, schrieb Javier Martinez Canillas:
>> systemd needs control groups support to be enabled in the
>> kernel so let's enable it by default since is quite likely
>> that a user-space with systemd will be used.
>>=20
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.c=
o.uk>
>> ---
>>  arch/arm/configs/exynos_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/ex=
ynos_defconfig
>> index 676c744..590abde 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -1,6 +1,7 @@
>>  CONFIG_SYSVIPC=3Dy
>>  CONFIG_NO_HZ=3Dy
>>  CONFIG_HIGH_RES_TIMERS=3Dy
>> +CONFIG_CGROUPS=3Dy
>>  CONFIG_BLK_DEV_INITRD=3Dy
>>  CONFIG_KALLSYMS_ALL=3Dy
>>  CONFIG_MODULES=3Dy
>=20
> CONFIG_FHANDLE=3Dy is also needed for systemd to get a serial console=
=2E
> multi_v7 has that already.
>=20

That's a requirement for systemd >=3D 209 AFAIK. I've systemd 208 on my=
 debian
jessie and it works without it.

I agree that it should be included but I think it can be in a follow-up=
 patch.

> Regards,
> Andreas
>=20

Best regards,
Javier
