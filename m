From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: samsung: Update the CHIP ID binding
 documentation
Date: Wed, 2 Oct 2019 17:48:19 +0200
Message-ID: <20191002154819.GA4072@kozik-lap>
References: <20190910123618.27985-1-s.nawrocki@samsung.com>
 <CGME20190910123637eucas1p26d2051f9bdd1bdf4510f1908ea98f641@eucas1p2.samsung.com>
 <20190910123618.27985-3-s.nawrocki@samsung.com>
 <20190917181322.GA683@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917181322.GA683@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, vireshk@kernel.org, robh+dt@kernel.org, kgene@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Sep 17, 2019 at 01:13:22PM -0500, Rob Herring wrote:
> On Tue, 10 Sep 2019 14:36:14 +0200, Sylwester Nawrocki wrote:
> > This patch adds documentation of a new optional "samsung,asv-bin"
> > property in the chipid device node and documents requirement of
> > "syscon" compatible string.  These additions are needed to support
> > Exynos ASV (Adaptive Supply Voltage) feature.
> > 
> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > ---
> > Changes since v3:
> >  - none
> > 
> > Changes since v2:
> >  - corrected patch summary line prefix, the patch moved in the
> >    sequence
> > 
> > Changes since v1 (RFC):
> >  - new patch
> > ---
> >  .../devicetree/bindings/arm/samsung/exynos-chipid.txt  | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Dear Sylwester,

This will create conflicts with conversion to dt-schema (already picked
up by Rob).

Can you convert this patch to dt-schema format and send it for Rob?

Best regards,
Krzysztof
