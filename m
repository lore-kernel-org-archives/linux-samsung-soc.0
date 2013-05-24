From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 6/6] pinctrl: exynos: Handle suspend/resume of GPIO
 EINT registers
Date: Fri, 24 May 2013 11:12:00 +0200
Message-ID: <CACRpkdbN4Nxg2VSr0bf+h4Y2U=CmX9mijdZz+=tom9V0-i-69g@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<4536937.hnhaYZLnaG@amdc1227>
	<CAD=FV=VYhBP+V6SQt5SkFZszdVxSJ6AZk-C-zx1Di-RZBYhGvw@mail.gmail.com>
	<3059629.yu4Ei1BXhd@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:55598 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754604Ab3EXJMA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 May 2013 05:12:00 -0400
Received: by mail-ie0-f182.google.com with SMTP id a14so11657542iee.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 May 2013 02:12:00 -0700 (PDT)
In-Reply-To: <3059629.yu4Ei1BXhd@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Wed, May 22, 2013 at 4:03 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> Some GPIO EINT control registers needs to be preserved across
> suspend/resume cycle. This patch extends the driver to take care of
> this.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>
> Changes since v2:
>  - Fixed error path
> Changes since v1:
>  - Added optional debugging messages
>  - Added proper error path in initialization

v2 version applied for fixes.

Again confirm you must really have all this. It is not looking
good with diffstats like this for fixing regressions.

Yours,
Linus Walleij
