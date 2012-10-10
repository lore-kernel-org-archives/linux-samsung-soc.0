From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/16] pinctrl: samsung: Usability and extensibiltiy improvements
Date: Wed, 10 Oct 2012 09:46:28 +0200
Message-ID: <CACRpkdbUmM2=vhjhCq_qN2v=8RUDeWV4b8A8oXXPE4e8Z9C7zg@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:56540 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245Ab2JJHq3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:46:29 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so244619wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:46:28 -0700 (PDT)
In-Reply-To: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch series is a work on improving usability and extensibiltiy of the
> pinctrl-samsung driver. It consists of three main parts:
>  - moving SoC-specific data to device tree
>  - converting the driver to use one GPIO chip and one IRQ domain per pin bank
>  - introducing generic wake-up interrupt capability description

So can you prepare a patch series which does all but the first
bullet to begin with, and a SoC-and register offset patch
on top of that as a separate series, because it is controversial?

I don't like that these two things are mingled together like this
in an all-or-nothing manner.

So I'm OK with a patch series for bulle (2) and (3) but not (1).

And I'd like to have Thomas A:s ACK on the series too.

Yours,
Linus Walleij
