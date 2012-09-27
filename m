From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] ASoC: SAMSUNG: Add DT support for i2s
Date: Thu, 27 Sep 2012 09:28:37 -0600
Message-ID: <506470A5.3070307@wwwdotorg.org>
References: <1348741532-29412-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:44299 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754992Ab2I0P2m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 11:28:42 -0400
In-Reply-To: <1348741532-29412-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, sangsu4u.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On 09/27/2012 04:25 AM, Padmavathi Venna wrote:
> Add support for device based discovery.

> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.txt

> +i2s@03830000 {
> +	compatible = "samsung,samsung-i2s";
> +	reg = <0x03830000 0x100>;

> +	tx-dma-channel-secondary = <&pdma0 8>;
> +	tx-dma-channel = <&pdma0 10>;
> +	rx-dma-channel = <&pdma0 9>;
> +	supports-6ch;
> +	supports-rstclr;
> +	supports-secdai;

Those 6 properties are custom to this binding so should have a vendor
prefix, e.g. "samsung,supports-6ch".

Also, I wonder if this shouldn't wait for the forthcoming standardized
DT DMA bindings (or perhaps document custom bindings that are identical
to the new standardized bindings)? Otherwise, the DMA stuff will all
have to be redefined again. Apparently it's hoped the bindings will be
in 3.7, or if not there, in 3.8.
