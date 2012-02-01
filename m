From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH 1/3] spi/s3c64xx: Log error interrupts
Date: Wed, 1 Feb 2012 11:50:34 +0530
Message-ID: <CAM=Q2cvR5=PFLS92C5rtHQgXxent+mb4s3ZPiL7sb3WcO1hr3A@mail.gmail.com>
References: <20120121132329.GA10751@opensource.wolfsonmicro.com>
	<1327152265-10789-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<CAM=Q2ctA6o0wW4LMW=Jpe7HPGbm4S-UySURToXrC1r4kOe08Rg@mail.gmail.com>
	<20120129214028.GC2994@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:48735 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322Ab2BAGUe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 01:20:34 -0500
Received: by vcge1 with SMTP id e1so748955vcg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jan 2012 22:20:34 -0800 (PST)
In-Reply-To: <20120129214028.GC2994@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org

Hi Mark,

On Mon, Jan 30, 2012 at 3:10 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Sat, Jan 28, 2012 at 10:30:36PM +0530, Shubhrajyoti Datta wrote:
>
> Please delete irrelevant context from your replies.
>
>> > + =A0 ret =3D request_irq(irq, s3c64xx_spi_irq, 0, "spi-s3c64xx", =
sdd);
>
>> Could we have a threaded irq instead and there are prints and that m=
ay get
>> executed in interrupt context.
>
> So, clearly we *could*. =A0However I think that's not going to be as
> helpful. =A0These errors are never supposed to happen (and if they do
> indicate a fairly serious problem) so the performance impact shouldn'=
t
> be our primary concern and if they do happen then my suspicion is tha=
t
> the timing information will be very important. =A0I expect that knowi=
ng
> exactly when the error occurred is likely to help diagnose what cause=
d
> it by virtue of knowing what other things were going on in the system=
 at
> that time.
I agree .

My only concern was that incase someone wants to add prints in the irq
that may be handy.
However as you rightly pointed that timing is surely to be more of a co=
ncern.
Thanks for the explanation.
