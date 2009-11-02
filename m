From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: S3C64XX DSP support added
Date: Mon, 2 Nov 2009 20:10:07 +0900
Message-ID: <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
	 <20091102104211.GA29351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f188.google.com ([209.85.222.188]:58086 "EHLO
	mail-pz0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754065AbZKBLKC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:10:02 -0500
Received: by pzk26 with SMTP id 26so3182773pzk.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2009 03:10:08 -0800 (PST)
In-Reply-To: <20091102104211.GA29351@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 2, 2009 at 7:42 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 02, 2009 at 11:09:34AM +0900, jassisinghbrar@gmail.com wrote:
>> From: Jassi Brar <jassi.brar@samsung.com>
>>
>> next coming are patches for review before I submit them mainline.
>> thanks.
>
> If nothing else these need a better name - the name suggests that
> they're a DSP when in fact they are actually implementing support for
> the PCM interface.

I saw that coming...
The codec drivers use the term DSP (DSP_A/DSP_B) for what our PCM
controller does.
I used 'DSP' for things related to ALSA and 'PCM' for h/w specific things.

> You might want to rename the existing PCM driver to DMA.
Could do that, but still 'PCM' is used at other places in the stack as well.
Would that be fine?
