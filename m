From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v8 09/17] dt-bindings: add document for rockchip variant
 of analogix_dp
Date: Fri, 30 Oct 2015 11:46:38 -0500
Message-ID: <CAL_JsqLxkz43gj-O+r0LURg0_41SrDB7g8EAHwjxbytoUPijhA@mail.gmail.com>
References: <1446020143-32645-1-git-send-email-ykk@rock-chips.com> <1446020905-10670-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446020905-10670-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yakir Yang <ykk@rock-chips.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Daniel Kurtz <djkurtz@chromium.org>, Doug Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, Ajay kumar <ajaynumb@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.c>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 28, 2015 at 3:28 AM, Yakir Yang <ykk@rock-chips.com> wrote:
> Rockchip DP driver is a helper driver of analogix_dp coder driver,
> so most of the DT property should be descriped in analogix_dp document.
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> ---

Looks mostly fine to me.

[...]

> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
> +
> +- ports: contain a port node with endpoint definitions as defined in
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.

Please document that you have 2 ports 0 and 1, port0 has 2 endpoints
for ? and port1 has 1 endpoint connected to a panel(or another
bridge). Otherwise that is only evident from the example.

Rob
