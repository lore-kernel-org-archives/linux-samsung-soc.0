From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: Fix initial audio clocks
 configuration on Exynos4 boards
Date: Wed, 28 Dec 2016 19:28:37 +0200
Message-ID: <20161228172837.yeuyadtmfeyoolvi@kozik-lap>
References: <1481268131-1264-1-git-send-email-m.szyprowski@samsung.com>
 <1481268131-1264-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:32806 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbcL1R32 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Dec 2016 12:29:28 -0500
Received: by mail-lf0-f66.google.com with SMTP id y21so30428536lfa.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2016 09:28:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481268131-1264-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Fri, Dec 09, 2016 at 08:22:11AM +0100, Marek Szyprowski wrote:
> Move assigned clocks properties from sound node to audio subsystem clock
> controller node. This way clocks topology and rates are set just after
> probing audio clocks controller. Leaving those properties under
> sound node doesn't guarantee to configure them before they are being used
> (for example i2s hardware module can be probed in parallel and it also
> require proper audio clocks configuration).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - added changes for exynos4412-itop-elite board
> ---
>  arch/arm/boot/dts/exynos4412-itop-elite.dts     | 21 ++++++++++-----------
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
>  2 files changed, 20 insertions(+), 21 deletions(-)
> 
Thanks, applied.

Best regards,
Krzysztof
