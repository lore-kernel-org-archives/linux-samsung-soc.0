From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/15] pinctrl: samsung: Detect and handle unsupported
 configuration types
Date: Thu, 11 Oct 2012 15:57:32 +0200
Message-ID: <CACRpkdbRNfic7LYkcRWQSJjWop+OH7ap_z0UpPco6+m_AASYPA@mail.gmail.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
	<1349943081-27939-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:47018 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752605Ab2JKN5e (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 09:57:34 -0400
Received: by mail-wi0-f172.google.com with SMTP id hq12so8775181wib.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Oct 2012 06:57:33 -0700 (PDT)
In-Reply-To: <1349943081-27939-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Thu, Oct 11, 2012 at 10:11 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch modifies the pinctrl-samsung driver to detect when width of a
> bit field is set to zero (which means that such configuraton type is not
> supported) and return an error instead of trying to modify an inexistent
> register.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

I'm quite happy with these 17 patches, but I'd like to have Thomas
Abraham's definitive ACK before I merge anything.

Yours,
Linus Walleij
