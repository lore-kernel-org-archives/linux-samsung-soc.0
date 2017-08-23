From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL/PATCH for v4.13] ARM: dts: exynos: add needs-hpd for Odroid-XU3/4
Date: Wed, 23 Aug 2017 21:43:46 +0200
Message-ID: <CAK8P3a1ka5jAdmobiwSsR5vR_gLVyd_92s+A5wAYTeYTesvi1w@mail.gmail.com>
References: <20170823162450.4981-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:32969 "EHLO
        mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932407AbdHWTns (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 15:43:48 -0400
Received: by mail-oi0-f52.google.com with SMTP id f11so11430021oic.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Aug 2017 12:43:48 -0700 (PDT)
In-Reply-To: <20170823162450.4981-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>

On Wed, Aug 23, 2017 at 6:24 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> From: Hans Verkuil <hverkuil@xs4all.nl>
>
> CEC support was added for Exynos5 in 4.13, but for the Odroids we need to set
> 'needs-hpd' as well since CEC is disabled when there is no HDMI hotplug signal,
> just as for the exynos4 Odroid-U3.
>
> This is due to the level-shifter that is disabled when there is no HPD, thus
> blocking the CEC signal as well. Same close-but-no-cigar board design as the
> Odroid-U3.
>
> Tested with my Odroid XU4.
>
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
> Hi Arnd, Olof,
>
> One fix for this cycle (v4.13) for feature (HDMI CEC) added in v4.13. Patch
> is necessary for this feature to work on Odroid XU3/XU4 family.

Applied, thanks!

      Arnd
