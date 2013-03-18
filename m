From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 6/6] irqchip: s3c24xx: add s3c2450 interrupt definitions
Date: Mon, 18 Mar 2013 23:21:26 +0100
Message-ID: <2341349.u4eE8qA54r@wuerfel>
References: <201303171404.06146.heiko@sntech.de> <201303181753.16547.heiko@sntech.de> <514791DC.9070600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:55113 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754184Ab3CRWV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Mar 2013 18:21:29 -0400
In-Reply-To: <514791DC.9070600@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robherring2@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>

On Monday 18 March 2013 17:14:52 Rob Herring wrote:
> 
> > +             s3c24xx,irqlist = <2 0 /* 2D */
> > +                                2 0 /* IIC1 */
> > +                                0 0 /* reserved */
> > +                                0 0 /* reserved */
> > +                                2 0 /* PCM0 */
> > +                                2 0 /* PCM1 */
> > +                                2 0 /* I2S0 */
> > +                                2 0>; /* I2S1 */
> 
> My first thought here is this information should not be centralized in
> the controller node, but placed with each source node (2D, I2C1, etc).

Seconded. Let's do this the same way we have it for all other irq chips
and put it all into the irq descriptor referring to the controller, not
the controller.

	Arnd
