From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v10 1/3] ARM: EXYNOS: Add support for EXYNOS5410 SoC
Date: Sat, 24 May 2014 00:55:36 +0200
Message-ID: <537FD1E8.2090705@gmail.com>
References: <1400841343-6016-1-git-send-email-t.dakhran@samsung.com>	<1400841343-6016-2-git-send-email-t.dakhran@samsung.com>	<537FB995.5070604@gmail.com>	<CANhyOUd8Q2nzh_bF6LZNuv8keVUB3F45PocYrLP_B=D_Q3tWuQ@mail.gmail.com> <CANhyOUfp1AL6wJ1Q9kWj=v-n9e2CyxkQOPb8_50M5bY_JN2f9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:40592 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751151AbaEWWzn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 18:55:43 -0400
In-Reply-To: <CANhyOUfp1AL6wJ1Q9kWj=v-n9e2CyxkQOPb8_50M5bY_JN2f9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tarek Dakhran <t.dakhran@gmail.com>
Cc: Tarek Dakhran <t.dakhran@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infrad>

On 24.05.2014 00:48, Tarek Dakhran wrote:
> Sorry, only now catch it!
> I agree, this patch is not needed anymore, except Kconfig option.
> config SOC_EXYNOS5410 is needed to build clock stuff.

Right, I missed this.

> What is your opinion, Tomasz?
> 

I'd suggest re-spinning this series once more, removing changes that are
not needed anymore, but keeping the Kconfig entry.

Best regards,
Tomasz
