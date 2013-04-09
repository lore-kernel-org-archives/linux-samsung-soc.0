From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: samsung: Remove hardcoded register offsets
Date: Tue, 9 Apr 2013 09:43:07 +0200
Message-ID: <CACRpkdaAjhkg_Q+q9Jg+f9F_abbeYKs-sZcuTEZiDjd+rqCtpA@mail.gmail.com>
References: <1363642315-10331-1-git-send-email-tomasz.figa@gmail.com>
	<1363642315-10331-5-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:52316 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935376Ab3DIHnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 03:43:08 -0400
Received: by mail-ia0-f170.google.com with SMTP id j38so1923073iad.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 00:43:07 -0700 (PDT)
In-Reply-To: <1363642315-10331-5-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>

On Mon, Mar 18, 2013 at 10:31 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> This patch replaces statically hardcoded register offsets of Exynos SoCs
> with an array of register offsets in samsung_pin_bank_type struct.
>
> Thanks to this change, support for SoCs with other set and order of
> registers can be added (e.g. S3C24xx and S3C64xx).
>
> Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>

Patch applied.

Yours,
Linus Walleij
