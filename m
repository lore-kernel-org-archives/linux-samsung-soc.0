From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/4] ARM: defconfig: Samsung/Exynos for v5.3
Date: Wed, 26 Jun 2019 19:28:42 -0700
Message-ID: <20190627022842.k4gccn6enqd75ufs@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
 <CAJKOXPeCQZPsF1kGKmhSWgxsWSsb4cre6mhS=n=kJbH63LjmUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPeCQZPsF1kGKmhSWgxsWSsb4cre6mhS=n=kJbH63LjmUQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 26, 2019 at 11:14:04AM +0200, Krzysztof Kozlowski wrote:
> On Tue, 25 Jun 2019 at 21:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> >
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.3
> >
> > for you to fetch changes up to dd50a69b5697532666023766688c6ea642e5a443:
> >
> >   ARM: exynos_defconfig: Enable Panfrost and Lima drivers (2019-06-19 19:23:35 +0200)
> >
> > ----------------------------------------------------------------
> > Samsung defconfig changes for v5.3
> >
> > 1. Trim several configs with savedefconfig.
> > 2. Enable Lima and Panfrost drivers for Mali GPU.
> 
> Hi,
> 
> I forgot to mention possible merge conflicts (although Stephen Cc-ed
> you on mails). Resolution is to accept both sides:
> 

Some of this could have been avoided by basing your branch on our fixes, but
not a big deal in this case. Thanks for the heads up!


-Olof
