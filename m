From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] i2c: s3c24xx: allow device core to setup default pin configuration
Date: Thu, 7 Mar 2013 07:16:24 +0100
Message-ID: <CACRpkdbyrecX=4sDsUDfGDErS_MeR22vmB7p_PA-TsfoE6runA@mail.gmail.com>
References: <1362404573-30406-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:56601 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874Ab3CGGQZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 01:16:25 -0500
Received: by mail-ie0-f179.google.com with SMTP id k11so135743iea.38
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Mar 2013 22:16:25 -0800 (PST)
In-Reply-To: <1362404573-30406-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, heiko@sntech.de, t.figa@samsung.com, wsa@the-dreams.de

On Mon, Mar 4, 2013 at 2:42 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> With device core now able to setup the default pin configuration,
> the call to devm_pinctrl_get_select_default can be removed. And
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings is also removed.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
