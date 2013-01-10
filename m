From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC PATCH 5/7] ARM: s3c64xx: Add board file for boot using Device Tree
Date: Thu, 10 Jan 2013 11:55:01 +0100
Message-ID: <1513533.R0vnZSVmMe@flatron>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com> <1357774909-29938-6-git-send-email-tomasz.figa@gmail.com> <20130110105221.GG20956@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:42906 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753373Ab3AJKzB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 05:55:01 -0500
Received: by mail-ea0-f169.google.com with SMTP id a12so162265eaa.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 02:55:00 -0800 (PST)
In-Reply-To: <20130110105221.GG20956@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk

Hi Mark,

On Thursday 10 of January 2013 10:52:22 Mark Brown wrote:
> On Thu, Jan 10, 2013 at 12:41:47AM +0100, Tomasz Figa wrote:
> > + * The following lookup table is used to override device names when
> > devices + * are registered from device tree. This is temporarily
> > added to enable + * device tree support addition for the Exynos4
> > architecture.
> Cut'n'paste.

Oh my, you got me. ;)

I will correct it in next version. Thanks for spotting this.

Best regards,
Tomasz Figa
