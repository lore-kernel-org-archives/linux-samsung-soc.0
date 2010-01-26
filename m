From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ASoC: AC97: S3C: Add controller driver
Date: Tue, 26 Jan 2010 10:53:22 +0000
Message-ID: <20100126105322.GG15759@rakim.wolfsonmicro.main>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
 <1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
 <1b68c6791001252332l5ee275c9we39c98691ad7692c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37794 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752056Ab0AZKxY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 05:53:24 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6791001252332l5ee275c9we39c98691ad7692c@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Jan 26, 2010 at 04:32:45PM +0900, jassi brar wrote:
> On Tue, Jan 26, 2010 at 2:51 PM,  <jassisinghbrar@gmail.com> wrote:

Please delete irrelevant context when replying to mails, it's much
easier to find the actual new text in the message that way.

> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* NOTE: If the codec=
 ouputs just one slot,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* it *seems* our A=
C97 controller reads the only
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* valid slot(if ei=
ther 3 or 4) for PCM-In.
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* For such cases, =
we record Mono.
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .channels_min =3D 1,

>   I would like to remove this anomaly and set channels_min =3D 2

Why?

>  And remove the second DAI_LINK in machine driver.

Again, why?
