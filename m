From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: add pinctrl nodes for Exynos5250 SoC
Date: Fri, 14 Dec 2012 21:34:47 +0100
Message-ID: <CACRpkdZgSpkHW3mW_2ZhvUWVTX7Qppb5G8d+MdD3zUDOYCY-pw@mail.gmail.com>
References: <1355403978-388-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:53822 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932289Ab2LNUes (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 15:34:48 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so2183819eek.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Dec 2012 12:34:47 -0800 (PST)
In-Reply-To: <1355403978-388-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org

On Thu, Dec 13, 2012 at 2:06 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Add pinctrl device nodes for Exynos5250 SoC.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

> - The individual device nodes which are using the old style Samsung gpio
>   bindings have not been converted over to pinctrl bindings yet. It might
>   also be important to know if Linus's pinctrl grab in device core patch
>   (http://comments.gmane.org/gmane.linux.kernel/1409263) gets accepted.

Greg seems happy with it and the plan is to have it merged for kernel
v3.9.

I intend to push Greg for an ACK and queue it for linux-next right after the
merge window.

> - This patch should not be merged for now which otherwise would break existing
>   platforms which are using the old samsung gpio driver bindings. This patch
>   is intended to get started with the migration to pinctrl framework.
>   It is probably better to first prepare all the migration patches and
>   merge them as a bunch.

Sure. I guess it'll be taken through the Samsung tree anyway, right?

Yours,
Linus Walleij
