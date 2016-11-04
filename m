From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 1/7] dma: pl08x: Add support for the DMA slave map
Date: Sat, 5 Nov 2016 00:26:49 +0100
Message-ID: <201611050026.49560.arnd@arndb.de>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com> <1478276094-19135-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54679 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbcKDX14 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 19:27:56 -0400
In-Reply-To: <1478276094-19135-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, sbkim73@samsung.com, andi.shyti@samsung.com, javier@osg.samsung.com, broonie@kernel.org, kgene@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com

On Friday 04 November 2016, Sylwester Nawrocki wrote:
> +       } else {
> +               pl08x->slave.filter.map = pl08x->pd->slave_map;
> +               pl08x->slave.filter.mapcnt = pl08x->pd->slave_map_len;
>         }

I think you miss the setup of the filter function here.

Filtering by string in this driver is a bit awkward, so I wonder if we
might want to go one step further here and pass the actual data (i.e. 
struct pl08x_channel_data) rather than the string here.

	Arnd
