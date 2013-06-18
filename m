From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2 2/3] pinctrl: exynos: add exynos5420 SoC specific data
Date: Tue, 18 Jun 2013 11:15:24 -0700
Message-ID: <CAD=FV=W4NARETQZHQTJWxGa2xkXtB7w6DvCKwdn5uC4sr=WrhA@mail.gmail.com>
References: <1371214954-29358-1-git-send-email-l.krishna@samsung.com>
	<1371214954-29358-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:39548 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933165Ab3FRSP0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 14:15:26 -0400
Received: by mail-la0-f43.google.com with SMTP id gw10so3784028lab.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 11:15:24 -0700 (PDT)
In-Reply-To: <1371214954-29358-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Simon Glass <sjg@chromium.org>, Thomas P Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, s.nawrocki@samsung.com, Linus Walleij <linus.walleij@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

Leela,

On Fri, Jun 14, 2013 at 6:02 AM, Leela Krishna Amudala
<l.krishna@samsung.com> wrote:
> +       EXYNOS_PIN_BANK_EINTG(8, 0x000, "gpz", 0x00),

Andrew realized that gpz only has 7 pins, not 8.  Can you fix in your
next spin?  It looks like Tomasz has requested a spin anyway.

-Doug
