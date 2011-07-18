From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/3] ARM: S5P64X0: Add HSMMC setup for host Controller
Date: Mon, 18 Jul 2011 11:17:51 +0100
Message-ID: <20110718101751.GU23270@n2100.arm.linux.org.uk>
References: <1308571049-4412-1-git-send-email-rajeshwari.s@samsung.com> <1308571049-4412-2-git-send-email-rajeshwari.s@samsung.com> <047801cc44f0$4fb16f50$ef144df0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40873 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753258Ab1GRKSA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 06:18:00 -0400
Content-Disposition: inline
In-Reply-To: <047801cc44f0$4fb16f50$ef144df0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Rajeshwari Shinde' <rajeshwari.s@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com

On Mon, Jul 18, 2011 at 11:13:36AM +0900, Kukjin Kim wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +
> > +#include <mach/gpio.h>

Please make that linux/gpio.h.
