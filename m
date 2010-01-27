From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [Rev2]Samsung: New driver for AC97 controllers
Date: Wed, 27 Jan 2010 11:06:01 +0000
Message-ID: <20100127110600.GG22551@rakim.wolfsonmicro.main>
References: <1264571815-14893-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35287 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754193Ab0A0LGD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2010 06:06:03 -0500
Content-Disposition: inline
In-Reply-To: <1264571815-14893-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Jan 27, 2010 at 02:56:55PM +0900, jassisinghbrar@gmail.com wrote:

>  I am going to submit revised patches for new driver for the AC97-ver-2.0
> controllers found in Samsung SoCs. The driver is named generic s3c-ac97.c
>  The driver has been tested for on s3c64xx and newer SoCs and is confirmed
> to support Playback/Capture and VRA.

The ASoC bits of this all look good, I'll do some testing before I apply
them though (probably later today) since I have relevant hardware on my
desk.
