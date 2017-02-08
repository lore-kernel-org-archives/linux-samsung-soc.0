From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [patch] pinctrl: samsung: checking for IS_ERR() instead of NULL
Date: Wed, 8 Feb 2017 10:41:09 +0200
Message-ID: <CAJKOXPcHYMGCGiq3X2vkpT9VtXe6hBBROjeZdJSvL2MMooYTPQ@mail.gmail.com>
References: <20170208072310.GA12877@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753922AbdBHIlQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2017 03:41:16 -0500
In-Reply-To: <20170208072310.GA12877@mwanda>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 8, 2017 at 9:23 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> devm_ioremap() returns NULL on error.  It doesn't return error pointers.
>
> Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Fix already sent by Wei:
https://www.spinics.net/lists/arm-kernel/msg560747.html

Best regards,
Krzysztof
