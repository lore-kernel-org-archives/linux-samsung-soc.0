From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: exynos: add exynos5250 SoC specific data
Date: Mon, 7 Jan 2013 00:31:25 +0100
Message-ID: <CACRpkdZKB1_1U1VZfYADwWfFpBum0Qc88kWtW37h7Z05RtSJfA@mail.gmail.com>
References: <1355399644-29417-1-git-send-email-thomas.abraham@linaro.org>
	<1355399644-29417-2-git-send-email-thomas.abraham@linaro.org>
	<CACRpkdaQ10CgoFXtk4EyqL4LWVpsdEAdrmy5R-_Rqm5fJdqS4A@mail.gmail.com>
	<CAJuYYwTZkzCXjowhKaJ253Oji07eDdEjMvNssyL1ThWtETswSQ@mail.gmail.com>
	<017801cde453$77b03eb0$6710bc10$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:50267 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753301Ab3AFXb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Jan 2013 18:31:26 -0500
Received: by mail-ie0-f177.google.com with SMTP id k13so22407397iea.22
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Jan 2013 15:31:26 -0800 (PST)
In-Reply-To: <017801cde453$77b03eb0$6710bc10$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, patches@linaro.org

On Thu, Dec 27, 2012 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> And I think, would be clear if the config could be changed like following.
>
> 8<----------------------------------------------------------------------
> From: Kukjin Kim <kgene.kim@samsung.com>
> Subject: [PATCH] pinctrl: exynos: change PINCTRL_EXYNOS option
>
> Since pinctrl-exynos can support exynos4 and exynos5 so changed
> the option name to PINCTRL_EXYNOS for more clarity.
>
> Cc: Thomas Abraham <Thomas.abraham@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Shall I take this into the pinctrl tree?

Yours,
Linus Walleij
