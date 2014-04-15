From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] regulator: s5m8767: Use same binding for external
 control as in s2mps11
Date: Tue, 15 Apr 2014 15:21:55 +0530
Message-ID: <CAK9yfHzgH-4C5agpu9SFckp1BcB6s9jeviDVZBokhS+aRh9RUA@mail.gmail.com>
References: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
	<1397462949-22379-5-git-send-email-k.kozlowski@samsung.com>
	<20140414211106.GC12304@sirena.org.uk>
	<CAK9yfHwL4o7-7Q03dw9JdD1UDsP_v2=we1kadRXaGAuaN1de_g@mail.gmail.com>
	<1397549539.29169.2.camel@AMDC1943>
	<CAK9yfHwUwjMEXisi5Jf+nAkS7CLnAUt-REkekns9JrRTAGQ=WQ@mail.gmail.com>
	<1397552145.29169.17.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397552145.29169.17.camel@AMDC1943>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 15 April 2014 14:25, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On wto, 2014-04-15 at 14:02 +0530, Sachin Kamat wrote:
>> On 15 April 2014 13:42, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> > On wto, 2014-04-15 at 13:26 +0530, Sachin Kamat wrote:
>> >> On 15 April 2014 02:41, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> >> > On Mon, Apr 14, 2014 at 10:09:09AM +0200, Krzysztof Kozlowski wrote:
>> >> >
>> >> >> -     - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
>> >> >> +     - samsung,ext-control-gpios: (optional) GPIO specifier for one
>> >> >>               GPIO controlling this regulator (enable/disable); This is
>> >> >>               valid only for buck9.
>> >> >
>> >> > This is an incompatible change.  It's OK to deprecate the old property
>> >> > but it's bad form to just remove it.
>> >>
>> >> I agree with Mark. Also, there is no need to make it generic.
>> >
>> > I thought it would be good to make it consistent and to reduce the
>> > number of bindings with same meaning on similar drivers.
>>
>> How about making the other one use "s5m8767,pmic-ext-control-gpios"
>> compatible instead of introducing a new one?
>
> But then we would introduce semi-generic binding with a driver-specific
> name.

We can have a IP specific name (first IP to have this property) common
across family of IPs.

>
> Anyway more drivers seem to use this kind of binding (tps65090, max8952,
> da9055, arizona) so maybe there is a point in making this generic?

In that case we could but probably not with samsung prefix.

-- 
With warm regards,
Sachin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
