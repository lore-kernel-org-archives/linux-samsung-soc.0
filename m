From: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 0/3] clocksource: exynos_mct: allow mct to use 64-bit
 counter from coprocessor
Date: Tue, 28 Jul 2015 08:24:26 -0700
Message-ID: <CAD=FV=W0PM57UJBQ1Vw4PNTapnPDvU1xtKP=9gdX6GBy+6yh1A@mail.gmail.com>
References: <1438032507.17734.46.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:37277 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176AbbG1PY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jul 2015 11:24:27 -0400
Received: by wibud3 with SMTP id ud3so164719406wib.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2015 08:24:26 -0700 (PDT)
In-Reply-To: <1438032507.17734.46.camel@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <klimov.linux@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Chirantan Ekbote <chirantan@chromium.org>, t.dakhran@gmail.com, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, kgene <kgene@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, yury.norov@gmail.com, Alim Akhtar <alim.akhtar@gmail.com>

Alexey,

On Mon, Jul 27, 2015 at 2:28 PM, Alexey Klimov <klimov.linux@gmail.com> wrote:
> Hi all,
>
> year(s) ago it was discovered that MCT timer and ARM architectured
> timer
> are the same hardware with different interface. Here [1].
>
> I followed mail-list discussions about removing MCT and using arch
> timer for Exynos5-based SoCs but things aren't moving at least latest
> upstream kernel on odroid-xu3 will use MCT as default timers.
> Maybe the reason are some power-management related things that very
> specific to Samsung. I don't know.
>
>
> Idea of this draft patchset comes from Doug patches when he tried to
> optimize read of 64-bit counter located in mmio. [2]
> Why not using cp15 counter instead if possible?

I hate to burst your bubble here, but...

...I think it would be a bad idea to use the cp15 counter on exynos
5422.  According to Samsung, there are issues where using cp15 could
sometimes return the wrong value, especially if you happen to read it
while on an A7 instead of an A15.  It will tend to work pretty well,
but Samsung claimed that it might not work right on some CPUs or at
some temperatures.

I've added Alim who provided this information to me (in the private
http://crosbug.com/p/29556).  He may be able to elaborate more.

Generally I'd say that if the arch timer works for you: use the arch
timer.  If the arch timer doesn't work for you, use the MCT.

-Doug
