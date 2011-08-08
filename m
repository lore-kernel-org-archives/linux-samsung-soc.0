From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 13/15] spi/s3c64xx: Merge dma control code
Date: Tue, 9 Aug 2011 00:02:37 +0530
Message-ID: <CABb+yY0ZRNnkrTNWhYShBRpLFr8RB=eL6NqQHuv1aW=o2KfoSA@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
	<1311744697-10264-14-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:65020 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752056Ab1HHSci (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 14:32:38 -0400
Received: by ewy4 with SMTP id 4so756627ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2011 11:32:37 -0700 (PDT)
In-Reply-To: <1311744697-10264-14-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dan Williams <dan.j.williams@intel.com>

On Wed, Jul 27, 2011 at 11:01 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch modifies to merge the dma control code.
> Original s3c64xx spi driver has each dma control code for rx and tx channel.
> This patch merges these dma control codes into one.
> With this patch, a dma setup function and callback function handle
> for both rx and tx channel.

This is nothing really to do with underlying DMAENGINE API.
And, apparently it actually bloats the driver ?   76 insertions(+), 64
deletions(-)
Yet, I am not very against the idea.

If you must do it, maybe It would have been better to move it early in
the patchset,
which would have resulted in a smaller and cleaner  "spi/s3c64xx: Add
support DMA engine API"
