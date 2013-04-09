From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: exynos5440: fix probe failure due to missing
 pin-list in config nodes
Date: Tue, 9 Apr 2013 10:14:30 +0200
Message-ID: <CACRpkdb6NDXqVicnRyQW8SPVHHo1hZ8OM57Ah3wmVwWWWp3+cg@mail.gmail.com>
References: <1364310754-3692-1-git-send-email-kgene.kim@samsung.com>
	<1364310754-3692-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:41536 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935140Ab3DIIOb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 04:14:31 -0400
Received: by mail-ie0-f172.google.com with SMTP id c10so8041330ieb.17
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 01:14:31 -0700 (PDT)
In-Reply-To: <1364310754-3692-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>

On Tue, Mar 26, 2013 at 4:12 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> From: Thomas Abraham <thomas.ab@samsung.com>
>
> The property 'samsung,exynos5440-pins' is optional in configuration nodes
> which are included in the Exynos5440 pin-controller device node. Fix the
> incorrect failure in driver probe if 'samsung,exynos5440-pins' property
> is not found in the configuration nodes.
>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Patch applied!

Thanks,
Linus Walleij
