From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Scaler to
  dt-schema
Date: Tue, 1 Oct 2019 08:43:51 -0500
Message-ID: <20191001134351.GA21744@bogus>
References: <CGME20190927143314eucas1p2d419866cd740207426cd37cb6fdff468@eucas1p2.samsung.com>
 <20190927143306.12133-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927143306.12133-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 27 Sep 2019 16:33:06 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Image Scaler to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - Fixed description of 'clocks' property:
> rather than 'mscl clock', 'pclk clock'
> - Added empty line within if-else statement
> - Added 'additionalProperties: false'
> - Listed all missing 'properties' in properties scope
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/gpu/samsung-scaler.txt           | 27 -------
>  .../bindings/gpu/samsung-scaler.yaml          | 81 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
> 

Applied, thanks.

Rob
