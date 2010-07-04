From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: Add SmartQ sound driver
Date: Sun, 4 Jul 2010 18:42:48 +0900
Message-ID: <20100704094246.GA2455@opensource.wolfsonmicro.com>
References: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com>
 <20100704090549.GD16825@opensource.wolfsonmicro.com>
 <4C305229.30409@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34796 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756299Ab0GDJnv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 05:43:51 -0400
Content-Disposition: inline
In-Reply-To: <4C305229.30409@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

On Sun, Jul 04, 2010 at 11:19:37AM +0200, Maurus Cuelenaere wrote:

> I don't see what power there is to save? The speaker and headphone
> jack are connected to the same physical pins, so when disabling the
> pins for one of them, the other is also disabled.

Meh, so they are.  That's a slightly unusual design - normally you'd
wire the speaker amplifier to a separate set of outputs to the
headphone.
