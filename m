From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to dt-schema
Date: Fri, 13 Sep 2019 11:34:23 +0200
Message-ID: <CAJKOXPd58jsqSycgQF=v_iBti292X+ECeCQ0Tf7ErycYXrkTmQ@mail.gmail.com>
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
 <20190912161538.4321-1-m.falkowski@samsung.com> <20190913062945.GA10283@pi3>
 <e082996a-743d-807a-38c0-dee65b490771@samsung.com> <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maciej Falkowski <m.falkowski@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 13 Sep 2019 at 11:29, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, 13 Sep 2019 at 11:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > Hi Krzysztof,
> >
> > On 9/13/19 8:29 AM, Krzysztof Kozlowski wrote:
> > > On Thu, Sep 12, 2019 at 06:15:38PM +0200, Maciej Falkowski wrote:
> > >> Convert Samsung Image Rotator to newer dt-schema format.
> > >>
> > >> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> > >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Just to make it clear, Marek's signed-off should appear for one of
> > > conditions:
> > >   - he contributed some source code to your patch,
> > >   - he took your patch, rebased, send by himself (not a case here, I
> > >     think),
> > >   - he contributed significant ideas, although for this there is a
> > >     "Co-developed-by" tag.
> > >
> > > If someone made just review - add Reviewed-by. If someone suggested the
> > > patch - add Suggested-by.
> >
> > My signed-off here was added to mark that this patch is allowed to be
> > submitted to the public mailing list, as I have required company
> > permissions for such activity. It is not that uncommon that a given
> > patch has more than one signed-off and still the main author has the
> > first signed-off tag.
>
> Thanks for explanations. If I understand correctly, your SoB appears
> because some internal Samsung rules. That is not what SoB is meant
> for:
> https://elixir.bootlin.com/linux/v5.3-rc8/source/Documentation/process/submitting-patches.rst#L431
> If you do not contributed to the patch, did not touch it (e.g.
> rebasing) and you are not sending it, then your SoB should not be
> there. It looks like the same madness with Kyungmin Park long time
> ago:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=for-next&id=6c6cf64b16438eac6da9a90412a82316ad196e7c
> Every patch was marked with SoB even though he was not involved at all
> in the process.
>
> That's not what kernel's SoB is for.

Ah, and if you meant that Maciej does not have the permissions to send
the patches, then your SoB along with patch going through your account
makes sense. Otherwise, adding your SoB and sending by Maciej, is a
joke of company regulations. It means absolutely nothing and then
strip it out.

Best regards,
Krzysztof
