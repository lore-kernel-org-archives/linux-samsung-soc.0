From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 23:49:27 +0100
Message-ID: <4F1B40F7.1000602@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20120121183155.GE10751@opensource.wolfsonmicro.com> <4F1B2235.4000009@gmail.com> <201201212223.54801.heiko@sntech.de> <4F1B2F38.9050708@gmail.com> <20120121215758.GC8331@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:63406 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343Ab2AUWtc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 17:49:32 -0500
In-Reply-To: <20120121215758.GC8331@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, linux-i2c@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01/21/2012 10:57 PM, Mark Brown wrote:
> On Sat, Jan 21, 2012 at 10:33:44PM +0100, Sylwester Nawrocki wrote:
>> On 01/21/2012 10:23 PM, Heiko St=C3=BCbner wrote:
>=20
>>> At least S3C2416/S3C2450 and S3C2412 (i.e. the ARMv5 SoCs) might pr=
ofit from
>>> it, as they also support the idle modes (stop modes) that Mark is t=
argetting
>>> with his patches in the long run.
>=20
>> It would be much better to enable core runtime PM support on all pla=
tforms
>> that use particular driver, even though there is no any drivers adap=
ted
>> runtime PM on some of them yet.
>
> It's just a Kconfig switch, the only issue is that users might not tu=
rn
> it on and for platforms where there's not much driver support they're
> more likely to not have done so.

Yes, and some simple SoCs might probably never benefit from runtime PM =
due to
their limited power modes. Hence enforcing RUNTIME_PM dependency on som=
e=20
common drivers might not be sane. But it would be ideal not to work aro=
und
things too much, and reimplement in drivers functionality that involves
upper layers.
=20
>>> Not sure about the 2410, 2440 and 2443 currently
>=20
>> But would just enabling RUNTIME_PM make any harm to those platforms =
?
>=20
> It really shouldn't cause any issues but it seems better to not push
> people towards it too much when there's not much win yet.  What I've
> been doing with all these patches is leaving any PM that already exis=
ts
> untouched (in so far as it's not buggy).  Where there's nothing alrea=
dy
> and it's all new code I've been using a more modern idiom.  I hope th=
at
> this minimise any impact on existing systems.

Sounds good. The idea of enforcing runtime PM seems to be good for /dev=
/null
only.. I noticed recently that you did a nice work correcting broken s3=
c-fb=20
driver PM code. I've done similar corrections but the patches never lef=
t the=20
internal trees due to limited time for this. And there is also a DRM dr=
iver=20
for FIMD on Exynos now.
