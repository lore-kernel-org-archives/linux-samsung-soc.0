From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: Fix initial clocks configuration
 on Odroid X/X2/U3 boards
Date: Thu, 8 Dec 2016 18:44:21 +0200
Message-ID: <20161208164421.GC5238@kozik-lap>
References: <1481194914-20490-1-git-send-email-m.szyprowski@samsung.com>
 <1481194914-20490-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f193.google.com ([209.85.210.193]:32892 "EHLO
        mail-wj0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753155AbcLHQo1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Dec 2016 11:44:27 -0500
Received: by mail-wj0-f193.google.com with SMTP id kp2so55326001wjc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Dec 2016 08:44:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481194914-20490-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Thu, Dec 08, 2016 at 12:01:54PM +0100, Marek Szyprowski wrote:
> Move assigned clocks properties from sound node to audio subsystem clock
> controller node. This way clocks topology and rates are set just after
> probing audio clocks controller. Leaving those properties under sound
> node doesn't guarantee to configure them before they are being used
> (for example i2s hardware module can be probed in parallel and it also
> require proper audio clocks configuration).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Looks correct, for the reference:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Does this fixes any encountered issue (real one)? I wonder whether this
should go to fixes or not.

Best regards,
Krzysztof
