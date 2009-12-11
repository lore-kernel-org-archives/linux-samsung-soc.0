From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/7] ARM: S5P6440: CPU initialization
Date: Fri, 11 Dec 2009 11:16:29 +0000
Message-ID: <20091211111628.GA25806@sirena.org.uk>
References: <1260525250-4160-1-git-send-email-kgene.kim@samsung.com> <20091211120011.19236e87@life-in-the-fast-lane>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:52554 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754050AbZLKLQY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 06:16:24 -0500
Content-Disposition: inline
In-Reply-To: <20091211120011.19236e87@life-in-the-fast-lane>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <maz@misterjones.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, Dec 11, 2009 at 12:00:11PM +0100, Marc Zyngier wrote:
> Kukjin Kim <kgene.kim@samsung.com> wrote:

> > +/* define the number of gpios we need to the one after the GPR() range */
> > +#define ARCH_NR_GPIOS		(S5P6440_GPR(S5P6440_GPIO_R_NR) + 1)

> Doing so prevents the use of GPIO expanders. Either provide a config
> option to provide additional GPIO space, or just get rid of the #define.

It also prevents the use of external devices with interrupt controllers
(eg, most PMICs these days).  See the S3C24xx and S3C64xx code for
examples of how to avoid this limit.
