From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v6 3/8] dts: Add usb2phy to Exynos 4
Date: Wed, 05 Feb 2014 16:57:07 +0100
Message-ID: <054401cf228a$ec10a9e0$c431fda0$%debski@samsung.com>
References: <1391016574-25237-1-git-send-email-k.debski@samsung.com>
 <1391016574-25237-4-git-send-email-k.debski@samsung.com>
 <CAOesGMh8qEumWGb_mVuiSTWE=tsEusntG5r9xL3Z+f_WUnBQSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAOesGMh8qEumWGb_mVuiSTWE=tsEusntG5r9xL3Z+f_WUnBQSw@mail.gmail.com>
Content-language: pl
Sender: linux-kernel-owner@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kishon Vijay Abraham I' <kishon@ti.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 'Vivek Gautam' <gautam.vivek@samsung.com>, mat.krawczuk@gmail.com, yulgon.kim@samsung.com, p.paneri@samsung.com, av.tikhomirov@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>, 'Kumar Gala' <galak@codeaurora.org>, 'Matt Porter' <matt.porter@linaro.org>, tjakobi@math.uni-bielefeld.de, 'Alan Stern' <stern@rowland.harvard.edu>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Olof,

> From: Olof Johansson [mailto:olof@lixom.net]
> Sent: Wednesday, January 29, 2014 9:51 PM
> 
> On Wed, Jan 29, 2014 at 9:29 AM, Kamil Debski <k.debski@samsung.com>
> wrote:
> > Add support to PHY of USB2 of the Exynos 4 SoC.
> >
> > Signed-off-by: Kamil Debski <k.debski@samsung.com>
> > ---
> >  .../devicetree/bindings/arm/samsung/pmu.txt        |    2 ++
> >  arch/arm/boot/dts/exynos4.dtsi                     |   31
> ++++++++++++++++++++
> >  arch/arm/boot/dts/exynos4210.dtsi                  |   17
> +++++++++++
> >  arch/arm/boot/dts/exynos4x12.dtsi                  |   17
> +++++++++++
> >  4 files changed, 67 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > index 307e727..a76f91d 100644
> > --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> > @@ -3,6 +3,8 @@ SAMSUNG Exynos SoC series PMU Registers
> >  Properties:
> >   - name : should be 'syscon';
> >   - compatible : should contain two values. First value must be one
> from following list:
> > +                  - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
> > +                  - "samsung,exynos4x12-pmu" - for Exynos4212 SoC,
> >                    - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
> >                    - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
> >                 second value must be always "syscon".
> 
> This and other PMU related bindings/dts changes should probably go in
> separate patch(es) instead of being snuck in with USB changes.

O, I will move this to a separate patch.

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
