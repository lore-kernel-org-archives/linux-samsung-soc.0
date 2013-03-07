From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] spi: s3c64xx: let device core setup the default pin configuration
Date: Thu, 7 Mar 2013 09:11:53 +0100
Message-ID: <CACRpkdb7r9e_O1O_fbAPs=zF+nm9UkV9zDchAW4HuJJ7A9a33w@mail.gmail.com>
References: <1362570130-14084-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:55028 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753879Ab3CGILy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 03:11:54 -0500
Received: by mail-ie0-f174.google.com with SMTP id k10so213083iea.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 00:11:54 -0800 (PST)
In-Reply-To: <1362570130-14084-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: spi-devel-general@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, heiko@sntech.de, jaswinder.singh@linaro.org, patches@linaro.org

On Wed, Mar 6, 2013 at 12:42 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> With device core now able to setup the default pin configuration,
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings is removed.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
