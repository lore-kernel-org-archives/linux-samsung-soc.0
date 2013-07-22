From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 04/20] clocksource: samsung_pwm_timer: Do not use clocksource_mmio
Date: Mon, 22 Jul 2013 22:13:17 +0200
Message-ID: <51ED925D.3060307@linaro.org>
References: <1374278673-25615-1-git-send-email-tomasz.figa@gmail.com> <1374278673-25615-6-git-send-email-tomasz.figa@gmail.com> <51ECAD60.1000109@linaro.org> <19090469.Cf6sbb33Ke@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:55644 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757021Ab3GVUNV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 16:13:21 -0400
Received: by mail-we0-f182.google.com with SMTP id u55so1627679wes.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 13:13:20 -0700 (PDT)
In-Reply-To: <19090469.Cf6sbb33Ke@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>

On 07/22/2013 09:47 AM, Tomasz Figa wrote:
> Hi Daniel,
>=20
> On Monday 22 of July 2013 05:56:16 Daniel Lezcano wrote:
>> On 07/20/2013 02:04 AM, Tomasz Figa wrote:
>>> In case of Samsung PWM timer, clocksource MMIO can not be used,
>>> because
>>> custom suspend/resume callbacks are required.
>>>
>>> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>>> ---
>>
>> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>=20
> Thanks for review.
>=20
>> Please in the future Cc me and Thomas Gleixner (clocksource/clockeve=
nt
>> maintainers).
>=20
> Oh, right, sorry. This series originally was not touching the clockso=
urce=20
> driver and I just kept original recipient list.
>=20
> Btw. Have you updated MAINTAINERS file? In latest linux-next I can st=
ill=20
> see only John Stultz and Thomas Gleixner as maintainers of=20
> drivers/clocksource.

Yes, right last week :)

https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=3Dti=
mers/core&id=3D9222d247bcbaacc40fe15549158f9d67523c1ace

Thanks
  -- Daniel

--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
