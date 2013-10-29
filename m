From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [Patch v4 0/2] Enable all cpus in Exynos5420
Date: Wed, 30 Oct 2013 00:32:01 +0530
Message-ID: <CANuQgHEx+pNdaybeJ_dpQ5kWYpA44hrYj4ikW9d60a3hEZZPDA@mail.gmail.com>
References: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:50669 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087Ab3J2TCD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 15:02:03 -0400
Received: by mail-oa0-f45.google.com with SMTP id i4so355945oah.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2013 12:02:02 -0700 (PDT)
In-Reply-To: <1381119431-12697-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Chander Kashyap <chander.kashyap@linaro.org>

Hi Kukjin,

On 7 October 2013 09:47, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> Exynos5420 is an octa-core SoC. This patch series enables the remaining 4 cores.
>
> Changes in v2:
>         - Changed the cpu node @unit-address value to reg property value.
> Changes in v3:
>         - Removed leading 0x from @unit-address value.
> Changes in v4:
>         - Fixed typo and patch subject from "arm: dt" to "ARM: dt".
>
> Chander Kashyap (2):
>   clocksource: mct: extend mct to support 8 local interrupts for
>     Exynos5420
>   arm: dt: Exynos5420: populate cpu node enteries to 8 cpus
>
>  arch/arm/boot/dts/exynos5420.dtsi |   37 +++++++++++++++++++++++++++++++++++--
>  drivers/clocksource/exynos_mct.c  |    4 ++++
>  2 files changed, 39 insertions(+), 2 deletions(-)
>
> --
> 1.7.9.5
>

?

Can you please take these patches?

-- 
with warm regards,
Chander Kashyap
