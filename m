From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCHv2 01/10] ARM: S3C2443: GPIO: Correct AC97 pin defines
Date: Wed, 27 Jan 2010 10:29:47 +0000
Message-ID: <20100127102946.GA13745@sirena.org.uk>
References: <1264571873-14924-1-git-send-email-jassisinghbrar@gmail.com> <20100127081140.GK9153@trinity.fluff.org> <1b68c6791001270015o4d5f42b8k858b959816c9b7c9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48571 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754023Ab0A0K3x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2010 05:29:53 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6791001270015o4d5f42b8k858b959816c9b7c9@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Jan 27, 2010 at 05:15:28PM +0900, jassi brar wrote:
> On Wed, Jan 27, 2010 at 5:11 PM, Ben Dooks <ben-linux@fluff.org> wrote:
> > On Wed, Jan 27, 2010 at 02:57:53PM +0900, jassisinghbrar@gmail.com wrote:
> >> From: Jassi Brar <jassi.brar@samsung.com>
> >>
> >> GPIO_E-[5,9] pin functionality was defined incorrectly.
> >> The patch corrects and adds missing pins.
> >
> > Ok, should I apply this to the fixes tree and send to linus?
> Honestly speaking, I don't know. Please do as you see due.
> Maybe Mark Brown, as an affected maintainer, has some opinion?

Might've wanted to CC me there... :)  If they're just plain wrong then
it should probably go to Linus, though equally well nobody's been
complaining about it.
