Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2429D48641C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966498; cv=none; b=bcoma7bk4ukSn8gZkk4fuLpgWyOQUMs+n5uSMEW0G2hub5e9W499tSzQhrCsFH5FkC4bV99yBaZw6KyyfIeH7hDnyfLi16ynP9FOOeJnApv7JaaxIilPRLFKgV4e3I7/owCZRPefNnBQcc1KdLLkRPowWxrkFBgfms9zhE8oBQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966498; c=relaxed/simple;
	bh=28AGN6pwCeJyoglmxkpbJsqh/NL6EeY9xBrx5No80m0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ED9zgcKz1Hw6683Czdaz5HQMC1l5Qfp91OGqjk7DvYnhErI3lJ/c1gMHnFOXeezCZhW7JwIdWTboX8Abo+UIileUO0d65ECJKESVKlNuDJ8ImwMLaaSdEr6tgzDFvKl2Zy1uHmXcixuodrvBGslmetIyMRZ340Z2raEuaEjsL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5wEV+yy; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5wEV+yy"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso35511305e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791966494; x=1792571294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEWX0NnWZSM0xUTF33KaixK1TLeuUgRnotvYl3b7sMI=;
        b=G5wEV+yyO0uEYc/VYtGpl50eKe0T6EWkecGt7kI8lLAthE3ATq4quZucttNWKHMytQ
         5uI2fFyL1qUlcQD2treZy1GArgb4fXMWwo6qw95U/amPj7jYAwGYEgdvCgN+rQNMScTy
         JGxck0WzHyzvxuyGjHZTk9o91cjobQ9V8X2KJ/Y5LoyRkirXBeLs6iRFKaoDjNgcStPt
         VfWnvNCX9U37FMCN+/DjzVUWASVyBfzC/wl76Zj3xxj0bPuGC1J0M2K1d0AlunXapoTY
         mvjHMyYpcGd85h6EUx6yUW98VWUcA1mzMY6lKLlz6TMtEEhvdvBcbkh2s6KgtN4lFOKy
         UTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966494; x=1792571294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEWX0NnWZSM0xUTF33KaixK1TLeuUgRnotvYl3b7sMI=;
        b=rFBGjjKMMoMMrGGaRzmAneQnZZ3acMwYKOjsDKxHWwCX4HyX7Ky9prcqIQXku9IpGb
         hAiL15af/t1FsaDeA6BRIuIgECVd00qNNenYVwgEpiU5Y+eBXDcNXrnPeyvemRqdbmQ/
         PBfR2W0axJ+mqSXq7UQjM/x94u/u+kPp9NvIqFDxkZ19m2NFyqA63zlG65SvkK1GsP/+
         WWS5F8sKmUPN0mP82Yeqef24Lqt8xFSIJJDGm4iwr2Sw5IdSShhp+dVk6MqoDfpV34d4
         Pw4KLG0FEmqRXjmTkNOaxMA59NCjZlF4G/aT/8r0Xs07Kx/vecCj0n89I7g4QQhc9LLO
         MwVQ==
X-Forwarded-Encrypted: i=1; AKwUvBy35WDXnSEru0z+6C210Bkeff4t22WKBO3neVXg1KhHBxvoo+uF0MN4kq42qYF3ojIKR6wyVyhpCl6iB8YrGuQOWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIX3c7In10srx95NgPYrCws8WQdq5irwiY+TjQ210hXgrQzykl3
	tsLIHeiMeHnVOC47AQkmz4n1XTsOP382dON7P9qwhwzvNxx7cpMn7pyQhDAh6FLZEE0=
X-Gm-Gg: AYBFou2erqm24Bqgp9NC5uLtXrvK4y3LWEd5xlJ2C06oORQ9lF2CNjytU3xpbPBxV3z
	QWM7bTQ5mJS8ztn8eB2wHfq1QGkGLf8lAfoYfSgRcfwq9VTmZOlVUWFDxkoz+xShXL2P5G5jRV3
	unA2MmPELrIVjhqn8LjjzNxf7nUD5iBvPzZVuEKgejHdsbtGprNkUxbl/XEYtE/sJGZ//3Xni8j
	+/oZYRrp0zPUpoQ0jUbB0EcDPrG6bePyVCXrlNf3S+skaXmN18muDi4vdOyiDT6PA0HzSMMU33y
	NKcBpvaa+783czXtiRBnqN4D7AhEzQwP2VqDBMLmogAPXMWczpVm93JzEe0m1ReyQhfvYJTx7Ds
	Ao88F20QTkTNsb6jzBrAKiXpOwSZPczewJRdUtkXojVecoWIciLoI8yHp7QmJX4vzt3DdrDYViU
	Pg2NHpj0AXO51pP87HgCWB+9W6RcDWPKD+xrbt71pD5AN8BwoCmcR3eVLAC78KVOBIgGdLAUO3D
	f9QINe+FUDe4XYaKnHaUISimsD/jiPlIiBe9OCfAkkEmAKtgAnWbfs=
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr291581105e9.24.1791966494135;
        Wed, 14 Oct 2026 01:28:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b8a184sm17182865e9.2.2026.10.14.01.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:28:13 -0700 (PDT)
Message-ID: <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
Date: Wed, 14 Oct 2026 10:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Wei Yang <yangwei1@eswincomputing.com>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
 Yang Xiwen <forbidden405@foxmail.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Stanley Chang <stanley_chang@realtek.com>, Ze Huang <huang.ze@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261014082037.1774672-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 10:20, Chen-Yu Tsai wrote:
> The DWC3 controller can operate in host mode. It does so with a XHCI
> compliant host controller. The XHCI has two downstream ports, one for
> HS and one for SS. USB downstream ports start from 1, not 0.

Is there something in index 0 we will need to define at some point ?

Using 0 as base for numbering in DT isn't incompatible with the USB
spec using base 1 for numbering,

> 
> Reconcile the downstream port numbering with the common USB host
> binding, renumbering the downstream port numbers from 0 and 1 to
> 1 and 2.
> 
> This is non-backwards compatible, however it won't break current
> major implementations:
> 
> - dwc3 "gadget mode" in Linux kernel only requires a connection to be
>    present; it doesn't matter which port it is
>    - dwc3 "host mode" OF graph connections aren't supported yet [1]
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
>    the OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
> [1] WIP to tie OF graph port node to USB port device
> 
> Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> It is unclear to me whether the HS/SS numbering is fixed for all dwc3
> variants. I checked Allwinner H616 and Rockchip RK3588 and they both
> have HS as port 1 and SS as port 2.
> 
> This also doesn't cover a potential "multi-port" DWC3 implementation,
> which Qualcomm seems to have.

It breaks the current Qualcomm numbering on numerous boards.

> ---
>   Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b653824..4b6304bd2ec1 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -410,11 +410,11 @@ properties:
>         property is used.
>   
>       properties:
> -      port@0:
> +      port@1:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: High Speed (HS) data bus.
>   
> -      port@1:
> +      port@2:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: Super Speed (SS) data bus.
>   

