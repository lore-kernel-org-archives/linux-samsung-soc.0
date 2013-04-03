From: Will Deacon <will.deacon@arm.com>
Subject: Re: [Suggestion] ARM:S5pv210: compiling issue for s5pv210 by using
 randconfig
Date: Wed, 3 Apr 2013 11:10:18 +0100
Message-ID: <20130403101018.GE11040@mudshark.cambridge.arm.com>
References: <514FB202.3040807@asianux.com>
 <515BFA8D.2000204@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:38357 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1761974Ab3DCKKv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Apr 2013 06:10:51 -0400
Content-Disposition: inline
In-Reply-To: <515BFA8D.2000204@asianux.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, "dhowells@redhat.com" <dhowells@redhat.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Apr 03, 2013 at 10:46:53AM +0100, Chen Gang wrote:
> Hello Maintainers:
> 
>   when you have time, could you help to check this suggestion ?

[...]

> > 
> >   make:
> >     make V=1 EXTRA_CFLAGS=-W ARCH=arm randconfig
> >     make V=1 EXTRA_CFLAGS=-W ARCH=arm menuconfig
> >       set arm-linux-gnu-  for "Cross-compiler tool prefix"
> >       set "Samsung S5PV210/S5PC210" for "ARM system type"
> >     make V=1 EXTRA_CFLAGS=-W ARCH=arm

I think the main problem is that you've reported an issue created from a
randconfig, but you haven't made the config in question available.

Will
