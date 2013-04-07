From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 0/2] Support device_prep_dma_sg for pl330
Date: Sun, 7 Apr 2013 15:20:54 +0530
Message-ID: <CABb+yY1NA0VDwuHYtoGSA6L80cyjL2TP_kWP89EdMqvA6fQHiw@mail.gmail.com>
References: <1364904076-3130-1-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f54.google.com ([209.85.210.54]:50371 "EHLO
	mail-da0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933049Ab3DGJuz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Apr 2013 05:50:55 -0400
Received: by mail-da0-f54.google.com with SMTP id p1so2192562dad.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Apr 2013 02:50:54 -0700 (PDT)
In-Reply-To: <1364904076-3130-1-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: Vinod Koul <vinod.koul@intel.com>, djbw@fb.com, Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>, Boojin Kim <boojin.kim@samsung.com>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Apr 2, 2013 at 5:31 PM, Chanho Park <chanho61.park@samsung.com> wrote:
> This patchset support device_prep_dma_sg functionality for pl330 dmaengine
> driver. The prep_dma_sg function prepares descriptors to transfer between src
> and dest memory which consists of scatter/gather list. The patchset contains
> code clean-up to eliminate duplications.
>
> Chanho Park (2):
>   dma: pl330: split off common code to give back descriptors
>   dma: pl330: add pl330_prep_dma_sg to transfer from sglist to sglist
>
>  drivers/dma/pl330.c |  209 ++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 157 insertions(+), 52 deletions(-)
>
Acked-by : Jassi Brar <jassisinghbrar@gmail.com>
