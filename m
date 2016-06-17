From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH RFC 6/6] ASoC: samsung: Add DT bindings
 documentation for TM2 sound subsystem
Date: Fri, 17 Jun 2016 13:08:36 +0200
Message-ID: <5763DA34.20009@samsung.com>
References: <1465815160-28504-1-git-send-email-s.nawrocki@samsung.com>
 <1465815160-28504-7-git-send-email-s.nawrocki@samsung.com>
 <57612295.7070203@metafoo.de> <5762D652.5030507@samsung.com>
 <5762D7BA.7050400@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48568 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751711AbcFQLJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 07:09:07 -0400
In-reply-to: <5762D7BA.7050400@metafoo.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: broonie@kernel.org, robh@kernel.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, inki.dae@samsung.com, beomho.seo@samsung.com, ideal.song@samsung.com

On 06/16/2016 06:45 PM, Lars-Peter Clausen wrote:
> You can still handle the clocks in the machine driver, but they should be
> specified in the node of the CODEC to accurately represent the hardware.
> 
> The simple-card driver e.g. does this, requests the clock of the CODEC and
> uses it to configure the CODEC input frequency based on it with
> snd_soc_dai_set_sysclk().

I was assuming parsing the CODEC node was not preferred. Thanks for the
clarification, I have reworked the machine driver to use the CODEC node.
