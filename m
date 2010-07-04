From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: Add SmartQ sound driver
Date: Sun, 04 Jul 2010 11:45:40 +0200
Message-ID: <4C305844.9000503@gmail.com>
References: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com> <20100704090549.GD16825@opensource.wolfsonmicro.com> <4C305229.30409@gmail.com> <20100704094246.GA2455@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:53629 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756299Ab0GDJpo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 05:45:44 -0400
Received: by ewy23 with SMTP id 23so1398454ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2010 02:45:42 -0700 (PDT)
In-Reply-To: <20100704094246.GA2455@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@slimlogic.co.uk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

 Op 04-07-10 11:42, Mark Brown schreef:
> On Sun, Jul 04, 2010 at 11:19:37AM +0200, Maurus Cuelenaere wrote:
>
>> I don't see what power there is to save? The speaker and headphone
>> jack are connected to the same physical pins, so when disabling the
>> pins for one of them, the other is also disabled.
> Meh, so they are.  That's a slightly unusual design - normally you'd
> wire the speaker amplifier to a separate set of outputs to the
> headphone.

I know, most of the SmartQ design is "slightly unusual"..

-- 
Maurus Cuelenaere
