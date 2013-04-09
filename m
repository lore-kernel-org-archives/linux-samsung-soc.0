From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: samsung: Split pin bank description into two structures
Date: Tue, 9 Apr 2013 09:41:52 +0200
Message-ID: <CACRpkdZewWoTT=EMd=pC_ESdRBU-O2q+syGvFX65WP9qEV9X_w@mail.gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
	<1363642315-10331-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f172.google.com ([209.85.210.172]:52548 "EHLO
	mail-ia0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936968Ab3DIHlx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 03:41:53 -0400
Received: by mail-ia0-f172.google.com with SMTP id k38so2344168iah.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 00:41:52 -0700 (PDT)
In-Reply-To: <1363642315-10331-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Mar 18, 2013 at 10:31 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This patch splits pin bank description into two structures, one
> describing bank type (currently only bitfield widths), which can be
> shared across multiple banks and second containing bank-specific
> parameters including a pointer to a bank type struct.
>
> It is a prerequisite for further patch removing the statically hardcoded
> register offsets, making it impossible to support SoCs with different
> set and order of pin control registers.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied.

Yours,
Linus Walleij
