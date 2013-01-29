From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Failure due to missing (Exynos related) pinctrl patch
Date: Tue, 29 Jan 2013 23:25:54 +0100
Message-ID: <CACRpkdYj_e6+iT7iAVtA8_t=4e_2Lxo9duozXccfcbKY8fGk7A@mail.gmail.com>
References: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:35165 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab3A2WZy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 17:25:54 -0500
Received: by mail-ie0-f171.google.com with SMTP id 10so790849ied.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 14:25:54 -0800 (PST)
In-Reply-To: <CAK9yfHybC6ZgGwxa_i=LrMpU_q9M4aaMraTqK63B+fw11NBqRA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Tue, Jan 29, 2013 at 6:10 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> Patch titled "pinctrl: exynos: change PINCTRL_EXYNOS option"
> (linux-next commit Id: 7452b64d) which is present in linux-next is
> missing in the mainline kernel.

Do I haven't sent my pull request for the pinctrl fixes yet.

> This patch is required along with the
> patch "gpio: samsung: fix pinctrl condition for exynos and exynos5440"
> (mainline commit Id: e4a5da51) which has already made it into
> mainline. Without the missing patch we get the following boot up
> warnings and subsequent failures with dt boot on 4412 based board:

Hm I didn't realize there was a dependency between these
patches, oh well, better get the pull for the pinctrl tree finished
off then...

Yours,
Linus Walleij
