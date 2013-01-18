From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: removing duplicated condition for PINCTRL_SAMSUNG
Date: Fri, 18 Jan 2013 16:11:23 +0100
Message-ID: <CACRpkdbX=hMMmAvOw1zvgXX380CyQp7tPg87_+J5YFEkfQ7ziQ@mail.gmail.com>
References: <1356632004-3067-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f179.google.com ([209.85.210.179]:45876 "EHLO
	mail-ia0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820Ab3ARPTl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 10:19:41 -0500
Received: by mail-ia0-f179.google.com with SMTP id x24so1486768iak.24
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jan 2013 07:19:41 -0800 (PST)
In-Reply-To: <1356632004-3067-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Thomas Abraham <thomas.ab@samsung.com>

On Thu, Dec 27, 2012 at 7:13 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:

> Now, PINCTRL_SAMSUNG should be enabled with PINCTRL_EXYNOS so we don't
> need to add 'depends on' condition already added in PINCTRL_EXYNOS.
>
> Cc: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Patch applied to pinctrl fixes, thanks!

Yours,
Linus Walleij
