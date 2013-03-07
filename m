From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] ARM: dts: Add default pin states for client nodes on
 Exynos4/5 platforms
Date: Thu, 7 Mar 2013 09:15:56 +0100
Message-ID: <CACRpkdbsCpV5_P=z44CMvsgps=AS9C62oprn6To6ExhoWZkvhA@mail.gmail.com>
References: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:51193 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754620Ab3CGIP5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 03:15:57 -0500
Received: by mail-ie0-f182.google.com with SMTP id k14so216330iea.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Mar 2013 00:15:57 -0800 (PST)
In-Reply-To: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, heiko@sntech.de, patches@linaro.org

On Wed, Mar 6, 2013 at 1:36 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> This patch series populates the default pin states in client nodes
> of Exynos4 and Exynos5 platforms. Exynos4/5 platforms are migrating
> to use pinctrl framework and having the default pin states listed
> in the client nodes allows the device core to setup the default
> pin configuration for all the controllers.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
