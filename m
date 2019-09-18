From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: Convert Samsung I2S controller
 to dt-schema
Date: Wed, 18 Sep 2019 08:49:33 -0500
Message-ID: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
References: <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
 <20190917111413.22711-1-m.falkowski@samsung.com> <20190917120452.28135-1-m.falkowski@samsung.com>
 <CAL_JsqJmjUR63i_hKUuZwDu42rebwABHu62bQoxTRRJu5yObEA@mail.gmail.com> <40f56f61-a1db-a1a2-262e-1f4c771481e1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <40f56f61-a1db-a1a2-262e-1f4c771481e1@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Falkowski <m.falkowski@samsung.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 5:08 AM Maciej Falkowski
<m.falkowski@samsung.com> wrote:
>
>
> On 9/17/19 3:05 PM, Rob Herring wrote:
>
> > On Tue, Sep 17, 2019 at 7:05 AM Maciej Falkowski
> > <m.falkowski@samsung.com> wrote:
> >> Convert Samsung I2S controller to newer dt-schema format.
> >>
> >> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >> v2:
> >> - Added missing Signed-off-by certificate
> >> ---
> >>   .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
> >>   .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
> >>   2 files changed, 119 insertions(+), 84 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> new file mode 100644
> >> index 000000000000..59dc76035cb4
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> >> @@ -0,0 +1,119 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Samsung SoC I2S controller
> >> +
> >> +maintainers:
> >> +  - Krzysztof Kozlowski <krzk@kernel.org>
> >> +  - Sangbeom Kim <sbkim73@samsung.com>
> >> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    description: |
> >> +      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
> >> +
> >> +      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
> >> +      secondary fifo, s/w reset control and internal mux for root clk src.
> >> +
> >> +      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
> >> +      playback, stereo channel capture, secondary fifo using internal
> >> +      or external dma, s/w reset control, internal mux for root clk src
> >> +      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
> >> +      is to allow transfer of multiple channel audio data on single data line.
> >> +
> >> +      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
> >> +
> >> +      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
> >> +      with only external dma and more no.of root clk sampling frequencies.
> >> +
> >> +      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
> >> +      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
> >> +      slightly modified bit offsets.
> >> +    enum:
> >> +      - "samsung,s3c6410-i2s"
> >> +      - "samsung,s5pv210-i2s"
> >> +      - "samsung,exynos5420-i2s"
> >> +      - "samsung,exynos7-i2s"
> >> +      - "samsung,exynos7-i2s1"
> > No need for quotes here.
> >
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  dmas:
> >> +    description: list of DMA controller phandle and DMA request line ordered pairs.
> > How many?
>
> Hi Rob,
>
> I have one problem with determining size of dmas.
>
> It seems that there are only two options for dmas: tx, rx or tx, rx, tx-sec.
>
> It looks like minItems should be two and maxItems should be three.
>
> However, some of bindings have different definition of dmas.
>
> When there is:
>
>          dmas = <&pdma0 10
>                  &pdma0 9
>                  &pdma0 8>;
>
> the number of Items for dmas is one,
>
> when there is:
>
>          dmas = <&pdma0 10>,
>                       <&pdma0 9>,
>                       <&pdma0 8>;
>
> the number of Items is three.
>
> Both of these are equal from perspective of dtc,
>
> however from schema point of view, they have different size.
>
>
> What is a proper solution to this kind of problem?

The solution is writing things in the latter form. I have a script to
convert a bunch of these. I need to coordinate doing that at the end
of a merge window.

Rob
