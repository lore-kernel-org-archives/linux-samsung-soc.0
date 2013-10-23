From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dmaengine: Support custom channel
 names
Date: Wed, 23 Oct 2013 15:32:03 +0200
Message-ID: <5267CFD3.8030901@metafoo.de>
References: <1382201032-13538-1-git-send-email-broonie@kernel.org> <1382201032-13538-2-git-send-email-broonie@kernel.org> <5266654D.30200@metafoo.de> <20131023113028.GP9388@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-048.synserver.de ([212.40.185.48]:1083 "EHLO
	smtp-out-024.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752600Ab3JWNcL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Oct 2013 09:32:11 -0400
In-Reply-To: <20131023113028.GP9388@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, linaro-kernel@lists.linaro.org

On 10/23/2013 01:30 PM, Mark Brown wrote:
> On Tue, Oct 22, 2013 at 01:45:17PM +0200, Lars-Peter Clausen wrote:
>> On 10/19/2013 06:43 PM, Mark Brown wrote:
> 
>>> Some devices have more than just simple TX and RX DMA channels, for example
>>> modern Samsung I2S IPs support a secondary transmit DMA stream which is
>>> mixed into the primary stream during playback. Allow such devices to
>>> specify the names of the channels to be requested in their dma_data.
> 
>> As shortly discussed yesterday, I think the general idea is fine. But it
>> might be better to have the names available at PCM creation time, since this
>> allows us to e.g. do proper probe referral and will also have the code take
>> the same path in the DT case, no matter if it uses the default names or not.
> 
> I agree, but I'm thinking that the way to do this is to get the entire
> struct provided earlier so that the compat drivers get to use this stuff
> too.  Is there any great reason not to do that?

No, that should be fine. I've been thinking about this before as well. We
probably need something like a snd_soc_register_component_with_dai_data() or
similar. That assign the DAI data on creation.

- Lars
