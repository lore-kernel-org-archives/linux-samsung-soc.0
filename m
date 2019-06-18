From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Tue, 18 Jun 2019 21:17:38 +0200
Message-ID: <CAJKOXPeODKo+nNTfmk9z1DaULrJMyNzuspBbFXXEkFqJ2hHYuw@mail.gmail.com>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
 <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
 <20190617163634.GA16941@kozik-lap>
 <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, airlied@linux.ie, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kgene@kernel.org, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jun 2019 at 19:42, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> > >
> > > > > +             reg = <0x11800000 0x5000>;
> > > > > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > > > > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +             interrupt-names = "job", "mmu", "gpu";
> > > > > +             clocks = <&clock CLK_G3D>;
> > > > > +             mali-supply = <&buck4_reg>;
> > > >
> > > > Please check if always-on property could be removed from buck4.
> > >
> > > I've checked, and this property can be removed safely.
> > >
> > > > Also, what about LDO27? It should be used as well (maybe through
> > > > vendor-specific properties which would justify the need of new vendor
> > > > compatible).
> > > >
> > >
> > > I'm unsure how LDO27 is used, can you elaborate?
> >
> > It is supplying the VDD_G3DS (with a note "SRAM power"). I do not have
> > any more data on it. However I did not check in vendor kernel for it.
> >
>
> After checking (a fork of) the vendor sources [1], it seems to me that
> this regulator is used for memory voltage related to Samsung's
> Adaptive Supply Voltage, for which there is a pending patchset [2].
>
> This seems to me to be out of the scope of this patchset, could you confirm?
>
> [1] https://github.com/kumajaya/android_kernel_samsung_universal5422/blob/ad41104d43e6470f8d4880d65b259dc7b903cc0d/arch/arm/mach-exynos/asv-exynos5422.c#L1052
> [2] https://lwn.net/Articles/784958/

Hi,

Indeed the vendor sources suggest that voltage scaling of this
regulator depends on ASV, not on frequency. However still the
regulator is there in the hardware so it should be in the bindings as
well (specific to Exynos). I guess the driver should also enable it
but this is separate topic (adding per-platform quirks to Panfrost
driver). Putting it to bindings also follows advice from line 12:
https://elixir.bootlin.com/linux/v5.2-rc5/source/Documentation/devicetree/bindings/writing-bindings.txt#L12

Best regards,
Krzysztof
