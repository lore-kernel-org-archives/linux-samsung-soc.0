From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC PATCH 09/14] ARM: dts: s6e3fa0: add DT bindings
Date: Tue, 15 Apr 2014 13:48:13 +0530
Message-ID: <CAK9yfHyJTpYNCwjCSAmFR-sHRMu5Z94k5eT78WmD-cwmYOEQyw@mail.gmail.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
	<1397540862-21359-10-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:56673 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159AbaDOISO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 04:18:14 -0400
Received: by mail-oa0-f51.google.com with SMTP id i4so10517507oah.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 01:18:14 -0700 (PDT)
In-Reply-To: <1397540862-21359-10-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

On 15 April 2014 11:17, YoungJun Cho <yj44.cho@samsung.com> wrote:
> This patch adds DT bindings for s6e3fa0 panel.
> The bindings describes panel resources, display timings, delays
> and physical size.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/panel/samsung,s6e3fa0.txt  |   52 ++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> new file mode 100644
> index 0000000..5986899
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/samsung,s6e3fa0.txt
> @@ -0,0 +1,52 @@
> +Samsung S6E3FA0 AMOLED LCD 5.7 inch panel
> +
> +Required properties:
> +  - compatible: "samsung,s6e3fa0"
> +  - reg: the virtual channel number of a DSI peripheral
> +  - vdd3-supply: core voltage supply
> +  - vci-supply: voltage supply for analog circuits
> +  - reset-gpio: a GPIO spec for the reset pin
> +  - display-timings: timings for the connected panel as described by [1]
> +
> +Optional properties:
> +  - power-on-delay: delay after turning regulators on [ms]
> +  - reset-delay: delay after reset sequence [ms]
> +  - init-delay: delay after initialization sequence [ms]
> +  - panel-width-mm: physical panel width [mm]
> +  - panel-height-mm: physical panel height [mm]
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [2]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/video/display-timing.txt
> +[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +       panel {

How about panel@0?

> +               compatible = "samsung,s6e3fa0";
> +               reg = <0>;




-- 
With warm regards,
Sachin
