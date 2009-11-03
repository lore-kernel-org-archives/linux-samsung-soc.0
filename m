From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: S3C64XX DSP support added
Date: Tue, 3 Nov 2009 10:38:47 +0900
Message-ID: <1b68c6790911021738p2b32b27rf688de5b7b2fa1e4@mail.gmail.com>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
	 <20091102104211.GA29351@sirena.org.uk>
	 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
	 <20091102112358.GC29351@sirena.org.uk>
	 <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
	 <20091102120732.GA7485@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f188.google.com ([209.85.222.188]:35788 "EHLO
	mail-pz0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755540AbZKCBin convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 20:38:43 -0500
Received: by pzk26 with SMTP id 26so3640024pzk.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2009 17:38:48 -0800 (PST)
In-Reply-To: <20091102120732.GA7485@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 2, 2009 at 9:07 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 02, 2009 at 08:59:44PM +0900, jassi brar wrote:
>
>> Okay, will rename s3c24xx-pcm.c to s3c24xx-dma.c and call this drive=
r
>> as s3c64xx-pcm.c
>
> Is there a PCM controller on the s3c24xx chips? =C2=A0I know you're n=
ot
> particularly intersted in them but if there is I'd be surprised if th=
e
> same driver wouldn't work for both and someone else might want to add
> the s3c24xx specific stuff (probably mostly under arch/arm). =C2=A0If=
 that is
> the case then s3c-pcm might be better.
Only s3c2450 in the 24xx series have a pcm controller. Since there is
no support for s3c2450 in mainline, I had to make it for s3c64xx

> It'd be nice to do that for the DMA driver too if it is getting renam=
ed
> anyway.
okay.
