From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 7/8] ARM: dts: exynos: Add mem-2-mem Scaler devices
Date: Thu, 9 Nov 2017 09:21:10 +0100
Message-ID: <CAJKOXPcQV79TS3MWQtFP3fTqUfyfLdoZFYJtmSHWx3uSj=t8MA@mail.gmail.com>
References: <CGME20171109081216eucas1p1cdd0e8c43689b11db9d8d76f72556b18@eucas1p1.samsung.com>
 <20171109081156.7111-1-m.szyprowski@samsung.com> <20171109081156.7111-8-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753246AbdKIIVN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 03:21:13 -0500
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com [209.85.128.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C7362193B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Nov 2017 08:21:12 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id y9so4798018wrb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Nov 2017 00:21:12 -0800 (PST)
In-Reply-To: <20171109081156.7111-8-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

On Thu, Nov 9, 2017 at 9:11 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
>
> There are 3 scaler devices in Exynos5420 SoCs, all are a part of MSCL
> power domain. MSCL power domain and SYSMMU controllers (two per each
> scaler device) have been already added to exynos5420.dtsi earlier,
> so bind them to newly added devices.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Both DTS patches look OK and since bindings were acked by Rob, I will
take them after merge window.

Best regards,
Krzysztof
