From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCHv2 01/10] ARM: S3C2443: GPIO: Correct AC97 pin defines
Date: Wed, 27 Jan 2010 08:24:47 +0000
Message-ID: <20100127082447.GL9153@trinity.fluff.org>
References: <1264571873-14924-1-git-send-email-jassisinghbrar@gmail.com> <20100127081140.GK9153@trinity.fluff.org> <1b68c6791001270015o4d5f42b8k858b959816c9b7c9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:50323 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751728Ab0A0IYs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2010 03:24:48 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6791001270015o4d5f42b8k858b959816c9b7c9@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, linux-arm-kernel@lists.infradead.org

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
> thanks

Ok, couple of questions:

1) Is it currently causing an working driver to fail?
2) Will it break anything currently in the kernel if merged now?

I'll await Mark's comments.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
