From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: samsung: Add support for SoC-specific
 suspend/resume callbacks
Date: Fri, 24 May 2013 11:07:41 +0200
Message-ID: <CACRpkdY-d3YYLJoWydakbT7P4wnBAK2XL7X0Fs0EcNSFakpUDw@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:44209 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760080Ab3EXJHm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:07:42 -0400
Received: by mail-ie0-f178.google.com with SMTP id f4so4100943iea.37
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 02:07:41 -0700 (PDT)
In-Reply-To: <1368807872-2601-5-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Fri, May 17, 2013 at 6:24 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> SoC-specific driver might require additional save and restore of
> registers. This patch adds pair of SoC-specific callbacks per pinctrl
> device to account for this.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied for fixes.

Hm this is quite a lot of code for "fixes", can you confirm that
the system is really unusable without all these patches?

Yours,
Linus Walleij
