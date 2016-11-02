From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] ASoC: samsung: Drop AC97 drivers
Date: Wed, 2 Nov 2016 20:25:19 +0200
Message-ID: <20161102182519.GB7958@kozik-lap>
References: <1478084815-30664-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34262 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756394AbcKBSZY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Nov 2016 14:25:24 -0400
Received: by mail-wm0-f67.google.com with SMTP id p190so4335056wmp.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Nov 2016 11:25:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1478084815-30664-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, krzk@kernel.org, m.szyprowski@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com

On Wed, Nov 02, 2016 at 12:06:55PM +0100, Sylwester Nawrocki wrote:
> The AC97 drivers are broken and it seems these have not been used
> for a long time.  This patch removes the unused code, i.e. Samsung
> SoC AC97 controller driver and related machine drivers:
> ln2440sbc_alc650, smdk2443_wm9710, smdk_wm9713.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> Rebased onto lates for-next branch.
> 
>  sound/soc/samsung/Kconfig            |  32 ---
>  sound/soc/samsung/Makefile           |   2 -
>  sound/soc/samsung/ac97.c             | 437 -----------------------------------
>  sound/soc/samsung/ln2440sbc_alc650.c |  72 ------
>  sound/soc/samsung/regs-ac97.h        |  66 ------
>  sound/soc/samsung/smdk2443_wm9710.c  |  68 ------
>  sound/soc/samsung/smdk_wm9713.c      | 108 ---------
>  7 files changed, 785 deletions(-)
>  delete mode 100644 sound/soc/samsung/ac97.c
>  delete mode 100644 sound/soc/samsung/ln2440sbc_alc650.c
>  delete mode 100644 sound/soc/samsung/regs-ac97.h
>  delete mode 100644 sound/soc/samsung/smdk2443_wm9710.c
>  delete mode 100644 sound/soc/samsung/smdk_wm9713.c
> 


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
