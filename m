From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH Resend] pinctrl: exynos: Fix build breakage
Date: Mon, 17 Jun 2013 13:25:59 +0200
Message-ID: <CACRpkdaxpr_7minVkbwsMK+tpbEy7LChz5C+Gt7zYNYhee2ibw@mail.gmail.com>
References: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:51222 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932390Ab3FQL0A convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 07:26:00 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so2973358obc.27
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2013 04:25:59 -0700 (PDT)
In-Reply-To: <1371461892-5298-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Patch Tracking <patches@linaro.org>, Doug Anderson <dianders@chromium.org>

On Mon, Jun 17, 2013 at 11:38 AM, Sachin Kamat <sachin.kamat@linaro.org=
> wrote:

> 'exynos_wkup_irq_ack' should be defined ahead of its call.
>
> Fixes the following error:
> drivers/pinctrl/pinctrl-exynos.c: In function =91exynos_wkup_irq_mask=
=92:
> drivers/pinctrl/pinctrl-exynos.c:299:3: error: implicit declaration o=
f
> function =91exynos_wkup_irq_ack=92 [-Werror=3Dimplicit-function-decla=
ration]
>    exynos_wkup_irq_ack(irqd);
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
> Fixed the commit message.
> ---

Applied.

Usually you should state which commit caused
the problem in the commit message.

Yours,
Linus Walleij
