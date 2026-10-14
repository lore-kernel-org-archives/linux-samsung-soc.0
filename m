Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C50D4D9F77
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970201; cv=pass; b=IHfXDDZpuAs6vbRgiOe7B+GbEbwyDVSy2g3cZH9yRZMV+VqNXz6imuoTniYegV1TsVncrSdmcB0wETSiz/W0lFB0pi4aWRXW2epUS+rA6yTOUzFf4VELghgWLtvRd3LpXXhaaitYFYo84TOoNvV+38xTi7gXu3FGu0iLV/GuNOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970201; c=relaxed/simple;
	bh=pWLyM9luQsQK0o6TzyDtyGsr+aOk8Ps1JZKkmmEaLaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At1zFanx1/EQLzXSj8vhJ7UcCPT+VU7fDgziIkl+ghYhMVgFgFqFsYYXPbUvovGOYkGsb6Z49JyekhmJ6SPPQWIn4b6uxBAMkV1Ug3Zz3QBkYu3tBMSeSs0U3GOa2IxbmCiNOFMMtYAUX3lgfjSbDmdYBvULeKaHTXJXrE+TtfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aAoGSYIW; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aAoGSYIW"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67699afea08so3011773d50.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 02:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970197; cv=none;
        d=google.com; s=arc-20260327;
        b=SVCkaYg79AALiyITwwEVQJt19ViMYY9AayryFr3vWY1VBqTTeoPWbj1UbZS+TaNitJ
         I10jFmYsr0LyM7p3Cs1t9bsYUwPKpTFEgy9TxwPc5WT5redbiXHnxfFZ3GLOIkN0Lndj
         Uml65NCXGtJ5yVKBpYi7zN0kc/wwm+vyow2z/4A5LneVfmEqTuZBTAnMXNtPRpoUWxtz
         nel+wZhxPdr598OMKUtt/wLGsFNResJgd3G/oqHCWiJjHdxxNbkzSOShBqQ3onUL6HiM
         ZG+2i5gsTn/81tAlTPX5gsbhFtBl5xXrUTal2hlNVN59kkJ6Iqdms8xwbAXZrlfloSOQ
         z6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        fh=QIgR4ucUb0L2eTqzPIyk924oAMb2Ov0fa0Qz3gMLapE=;
        b=J/3P0BV+X6ewhwzXklekvT3UORyPrw798DyYeeg9SoI9XZA973X9DV+U1ByiOoXMAe
         XxPup/QmtAZl/oN6Vh0nMec3fzqRRUAA2BS3tdO47gUcAXznprmKhb9j3VX21VqR0tmB
         G7mevdHVRTiJaiEuzXup8cioYBSKEXdoE1xRlYhgw5eWBB+c5XSCb9RgQ+UeMbOtd4Sp
         +nyB/hxsDBISXrC0ywuAs8xxHWHj9ZuYKLMIbyAFpGuKWlvtosI6oWu+iP/DF57hRWtA
         KNKDucpMTZKD5jnhJhHY7m1q/kGJZVYaqVURFl+eA9cYk+nO3Pza6M0v+XziooI98Cjl
         a4bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791970197; x=1792574997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=aAoGSYIWWjtVl7BdPGo49TE1UOs7NuJ9kjStb8r2sXTsaTBtWvFMA+ayTXnDHo4wVv
         +ajzuC8CFoNnYs+L3Pd5obM6j8bqYoTtK63Fp52vRVwxAVtnds3dPppxzGg/qHsH5dDb
         fXf5FX8TYvPKwE7Hmn8A97zWNhRVC+SXvPylI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970197; x=1792574997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=ZHqbkANJ2GHfhbGkdibODC7jZrsm4jraZEwArJ5TAml3u3JWQofYYmHyh3FfWG65S5
         01YQRV7hkIG7aKHh6iNY5M9c0jk21LT5HZ7pfaiGYcN2oS37phTZ8Qm3pwwKLVyu3m2n
         7KlwpTCMvjxABuKc8LoqUYJYDtiEV7OkQSHefHAe0WIOge7mGoHhLTZPhgPjsZGBhx+c
         rdu8jkQt7JgwTQjzaewqNWGa7+zkVKg4guFJL4xxFO89FAtw2fFwSEe4kaBRV3aRqDNq
         uDfbv/R9pdSvnDO+izqDk4HtXD0Un9+yYj9n+CT+XmSs0CmXRkq0hk/Z1uWczUUmUHmX
         ZDmg==
X-Forwarded-Encrypted: i=1; AKwUvBy4iNEs7I2y2SAs7PD4BcPvQAnJL397/y/9IU4snIYEpiH1LyTrNAC/iJGuQP8hbmhjG/4yli4vXQqk7eatgtqgwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKEid/U9YCdRMa6U6DqgYuBxJJ2U+2CbXvPhf3k4L+akLnqW9w
	2tOXiRXoyH2V1YRKPIxcBHGYikxMDpeb/y4JhTjj1Gnqm6YEFZ5j6bm3wDr9o0817zGc9RbBfRf
	6xtu48UWgpiRynEmVluYfDr4Gj1wLYvOU220LbBbU
X-Gm-Gg: AYBFou0tNsGwrdn96Nd8JgWYXiHt4RwJbfmTU52+fzxiv3bXWolAlrOXyB4ddgolMNG
	SB8oG/cohqW416DxpkkAUQF9UhDytecI6qPk4pvtROlOHMmltUljXYMszx/2EvNII5aRqGPTmud
	EjrfBtr5ohKuyt6DL/oCb0VXy+UmevPyqu2yCPENp6QHc0NEsGS+/vB199x0V5LCW7gzrQtcjwG
	DI2/FoMoeHbXyQwKH8G3V3OTjgPwtBhctg27dHERfX5Gh92so5AH8bEuzGceHTT7XV+78I7sBmk
	0vlYJ36NpRxz4dhDYeg1/mtJ6RUPGTOBJvojNbsjnWQ/WuJZh7USJUJqCHi9QyDf09U=
X-Received: by 2002:a05:690e:1094:10b0:677:d106:6f97 with SMTP id
 956f58d0204a3-679363475c0mr3180487d50.152.1791970197053; Wed, 14 Oct 2026
 02:29:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
In-Reply-To: <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 18:29:46 +0900
X-Gm-Features: AclHuK9N2qPZVqRIKj3AC2e-RNgLBJ_oiV-FNmg6s8RgvBJGg_msVeXPasEPdno
Message-ID: <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 10/14/26 10:20, Chen-Yu Tsai wrote:
> > The DWC3 controller can operate in host mode. It does so with a XHCI
> > compliant host controller. The XHCI has two downstream ports, one for
> > HS and one for SS. USB downstream ports start from 1, not 0.
>
> Is there something in index 0 we will need to define at some point ?

On the host side, no. Downstream ports start at 1.

On the device mode side, I believe the numbers are completely made up.

> Using 0 as base for numbering in DT isn't incompatible with the USB
> spec using base 1 for numbering,

But you end up with diverging numbering schemes, and it diverges
from other USB controllers, particularly XHCI, which DWC3 embeds.

And it also differs from the numbering currently used for directly
connected onboard devices (like hubs), which use or expect the USB
numbering scheme.

Sure we can make DWC3 "special", drop inclusion of usb-hcd.yaml,
and duplicate the section for onboard devices. On Linux, we can
add some more code to xhci_find_raw_port_number() to make an
exception for DWC3 controllers.

Also, usb_of_get_connect_type() is already broken for DWC3 based
controllers that only describe the HS connection but not the SS
connection. usb_of_get_connect_type() currently doesn't call
usb_hcd_find_raw_port_number() so both HS and SS get mapped to port 1,
which wouldn't be in the DT since HS is currently port@0. But even if
it did, SS would get mapped to port 2 anyway.


IMHO having consistent numbering across controller types would be
better. This avoids making the USB core and hub code deal with more
exceptions, and also easier to understand and write device trees.

> > Reconcile the downstream port numbering with the common USB host
> > binding, renumbering the downstream port numbers from 0 and 1 to
> > 1 and 2.
> >
> > This is non-backwards compatible, however it won't break current
> > major implementations:
> >
> > - dwc3 "gadget mode" in Linux kernel only requires a connection to be
> >    present; it doesn't matter which port it is
> >    - dwc3 "host mode" OF graph connections aren't supported yet [1]
> > - FreeBSD doesn't use the OF graph for anything
> > - U-boot doesn't use the OF graph for USB
> > - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
> >    the OF graph for USB
> > - coreboot doesn't use the OF graph for anything
> > - Zephyr doesn't support dwc3
> > - TF-A doesn't use the OF graph for anything
> > - EDK2 doesn't support dwc3 and doesn't support OF graph
> > - OP-TEE doesn't support dwc3 and doesn't support OF graph
> >
> > [1] WIP to tie OF graph port node to USB port device
> >
> > Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF =
graph ports")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > It is unclear to me whether the HS/SS numbering is fixed for all dwc3
> > variants. I checked Allwinner H616 and Rockchip RK3588 and they both
> > have HS as port 1 and SS as port 2.
> >
> > This also doesn't cover a potential "multi-port" DWC3 implementation,
> > which Qualcomm seems to have.
>
> It breaks the current Qualcomm numbering on numerous boards.

Yes. It breaks _everyone_ using the current numbering in the sense that
they are no longer valid, but should not affect actual usage.

This comment refers to "multiport" controllers from Qualcomm [1], which
would have ports beyond 1 and 2.

[1] https://lore.kernel.org/all/20240420044901.884098-8-quic_kriskura@quici=
nc.com/


> > ---
> >   Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yam=
l b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > index 6c0b8b653824..4b6304bd2ec1 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > @@ -410,11 +410,11 @@ properties:
> >         property is used.
> >
> >       properties:
> > -      port@0:
> > +      port@1:
> >           $ref: /schemas/graph.yaml#/properties/port
> >           description: High Speed (HS) data bus.
> >
> > -      port@1:
> > +      port@2:
> >           $ref: /schemas/graph.yaml#/properties/port
> >           description: Super Speed (SS) data bus.
> >
>
