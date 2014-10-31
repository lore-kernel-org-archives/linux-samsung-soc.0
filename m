From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 01/14] mfd: max77686/802: Map regulator driver to its
 own of_node
Date: Fri, 31 Oct 2014 14:07:54 +0100
Message-ID: <1414760874.7318.15.camel@AMDC1943>
References: <1414668053-31370-1-git-send-email-k.kozlowski@samsung.com>
 <1414668053-31370-2-git-send-email-k.kozlowski@samsung.com>
 <20141031122330.GP18557@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20141031122330.GP18557@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On pi=C4=85, 2014-10-31 at 12:23 +0000, Mark Brown wrote:
> On Thu, Oct 30, 2014 at 12:20:40PM +0100, Krzysztof Kozlowski wrote:
> > Add of_compatible fields for max77686 and max77802 regulator driver=
s.
> > The driver's node should be the same as voltage-regulators node. Th=
is
> > simplifies parsing of regulators init data from DTS.
>=20
> No, this is broken.  You're introducing an ABI break that conveys no
> additional information, I can't see any reason why this should make i=
t
> simpler to parse init data (you've certainly not articulated one in t=
he
> changelog here) but even if it did you are changing the ABI incompati=
bly
> and convenience isn't a good reason to do that.

The ABI won't be broken - both drivers would work fine with old and new
DTB. However I agree that I should justify this more...

Javier and you explained me using parent's device for rdev->dev so I
think this change won't be needed and I'll just drop it.

Thank you for feedback.

> I'm getting very frustrated with what's going on with these drivers,
> there seem to be a lot of rather large sets of patches spawning lots =
of
> discussion but also frequent review problems and very little actually
> getting merged (look at the set of changes in the past few merge wind=
ows
> for example).  There's something going wrong here.

If I over-spammed you, then I am deeply sorry.

Best regards,
Krzysztof
