From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3 0/5] Avoid passing clks through platform data
Date: Sat, 24 Nov 2012 11:10:44 +0900
Message-ID: <122c01cdc9e8$e91ed500$bb5c7f00$%kim@samsung.com>
References: <1352177317-16395-1-git-send-email-padma.v@samsung.com>
 <CAAgF-Bevg7h1yq1bnLhwbUJ94+HKhaaJ6MeYvXUAunKpE-Lvkw@mail.gmail.com>
 <20121123115109.GH4529@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:19884 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932609Ab2KXCKp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 21:10:45 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDY00ABJZDKS590@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:44 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDY009H6ZDWI170@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:44 +0900 (KST)
In-reply-to: <20121123115109.GH4529@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Padma Venkat' <padma.kvr@gmail.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, olofj@google.com

Mark Brown wrote:
> 
> On Fri, Nov 23, 2012 at 04:40:59PM +0530, Padma Venkat wrote:
> > cc'ing Mark Brown.
> >
> > On Tue, Nov 6, 2012 at 10:18 AM, Padmavathi Venna <padma.v@samsung.com>
> wrote:
> > > Changes since v2:
> > >         - Rebased on 3.7-rc3
> 
> Please don't do this, send the patches non-quoted.

And it can make a confusion if there is no any explanation...

Note, I applied following arch/arm/ Samsung stuff for audio with Sangbeom's
ack:-)

Padmavathi Venna (9):
      ARM: EXYNOS: Add clocks for EXYNOS5 Audio Subsystem
      ARM: dts: Add nodes for i2s controllers for Samsung EXYNOS5 platforms
      ARM: EXYNOS: Enable platform support for I2S controllers
      ARM: S3C64XX: Add I2S clkdev support
      ARM: S5PC100: Add I2S clkdev support
      ARM: S5P64X0: Add I2S clkdev support
      ARM: S5PV210: Avoid passing the clks through platform data
      ARM: EXYNOS: Avoid passing the clks through platform data
      ARM: SAMSUNG: Delete the unnecessary variable

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
