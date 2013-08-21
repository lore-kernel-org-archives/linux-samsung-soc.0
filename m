From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Parse pin groups before calling pinctrl_register()
Date: Thu, 22 Aug 2013 00:25:05 +0200
Message-ID: <CACRpkdaNzXtVVE9Pk-Sx=zXp5w_-C8T-oHqJh0AH8v3cRo7kng@mail.gmail.com>
References: <1377015381-26455-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:38801 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab3HUWZG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Aug 2013 18:25:06 -0400
Received: by mail-ob0-f171.google.com with SMTP id tb18so2084519obb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2013 15:25:05 -0700 (PDT)
In-Reply-To: <1377015381-26455-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Aug 20, 2013 at 6:16 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> Calling pinctrl_register() means that the driver is fully initialized
> and might accept pinmux/pinconf requests, so pin groups must be parsed
> before.
>
> This patch fixes this problem by moving device tree parsing before call
> to pinctrl_register(). In addition, this fixes support for hogs on
> pin controllers handled by pinctrl-samsung driver.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Patch applied.

Yours,
Linus Walleij
