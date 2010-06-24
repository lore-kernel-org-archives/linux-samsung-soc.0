From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: SMDK6440: I2C writes fails
Date: Thu, 24 Jun 2010 17:35:18 +0100
Message-ID: <34703F8C-7A9C-43FE-A748-9F6E90F3D425@opensource.wolfsonmicro.com>
References: <AANLkTim5qV8N_0iZ9DViJG1-IqYHhO-DKJZrd7RHpWbB@mail.gmail.com>  <20100624113236.GA3958@opensource.wolfsonmicro.com> <AANLkTikxaMB4eqnNuC8lneEt333gRWzKfLHy2-ChQeB5@mail.gmail.com> (sfid-20100624_133539_674220_8A82C8AB)
Mime-Version: 1.0 (iPad Mail 7B367)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55983 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755184Ab0FYMPz convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jun 2010 08:15:55 -0400
In-Reply-To: <AANLkTikxaMB4eqnNuC8lneEt333gRWzKfLHy2-ChQeB5@mail.gmail.com> (sfid-20100624_133539_674220_8A82C8AB)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>


On 24 Jun 2010, at 13:35, Naveen Krishna Ch <naveenkrishna.ch@gmail.com> wrote:

> Hi Mark,
> 
> On 24 June 2010 17:02, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
>> 
>> On Wed, Jun 23, 2010 at 11:15:55AM +0530, Naveen Krishna Ch wrote:
>> 
>>> Where should i be looking,
>> 
>> I would suggest looking at the driver and comparing it with the
>> datasheet.
>> 
>>> Will changing the spin counts work?
>> 
>> I'd expect this to be unlikely.  Note that if we run out of spins we
>> still go for the 1ms sleep that was being used originally so it's more
>> likely that there's a bug in the chip when that register is being read
>> (though this would be surprising) or some other change in your kernel is
>> causing problems.
> 
>  --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -527,7 +527,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
>         /* first, try busy waiting briefly */
>         do {
>                 iicstat = readl(i2c->regs + S3C2410_IICSTAT);
> -       } while ((iicstat & S3C2410_IICSTAT_START) && --spins);
> +       } while (--spins && (iicstat & S3C2410_IICSTAT_START));
> 
>         /* if that timed out sleep */
>         if (!spins) {
> 
> Does the trick..

That smells rather like a compiler bug to me - the two versions
ought to be equivalent apart from the ordering of the comparisons.