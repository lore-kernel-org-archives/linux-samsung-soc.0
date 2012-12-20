From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c-core: Add gpio based bus arbitration implementation
Date: Thu, 20 Dec 2012 00:53:43 +0000
Message-ID: <CACxGe6uoWSD4EK+jb4Hrh0-nF+waWNh8MyBH5M7oxrwA7uGLrg@mail.gmail.com>
References: <1355464254-12768-1-git-send-email-ch.naveen@samsung.com>
 <1355464254-12768-2-git-send-email-ch.naveen@samsung.com> <20121219123201.B636A3E0AD7@localhost>
 <20121219171423.GW4985@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121219171423.GW4985-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux I2C <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, grundler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, naveen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 19, 2012 at 5:14 PM, Mark Brown
<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org> wrote:
> On Wed, Dec 19, 2012 at 12:32:01PM +0000, Grant Likely wrote:
>
>> I'm not convinced on the design of this protocol. It won't scale beyond
>> 2 bus masters and it seems very specific to the design of a specific
>> piece of hardware. I don't think it is mature enough to bake into the
>
> I ought to point out that the original patch would've baked this into
> the Samsung I2C driver but I asked for it to be split out as it's
> nothing to do with the controller really and I'm sure I've seen it
> before.

Indeed, baking it into the driver is also the wrong abstraction.

g.

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
