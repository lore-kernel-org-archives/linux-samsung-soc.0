From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm/exynos: ipp: Remove Exynos DRM IPP subsystem
Date: Thu, 14 Dec 2017 16:54:19 +0000
Message-ID: <CAPj87rOO5QNTOVAO6aBcVJtBvgnXgv0tPVrnzCBkAdb6YaYrxw@mail.gmail.com>
References: <CGME20171214151022eucas1p2d4fbf88e33398521a71a4dcbdf508047@eucas1p2.samsung.com>
 <20171214151015.5580-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33776 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753353AbdLNQyV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 11:54:21 -0500
Received: by mail-lf0-f46.google.com with SMTP id g80so2973666lfg.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2017 08:54:20 -0800 (PST)
In-Reply-To: <20171214151015.5580-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi,

On 14 December 2017 at 15:10, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Exynos DRM IPP subsystem is in fact non-functional and frankly speaking
> dead-code. This patch clearly marks that Exynos DRM IPP subsystem is
> broken and never really functional. It will be replaced by a completely
> rewritten API.

I certainly won't be sad to see the back of that pile of integer overflow.

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
