From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver for S/PDIF PCM
 audio
Date: Mon, 4 Oct 2010 15:42:00 -0700
Message-ID: <20101004224159.GA4972@opensource.wolfsonmicro.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
 <1286194583-19937-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55915 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751634Ab0JDWlq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Oct 2010 18:41:46 -0400
Content-Disposition: inline
In-Reply-To: <1286194583-19937-1-git-send-email-sw.youn@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Seungwhan Youn <sw.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, kgene.kim@samsung.com, lrg@slimlogic.co.uk, jassi.brar@samsung.com

On Mon, Oct 04, 2010 at 09:16:23PM +0900, Seungwhan Youn wrote:

> +/* Audio clock settings are belonged to board specific part. Every
> + * board can set audio source clock setting which is matched with H/W
> + * like this function-'set_audio_clock_heirachy'.
> + */
> +static int set_audio_clock_heirachy(struct platform_device *pdev)
> +{

I'd expect this to be with the other clock configuration code under
arch/arm, especially as it's involving the EPLL which can have fairly
wide usage - it seems better to make sure people working with other,
non-audio, bits of the system are aware of the EPLL usage.
