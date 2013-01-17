From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/26] gpio: samsung: remove inclusion <mach/regs-clock.h>
Date: Thu, 17 Jan 2013 11:50:53 +0100
Message-ID: <CACRpkdYDa_vJhUZDJaO9N59ZscymcjD833pVC2rCz0tF9DmQ-A@mail.gmail.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
	<1357165443-3716-2-git-send-email-kgene.kim@samsung.com>
	<CACRpkdYhNHwqK3YkEKQedFvYDc6kuwesY4gmMroipnnhrLP6pA@mail.gmail.com>
	<027701cdef62$12363bb0$36a2b310$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:43615 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756432Ab3AQKux (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jan 2013 05:50:53 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so4438337ieb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jan 2013 02:50:53 -0800 (PST)
In-Reply-To: <027701cdef62$12363bb0$36a2b310$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>

On Thu, Jan 10, 2013 at 7:41 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> BTW, do you have any comments on following patches?
>
> [PATCH] gpio: samsung: silent build warning for EXYNOS5
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg14443.html

Merged to fixes.

> [PATCH] gpio: samsung: fix pinctrl condition for exynos and exynos5440
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/14758

Merged to fixes.

> [PATCH] gpio: samsung: skip gpio lib registration for EXYNOS5440
> http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/14673

I'll check it out, may have missed it.

Yours,
Linus Walleij
