From: Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: samsung: document bindings for Midas
 family boards
Date: Thu, 21 Dec 2017 12:42:46 +1100
Message-ID: <20171221014246.GA23568@lineageos.org>
References: <20171218123805.26345-1-simon@lineageos.org>
 <20171218123805.26345-2-simon@lineageos.org>
 <20171220181759.6r4waz4seerh6q4i@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:33953 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756025AbdLUBmz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 20:42:55 -0500
Content-Disposition: inline
In-Reply-To: <20171220181759.6r4waz4seerh6q4i@rob-hp-laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>

Hi Rob,

Thanks for the review.

On Wed, Dec 20, 2017 at 12:17:59PM -0600, Rob Herring wrote:
> On Mon, Dec 18, 2017 at 11:38:02PM +1100, Simon Shields wrote:
> > Document GT-I9300, GT-I9305, GT-N7100, and GT-N7105 bindings, along
> > with the shared "midas" binding.
> > 
> > Signed-off-by: Simon Shields <simon@lineageos.org>
> > ---
> >  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> My comment on v2 remains.

Do you have any example of a better description? All the other ARM board
descriptions seem similarly terse.

Alternatively, maybe changing the compatible strings is a better
solution? "samsung,n710x" for t0, "samsung,i9300" for m0, and
"samsung,i9305" for m3?

Cheers,
Simon
