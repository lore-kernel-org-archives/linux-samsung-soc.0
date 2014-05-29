From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v11 0/3] Exynos 5410 support
Date: Thu, 29 May 2014 15:36:10 +0200
Message-ID: <538737CA.4070709@suse.de>
References: <1401074613-29227-1-git-send-email-t.dakhran@samsung.com> <7hr43f9mmn.fsf@paris.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46957 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932423AbaE2NgR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 09:36:17 -0400
In-Reply-To: <7hr43f9mmn.fsf@paris.lan>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@linaro.org>, Tarek Dakhran <t.dakhran@samsung.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>

Hi Tarek and Kevin,

Am 27.05.2014 19:06, schrieb Kevin Hilman:
> Tarek Dakhran <t.dakhran@samsung.com> writes:
>=20
>> The series of patches represent support of Exynos 5410 SoC
>>
>> The Exynos 5410 is the first Samsung SoC based on big.LITTLE archite=
cture
>>
>> Patches add new platform description, support of clock controller an=
d device
>> tree for Exynos 5410.
>>
>> Has been build on Samsung Linux Kernel
>>   (branch: for-next, commit: 97eae6c Merge branch 'v3.16-next/multip=
latform' into for-next)
>>
>> Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig=
)
>> 		    2) Exynos 5410 reference board (multi_v7_defconfig)
>> 		    3) Odroid-XU board (exynos_defconfig)
>> 		    4) Odroid-XU board (multi_v7_defconfig)
>=20
> Tested-by: Kevin Hilman <khilman@linaro.org>
>=20
> FYI, I boot tested this on an odroid-xu (exynos_defconfig and
> multi_v7_defconfig.)

Could you clarify: Are you using exynos5410-smdk5410.dts with the
ODROID-XU or do you have some upcoming exynos5410-odroidxu.dts based on
exynos5410.dtsi?

Thanks,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
