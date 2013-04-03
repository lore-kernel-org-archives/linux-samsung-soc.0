From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: samsung: Split pin bank description into two structures
Date: Wed, 3 Apr 2013 23:05:11 +0200
Message-ID: <CACRpkdYh27R1qZWGQpenCpUHNpbtAHOh-Cc1iRZnbCT8zPW9aw@mail.gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
	<1363642315-10331-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:53825 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760019Ab3DCVFM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 17:05:12 -0400
Received: by mail-ie0-f170.google.com with SMTP id c11so2262394ieb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Apr 2013 14:05:11 -0700 (PDT)
In-Reply-To: <1363642315-10331-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Mar 18, 2013 at 10:31 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This patch splits pin bank description into two structures, one
> describing bank type (currently only bitfield widths), which can be
> shared across multiple banks and second containing bank-specific
> parameters including a pointer to a bank type struct.
>
> It is a prerequisite for further patch removing the statically hardcoded
> register offsets, making it impossible to support SoCs with different
> set and order of pin control registers.
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

I'd like an ACK from Thomas Abraham on this patch.

Thanks,
Linus Walleij
