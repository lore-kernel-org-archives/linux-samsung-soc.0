From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/2] ARM: S3C24XX: Move s3c2443-clock.c to mach-s3c24xx
Date: Thu, 23 Feb 2012 02:42:58 +0900
Message-ID: <4F452922.3060600@samsung.com>
References: <201202212221.41744.heiko@sntech.de> <201202212226.01189.heiko@sntech.de> <201202221718.01137.arnd@arndb.de> <201202221828.53363.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:35209 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753266Ab2BVRnE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Feb 2012 12:43:04 -0500
Received: by daed14 with SMTP id d14so258091dae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2012 09:43:03 -0800 (PST)
In-Reply-To: <201202221828.53363.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

On 02/23/12 02:28, Heiko St=FCbner wrote:
> Am Mittwoch 22 Februar 2012, 18:18:00 schrieb Arnd Bergmann:
>> On Tuesday 21 February 2012, Heiko St=FCbner wrote:
>>> S3C-SoCs starting with the S3C2443 can share a lot of functionality=
=2E
>>> The file can collect more common code of these SocS later on and
>>> therefore gets a new name to reflect this future purpose.
>>>
>>> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
>>> ---
>>>
>>>   arch/arm/mach-s3c24xx/Kconfig          |   14 +-
>>>   arch/arm/mach-s3c24xx/Makefile         |    4 +
>>>   arch/arm/mach-s3c24xx/common-s3c2443.c |  644
>>>   ++++++++++++++++++++++++++++++++ arch/arm/plat-s3c24xx/Kconfig
>>>   |    6 -
>>>   arch/arm/plat-s3c24xx/Makefile         |    1 -
>>>   arch/arm/plat-s3c24xx/s3c2443-clock.c  |  635
>>>   -------------------------------
>>
>> No objections on the patch, but please use 'git format-patch -M' whe=
n
>> moving files so that we can see which parts have changed in the proc=
ess.
> the results of -M look really nice, thanks for the hint and I will tr=
y to
> remember it :-)
>
Or for that, you can add following at .gitconfig file

[diff]
	renames =3D true
	renameLimit =3D 50000

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
