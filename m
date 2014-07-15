From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v3 0/8] Add Exynos4412 based Odroid X2 and U2/U3/U3+ support
Date: Wed, 16 Jul 2014 02:49:11 +0900
Message-ID: <53C56997.1080806@samsung.com>
References: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:37978 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610AbaGORtS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 13:49:18 -0400
Received: by mail-pa0-f48.google.com with SMTP id et14so2233554pad.35
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 10:49:18 -0700 (PDT)
In-Reply-To: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

On 07/14/14 21:48, Marek Szyprowski wrote:
> Hello,
>
Hi Marek,

> This is the third version of the initial patch series adding support
> for Exynos 4412 based Odroid X2 and U2/U3/U3+ boards and improving
> support for Odroid X.
>
Looks good to me and thanks for your support Odroid series.

> Complete USB support for Odroid U2/U3/U3+ still requires some fixes in
> Exynos4 USB2 Phy driver and clock driver for CLKOUT:
> http://thread.gmane.org/gmane.linux.kernel/1731843/
> http://www.spinics.net/lists/linux-usb/msg109587.html
> The above changes however don't affect Odroid DTS files, but without
> them, usb3503 hub is not yet functional.
>
> Support for audio codec and HDMI video output is available in separate patch series.
>
> If one is interested in more complete and open-source Odroid board
> support, there are also patches for u-boot project:
> http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/188295/focus=188610
>
I've applied this whole series.

- Kukjin
