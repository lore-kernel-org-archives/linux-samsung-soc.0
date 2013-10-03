From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: Re: [PATCH v3 0/2] Enable all cpus in Exynos5420
Date: Thu, 3 Oct 2013 11:51:52 +0530
Message-ID: <CANuQgHFbnkDnizH02-PR4qeq8+s7ZTq7Rv3bsJQHWia7xKPOEw@mail.gmail.com>
References: <1378380593-5305-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:38647 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755566Ab3JCGVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Oct 2013 02:21:53 -0400
Received: by mail-oa0-f47.google.com with SMTP id i1so1928907oag.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Oct 2013 23:21:53 -0700 (PDT)
In-Reply-To: <1378380593-5305-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>

On 5 September 2013 16:59, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> Exynos5420 is an octacore SoC. This patch series enables the remaining 4 cores.
>
> Changes in v2:
>         - Changed the cpu node @unit-address value to reg property value.
> Changes in v3:
>         - Removed leading 0x from @unit-address value.
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

Hi Kukjin, can you please take these patches.

-- 
with warm regards,
Chander Kashyap
