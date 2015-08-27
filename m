From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3] irqchip: kill off set_irq_flags usage
Date: Thu, 27 Aug 2015 16:56:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1508271655220.15006@nanos>
References: <1438030523-15853-1-git-send-email-robh@kernel.org> <1438030523-15853-6-git-send-email-robh@kernel.org> <CAL_JsqL9EsFpE3j_ud6bvoJ38di+2428mBD2VgQPX8fba=BpdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:59940 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753551AbbH0O46 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 10:56:58 -0400
In-Reply-To: <CAL_JsqL9EsFpE3j_ud6bvoJ38di+2428mBD2VgQPX8fba=BpdQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org

On Wed, 26 Aug 2015, Rob Herring wrote:
> Everything except this patch, sh, gpu, and final removal of
> set_irq_flags in arm/arm64 are in -next. There don't appear to be any
> new users either.
> 
> Can you apply this patch and these 2 now so they have some time in -next:
> 
> http://lkml.kernel.org/r/1438030523-15853-11-git-send-email-robh@kernel.org
> http://lkml.kernel.org/r/1438030523-15853-5-git-send-email-robh@kernel.org
> 
> And these 2 toward the end of the merge window once there is no more
> set_irq_flags:
> 
> http://lkml.kernel.org/r/1436711211-18223-13-git-send-email-robh@kernel.org
> http://lkml.kernel.org/r/1436711211-18223-14-git-send-email-robh@kernel.org

Could you please resend these 5 patches to me. Seems I lost some of them.

Thanks,

	tglx
