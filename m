From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V2 2/8] ASoC: Samsung: I2S: Add quirks as driver data
	in I2S
Date: Fri, 26 Jul 2013 15:06:18 +0100
Message-ID: <20130726140618.GP24642@n2100.arm.linux.org.uk>
References: <1374845812-7803-1-git-send-email-padma.v@samsung.com> <1374845812-7803-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:38722 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755909Ab3GZOGf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Jul 2013 10:06:35 -0400
Content-Disposition: inline
In-Reply-To: <1374845812-7803-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, abrestic@chromium.org, kgene.kim@samsung.com, broonie@kernel.org, tomasz.figa@gmail.com

On Fri, Jul 26, 2013 at 07:06:46PM +0530, Padmavathi Venna wrote:
> -- compatible : "samsung,i2s-v5"
> +- compatible : should be one of the following.
> +   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S. Previous versions
> +     has only 8/16bit support.
> +   - samsung,s3c6410-i2sv4: for 8/16/24bit multichannel(5.1 channel) I2S.
> +     Introduced in s3c6410. This also applicable for s5p64x0 platforms.
> +   - samsung,s5pc100-i2s: for 8/16/24bit multichannel(5.1 channel) I2S
> +     with secondary fifo and s/w reset control.
> +   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> +     secondary fifo, s/w reset control and internal mux for root clk src.
> +

So what happens with your changes to everyone who is using a DT file with
the "samsung,i2s-v5" compatible string?
