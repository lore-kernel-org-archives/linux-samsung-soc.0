From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request
 API
Date: Wed, 16 Nov 2016 19:03:37 +0200
Message-ID: <20161116170337.GA4124@kozik-lap>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <20161116032620.GV3000@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34129 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752679AbcKPRDn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 12:03:43 -0500
Content-Disposition: inline
In-Reply-To: <20161116032620.GV3000@localhost>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, arnd@arndb.de, krzk@kernel.org, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Wed, Nov 16, 2016 at 08:56:20AM +0530, Vinod Koul wrote:
> On Thu, Nov 10, 2016 at 04:17:48PM +0100, Sylwester Nawrocki wrote:
> > This patch series aims to convert the s3c64xx platform to use
> > the new DMA channel request API, i.e. this is only meaningful 
> > for non-dt systems using s3c64xx SoCs.
> > 
> > Presumably the first 2 or 4 patches in this series could be queued 
> > for v4.10-rc1 and the remaining patches could be left for subsequent
> > release, to avoid non-trivial conflict with patches already applied 
> > in the ASoC tree.
> 
> I am fine with dma patch (expect the subsystem tag) and others except arm
> ones have acks, so I think we can merge this for v4.10-rc1. I cna create a
> immutable tag and people can merge into their tree in case they have
> dependencies.
> 
> Btw need acks on ARM patches before I can apply

First two ARM acked. Vinod, could you prepare a tag with them?

As I understood, everything won't be applied because ASoC tree already
contains some work around this?

Best regards,
Krzysztof
