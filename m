From: Ben Dooks <ben-i2c@fluff.org>
Subject: Re: [PATCH] I2C:SAMSUNG:Select I2C_S3C2410 if HAVE_S3C2410_I2C
Date: Fri, 25 Mar 2011 21:32:15 +0000
Message-ID: <20110325213214.GT15795@trinity.fluff.org>
References: <1300957573-2622-1-git-send-email-tushar.behera@linaro.org> <20110324104751.GS15795@trinity.fluff.org> <AANLkTinw2uMdoy_ugKjhuVWC=cUMNgy-mv+ezUzPPkke@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:35940 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755305Ab1CYVcX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Mar 2011 17:32:23 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinw2uMdoy_ugKjhuVWC=cUMNgy-mv+ezUzPPkke@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Ben Dooks <ben-i2c@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On Fri, Mar 25, 2011 at 08:12:06AM +0530, Tushar Behera wrote:
> Hi Ben,
> 
> On 24 March 2011 16:17, Ben Dooks <ben-i2c@fluff.org> wrote:
> > On Thu, Mar 24, 2011 at 02:36:13PM +0530, Tushar Behera wrote:
> >> On Samsung Kconfig files, HAVE_S3C2410_I2C is selected if we want
> >> to enable support for I2C. But the I2C controller is selected only
> >> if I2C_S3C2410 is defined.
> >>
> >> This patch selects I2C_S3C2410 when I2C and HAVE_S3C2410 are selected.
> >
> > No. Do not do this, just having the device on the board does not mean
> > you want it forced into the kernel. A user may want to build it as a
> > module or not build it at-all.
> >
> Thanks for your comments.

Sorry, default should be fine... it's select that is something that
shouldn't be done. I'll test and apply tomorrow.

That'll teach me to go reviewing stuff before the first proper coffee
of the morning.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
