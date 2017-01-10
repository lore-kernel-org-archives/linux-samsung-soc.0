From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos5433: fix addresses in node names
Date: Tue, 10 Jan 2017 20:34:40 +0200
Message-ID: <20170110183440.7lmqhcrc5642obbe@kozik-lap>
References: <CGME20170110093054eucas1p1bb74f8494dd6cece0debfabfc8ec34ca@eucas1p1.samsung.com>
 <1484040648-23763-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:33695 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762853AbdAJSep (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2017 13:34:45 -0500
Received: by mail-wj0-f196.google.com with SMTP id kp2so88393395wjc.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2017 10:34:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1484040648-23763-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

On Tue, Jan 10, 2017 at 10:30:48AM +0100, Andrzej Hajda wrote:
> Address should not contain 0x prefix.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof
