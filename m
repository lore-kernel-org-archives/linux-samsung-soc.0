From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Thu, 25 Sep 2014 14:47:08 -0600
Message-ID: <CAD8Lp44UENSjFVuejnm8bKpyLsu0X0SErBgfmVtVPH6Tv9SptA@mail.gmail.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
	<CAD8Lp45F_rgN0JZ2n77VXSqN4C6K_hkqu6vsPqha-UbsVf4bow@mail.gmail.com>
	<5424597A.7040904@samsung.com>
	<CAD8Lp46tzgtEaUMS2+QSKoObW+kedWvAqJXMU5uKqnHp_LumGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:60761 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbaIYUrK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 16:47:10 -0400
Received: by mail-wi0-f181.google.com with SMTP id z2so10308456wiv.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 13:47:08 -0700 (PDT)
In-Reply-To: <CAD8Lp46tzgtEaUMS2+QSKoObW+kedWvAqJXMU5uKqnHp_LumGw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kamil Debski <k.debski@samsung.com>

On Thu, Sep 25, 2014 at 1:44 PM, Daniel Drake <drake@endlessm.com> wrote:
>> AFAIK 880 MHz is recommended MPLL frequency for Exynos4412 EVT2.0, which
>> is revision of the Exynos4412 SoC the Odroid U3 boards are populated with.
>> You can read the main/sub revision information from the chip ID register
>> (at 0x10000000).
>
> Thanks for the information. Might be worth a quick comment in
> exynos4x12.dtsi then, saying that the defaults here are for Exynos4412
> EVT2.0 and might want to be overridden for other versions of the SoC.

Also can you double check this?
The old ODROID-X is Exynos4412 EVT1.0 and runs 880MHz MPLL.

Daniel
