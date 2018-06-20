From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: Remove obsolete insignal-boards.txt
Date: Wed, 20 Jun 2018 20:47:47 +0200
Message-ID: <20180620184747.ermfvtqzllofwoub@kozik-lap>
References: <20180528185310.21971-1-krzk@kernel.org>
 <20180531165007.GA29098@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180531165007.GA29098@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, May 31, 2018 at 11:50:07AM -0500, Rob Herring wrote:
> On Mon, May 28, 2018 at 08:53:10PM +0200, Krzysztof Kozlowski wrote:
> > The compatibles mentioned in insignal-boards.txt are already documented
> > under devicetree/bindings/arm/samsung/samsung-boards.txt.  Also the
> > contents of insignal-boards.txt is not accurate, e.g. does not mention
> > Arndale boards.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/insignal-boards.txt | 8 --------
> >  1 file changed, 8 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/insignal-boards.txt
> 
> Reviewd-by: Rob Herring <robh@kernel.org>

Applied to samsung-soc (with fixed typo for Reviewed-by tag).

Best regards,
Krzysztof
