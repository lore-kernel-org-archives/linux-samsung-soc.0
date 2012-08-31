From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: EXYNOS: Add support for GPIO on Exynos4x12
Date: Sat, 1 Sep 2012 00:46:50 +0200
Message-ID: <CACRpkdaMqvQOUETPKFuzBw1bW+GciHLE1uvtdkPV5FoxrowftQ@mail.gmail.com>
References: <4648723.rWnut7F0uJ@amdc1227>
	<CAJuYYwTBeCczF7M=9pJzYUgGB3Xg1md2kRDKbYEU-ji-C1_hug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:60166 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753961Ab2HaWqv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 18:46:51 -0400
Received: by weyx8 with SMTP id x8so1914249wey.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Aug 2012 15:46:50 -0700 (PDT)
In-Reply-To: <CAJuYYwTBeCczF7M=9pJzYUgGB3Xg1md2kRDKbYEU-ji-C1_hug@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

On Tue, Aug 28, 2012 at 4:58 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> On 28 August 2012 15:31, Tomasz Figa <t.figa@samsung.com> wrote:

>> This patch series makes necessary preparations and adds support for GPIO on
>> Exynos4x12 SoCs.
>
> Hopefully, we can get device tree support merged for Exynos4412 soon
> and then switch over to using pinctrl driver. That can simplfy the
> gpio/pinmux support for Exynos4 SoC's.

This sounds like a NACK.

I will not merge these patches until Ben or Kukjin (the Samsung
maintainers listed in MAINTAINERS) ACK it.

Yours,
Linus Walleij
