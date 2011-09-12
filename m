From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3 4/6] DMA: PL330: Add device tree support
Date: Tue, 13 Sep 2011 00:28:34 +0530
Message-ID: <CABb+yY0QPQpfU=vvOLNG3U6idEv4Gy9btxt=-fRhMJwA+PLPzQ@mail.gmail.com>
References: <1315852165-32402-1-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-3-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-4-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-5-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:55339 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753661Ab1ILS6g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Sep 2011 14:58:36 -0400
Received: by bkbzt4 with SMTP id zt4so2891689bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Sep 2011 11:58:34 -0700 (PDT)
In-Reply-To: <1315852165-32402-5-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, boojin.kim@samsung.com

On Mon, Sep 12, 2011 at 11:59 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> For PL330 dma controllers instantiated from device tree, the channel
> lookup is based on phandle of the dma controller and dma request id
> specified by the client node. During probe, the private data of each
> channel of the controller is set to point to the device node of the
> dma controller. The 'chan_id' of the each channel is used as the
> dma request id.
>
> Client driver requesting dma channels specify the phandle of the
> dma controller and the request id. The pl330 filter function
> converts the phandle to the device node pointer and matches that
> with channel's private data. If a match is found, the request id
> from the client node and the 'chan_id' of the channel is matched.
> A channel is found if both the values match.
>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Reviewed-by: Rob Herring <rob.herring@calxeda.com>
> ---

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

thanks
-jassi
