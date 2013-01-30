From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 3/4] ARM: Exynos5250: Add clock information for
 dwc3-exynos
Date: Tue, 29 Jan 2013 22:54:23 -0800
Message-ID: <079201cdfeb6$a4a96400$edfc2c00$@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
 <1358257112-19595-4-git-send-email-gautam.vivek@samsung.com>
 <3963234.Gb249i4a6U@flatron>
 <CAFp+6iHd66_dvj_M5zOpJZ7sEy-pYa-CdWKUZBYc3Dfn3JHtfg@mail.gmail.com>
 <CAFp+6iE+WvQz_rbKY2L4N2KoUeTTZYhwc3v3wU5iua_bEPN1ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFp+6iE+WvQz_rbKY2L4N2KoUeTTZYhwc3v3wU5iua_bEPN1ng@mail.gmail.com>
Content-language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Vivek Gautam' <gautamvivek1987@gmail.com>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Vivek Gautam' <gautam.vivek@samsung.com>, jg1.han@samsung.com, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Vivek Gautam wrote:
> 
> Hi Tomasz,
> 
> 
> On Wed, Jan 16, 2013 at 8:35 PM, Vivek Gautam
> <gautamvivek1987@gmail.com> wrote:
> > Hi Tomasz,
> >
> >
> > On Wed, Jan 16, 2013 at 1:19 PM, Tomasz Figa <tomasz.figa@gmail.com>
> wrote:
> >> Hi Vivek,
> >>
> >> Don't you need also some clkdev lookup entry to make the clock
available
> >> in the driver?
> >>
> >
> > This clock source we added with a motive of completion, however it's
> > not being used as of now.
> > As far as i could see the lookup structure contains clocks for devices
> > having multiple instances.
> > Do you feel that i should be adding an entry in clk_lookup structure ?
> > May be i am missing here something. Can you please elaborate on the
> > use-case of clk_lookup
> > entries.
> >
> 
> Any suggestions on this please ?
> 
Just note, I think you can do it based on Samsung common clock is for all of
exynos stuff which will be done in a couple of days. Sorry for late it,
because there were some problems.

Thanks.

- Kukjin
