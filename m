From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: Add SmartQ sound driver
Date: Sun, 4 Jul 2010 22:01:33 +0900
Message-ID: <F182A883-DE14-4BE4-8430-9C925E59893B@opensource.wolfsonmicro.com>
References: <4c2e8856.487e0e0a.3bb5.3ec0@mx.google.com> <4C305C75.1060305@gmail.com> (sfid-20100704_110339_786796_2EEE3A65)
Mime-Version: 1.0 (iPad Mail 7B367)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42573 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757505Ab0GDNBU convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Jul 2010 09:01:20 -0400
In-Reply-To: <4C305C75.1060305@gmail.com> (sfid-20100704_110339_786796_2EEE3A65)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

On 4 Jul 2010, at 19:03, Maurus Cuelenaere <mcuelenaere@gmail.com> wrote:

> Op 03-07-10 02:46, Maurus Cuelenaere schreef:
>> +static struct snd_soc_jack_pin smartq_jack_pins[] = {
>> +	/* Disable speaker when headphone is plugged in */
>> +	{
>> +		.pin	= "Internal Speaker",
>> +		.mask	= SND_JACK_HEADPHONE,
>> +		.invert	= true,
>> +	},
>> +};
> 
> Hmm I just discovered that this .invert should be false (guess I didn't test enough), should I resubmit this patch or submit an incremental one?

Incremental please.