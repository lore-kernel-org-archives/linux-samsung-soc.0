From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ASoC: samsung: let device core setup the default pin configuration
Date: Thu, 7 Mar 2013 09:14:56 +0100
Message-ID: <CACRpkdYF7ed-+Qkw_+N2rHzOv1njkGLew+7wcSYsOGvooeAVCA@mail.gmail.com>
References: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f180.google.com ([209.85.210.180]:58100 "EHLO
	mail-ia0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138Ab3CGIO4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 03:14:56 -0500
Received: by mail-ia0-f180.google.com with SMTP id f27so172546iae.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 00:14:56 -0800 (PST)
In-Reply-To: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: alsa-devel@alsa-project.org, lrg@ti.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, heiko@sntech.de, patches@linaro.org

On Wed, Mar 6, 2013 at 12:55 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> With device core now able to setup the default pin configuration,
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings in i2s driver is removed.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
