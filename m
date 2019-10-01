From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung 2D Graphics
  Accelerator to dt-schema
Date: Tue, 1 Oct 2019 08:44:49 -0500
Message-ID: <20191001134449.GA23645@bogus>
References: <CGME20190927143325eucas1p289cb46e8dcbb1ace0b1f80ade738c29b@eucas1p2.samsung.com>
 <20190927143319.12232-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927143319.12232-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 27 Sep 2019 16:33:19 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung 2D Graphics Accelerator to newer dt-schema format
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> ---
> v3:
> - Merged two if-statements with single if-else statement
> - Added 'additionalProperties: false'
> - Listed all missing 'properties' in properties scope
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt   | 27 -------
>  .../devicetree/bindings/gpu/samsung-g2d.yaml  | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> 

Applied, thanks.

Rob
