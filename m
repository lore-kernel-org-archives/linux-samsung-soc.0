From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: samsung: Protect bank registers with a spinlock
Date: Tue, 9 Apr 2013 09:37:40 +0200
Message-ID: <CACRpkdb9JUzTtxQa++jVJHCPM_ZaWUnO1pfi9=7oNpMuGnc+LQ@mail.gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
	<1363642315-10331-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:50237 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935254Ab3DIHhk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 03:37:40 -0400
Received: by mail-ie0-f170.google.com with SMTP id c11so8154304ieb.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 00:37:40 -0700 (PDT)
In-Reply-To: <1363642315-10331-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Mar 18, 2013 at 10:31 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> Certain pin control registers can be accessed from different contexts,
> i.e. pinctrl, gpio and irq functions. This makes the locking provided by
> pin control core insufficient.
>
> This patch adds necessary locking using a per bank spinlock as it was
> done in the old Samsung GPIO driver.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

OK no reaction from the other Samsung maintainers so now I start
applying these...

Patch applied!

Yours,
Linus Walleij
