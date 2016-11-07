From: Andi Shyti <andi.shyti@samsung.com>
Subject: Re: [PATCH RFC 3/7] spi: s3c64xx: Do not use platform_data for DMA
 parameters
Date: Mon, 07 Nov 2016 11:51:20 +0900
Message-ID: <20161107025120.o7ubznfooidktix6@gangnam.samsung>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20161104161715epcas5p16e5794ae9564f5bc5d899e874ceebfc9@epcas5p1.samsung.com>
 <1478276094-19135-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40107 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752057AbcKGCvW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Nov 2016 21:51:22 -0500
Content-disposition: inline
In-reply-to: <1478276094-19135-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, arnd@arndb.de, kgene@kernel.org, javier@osg.samsung.com, sbkim73@samsung.com

Hi Sylwester,

> All related platforms use either devicetree or the DMA slave
> map API for mapping DMA channels to DMA slaves so we can now
> stop using platform_data for passing DMA details.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Tested-by: Andi Shyti <andi.shyti@samsung.com>

Andi
