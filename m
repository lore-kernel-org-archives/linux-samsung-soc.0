From: Pavel Fedin <p.fedin@samsung.com>
Subject: RE: [PATCH v7 1/4] Documentation: dt-bindings: Describe SROMc
 configuration
Date: Thu, 12 Nov 2015 10:02:06 +0300
Message-ID: <00f901d11d18$0b68e760$223ab620$@samsung.com>
References: <cover.1446799912.git.p.fedin@samsung.com>
 <0bc58ce0fd39767834f486c4c0cfbbd70044caed.1446799912.git.p.fedin@samsung.com>
 <CAL_JsqLsD9gA2-AWYGaHvOuZhhDmE2BHmPMU2nJjPYEvQJdNHQ@mail.gmail.com>
 <009301d11c4c$6eaa1eb0$4bfe5c10$@samsung.com>
 <CAL_JsqLtWwdGHKKfS8b6E0Urh6gYopZcwpdyvJGWCRm7x81YzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22881 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbbKLHCL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 02:02:11 -0500
In-reply-to: <CAL_JsqLtWwdGHKKfS8b6E0Urh6gYopZcwpdyvJGWCRm7x81YzA@mail.gmail.com>
Content-language: ru
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rob Herring' <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>

 Hello!

> >> > +- samsung,srom-timing : array of 6 integers, specifying bank timings in the
> >> > +                        following order: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
> >> > +                        Each value is specified in cycles and has the following
> >> > +                        meaning and valid range:
> >> > +                        Tacp : Page mode access cycle at Page mode (0 - 15)
> >> > +                        Tcah : Address holding time after CSn (0 - 15)
> >> > +                        Tcoh : Chip selection hold on OEn (0 - 15)
> >> > +                        Tacc : Access cycle (0 - 31, the actual time is N + 1)
> >> > +                        Tcos : Chip selection set-up before OEn (0 - 15)
> >> > +                        Tacs : Address set-up before CSn (0 - 15)
> >>
> >> This is not easily extended. Perhaps a property per value instead.
> >
> >  We had a discussion with Krzysztof about it, he agreed with this form of the property.
> > My concern was that it's just too much typing, and makes little sense because these
> > settings always go together. If register layout changes, or parameter set changes in
> > incompatible way, then it's another device, not exynos-srom anymore.
> >  So would you agree with that, or is your position strong?
> 
> I'm thinking for a new version of the controller which could add (or
> remove) new timing parameters, but then I guess you can interpret the
> field differently based on the compatible string. Anyway, your problem
> to deal with.

 Of course, my thought is that if compatible string is different,
then it's already a different device. And of course it would have different parameters.
 So, OK, i'll post new version with fixed documentation today.

Kind regards,
Pavel Fedin
Expert Engineer
Samsung Electronics Research center Russia
