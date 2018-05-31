From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: Remove obsolete insignal-boards.txt
Date: Thu, 31 May 2018 11:50:07 -0500
Message-ID: <20180531165007.GA29098@rob-hp-laptop>
References: <20180528185310.21971-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180528185310.21971-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, May 28, 2018 at 08:53:10PM +0200, Krzysztof Kozlowski wrote:
> The compatibles mentioned in insignal-boards.txt are already documented
> under devicetree/bindings/arm/samsung/samsung-boards.txt.  Also the
> contents of insignal-boards.txt is not accurate, e.g. does not mention
> Arndale boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/insignal-boards.txt | 8 --------
>  1 file changed, 8 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/insignal-boards.txt

Reviewd-by: Rob Herring <robh@kernel.org>
