From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: kgene's for-next branch broken, and boot regressions
Date: Sun, 27 Jul 2014 14:33:22 +0200
Message-ID: <53D4F192.5020605@suse.de>
References: <53D46D2F.3000202@suse.de> <53D494DB.8030600@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36179 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751343AbaG0MdZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 08:33:25 -0400
In-Reply-To: <53D494DB.8030600@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Kevin Hilman <khilman@linaro.org>

Am 27.07.2014 07:57, schrieb Andreas F=E4rber:
> Am 27.07.2014 05:08, schrieb Andreas F=E4rber:
>> On the ODROID-XU (with local patches based on smdk5410) I get the
>> following with earlyprintk:
>>
[...]
>> [    0.000000] Kernel panic - not syncing: failed to find exynos pmu
>> register
[...]
>>
>> Reverting "ARM: EXYNOS: Refactored code for using PMU address via DT=
"
>> and "ARM: EXYNOS: Add support for mapping PMU base address via DT" f=
ixed
>> the latter.
>=20
> Adding a "samsung,exynos5410-pmu" system-controller node like on 5420
> fixes this as well. Patchset being prepared.

http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34686.=
html

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
