From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/7] Samsung cleanup for v3.14
Date: Mon, 23 Dec 2013 18:49:14 -0800
Message-ID: <CAOesGMii6z29QUE2v13f5moaDTx0V2rmFpOS2FYrini=_DD2Lw@mail.gmail.com>
References: <52AE0F4E.5070309@samsung.com>
	<20131222220338.GB13365@quad.lixom.net>
	<1af801cf0049$783fe660$68bfb320$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:49569 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753802Ab3LXCtQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Dec 2013 21:49:16 -0500
Received: by mail-qc0-f177.google.com with SMTP id m20so5553805qcx.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2013 18:49:15 -0800 (PST)
In-Reply-To: <1af801cf0049$783fe660$68bfb320$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Dec 23, 2013 at 5:42 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Olof Johansson wrote:
>>
>> On Mon, Dec 16, 2013 at 05:21:34AM +0900, Kukjin Kim wrote:
>> > The following changes since commit
>> 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
>> >
>> >   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
>> >
>> > are available in the git repository at:
>> >
>>
>> > git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
>> > tags/samsung-cleanup
>> >
>> > for you to fetch changes up to 7c394e7be4d267c02eaaac8fa197a7c1b023c99b:
>> >
>> >   ARM: EXYNOS: Constify clksrc immutable register restore tables
>> > (2013-12-12 07:09:33 +0900)
>> >
>> > ----------------------------------------------------------------
>> > Samsung cleanup for v3.14
>> > - remove unused SAMSUNG_GPIOLIB_4BIT and IRQF_DISABLED
>> > - constify immutable PMU data table and PM clksrc register
>> > - make const struct for sleep_save
>> >
>> > ----------------------------------------------------------------
>> > Daniel Kurtz (3):
>> >       ARM: EXYNOS: Constify data tables for pmu
>> >       ARM: SAMSUNG: Let s3c_pm_do_restore_*() take const sleep_save
>> >       ARM: EXYNOS: Constify clksrc immutable register restore tables
>> >
>> > Michael Opdenacker (2):
>> >       ARM: SAMSUNG: remove unused SAMSUNG_GPIOLIB_4BIT Kconfig parameter
>> >       ARM: SAMSUNG: remove IRQF_DISABLED
>>
> Hi Olof,
>
>> Pulled into next/cleanup.
>
> Thanks.
>
>> Please be consistent in patch subjects like
>> other platforms, so "ARM: samsung: .." or "ARM: exynos: ...".
>>
> Well, 'SAMSUNG' and 'EXYNOS' are proper names and they have a habit of
> starting with a capital letter or just using capital letters like 'ARM' in
> the subject. Additionally, we used to use like that.

Ok, well, what I'm looking for mostly is consistency. So if you prefer
to capitalize the words then make sure you always do so. :)


-Olof
