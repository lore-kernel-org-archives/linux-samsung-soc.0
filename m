From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/8] DMA: s3c64xx: Conversion to the new channel request API
Date: Mon, 14 Nov 2016 12:59:23 +0100
Message-ID: <31f2ed35-2838-8a9d-695c-df3d89ad4b18@samsung.com>
References: <1478791076-19528-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161114101259epcas1p2ad701e7b99590a5e9f835a9fab44e409@epcas1p2.samsung.com>
 <20161114101101.GK1575@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39445 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752188AbcKNL73 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 06:59:29 -0500
In-reply-to: <20161114101101.GK1575@localhost.localdomain>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: krzk@kernel.org, vinod.koul@intel.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, broonie@kernel.org, ym0914@gmail.com, arnd@arndb.de, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On 11/14/2016 11:11 AM, Charles Keepax wrote:
>> The whole series can be pulled from git repository:
>> >  git://linuxtv.org/snawrocki/samsung.git 
>> >  branch: for-v4.10/dma/pl080-s3c64xx-v2
>
> Tested this series again still looks good to me. The code on that
> branch does differ from the code on the list by the following
> diff however:
> 
> --- a/drivers/dma/amba-pl08x.c
> +++ b/drivers/dma/amba-pl08x.c
> @@ -2317,7 +2317,7 @@ static int pl08x_probe(struct amba_device
> *adev, const struct amba_id *id)
>        } else {
>             pl08x->slave.filter.map = pl08x->pd->slave_map;
>             pl08x->slave.filter.mapcnt = pl08x->pd->slave_map_len;
> -           pl08x->slave.filter.fn = pl08x_filter_id;
> +           pl08x->slave.filter.fn = pl08x_filter_fn;
>        }
> 
> I tested the code from the list, rather than the branch.

Oops, I forgot to push the final branch again, it's corrected
now.  Thanks for your time, hopefully there is no need to bother
you with this series any more.

-- 
Regards,
Sylwester
