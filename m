From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] arm64: dts: exynos: Pull for v5.4
Date: Thu, 12 Sep 2019 11:35:52 +0200
Message-ID: <CAJKOXPcF_NVeyR7cRnq-6obi39MocA0aRGUn_9aExjBy0VXkWw@mail.gmail.com>
References: <20190911183632.4317-1-krzk@kernel.org> <CAK8P3a2pBV+fh0rHitZ30Zz61QNRLfNSD-nhnzq4ZtxSh66F1Q@mail.gmail.com>
 <CAJKOXPcOSvc2DfoN+7Tca=t5dSm3RcKqmm06AfR0PAVBeY=GvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcOSvc2DfoN+7Tca=t5dSm3RcKqmm06AfR0PAVBeY=GvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 12 Sep 2019 at 08:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 11 Sep 2019 at 23:07, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Sep 11, 2019 at 8:36 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > Unfortunately the patches were applied right after closing the linux-next.
> >
> > Hi Krzysztof,
> >
> > I took a look at these and am not convinced this is right:
> >
> > > 1. Fix boot of Exynos7 due to wrong address/size of memory node,
> >
> > The current state is clearly broken and a fix is needed, but
> > I'm not sure this is the right fix. Why do you have 32-bit physical
> > addressing on a 64-bit chip? I looked at commit ef72171b3621
> > that introduced it, and it seems it would be better to just
> > revert back to 64-bit addresses.
>
> We discussed with Marek Szyprowski that either we can go back to
> 64-bit addressing or stick to 32. There are not known boards with more
> than 4 GB of RAM so from this point of view the choice was irrelevant.
> At the end of discussion I mentioned to stick with other arm64 boards
> (although not all), so revert to have 64 bit address... but Marek
> chosen differently. Since you ask, let's go back with revert.
>
> >
> > > 2. Move GPU under /soc node,
> >
> > No problem
> >
> > > 3. Minor cleanup of #address-cells.
> >
> > IIRC, an interrupt-controller is required to have a #address-cells
> > property, even if that is normally zero. I don't remember the
> > details, but the gic binding lists it as mandatory, and I think
> > the PCI interrupt-map relies on it. I would just drop this patch.
>
> Indeed, binding requires both address and size cells. I'll drop it.

Short update: no, address-cells are not required by bindings. They are
optional. In case of lack of them, the parent address-cells will be
used so effectively this patch was changing it from 0 to 1. Anyway
this was not expressed in commit msg so I'll drop it.

Best regards,
Krzysztof
