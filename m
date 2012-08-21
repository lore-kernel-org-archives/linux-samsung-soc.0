From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: Add pinctrl node entries for Samsung
 Exynos4210 SoC
Date: Tue, 21 Aug 2012 14:54:16 +0200
Message-ID: <CACRpkdbuqtPKMTEziPfMYfSssjWxPeMEP7=wJD4WtEHNppcOZA@mail.gmail.com>
References: <1345061442-32378-1-git-send-email-thomas.abraham@linaro.org>
	<1345061442-32378-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:64615 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab2HUMyR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Aug 2012 08:54:17 -0400
Received: by vcbfk26 with SMTP id fk26so6063380vcb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 05:54:16 -0700 (PDT)
In-Reply-To: <1345061442-32378-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On Wed, Aug 15, 2012 at 10:10 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> +       pinctrl@11400000 {
> +               uart0_data: uart0-data {
> +                       samsung,pins = "gpa0-0", "gpa0-1";
> +                       samsung,pin-function = <0x2>;
> +                       samsung,pin-pud = <0>;
> +                       samsung,pin-drv = <0>;
> +               };

Apart from the pin-pud and pin-drv stuff this patch looks fine. These two
things I want to discuss in the other mail thread (controller core) first.

Yours,
Linus Walleij
