From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dmaengine: Support custom channel
 names
Date: Tue, 22 Oct 2013 13:45:17 +0200
Message-ID: <5266654D.30200@metafoo.de>
References: <1382201032-13538-1-git-send-email-broonie@kernel.org> <1382201032-13538-2-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-204.synserver.de ([212.40.185.204]:1044 "EHLO
	smtp-out-203.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751714Ab3JVLrf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Oct 2013 07:47:35 -0400
In-Reply-To: <1382201032-13538-2-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <t.figa@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

On 10/19/2013 06:43 PM, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Some devices have more than just simple TX and RX DMA channels, for example
> modern Samsung I2S IPs support a secondary transmit DMA stream which is
> mixed into the primary stream during playback. Allow such devices to
> specify the names of the channels to be requested in their dma_data.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>

As shortly discussed yesterday, I think the general idea is fine. But it
might be better to have the names available at PCM creation time, since this
allows us to e.g. do proper probe referral and will also have the code take
the same path in the DT case, no matter if it uses the default names or not.

- Lars
