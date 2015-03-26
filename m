From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [rtc-linux] Re: [PATCH v2 2/2] mfd: sec-core: Modify RTC
 compatible name of S2MPS13
Date: Thu, 26 Mar 2015 14:18:12 +0000
Message-ID: <20150326141812.GO5951@x1>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
 <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
 <20150323123458.GE24804@x1>
 <CAJKOXPeh1McgSxJD23G=2QijRAQM2YGHbDFeGiA4bQQ-mRX-FA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:36601 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752251AbbCZOSS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Mar 2015 10:18:18 -0400
Received: by wibg7 with SMTP id g7so150332975wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2015 07:18:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAJKOXPeh1McgSxJD23G=2QijRAQM2YGHbDFeGiA4bQQ-mRX-FA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: rtc-linux@googlegroups.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, 24 Mar 2015, Krzysztof Kozlowski wrote:

> 2015-03-23 13:34 GMT+01:00 Lee Jones <lee.jones@linaro.org>:
> > On Tue, 17 Mar 2015, Krzysztof Kozlowski wrote:
> >
> >> From: Chanwoo Choi <cw00.choi@samsung.com>
> >>
> >> This patch modify the RTC compatible name of S2MPS13 because S2MPS=
13's RTC is
> >> equal to S2MPS14's RTC.
> >>
> >> Cc: Lee Jones <lee.jones@linaro.org>
> >> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>
> >> ---
> >>
> >> Changes since v1:
> >> 1. New patch.
> >> ---
> >>  drivers/mfd/sec-core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Applied, thanks.
>=20
> Hi,
>=20
> Sorry for the mess but we did this wrong.
> The S2MPS13 RTC is slightly different than S2MPS14 and that differenc=
e
> is important. It is embarrassing... but the difference was written
> small-print as a note in datasheet. Really. I found it after carefull=
y
> comparing two PDFs. The impact of difference was not detected because
> of error in DTS for Exynos5433-based board.
>=20
> This patch should be dropped (or reverted) and "s2mps13-rtc" should b=
e
> used for S2MPS13 RTC mfd_cell. The RTC driver (rtc/rtxc-s5m) should
> have its own support for RTC which I will add in separate patch.
>=20
> Lee, once again sorry for the mess. How would you like to proceed? Ca=
n
> you just drop this commit?

Patch removed -- panic averted.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
