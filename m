From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v4 0/4] [PATCH v4 0/4] Exynos SROMc configuration and
 Ethernet support for SMDK5410
Date: Fri, 30 Oct 2015 09:43:28 +0300
Message-ID: <00a001d112de$49b31d90$dd1958b0$@samsung.com>
References: <cover.1446122247.git.p.fedin@samsung.com>
 <CAGcde9GtepdzFLCfW+ughAdyU_sKXUhgK35z434FPOFXpmRX9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48444 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777AbbJ3Gnd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 02:43:33 -0400
In-reply-to: <CAGcde9GtepdzFLCfW+ughAdyU_sKXUhgK35z434FPOFXpmRX9Q@mail.gmail.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Pankaj Dubey' <dubepankaj1980@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, 'Mark Rutland' <mark.rutland@arm.com>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Pawel Moll' <pawel.moll@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Rob Herring' <robh+dt@kernel.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Kumar Gala' <galak@codeaurora.org>

 Hello!

> >  .../bindings/arm/samsung/exynos-srom.txt           | 50 ++++++++++++++++++-
> >  arch/arm/boot/dts/exynos5410-smdk5410.dts          | 41 +++++++++++++++
> >  arch/arm/boot/dts/exynos5410.dtsi                  | 15 ++++++
> >  arch/arm/mach-exynos/Kconfig                       |  2 +-
> >  drivers/soc/samsung/Kconfig                        |  2 +-
> >  drivers/soc/samsung/exynos-srom.c                  | 58 +++++++++++++++++++++-
> >  6 files changed, 162 insertions(+), 6 deletions(-)
> >
> 
> Something wrong here, I am not able to find V4 1/4 and 3/4 in this mailing list.

 Which mailing list is "this"? I've just rechecked, i've got my messages back on both (linux-samsung-soc and linux-arm-kernel).

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
