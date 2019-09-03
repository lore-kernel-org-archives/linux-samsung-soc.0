From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
Date: Tue, 3 Sep 2019 09:04:23 +0200
Message-ID: <CAJKOXPcYv_7s9wJQQL7Z7BYLCKmADG_h37yU1Z4e=Qv7vAxosw@mail.gmail.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com>
 <20190830104502.7128-2-guillaume.gardet@arm.com>
 <20190902153146.GB9289@kozik-lap>
 <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
 <VE1PR08MB468570F2B6851C4CD3E80A5083B90@VE1PR08MB4685.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <VE1PR08MB468570F2B6851C4CD3E80A5083B90@VE1PR08MB4685.eurprd08.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 3 Sep 2019 at 09:03, Guillaume Gardet <Guillaume.Gardet@arm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 03 September 2019 08:56
> > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>;
> > Marek Szyprowski <m.szyprowski@samsung.com>; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
> > exynos5250 compatible
> >
> > On Mon, 2 Sep 2019 at 17:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Fri, Aug 30, 2019 at 12:44:58PM +0200, Guillaume Gardet wrote:
> > > > Add "samsung,exynos5250-mali" binding.
> > > >
> > > > Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
> > > >
> > > > Cc: Kukjin Kim <kgene@kernel.org>
> > > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > ---
> > > > V3 changes:
> > > >   * add dt-bindings before node in device tree
> > > > V2 changes:
> > > >   * new file
> > > >
> > > >  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
> > >
> > > Thanks, entire set applied (with re-ordering and minor description
> > > changes).
> >
> > Hi Guillaume,
>
> Hi,
>
> >
> > I applied yesterday entire patchset but this dt-bindings patch causes big
> > merge conflict which will not be reasonable to resolve by Linus.
> > Can you rebase this patch on top of latest linux-next? Basically you would
> > need to add respective entries to new YAML file:
> > Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> >
> > Send it to regular dt-bindings maintainers (scripts/get_maintainers.pl).
>
> IIUC, I just need to resend this patch (1/5) rebased to use yaml, instead of txt, no need to resend other patches, right?

Yes, correct. Just remember to send it to proper maintainers (previous
one skipped DT guys).

Best regards,
Krzysztof
