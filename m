From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 14/14] ARM: SAMSUNG: Remove Samsung specific enum type
 for dma direction
Date: Mon, 25 Jul 2011 17:38:37 +0530
Message-ID: <CABb+yY3dwshghgXPuMyLzm=ArYdELBOqVf4AcxN77MV1jV8Ang@mail.gmail.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-15-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:65296 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864Ab1GYMIi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 08:08:38 -0400
Received: by eye22 with SMTP id 22so3406484eye.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2011 05:08:37 -0700 (PDT)
In-Reply-To: <1311557312-26107-15-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
> This patch removes the samsung specific enum type 's3c2410_dmasrc'
> and uses 'dma_data_direction' instead.
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

If this patch was first in the patchset, probably it could have been
already merged.
