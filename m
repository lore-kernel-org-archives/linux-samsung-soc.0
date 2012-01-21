From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 22:33:44 +0100
Message-ID: <4F1B2F38.9050708@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <20120121183155.GE10751@opensource.wolfsonmicro.com> <4F1B2235.4000009@gmail.com> <201201212223.54801.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:39513 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751140Ab2AUVdu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 16:33:50 -0500
In-Reply-To: <201201212223.54801.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-i2c@vger.kernel.org, Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01/21/2012 10:23 PM, Heiko St=C3=BCbner wrote:
> Am Samstag 21 Januar 2012, 21:38:13 schrieb Sylwester Nawrocki:
>> On 01/21/2012 07:31 PM, Mark Brown wrote:
>>> On Sat, Jan 21, 2012 at 04:52:58PM +0100, Sylwester Nawrocki wrote:
>>>> On 01/21/2012 02:28 PM, Mark Brown wrote:
>>> that the rather serious problems with getting I2C patches applied I=
'd
>>> rather do as little as possible in individual patches.
>>>
>>> It would also introduce a regression for systems that don't use run=
time
>>> PM (probably most s3c24xx ones).
>>
>> Indeed, I'd forgotten about this fact for a while. I suspect the Run=
-time
>> PM core functionality could be enabled on those platform, allowing t=
o make
>> the common driver dependant on PM_RUNTIME. Not sure if that's accept=
able
>> for the smaller SoCs though. It rather sounds more like lots of trou=
ble
>> for little benefits. Maybe it's desirable to do that at some point a=
nyway.
>=20
> At least S3C2416/S3C2450 and S3C2412 (i.e. the ARMv5 SoCs) might prof=
it from
> it, as they also support the idle modes (stop modes) that Mark is tar=
getting
> with his patches in the long run.

Ah, I was just about to ask whether this patch is a part of some wider =
plan.
It would be much better to enable core runtime PM support on all platfo=
rms
that use particular driver, even though there is no any drivers adapted=
=20
runtime PM on some of them yet.

>=20
> Not sure about the 2410, 2440 and 2443 currently

But would just enabling RUNTIME_PM make any harm to those platforms ?

--=20

Regards,
Sylwester
