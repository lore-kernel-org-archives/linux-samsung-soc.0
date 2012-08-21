From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] gpio: exynos4: skip gpiolib registration if
 pinctrl driver is used
Date: Tue, 21 Aug 2012 14:05:22 +0200
Message-ID: <CACRpkdYc-iMgKBNfRmxUFftK78G77qQ8h_Rr5td1-95NGo7wZg@mail.gmail.com>
References: <1345060656-32201-1-git-send-email-thomas.abraham@linaro.org>
	<1345060656-32201-4-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:49702 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757202Ab2HUMFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Aug 2012 08:05:22 -0400
Received: by vbbff1 with SMTP id ff1so6396882vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Aug 2012 05:05:22 -0700 (PDT)
In-Reply-To: <1345060656-32201-4-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, kgene.kim@samsung.com, patches@linaro.org

On Wed, Aug 15, 2012 at 9:57 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:

> Pinctrl driver, when enabled, registers all the gpio pins and hence the
> registration of gpio pins by this driver can be skipped.
>
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

> +#ifdef CONFIG_OF

Wouldn't it be better to use
#ifdef CONFIG_PINCTRL_SAMSUNG?

Yours,
Linus Walleij
