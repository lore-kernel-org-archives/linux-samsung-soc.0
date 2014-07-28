From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Subject: Re: [RESEND][PATCH 1/2] ARM: DTS: Add PMU DT node for exynos5260
 SoC
Date: Mon, 28 Jul 2014 22:29:33 +0200
Message-ID: <53D6B2AD.7070404@suse.de>
References: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>	<1406551080-14821-2-git-send-email-vikas.sajjan@samsung.com> <CAK5sBcHdsDF60JTv7ugC4m=A-5Lmr2rDwizhkCLEyYGRio-2-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60103 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751162AbaG1U3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 16:29:41 -0400
In-Reply-To: <CAK5sBcHdsDF60JTv7ugC4m=A-5Lmr2rDwizhkCLEyYGRio-2-Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>, Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, sajjan.linux@gmail.com, Doug Anderson <dianders@chromium.org>

Hi Vikas and Sachin,

Am 28.07.2014 17:26, schrieb Sachin Kamat:
> On Mon, Jul 28, 2014 at 6:07 PM, Vikas Sajjan <vikas.sajjan@samsung.c=
om> wrote:
>> Adds PMU DT node for exynos5260 SoC.
>>
>> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
>> ---
>>  .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>>  arch/arm/boot/dts/exynos5260.dtsi                  |    5 +++++
>>  2 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b=
/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> index 2a4ab04..c038628 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>> @@ -8,6 +8,7 @@ Properties:
>>                    - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
>>                    - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
>>                    - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
>> +                  - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
>=20
> nit: This line should come after 5250 entry to preserve the order.
>=20
> Otherwise, looks good.

Earlier today, Kukjin indicated he would apply my corresponding 5410
series [*], but he hasn't pushed yet. It adds a 5410 entry before 5420,
which will conflict with adding 5260 in the same place.

Regards,
Andreas

[*]
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg34686.=
html

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
