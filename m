From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] fix to use static declarations for samsung stuff
Date: Wed, 7 Mar 2012 12:15:57 +0000
Message-ID: <201203071215.57828.arnd@arndb.de>
References: <013b01cce7f3$48c87e30$da597a90$%kim@samsung.com> <4F574CAE.6030903@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:63459 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756155Ab2CGMQB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 07:16:01 -0500
In-Reply-To: <4F574CAE.6030903@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: rmk+kernel@arm.linux.org.uk, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wednesday 07 March 2012, Kukjin Kim wrote:
> im wrote:
> > Hi Russell, Arnd and Olof,
> >
> > Please pull following branch which is including fix to use static
> > declarations for samsung stuff.
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> > next/cleanup-use-static
> >
> > I'm not sure it can be sent to upstream for v3.3 but if so, would be better.
> >
> Hi Arnd, Olof,
> 
> I can't see this series in arm-soc yet. If missed, please pull from:
>   http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> next/cleanup-use-static
> 
> As a note, I rebased it on top of arm-soc/depends/rmk/for-armsoc because 
> this touches same points(dma declaration part).
> 
> If any problems, please kindly let me know.
> 

Sorry, I must have missed this request, I can't remember seeing it before.
The patches all look good, Olof will take care of getting them in.

	Arnd
