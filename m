From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add init code of audio to Goni and
	Aquila board
Date: Fri, 1 Oct 2010 06:28:13 +0100
Message-ID: <20101001052813.GD30949@sirena.org.uk>
References: <4CA5623B.5030405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35667 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208Ab0JAF2P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 01:28:15 -0400
Content-Disposition: inline
In-Reply-To: <4CA5623B.5030405@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Fri, Oct 01, 2010 at 01:23:23PM +0900, Chanwoo Choi wrote:
> This patch add initializtion code of audio and I2S platform drivers
> to Goni and Aquila board.

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

> +static void __init aquila_sound_init(void)
> +{
> +	unsigned int gpio;
> +
> +	/* CODEC_XTAL_EN 
> +	 *
> +	 * The Aquila board have a oscillator which provide main clock
> +	 * to WM8994 codec. The oscillator provide 24MHz clock to WM8994
> +	 * clock. Set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.
> +	 * */

In future we should be able to arrange for this clock to be disabled
when the CODEC is totally idle, giving a marginal power saving.
