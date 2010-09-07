From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/2] s3c24xx: DMA: don't use autoreload feature
Date: Wed, 08 Sep 2010 00:37:00 +0100
Message-ID: <4C86CC9C.9070506@fluff.org>
References: <1283872143-32492-1-git-send-email-anarsoul@gmail.com> <1283901799-20461-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from dsl78-143-211-26.in-addr.fast.co.uk ([78.143.211.26]:55994 "EHLO
	ben-laptop" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756557Ab0IGXir (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Sep 2010 19:38:47 -0400
In-Reply-To: <1283901799-20461-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Kleffel <tk@maintech.de>

On 08/09/10 00:23, Vasily Khoruzhick wrote:
> Some integrated DMA-capable hardware doesn't like autoreload
> feature of s3c24xx DMA-engine, that's why s3cmci driver
> didn't work with DMA transfers enabled.
> 
> I rewrote DMA driver not to use autoreload feature and removed
> all pre-loading features. Buffer re-load is fast enought to perform
> it in IRQ handler, and anyway I don't see any reason to waste CPU
> cycles on waiting for buffer load. Driver is much simplier now,
> it was tested with s3cmci and s3c24xx-i2s drivers on s3c2442 and
> s3c2410 SoCs and works just nice.

I found this really necessary, especially on systems where some
drivers can keep the cpu irq load high, such as pio hard-discs.

Can this be changed to a flag that is set to control the behaviour
on a per driver basis?
