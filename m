From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 4/7] ASoC: samsung: i2s: Do not use platform_data for DMA parameters
Date: Sat, 5 Nov 2016 00:29:18 +0100
Message-ID: <201611050029.18984.arnd@arndb.de>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com> <1478276094-19135-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:53774 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750971AbcKDXaS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 19:30:18 -0400
In-Reply-To: <1478276094-19135-6-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On Friday 04 November 2016, Sylwester Nawrocki wrote:
> -       ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
> +       ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
>                                                  NULL, NULL);

If we remove the filter argument from every caller here, maybe we should also
change the prototype to not expect those three NULL arguments any more.



	Arnd
