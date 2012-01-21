From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 21:23:24 +0000
Message-ID: <20120121212323.GA8331@opensource.wolfsonmicro.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <1327152527-11364-2-git-send-email-broonie@opensource.wolfsonmicro.com>
 <4F1ADF5A.6000806@gmail.com>
 <20120121183155.GE10751@opensource.wolfsonmicro.com>
 <4F1B2235.4000009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1B2235.4000009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Jan 21, 2012 at 09:38:13PM +0100, Sylwester Nawrocki wrote:
> On 01/21/2012 07:31 PM, Mark Brown wrote:

> > Yeah, me too but it seemed idiomatic.  Frankly I don't really understand
> > why there's a synchronous version of put.

> The synchronous put callbacks might be needed for instance in a bus core code
> to make sure the child device drivers aren't accessing resources while
> bus adapter (USB/PCI) is being unplugged for example. In cases like platform 

In those cases it feels like we ought to either do what we do with
suspend and make sure the device is resumed on the exit path (like we do
when we're entering system suspend) or just disable the PM operations,
especially given that we're reference counting.

> I2C bus controller it might be more optimal to use asynchronous put versions.
> As there are usually performed fast multiple adjacent transfers and multiple
> put runtime get/put might be merged to one get/put due to scheduling latency.
> However I've never really measured that. Implementing autosuspend might give
> some insights about that.

As I was just saying in another thread I do think it's probably worth
considering adding some small amount of autosuspend by default in order
to try to deal with that sort of pattern.  Of course for I2C devices I
rather suspect the bus is sufficiently slow that any performance work we
do in the host is immaterial.  
