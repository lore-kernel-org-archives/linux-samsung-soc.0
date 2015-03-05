From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: exynos: Add support for Exynos5433
Date: Thu, 5 Mar 2015 10:53:46 +0100
Message-ID: <CACRpkdZaRbkLtaS2ABWt8jsv2j7MRsg63E0gDte6mvh1TzbH2Q@mail.gmail.com>
References: <1421822591-10536-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33371 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754301AbbCEJxr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 04:53:47 -0500
Received: by oifz81 with SMTP id z81so10766860oif.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2015 01:53:46 -0800 (PST)
In-Reply-To: <1421822591-10536-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 21, 2015 at 7:43 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch adds driver data for Exynos5433 SoC. Exynos5433 includes 228 multi-
> functional input/output port pins and 135 memory port pins. There are 41 general
> port groups and 2 memory port groups.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> ---
> Changes from v2:
> - Rebase it on v3.19-rc5

Patch applied with Tomasz ACK.

Yours,
Linus Walleij
