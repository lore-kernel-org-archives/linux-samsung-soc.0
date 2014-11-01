From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v3 4/9] drivercore / platform: Keep PM domain powered during ->probe()
Date: Sat, 01 Nov 2014 01:21:28 +0100
Message-ID: <1760759.EbfNSUWGb7@vostro.rjw.lan>
References: <1413208930-26019-1-git-send-email-ulf.hansson@linaro.org> <20141031000749.GK36444@dtor-ws> <CAPDyKFpjYkBcW4XMO0CmgOiLux9=iw2=DEHkBG9OVZh5T5CgQg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFpjYkBcW4XMO0CmgOiLux9=iw2=DEHkBG9OVZh5T5CgQg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <tomasz.figa@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Philipp Zabel <philipp.zabel@gmail.com>, Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Russell King <linux@arm.linux.org.uk>, Jack Dai <jack.dai@rock-chips.com>, Jinkun Hong <jinkun.hong@rock-chips.com>, Aaron
List-Id: linux-samsung-soc@vger.kernel.org

On Friday, October 31, 2014 10:23:00 AM Ulf Hansson wrote:
> On 31 October 2014 01:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > On Thu, Oct 30, 2014 at 01:47:27PM -0700, Kevin Hilman wrote:
> >> Ulf Hansson <ulf.hansson@linaro.org> writes:
> >>
> >> > To sucessfully probe some devices their corresponding PM domains may
> >> > need to be powered.
> >>
> >> Isn't that what pm_runtime_get*() is supposed to be doing?  Why isn't
> >> that working?
> >
> > Also, I do not understand why we placing device into a power domain only
> > when we probe it. Why if I unbind device from its driver (or do not have
> > a driver for it) it disappears from its power domain? To me power domain
> > and having driver bound to a device are 2 orthogonal concepts.
> 
> That's a different discussion, I don't think we want to go there
> within this context.

Why don't we, exactly?

Rafael

