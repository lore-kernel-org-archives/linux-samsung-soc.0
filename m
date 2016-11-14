From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request
 API
Date: Mon, 14 Nov 2016 10:11:01 +0000
Message-ID: <20161114101101.GK1575@localhost.localdomain>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:60925 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933968AbcKNKLa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 05:11:30 -0500
Content-Disposition: inline
In-Reply-To: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Thu, Nov 10, 2016 at 04:17:48PM +0100, Sylwester Nawrocki wrote:
> This patch series aims to convert the s3c64xx platform to use
> the new DMA channel request API, i.e. this is only meaningful 
> for non-dt systems using s3c64xx SoCs.
> 
> Presumably the first 2 or 4 patches in this series could be queued 
> for v4.10-rc1 and the remaining patches could be left for subsequent
> release, to avoid non-trivial conflict with patches already applied 
> in the ASoC tree.
> 
> The whole series can be pulled from git repository:
>  git://linuxtv.org/snawrocki/samsung.git 
>  branch: for-v4.10/dma/pl080-s3c64xx-v2

Tested this series again still looks good to me. The code on that
branch does differ from the code on the list by the following
diff however:

--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2317,7 +2317,7 @@ static int pl08x_probe(struct amba_device
*adev, const struct amba_id *id)
       } else {
            pl08x->slave.filter.map = pl08x->pd->slave_map;
            pl08x->slave.filter.mapcnt = pl08x->pd->slave_map_len;
-           pl08x->slave.filter.fn = pl08x_filter_id;
+           pl08x->slave.filter.fn = pl08x_filter_fn;
       }

I tested the code from the list, rather than the branch.

Thanks,
Charles
