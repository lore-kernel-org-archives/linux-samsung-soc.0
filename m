From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: S3C64XX DSP support added
Date: Tue, 3 Nov 2009 20:58:22 +0900
Message-ID: <1b68c6790911030358s7effe979nadfd489c888671e4@mail.gmail.com>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
	 <20091102104211.GA29351@sirena.org.uk>
	 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
	 <20091102112358.GC29351@sirena.org.uk>
	 <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
	 <20091102120732.GA7485@rakim.wolfsonmicro.main>
	 <1b68c6790911021738p2b32b27rf688de5b7b2fa1e4@mail.gmail.com>
	 <20091103094751.GA1520@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:43878 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753280AbZKCL6S convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 06:58:18 -0500
Received: by pwj9 with SMTP id 9so2449931pwj.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Nov 2009 03:58:22 -0800 (PST)
In-Reply-To: <20091103094751.GA1520@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Nov 3, 2009 at 6:47 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Nov 03, 2009 at 10:38:47AM +0900, jassi brar wrote:
>> On Mon, Nov 2, 2009 at 9:07 PM, Mark Brown
>
>> > Is there a PCM controller on the s3c24xx chips? =C2=A0I know you'r=
e not
>
>> Only s3c2450 in the 24xx series have a pcm controller. Since there i=
s
>> no support for s3c2450 in mainline, I had to make it for s3c64xx
>
> In that case the s3c- name would be nice in case someone does submit
> support for that CPU some time.
Okay, will do that. thanks

btw, I plan to rename s3c24xx-pcm.c/h to s3c-audio.c/h rather than s3c-=
dma.c/h
because that code isn't about just dma and s3c-dma doesn't sound anythi=
ng audio
related.
Also, the prefix s3c24xx_pcm_* in s3c24xx-pcm.c has been changed to s3c=
_audio_*
