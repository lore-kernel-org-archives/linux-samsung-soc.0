From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v4] ARM: s3c244x: Fix mess with gpio {set,get}_pull callbacks
Date: Wed, 1 Dec 2010 08:19:03 +0200
Message-ID: <201012010819.03728.anarsoul@gmail.com>
References: <201011301701.03443.anarsoul@gmail.com> <4CF55785.5090403@metafoo.de> <000d01cb9118$9136c740$b3a455c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:61906 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751167Ab0LAGTb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 01:19:31 -0500
Received: by eye27 with SMTP id 27so3285219eye.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2010 22:19:29 -0800 (PST)
In-Reply-To: <000d01cb9118$9136c740$b3a455c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Lars-Peter Clausen' <lars@metafoo.de>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Abdoulaye Walsimou GAYE' <awg@embtoolkit.org>

On Wednesday 01 December 2010 07:28:17 Kukjin Kim wrote:
> > >  	else if (pup == S3C_GPIO_PULL_NONE)
> 
> pull == S3C_GPIO_PULL_NONE?

Yep, thanks
