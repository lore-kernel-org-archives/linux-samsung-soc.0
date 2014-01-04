From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2nd 5/5] Samsung SoC update for v3.14
Date: Fri, 3 Jan 2014 18:27:38 -0800
Message-ID: <CAOesGMjvs8oK1DXhDZtEeoDNreNRVkKkDac2jKsgZHbk6SFKqA@mail.gmail.com>
References: <52B5DCBD.5020202@samsung.com>
	<20131228231735.GC22753@quad.lixom.net>
	<22f701cf08f3$12670410$37350c30$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:53571 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753589AbaADC1j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 21:27:39 -0500
Received: by mail-qc0-f174.google.com with SMTP id n7so15238296qcx.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 18:27:39 -0800 (PST)
In-Reply-To: <22f701cf08f3$12670410$37350c30$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Fri, Jan 3, 2014 at 6:17 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Sun, Dec 22, 2013 at 03:23:57AM +0900, Kukjin Kim wrote:
>> > The following changes since commit
>> 538cfbb4c40ab59688236484138133b8e3e89220:
>> >
>> >   ARM: dts: Add initial support for Arndale Octa board (2013-12-16
>> > 05:05:43 +0900)
>> >
>> > are available in the git repository at:
>> >
>>
>> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> > tags/samsung-soc-2
>> >
>> > for you to fetch changes up to 7a28f198735d040f4d318511827d913d4b53f355:
>> >
>> >   ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board
>> > (2013-12-19 05:34:26 +0900)
>> >
>> > ----------------------------------------------------------------
>> > Samsung SoC 2nd update for v3.14
>> > - add exynos4412-tiny4412 board dt
>> >   for FriendlyARM's TINY4412 board
>> >
>> > ----------------------------------------------------------------
>> > Alex Ling (1):
>> >       ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board
>> >
>> >  arch/arm/boot/dts/Makefile                |  1 +
>> >  arch/arm/boot/dts/exynos4412-tiny4412.dts | 93
>> > +++++++++++++++++++++++++++++++
>> >  2 files changed, 94 insertions(+)
>> >  create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts
>>
>> Hi,
>>
>> This is really just a DT patch, and given that I didn't take the base
>> patch it
>> makes sense to take this in a DT branch instead. Please resend on top of
>> dt-2.
>>
> Olof, you mean adding new DT is OK?
>
> Sounds good, let me send a new pull-request for exynos4412-tiny4412 and
> exynos5420-arndale-octa tonight, I replied with different opinion on other
> Sachin's email though ;-)
>
> Sachin, you don't need to concern about that :-)

Yes, I'm ok with adding DT (if the DT is usable and bootable without
code changes). Don't submit the DT if the required code changes are
not yet in though.


-Olof
