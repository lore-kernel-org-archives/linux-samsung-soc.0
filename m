From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/15] pinctrl: samsung: Usability and extensibiltiy improvements
Date: Thu, 11 Oct 2012 16:05:43 +0200
Message-ID: <CACRpkdZvhKEHHZrhHobes+7iYkv+eCYbQqa8Y8R3yejzxEYUxw@mail.gmail.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:38661 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756182Ab2JKOFo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 10:05:44 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so1035644wey.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Oct 2012 07:05:43 -0700 (PDT)
In-Reply-To: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Thu, Oct 11, 2012 at 10:11 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch series is a work on improving usability and extensibiltiy of
> the pinctrl-samsung driver. It consists of three main parts:
>  - improving flexibility of SoC-specific data specification
>  - converting the driver to one GPIO chip and IRQ domain per pin bank
>  - improving wake-up IRQ setup and handling

Oh I see Thomas and Kyungmin has ACKed this on patch 0,
sorry for being so confused :-/

Looking into applying this using a separate samsung branch
now...

Linus Walleij
