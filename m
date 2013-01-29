From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] DMA: PL330: Add xlate function
Date: Tue, 29 Jan 2013 10:27:19 +0000
Message-ID: <201301291027.19325.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <201301281458.15219.arnd@arndb.de> <CAAgF-BcxqNyf8VQcndJbRnQYEcZyRayTYq-hqkB73Jd+FVTaYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:63732 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751790Ab3A2K12 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 05:27:28 -0500
In-Reply-To: <CAAgF-BcxqNyf8VQcndJbRnQYEcZyRayTYq-hqkB73Jd+FVTaYg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padma Venkat <padma.kvr@gmail.com>, Jon Hunter <jon-hunter@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, swarren@nvidia.com, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com

On Tuesday 29 January 2013, Padma Venkat wrote:
> of_dma_simple_xlate is just passing the dma channel number to the
> filter function. But I also need
> to compare against device node as my requested channel can belong to
> any of the available dma controller
> on SoC. So I implemented a xlate which passes the whole dma_spec.

Hmm, this seems to be a universal requirement for anyone using the
simple xlate function. Jon, how did you expect drivers to handle
this? Assuming that there is only one DMA controller in the system
does not sound like a good idea.

Padma, please have a look at how I did this in the dw_dma patch
I posted yesterday.

	Arnd
