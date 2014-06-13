From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] ARM: EXYNOS: mcpm: Don't rely on firmware's secondary_cpu_start
Date: Fri, 13 Jun 2014 08:10:18 -0700
Message-ID: <CAD=FV=XkTSfHwt9Ekcy6TPGWJTJ49zMCOA9eaJVaq=q4u4Ri3Q@mail.gmail.com>
References: <1402090985-8061-1-git-send-email-dianders@chromium.org>
	<20140607181221.GB25068@e102568-lin.cambridge.arm.com>
	<CAD=FV=X17PeJ6JPE9Qyc1QT07AvA2PTE69Q87gz9a6MdUHgi4A@mail.gmail.com>
	<20140609223831.GB16889@e102568-lin.cambridge.arm.com>
	<CANuQgHHxAhTNYX-JAEdRkO=PMYT4A5GwXcuQfiqwE0CEkQyR+w@mail.gmail.com>
	<CAD=FV=V5_RRNkgA7Rk7XbQw9m1qh6-RJA8arW7ZRU=QbWAPa+w@mail.gmail.com>
	<alpine.LFD.2.11.1406101146140.25775@knanqh.ubzr>
	<CADWw7OjqK3MAuqCHuv-WS3Bb2+2Q-FXth+7hqtwFoyAP6pyYhA@mail.gmail.com>
	<CAD=FV=ULFx0GPp_mnEfouZF+m4h_RYE6WQu48N0WbFWrFv8-BA@mail.gmail.com>
	<5398758F.4080306@samsung.com>
	<CADWw7Oh=A_cg_hqu8DZ1t_iacOGgWediLp3K3viFYHMNAPkqRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CADWw7Oh=A_cg_hqu8DZ1t_iacOGgWediLp3K3viFYHMNAPkqRw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chander Kashyap <k.chander@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, Inderpal Singh <inderpal.s@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chander Kashyap <chander.kashyap@linaro.org>, "olof@lixom.net" <olof@lixom.net>, Tushar Behera <trblinux@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Chander,

On Fri, Jun 13, 2014 at 4:54 AM, Chander Kashyap <k.chander@samsung.com> wrote:
> This patch is effectively changing the mcpm_entry_point address from
> nsbase + 0x1c to nsbase + 0x8
>
> Hence while integrating with mainline u-boot we need to take care for
> new mcpm_entry_point address.
>
> With Chromebook it works straightforward.

Can you explain more and point to the code that is using the nsbase +
0x1c?  Specifically the only code I see that uses the nsbase + 0x1c is
the code that is located at nsbase, which is the code we're
overwriting here.  I'd imagine you're using U-Boot code that looks
something like the bits that start at code_base here:

https://chromium.googlesource.com/chromiumos/third_party/u-boot/+/ce358daf5069f1dc145b0f9d403cfbb028271807/arch/arm/cpu/armv7/exynos/lowlevel.S

With my kernel change you can completely eliminate U-Boot's
installation of this code (or keep it, it makes no difference).

-Doug
