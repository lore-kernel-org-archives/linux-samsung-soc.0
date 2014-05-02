From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] Documentation: DT: Exynos: Bind SRAM though DT
Date: Fri, 02 May 2014 10:53:44 +0200
Message-ID: <4811186.9DeISv2WWp@wuerfel>
References: <1399007180-20680-1-git-send-email-sachin.kamat@linaro.org> <1399007180-20680-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:62106 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327AbaEBIyV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 04:54:21 -0400
In-Reply-To: <1399007180-20680-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, heiko@sntech.de, robh+dt@kernel.org, kgene.kim@samsung.com

On Friday 02 May 2014 10:36:20 Sachin Kamat wrote:
> +       sram@02020000 {
> +               compatible = "mmio-sram";
> +               reg = <0x02020000 0x54000>;
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0 0x02020000 0x54000>;
> +

That is actually quite a lot of unused SRAM. Since it came up this
morning in another thread, there may be value in using this for
coherent DMA allocations for some devices. Not sure about how
to best hook this up, but there could be some serious performance
improvements. A typical case would be DMA descriptors for a
gigabit ethernet adapter, which are a pain to maintain on platforms
without cache-coherent DMA.

You could check what drivers you have that call dma_alloc_coherent,
and see if any of them are performance-critical, then hack them
up to use this memory instead as an experiment.

	Arnd
