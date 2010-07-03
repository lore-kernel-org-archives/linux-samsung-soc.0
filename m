From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ARM: S3C64XX: Add audio support to
 SmartQ
Date: Sat, 3 Jul 2010 01:18:03 +0100
Message-ID: <20100703001803.GB3869@sirena.org.uk>
References: <4c2e7f40.d37b0e0a.2178.3d69@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34587 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943Ab0GCASF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Jul 2010 20:18:05 -0400
Content-Disposition: inline
In-Reply-To: <4c2e7f40.d37b0e0a.2178.3d69@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben@simtec.co.uk>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org

On Sat, Jul 03, 2010 at 01:40:24AM +0200, Maurus Cuelenaere wrote:

> +static struct i2c_board_info smartq_i2c_devs[] __initdata = {
> +	{ I2C_BOARD_INFO("wm8750", 0x1a), },
> +};

It'd be slightly nicer to register with the actual chip ID and make sure
the driver can handle it - it'll avoid the potential for confusion.
