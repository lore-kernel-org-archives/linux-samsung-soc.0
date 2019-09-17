From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung Image Rotator to
  dt-schema
Date: Tue, 17 Sep 2019 15:08:16 -0500
Message-ID: <20190917200816.GA10224@bogus>
References: <20190913062945.GA10283@pi3>
 <CGME20190917103758eucas1p10793e499209137630681186a10a4b7bd@eucas1p1.samsung.com>
 <20190917103727.14997-1-m.falkowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917103727.14997-1-m.falkowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, krzk@kernel.org, a.hajda@samsung.com, m.szyprowski@samsung.com, m.falkowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 17 Sep 2019 12:37:27 +0200, Maciej Falkowski wrote:
> Convert Samsung Image Rotator to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v3:
> - remove unneded comments and descriptions
> - remove unneded maxItems field from clock-names property
> ---
>  .../bindings/gpu/samsung-rotator.txt          | 28 -----------
>  .../bindings/gpu/samsung-rotator.yaml         | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-rotator.yaml
> 

Applied, thanks.

Rob
