From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v8 11/17] dt-bindings: add document for rockchip dp phy
Date: Fri, 30 Oct 2015 11:42:09 -0500
Message-ID: <CAL_JsqL=pL8SXLEzhbJHS_djFSh+Ctky0igzagZ6E0M9Q_TFuA@mail.gmail.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446021068-11655-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44907 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751078AbbJ3Qme (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 12:42:34 -0400
In-Reply-To: <1446021068-11655-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Daniel Kurtz <djkurtz@chromium.org>, Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ajay kumar <ajaynumb@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.c>

On Wed, Oct 28, 2015 at 3:31 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> Add dt binding documentation for rockchip display port PHY.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> Changes in v8:
> - Remove the specific address in the example node name. (Heiko)
>
> Changes in v7:
> - Simplify the commit message. (Kishon)
>
> Changes in v6: None
> Changes in v5:
> - Split binding doc's from driver changes. (Rob)
> - Update the rockchip,grf explain in document, and correct the clock required
>   elemets in document. (Rob & Heiko)
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  .../devicetree/bindings/phy/rockchip-dp-phy.txt    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> new file mode 100644
> index 0000000..00902cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> @@ -0,0 +1,22 @@
> +Rockchip Soc Seroes Display Port PHY
> +------------------------------------
> +
> +Required properties:
> +- compatible : should be one of the following supported values:
> +        - "rockchip.rk3288-dp-phy"
> +- clocks: from common clock binding: handle to dp clock.
> +       of memory mapped region.
> +- clock-names: from common clock binding:
> +       Required elements: "24m"
> +- rockchip,grf: phandle to the syscon managing the "general register files"
> +- #phy-cells : from the generic PHY bindings, must be 0;
> +
> +Example:
> +
> +edp_phy: edp-phy {
> +       compatible = "rockchip,rk3288-dp-phy";
> +       rockchip,grf = <&grf>;
> +       clocks = <&cru SCLK_EDP_24M>;
> +       clock-names = "24m";
> +       #phy-cells = <0>;
> +};
> --
> 1.9.1
>
>
