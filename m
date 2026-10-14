Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B66214A9B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971074; cv=none; b=Lt+4KsIBkObmBK+u9YtVLj4VNweNxa6/9ZgrX1OFbUa813xlESSTtO54JosQqKRVZAilbP6ojWqvIXOBESBi6oonOU6KRQymmL1D9gC0rdMVWnZ5bM0oz/G9nY6JVTAvOosugicNydV7Bq8dGKKxAIH7YEnJom64MTtyYcERCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971074; c=relaxed/simple;
	bh=WaYVZicrDlr4HfBHe/rJfnu+8TVr0yyGGzp7RQjsvxA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zzcjzhjlb62CnlVJW5kHCwebQVCPgaR2BOPfheSzTWhTqvSd2uomN9C6amTQWYBjg33a3nnY2t2gFHHGLE5S/PDl41FsfxIOWZlh+PVxnoZ1KjIYHQVO8P9DoNYSKdpXsIvk92NHdR+ajNcTqCNcNQV8NAhUP8UdN6q2EK1RxR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8XQHrdb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8XQHrdb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c02782159so2362937f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Oct 2026 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791971071; x=1792575871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6xM3sm3th3dZUQDR90wqF/auFVqXIo1QuQOs4ETDrQ=;
        b=I8XQHrdbkKkPYfSgwJZAAfJxAIWGRM3OGO/xmLPD7ip+aV/bhsJsC0rgHdqxd7jOhj
         w48DVXEGyxtwruEJ5EaoYZPM9WGThErLKPyP71dnq3fkiMuUuLT8rpy32Ix7jt8n4U6z
         YUfc7WFwcaiSBCLSRWXOYVICimnrfNiz5N2bhk5zZCLHE60ED8LhFL2cAiMxsW8nJJnf
         6SuDySEwvgQC8b7rOnOpZ8VqmO67Z74N1bXlySPNmpBDnNLUuLcBT8mq5aggo8TrVVSE
         QkjU29NIMlJvvPw7KuGnk2b2REUoDRZxTnKYpmACbZSB51x4TbV5Wn/sMbivaJXdv+0A
         rn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971071; x=1792575871;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6xM3sm3th3dZUQDR90wqF/auFVqXIo1QuQOs4ETDrQ=;
        b=Jv69fZH797LjVnKnduaiul5R6N4/iII8IK522PYmRJq3uuiT1Ik6j68pzHamjxjrFQ
         Z1YLiQIGpZAV9KULaUzeCXkUG8h0ZZKso3M2qx9Ow9s+5PhIK8schY36X711VWmEU8aW
         Foy/L1/GI+Qysm4Njhf4PhMeN/rJer/uXjKSE4PBfCIIqWB4K7wRSTDgvTWJgBKKkh+r
         uW8sePrrEYr1OauLPrxTNhr4ZGy/jGerB5hnUTMGro44qXv2BggRpnFNmPpnYslBQEMJ
         yQBHWBkzsu5nsCNL9obpQeeQHgKGDeYUb6LPt4dZU2oN6Z8L2kiKkZt7UpU0DZdK5p+u
         ZlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZU69v3Wh1bsoSlyDOE747hxOadT+8I3ut9RoXzswlr+IQCEq4dQ4fLC1iZgesl3MB1yfBxciejEksfxiQ/88YNA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIXuW1tabzhmoJ9DkgSl6TX8+6E/QNYeSWmCvJ35eoOg6fm9jn
	ibjAxpjmqX9AN6v99+RY6Ex2sOEZn4TBoeC46/5QIxUfqrcdBiI3PWP+K5Nm75mOnpc=
X-Gm-Gg: AYBFou3WKdn1BWvckw5SeYUGyDeSpcHzkreCWtuxhXayUnSNdIHUL81RzPuBO1V7C1u
	Z+8nk3i0jEfxiESYPUlc9iKKDfMxkL9RMnSoVEAVuJKYv3bfnMrwF5hXXYIpHti2fJeaBLBOjdq
	+SMd8TetkLsxdQ6oHmcjakj+DFfM+HhTN6JPSvop2ml4LrlScKUJYwOuMi7ZdSN87+Wpt6Y5voX
	o9vVFN4zm4+E5e3JD1EDiIxmobybt6vpaDWwWLfoQuvsr3bKkwB7jPq6SMMNYVhSgohHs58TMi3
	V2GvURXiBpMzyEGoIjUIsDyS1BG+ISVIWoJx6T7xsSWaHPv5BKJ37xdm1NVPkDDgTbfgJ4CCcGI
	4UTgkUIFQ39nbbuwxqgiUQZZgnHLiiTiKSafBklt+Bdth0JGN8ovDRVfEPJayAPL8J1RhybBp8T
	+t9yFXbWh78V+awq2nqaNGKvbIhCaMKsidAPIcfEK/XoofNn8SoC2ZuxyyLbcJzGBVX8WMt1tt3
	NWBoKbCxXABMJOW3Cl/16XMncmSUplwuT6eeaa3NNNC2nBN47JoJA==
X-Received: by 2002:a05:6000:22c8:b0:48c:6a50:cb9a with SMTP id ffacd0b85a97d-48dbacf56a0mr28939645f8f.51.1791971070318;
        Wed, 14 Oct 2026 02:44:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de70079e7sm5699992f8f.11.2026.10.14.02.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:44:29 -0700 (PDT)
Message-ID: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Date: Wed, 14 Oct 2026 11:44:28 +0200
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
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
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
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
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
In-Reply-To: <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/26 11:29, Chen-Yu Tsai wrote:
> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
>>> The DWC3 controller can operate in host mode. It does so with a XHCI
>>> compliant host controller. The XHCI has two downstream ports, one for
>>> HS and one for SS. USB downstream ports start from 1, not 0.
>>
>> Is there something in index 0 we will need to define at some point ?
> 
> On the host side, no. Downstream ports start at 1.
> 
> On the device mode side, I believe the numbers are completely made up.
> 
>> Using 0 as base for numbering in DT isn't incompatible with the USB
>> spec using base 1 for numbering,
> 
> But you end up with diverging numbering schemes, and it diverges
> from other USB controllers, particularly XHCI, which DWC3 embeds.
> 
> And it also differs from the numbering currently used for directly
> connected onboard devices (like hubs), which use or expect the USB
> numbering scheme.
> 
> Sure we can make DWC3 "special", drop inclusion of usb-hcd.yaml,
> and duplicate the section for onboard devices. On Linux, we can
> add some more code to xhci_find_raw_port_number() to make an
> exception for DWC3 controllers.
> 
> Also, usb_of_get_connect_type() is already broken for DWC3 based
> controllers that only describe the HS connection but not the SS
> connection. usb_of_get_connect_type() currently doesn't call
> usb_hcd_find_raw_port_number() so both HS and SS get mapped to port 1,
> which wouldn't be in the DT since HS is currently port@0. But even if
> it did, SS would get mapped to port 2 anyway.
> 
> 
> IMHO having consistent numbering across controller types would be
> better. This avoids making the USB core and hub code deal with more
> exceptions, and also easier to understand and write device trees.

I was in the impression the port number not necessarily reflects
an actual physical numbering, and can be a logical number we would
then map in the kernel.

I don't see any issue here having base 0 for the bindings and then
converting it to base 1 for the XHCI port numbering.

Each controller (Host, Device, OTG) will have it's own numbering anyway,
so using the XHCI numbering only sounds a bad idea TBH.

> 
>>> Reconcile the downstream port numbering with the common USB host
>>> binding, renumbering the downstream port numbers from 0 and 1 to
>>> 1 and 2.
>>>
>>> This is non-backwards compatible, however it won't break current
>>> major implementations:
>>>
>>> - dwc3 "gadget mode" in Linux kernel only requires a connection to be
>>>     present; it doesn't matter which port it is
>>>     - dwc3 "host mode" OF graph connections aren't supported yet [1]
>>> - FreeBSD doesn't use the OF graph for anything
>>> - U-boot doesn't use the OF graph for USB
>>> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
>>>     the OF graph for USB
>>> - coreboot doesn't use the OF graph for anything
>>> - Zephyr doesn't support dwc3
>>> - TF-A doesn't use the OF graph for anything
>>> - EDK2 doesn't support dwc3 and doesn't support OF graph
>>> - OP-TEE doesn't support dwc3 and doesn't support OF graph
>>>
>>> [1] WIP to tie OF graph port node to USB port device
>>>
>>> Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>> It is unclear to me whether the HS/SS numbering is fixed for all dwc3
>>> variants. I checked Allwinner H616 and Rockchip RK3588 and they both
>>> have HS as port 1 and SS as port 2.
>>>
>>> This also doesn't cover a potential "multi-port" DWC3 implementation,
>>> which Qualcomm seems to have.
>>
>> It breaks the current Qualcomm numbering on numerous boards.
> 
> Yes. It breaks _everyone_ using the current numbering in the sense that
> they are no longer valid, but should not affect actual usage.

Older DT are supposed to be working on new kernels, you will break ABI
and will break usage if the port numbering is enforced to enabled embedded
hubs for example.

Neil

> 
> This comment refers to "multiport" controllers from Qualcomm [1], which
> would have ports beyond 1 and 2.
> 
> [1] https://lore.kernel.org/all/20240420044901.884098-8-quic_kriskura@quicinc.com/
> 
> 
>>> ---
>>>    Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> index 6c0b8b653824..4b6304bd2ec1 100644
>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>> @@ -410,11 +410,11 @@ properties:
>>>          property is used.
>>>
>>>        properties:
>>> -      port@0:
>>> +      port@1:
>>>            $ref: /schemas/graph.yaml#/properties/port
>>>            description: High Speed (HS) data bus.
>>>
>>> -      port@1:
>>> +      port@2:
>>>            $ref: /schemas/graph.yaml#/properties/port
>>>            description: Super Speed (SS) data bus.
>>>
>>

