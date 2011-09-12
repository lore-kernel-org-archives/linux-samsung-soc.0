From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v3 1/6] DMA: PL330: move filter function into driver
Date: Tue, 13 Sep 2011 00:27:48 +0530
Message-ID: <CABb+yY0Z5qH5TDAr+5mthzH8pdTu3Gfrzk9CLRWiJQ4n15eKEQ@mail.gmail.com>
References: <1315852165-32402-1-git-send-email-thomas.abraham@linaro.org>
	<1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50753 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753661Ab1ILS5t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Sep 2011 14:57:49 -0400
Received: by bkbzt4 with SMTP id zt4so2890976bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Sep 2011 11:57:48 -0700 (PDT)
In-Reply-To: <1315852165-32402-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, boojin.kim@samsung.com

On Mon, Sep 12, 2011 at 11:59 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> The dma channel selection filter function is moved from plat-samsung
> into the pl330 driver. In additon to that, a check is added in the
> filter function to ensure that the channel on which the filter has
> been invoked is pl330 channel instance (and avoid any incorrect
> access of chan->private in a system with multiple types of DMA
> drivers).
>
> Suggested-by: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>
