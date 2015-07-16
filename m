From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/13] irqchip: kill off set_irq_flags usage
Date: Thu, 16 Jul 2015 13:10:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507161309370.18576@nanos>
References: <1436711211-18223-1-git-send-email-robh@kernel.org> <1436711211-18223-7-git-send-email-robh@kernel.org> <alpine.DEB.2.11.1507121737030.20072@nanos> <CAL_JsqJfDdDAQ1gr1w3w8_FVqKzxqDag-PHnwguaPfT+6zqszw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:41776 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224AbbGPLKq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 07:10:46 -0400
In-Reply-To: <CAL_JsqJfDdDAQ1gr1w3w8_FVqKzxqDag-PHnwguaPfT+6zqszw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org

On Mon, 13 Jul 2015, Rob Herring wrote:
> On Sun, Jul 12, 2015 at 11:43 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > So in most of the irqchip drivers, this is irrelevant.
> 
> Agreed, but that's a separate series I think. I'm trying not to change
> behavior with this series. Are you proposing I do something different
> with this patch?

No, consolidating it with no functional change is certainly the right
thing to do first.

Thanks,

	tglx
