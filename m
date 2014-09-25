From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] ARM: dts: Specify default clocks for Exynos4 FIMC devices
Date: Thu, 25 Sep 2014 13:44:30 -0600
Message-ID: <CAD8Lp46tzgtEaUMS2+QSKoObW+kedWvAqJXMU5uKqnHp_LumGw@mail.gmail.com>
References: <1410367054-30926-1-git-send-email-s.nawrocki@samsung.com>
	<CAD8Lp45F_rgN0JZ2n77VXSqN4C6K_hkqu6vsPqha-UbsVf4bow@mail.gmail.com>
	<5424597A.7040904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:40972 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbaIYTob (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 15:44:31 -0400
Received: by mail-wi0-f179.google.com with SMTP id d1so10220365wiv.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 12:44:30 -0700 (PDT)
In-Reply-To: <5424597A.7040904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Kamil Debski <k.debski@samsung.com>

On Thu, Sep 25, 2014 at 12:05 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>> Just curious about the Exynos4x12 situation here.
>> You set the FIMC clocks as 176MHz, child of MPLL, which works for
>> ODROID with a divider:
>>
>> 880MHz MPLL / 5 = 176MHz
>>
>> However, talking of recommended frequencies... Is 880MHz really the
>> standard there?
>> Isn't 800MHz the more common one?
>
> AFAIK 880 MHz is recommended MPLL frequency for Exynos4412 EVT2.0, which
> is revision of the Exynos4412 SoC the Odroid U3 boards are populated with.
> You can read the main/sub revision information from the chip ID register
> (at 0x10000000).

Thanks for the information. Might be worth a quick comment in
exynos4x12.dtsi then, saying that the defaults here are for Exynos4412
EVT2.0 and might want to be overridden for other versions of the SoC.

Thanks
Daniel
