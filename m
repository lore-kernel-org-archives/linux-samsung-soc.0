From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 1/2] ASoC: Samsung: Do not register samsung audio dma
 device as pdev
Date: Fri, 7 Dec 2012 15:46:46 +0900
Message-ID: <20121207064644.GI26070@opensource.wolfsonmicro.com>
References: <1354765837-3469-1-git-send-email-padma.v@samsung.com>
 <1354765837-3469-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:41953 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754602Ab2LGGqy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Dec 2012 01:46:54 -0500
Content-Disposition: inline
In-Reply-To: <1354765837-3469-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com, sbkim73@samsung.com, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org, kgene.kim@samsung.com, ben@simtec.co.uk, lrg@slimlogic.co.uk, jassisinghbrar@gmail.com, anarsoul@gmail.com, graeme.gregory@wolfsonmicro.com, philipp.zabel@gmail.com, dgreenday@gmail.com, chripell@evolware.org, mcuelenaere@gmail.com

On Thu, Dec 06, 2012 at 09:20:36AM +0530, Padmavathi Venna wrote:
> Previously, the ASoC 'platform' (PCM/DMA) object was instantiated via a
> platform_device. This didn't represent the hardware well, since there
> was no separate hardware associated with this platform_device; it was a
> virtual device with sole purpose to call snd_soc_register_platform().

Looks good however this doesn't apply against my topic/samsung branch -
can you please check if I need anything from Kukjin's tree?  Though I
guess the easiest thing is just to wait until the merge window is over,
we're near to the next release.
