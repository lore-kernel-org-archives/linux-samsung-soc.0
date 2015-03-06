From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl: exynos: Add support for Exynos5433
Date: Fri, 6 Mar 2015 12:57:12 +0100
Message-ID: <CACRpkdZRWgJmUh5nc8Mims11cqqj-GNrK5jCvF6y+Jtcore4yA@mail.gmail.com>
References: <1424746062-14424-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:38896 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753123AbbCFL5N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Mar 2015 06:57:13 -0500
Received: by oiax69 with SMTP id x69so17178989oia.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2015 03:57:12 -0800 (PST)
In-Reply-To: <1424746062-14424-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Chanho Park <chanho61.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 24, 2015 at 3:47 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch adds driver data for Exynos5433 SoC. Exynos5433 includes 228 multi-
> functional input/output port pins and 135 memory port pins. There are 41 general
> port groups and 2 memory port groups.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
> Changes from v3:
> - Rebase it on Linux 4.0-rc1
> - Add acked messgae of Tomasz Figa

Already merged v3. Thanks anyway!

Yours,
Linus Walleij
