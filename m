From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: remove duplicated line of samsung_pinctrl_register()
Date: Sun, 10 Feb 2013 20:17:44 +0100
Message-ID: <CACRpkdbA_BrjL2bCEZJHxQh=kvAN0sH-Jgbm=MOJ7-J+J8e5rg@mail.gmail.com>
References: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:46513 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756136Ab3BJTRo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Feb 2013 14:17:44 -0500
Received: by mail-ie0-f169.google.com with SMTP id 13so7066937iea.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Feb 2013 11:17:44 -0800 (PST)
In-Reply-To: <001901ce05be$aacdeb30$0069c190$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>

On Fri, Feb 8, 2013 at 6:39 AM, Jingoo Han <jg1.han@samsung.com> wrote:

> This patch removes duplicated line of samsung_pinctrl_register(),
> because the number of pins is redundantly assigned twice.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Patch applied with the Reviewed-by/Acked-by tags from
the maintainers.

Thanks!
Linus Walleij
