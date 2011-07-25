From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V4 14/14] ARM: SAMSUNG: Remove Samsung specific enum type
 for dma direction
Date: Mon, 25 Jul 2011 15:15:32 -0600
Message-ID: <20110725211532.GF26735@ponder.secretlab.ca>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-15-git-send-email-boojin.kim@samsung.com>
 <CABb+yY3dwshghgXPuMyLzm=ArYdELBOqVf4AcxN77MV1jV8Ang@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:33774 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568Ab1GYVPg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 17:15:36 -0400
Received: by gyh3 with SMTP id 3so2504031gyh.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 14:15:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CABb+yY3dwshghgXPuMyLzm=ArYdELBOqVf4AcxN77MV1jV8Ang@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Boojin Kim <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jul 25, 2011 at 05:38:37PM +0530, Jassi Brar wrote:
> On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> > This patch removes the samsung specific enum type 's3c2410_dmasrc'
> > and uses 'dma_data_direction' instead.
> >
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> 
> Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
> 
> If this patch was first in the patchset, probably it could have been
> already merged.

Indeed.  If you move this to the front when you post the next version
then it can be merged right away.

Acked-by: Grant Likely <grant.likely@secretlab.ca>
