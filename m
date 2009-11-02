From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: S3C64XX DSP support added
Date: Mon, 2 Nov 2009 20:59:44 +0900
Message-ID: <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
	 <20091102104211.GA29351@sirena.org.uk>
	 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
	 <20091102112358.GC29351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.216.179]:63291 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754488AbZKBL7k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:59:40 -0500
Received: by pxi9 with SMTP id 9so3130971pxi.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2009 03:59:45 -0800 (PST)
In-Reply-To: <20091102112358.GC29351@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 2, 2009 at 8:23 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 02, 2009 at 08:10:07PM +0900, jassi brar wrote:

>> I used 'DSP' for things related to ALSA and 'PCM' for h/w specific t=
hings.
>
> I'm having a hard time following your logic here? =C2=A0This is a har=
dware
> driver after all.
Register and bit definitions, DMA and other platform resources are all
using 'PCM',
while ALSA related stuff : CPU driver, DAI name etc are using 'DSP'.

>> > You might want to rename the existing PCM driver to DMA.
>> Could do that, but still 'PCM' is used at other places in the stack =
as well.
>> Would that be fine?
>
> Probably, yes. =C2=A0The use of PCM for DMA drivers is there mostly b=
ecause
> in older systems the PCM interface offered no software control at all=
 so
> all you needed to drive them was the DMA driver.
Okay, will rename s3c24xx-pcm.c to s3c24xx-dma.c and call this driver
as s3c64xx-pcm.c
