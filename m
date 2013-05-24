From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] pinctrl: samsung: Allow per-bank SoC-specific private data
Date: Fri, 24 May 2013 11:09:02 +0200
Message-ID: <CACRpkdZs=fWfi-9U5T-H+mLRJ1T6sn2Zb4UfurSkZYsqX_n9Zg@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-6-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:64061 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760064Ab3EXJJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:09:03 -0400
Received: by mail-ie0-f180.google.com with SMTP id ar20so11636311iec.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 02:09:02 -0700 (PDT)
In-Reply-To: <1368807872-2601-6-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, May 17, 2013 at 6:24 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch extends pin bank descriptor structure with SoC-specific
> private data field that allows SoC-specific drivers to store their own
> private data.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied for fixes.

Yours,
Linus Walleij
