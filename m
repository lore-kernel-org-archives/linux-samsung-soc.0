From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: Revised patches for PCM Controller driver
Date: Wed, 4 Nov 2009 21:14:45 +0900
Message-ID: <1b68c6790911040414jced4bf1i8852a9ce84c3ddf5@mail.gmail.com>
References: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
	 <20091104110512.GB25044@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.216.179]:35924 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753453AbZKDMOk convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 07:14:40 -0500
Received: by pxi9 with SMTP id 9so4578624pxi.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Nov 2009 04:14:45 -0800 (PST)
In-Reply-To: <20091104110512.GB25044@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 4, 2009 at 8:05 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Nov 04, 2009 at 05:27:44PM +0900, jassisinghbrar@gmail.com wr=
ote:
>
>> Acting upon the inputs given by Mark and Ben, I have revised the cod=
e.
>> A few points to be noted:-
>
> Please just post this stuff upstream, I'll review it fully there.
>
> Unless the code is so awful it can clearly never be accepted upstream
> without major work (which is not the case here) not submitting upstre=
am
> at the earliest opportunity is likely to slow things down, either
> through the wait caused by an extra round of upstream submission or
> through missing key subsystem specific feedback (as happened with the
> IDE code, where several rounds of updates were done on code that woul=
d
> never be accepted upstream due to using the old IDE subsystem).

One of the purposes of this list was to catch trivial mistakes in the
patches before they are sent upstream for maintainer review. That shoul=
d help
save maintainers time and keep them 'receptive' to samsung's patches.
Second purpose being peer review withing samsung.


>> 1) The prefix s3c24xx_pcm_ in the platform driver has been changed t=
o
>> =C2=A0 =C2=A0more neutral s3c_audio_
>
> Please use DMA or something else which indicates which part of the au=
dio
> subsystem it's driving.
okay, will call it s3c_dma_
