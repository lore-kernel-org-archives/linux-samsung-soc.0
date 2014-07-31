From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Fix Exynos5410 boot
Date: Wed, 30 Jul 2014 17:33:59 -0700
Message-ID: <CAOesGMjh=xMZ3vB45ofh=CLjTFDMQxSxus5q_P67XQSbwg6-+A@mail.gmail.com>
References: <1406463725-4208-1-git-send-email-afaerber@suse.de>
	<53D4EFBB.6000404@suse.de>
	<00c901cfa9fc$727b4e10$5771ea30$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00c901cfa9fc$727b4e10$5771ea30$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Sun, Jul 27, 2014 at 5:39 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Andreas F=C3=A4rber wrote:
>>
>> Am 27.07.2014 14:22, schrieb Andreas F=C3=A4rber:
>> > Hello,
>> >
>> > This mini-series unbreaks booting on 5410 based ODROID-XU.
>> >
>> > Since I do not have access to a TRM, the address is a guess based =
on
>> > 5250 and 5410. Such a node was not present in the 3.14 downstream =
tree.
>>
>> s/5410/5420/
>>
> OK.
>
>> >
>> > Regards,
>> > Andreas
>> >
>> > Andreas F=C3=A4rber (3):
>> >   Documentation: devicetree: Document exynos5410 PMU
>> >   ARM: dts: exynos: Add PMU to Exynos5410
>> >   ARM: EXYNOS: Add support for Exynos5410 PMU
>> >
>> >  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
>> >  arch/arm/boot/dts/exynos5410.dtsi                     | 5 +++++
>> >  arch/arm/mach-exynos/exynos.c                         | 1 +
>> >  3 files changed, 7 insertions(+)
>>
> Andreas, thanks.
>
> I'll apply this whole series.

We're getting close to the merge window. I'd prefer not to have to
start reverting samsung code to recover from these regressions, so
please send this up very soon.


-Olof
