From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/9] soc: samsung: Add Exynos Adaptive Supply Voltage driver
Date: Thu, 8 Aug 2019 15:14:54 +0200
Message-ID: <CAJKOXPc01ViCcwpasJ4o+yxvz5r8v0D1h5F5dc4=s0R0Jn4uNw@mail.gmail.com>
References: <CGME20190718143130eucas1p26f2058f47eb2f4020e1ddbf1619d1ac8@eucas1p2.samsung.com>
 <20190718143044.25066-1-s.nawrocki@samsung.com> <20190718143044.25066-4-s.nawrocki@samsung.com>
 <CAJKOXPeOfDHjqSotxVwVuy+6r9X3Q8ZXLit1_=gGd7bOwkHupA@mail.gmail.com>
 <a56fe2d8-1f26-b462-1564-f23902f7dbb5@samsung.com> <CAJKOXPc8iFo=2JAGEZSC46N3sZae4+JcZYBCjpKysb6PFPzyaQ@mail.gmail.com>
 <669c6b25-eb7e-ed3a-72a2-ee155a568363@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <669c6b25-eb7e-ed3a-72a2-ee155a568363@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-pm@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, kgene@kernel.org, vireshk@kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 8 Aug 2019 at 14:48, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 08/08/2019 13:31, Krzysztof Kozlowski wrote:
> > On Thu, 8 Aug 2019 at 14:07, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> >>>> +static unsigned int exynos5422_asv_parse_table(struct exynos_asv *asv,
> >>>> +                                     unsigned int pkg_id)
> >>>> +{
> >>>> +       return (pkg_id >> EXYNOS5422_TABLE_OFFSET) & EXYNOS5422_TABLE_MASK;
> >>>> +}
> >>>> +
> >>>> +static bool exynos5422_asv_parse_bin2(struct exynos_asv *asv,
> >>>> +                                    unsigned int pkg_id)
> >>>> +{
> >>>> +       return (pkg_id >> EXYNOS5422_BIN2_OFFSET) & EXYNOS5422_BIN2_MASK;
> >>>
> >>> return !!() for converting to boolean.
> >>
> >> I'm not convinced it is needed, the return type of the function is bool
> >> and value of the expression will be implicitly converted to that type.
> >> Is there any compiler warning related to that?
> >
> > Yeah, but bool is int so there will be no implicit conversion... I
> > guess it is a convention. In theory !! is the proper conversion to
> > bool but if bool==int then it's essentially conversion to 1. I am not
> > sure what's the benefit, maybe for some wrong code which would do
> > comparisons on result like if (exynos5422_asv_parse_bin2() == TRUE)...
>
> Not so - since we use "-std=gnu89", we have C99-like _Bool, which our
> bool is a typedef of. Conversions, either implicit or explicit, are
> well-defined:
>
> "6.3.1.2 Boolean type
>
> When any scalar value is converted to _Bool, the result is 0 if the
> value compares equal
> to 0; otherwise, the result is 1."
>
> This is even called out in Documentation/process/coding-style.rst:
>
> "When using bool types the !! construction is not needed, which
> eliminates a class of bugs."

Good point, thanks!

Best regards,
Krzysztof
