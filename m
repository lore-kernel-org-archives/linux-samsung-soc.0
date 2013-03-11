From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ARM: exynos: pl330: Add #dma-cells for generic dma binding support
Date: Mon, 11 Mar 2013 21:02:36 +0000
Message-ID: <201303112102.36909.arnd@arndb.de>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com> <CAAgF-Bf+rqiFUaBD=aRqry6-2z4o0Ao2L2YRm8bu1x98TfPPyg@mail.gmail.com> <015901ce1ad3$6ea43540$4bec9fc0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:52886 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754507Ab3CKVCq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Mar 2013 17:02:46 -0400
In-Reply-To: <015901ce1ad3$6ea43540$4bec9fc0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Padma Venkat' <padma.kvr@gmail.com>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com, 'Olof Johansson' <olof@lixom.net>

On Thursday 07 March 2013, Kukjin Kim wrote:
> > Can you please take this patch in 3.9 rc2 ?
> > 
> Sure, I will.
> 
> BTW, Arnd, I'm not sure second one(socfpga.dtsi) can be handled in samsung
> tree.

I guess you're right, I've applied the second one to the fixes branch now.

Thanks,

	Arnd
