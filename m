From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 3/5] Samsung exynos cpuidle update for v3.17
Date: Sat, 09 Aug 2014 09:35:49 +0900
Message-ID: <010101cfb369$dfe6da20$9fb48e60$@samsung.com>
References: <53C9C159.4070305@samsung.com>
 <CAGa+x86XpkxEhe2D9NfFvWhTre-mAPkcsyzObb8q=Xa=Yd2Xdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47698 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaHIAfy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Aug 2014 20:35:54 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NA00064KKBS3Q10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Aug 2014 09:35:53 +0900 (KST)
In-reply-to: <CAGa+x86XpkxEhe2D9NfFvWhTre-mAPkcsyzObb8q=Xa=Yd2Xdw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kevin Hilman' <khilman@linaro.org>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, 'Chander Kashyap' <chander.kashyap@linaro.org>, 'Doug Anderson' <dianders@google.com>, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>

Kevin Hilman wrote:
> 
> Hello,
> 
Hi,

> On Fri, Jul 18, 2014 at 5:52 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:
> >
> >   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)
> >
> > are available in the git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > tags/exynos-cpuidle
> >
> > for you to fetch changes up to fc2cac41ebbfb16da8b036cba6ec6714ab780a6d:
> >
> >   ARM: EXYNOS: populate suspend and powered_up callbacks for mcpm
> > (2014-07-19 03:36:00 +0900)
> >
> > ----------------------------------------------------------------
> > exynos cpuidle update for v3.17
> >
> > - add callbacks exynos_suspend() and exynos_powered_up()
> >   for support cpuidle through mcpm
> > - skip exynos_cpuidle for exynos5420 because is uses
> >   cpuidle-big-liggle generic cpuidle driver
> > - add generic functions to calculate cpu number is used
> >   for pmu and this is required for exynos5420 multi-cluster
> > - add of_device_id structure for big.LITTLE cpuidle and
> >   add "samsung,exynos5420" compatible string for exynos5420
> 
> I'm curious what platforms this is expected to work on, and where it's
> been tested.
> 
exynos5420 and its reference board, smdk5420.

> I tried it on exynos5800-peach-pi (chromebook2) and it hangs up (no
> kernel messages) shortly after the driver loads, and never finishes to
> boot.
> 
Oh, sorry about that, if so, it should be fixed before -rc1. Just note that I
thought since exynos5800 is very similar with exynos5420 so I didn't ask
Chander to test the series on exynos5800 based board...Just asked to test with
Nico's mcpm series. BTW, unfortunately I have no exynos5800-peach-pi...

> I needed an extra compatible entry for the 5800 in the driver for the
> driver to load, which suggests it hasn't been tested on 5800, but at
> least in theory, this should be compatible with the 542x, right?
> 
Yes I think so. As you can see in exynos5800.dtsi, it is including exynos5420.

> For testing, I tried today's linux-next and arm-soc/for-next.
> 
Hmm...why is the problem happened at last? Not at that time? :(

I need to figure it out...

Thanks,
Kukjin
