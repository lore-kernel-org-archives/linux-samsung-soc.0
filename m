From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: samsung: Skip registration if pinctrl driver is
 present on Exynos4x12
Date: Sun, 28 Oct 2012 20:11:50 +0100
Message-ID: <CACRpkdYNDSp0K3wpvUem9ecsW-JQ9L6aKqaOmHNUR65DQTMNHA@mail.gmail.com>
References: <1351089457-8205-1-git-send-email-t.figa@samsung.com>
	<1351089457-8205-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:59134 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751684Ab2J1TLw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Oct 2012 15:11:52 -0400
Received: by mail-ea0-f174.google.com with SMTP id c13so1446992eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Oct 2012 12:11:50 -0700 (PDT)
In-Reply-To: <1351089457-8205-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org

On Wed, Oct 24, 2012 at 4:37 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch modifies the Samsung GPIO driver to check for pinctrl driver
> presence earlier and use generic matching instead of a single compatible
> value.
>
> This allows us to fix warning about unrecognized SoC in case of
> Exynos4x12, which is not supported by this driver.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if there is something you want merged through
the GPIO or pinctrl tree. I have this Samsung branch on the
pinctrl tree...

Yours,
Linus Walleij
