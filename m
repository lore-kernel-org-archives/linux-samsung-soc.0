From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: spdif: Fix DMA filter initialization
Date: Wed, 2 Nov 2016 20:26:08 +0200
Message-ID: <20161102182608.GC7958@kozik-lap>
References: <1478084583-30460-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36617 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756250AbcKBS0Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 14:26:16 -0400
Received: by mail-wm0-f67.google.com with SMTP id c17so4308714wmc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2016 11:26:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478084583-30460-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com

On Wed, Nov 02, 2016 at 12:03:03PM +0100, Sylwester Nawrocki wrote:
> This patch fixes issues introduced in commit 73f5dfc68316bef2ab7062ec
> "ASoC: samsung: get access to DMA engine early to defer probe properly"
> and indicated by a following compilation warning:
> 
>   CC [M]  sound/soc/samsung/spdif.o
> sound/soc/samsung/spdif.c: In function ‘spdif_probe’:
> sound/soc/samsung/spdif.c:419:6: warning: ‘filter’ may be used uninitialized
> in this function [-Wuninitialized]
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/spdif.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
