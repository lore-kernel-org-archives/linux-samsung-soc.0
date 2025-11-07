Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E072F746D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Nov 2025 03:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486787; cv=none; b=VsjbcemUeHEtCK8kVvd49vJr+M4mXxpBoUu/uS4y+HDDMnjdqnH2VRc+5H4T3D2rFNXp83ksnBlkoqKyOB+rLzJAgrhQbeE+eZFwtVNodNyjJED5xgPiXoA/3mn7i1LLhGuZusAM+AxOG+lHVL3UgZhnrp3hzUG/t7ndd58BI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486787; c=relaxed/simple;
	bh=hYOeoqXmSEIDHI78r81gIByIxvqycJsoQtqBa4+ZRmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkEDSCpxg985GPHS+hpZnVTLbV82llNR7nMi0UmmYWyrhVPOk/4Aw7MNw3llGVfhoRBSxEsBUOlPQuvor2wsQmQqLIxOnJutJIAAWx55xT8bsLe6+P/S3fdQDNov0BprOxaz7zKmN66LSYzaF8meTlpHZN78zs5Wp4CcXa6ujaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WJ8yOBBr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WJ8yOBBr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429c7869704so231087f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Nov 2025 19:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762486783; x=1763091583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbO2nTB7Qh4Qw6JsJr6W4VgsgC2mZidOm7iZWG0m/78=;
        b=WJ8yOBBrnDqu6KHDZuK5drza3tRu8dVg+rG/hNmICmNCO7dTU5mxoekLGBCanXKqVt
         dSssoBFTwMGKUoUKMAGKrzfW/qD26TU6CIRYw8s2Xm53rOzoCJLFhf7208RpAbVq3Uzb
         cwO94UjgK45X3edusQNOkkrHHC7VKWhpPQ/Qvozd0/llLpABPdrZyVy3tyB4rmF3F81I
         TOAeyf07UQl1kRyjW8xINXC62Vd/Buimph0xroSV8A/9rK3JoTWB4ohfDTqAw+RiSP7N
         ZiExonkST1QmcySFfAUIqUBStH2YZIzTpM1eW5j9ID+bgOwoHCqRgf8CF3qr4R/aPvs/
         PYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762486783; x=1763091583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbO2nTB7Qh4Qw6JsJr6W4VgsgC2mZidOm7iZWG0m/78=;
        b=DbsRe2YWj8muFvcw7w//7SrvATItU9mgFDe6M9NK9LLd1P+r2y7e47MkbPcIAq8WVP
         OqCivDdWkJKLyNsEZE9kb/s7Bt7oZnLETLJkxBgVfUwbtwTvfQFaSakx9S6oCELAk9hl
         52fcwyTOehaMmOsnLi4lfYVAMXhRudpCq36QMZ4YqA43ceR83jSvm8rp/hUGPFpH0IhP
         gf/WRR6gPT5K8u7J3BrNPsHzQcNMLBtPtsEk8t+jSdd0xBteVoxNrwcev+LxxE3BHpi5
         K1AA3jt/n1ob5IYt+GWQv+YEJqm8ke0gQjvNobm9C+aDRKKBRcISZ41EtBd9OPzi4zkN
         B8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXNL47UlU2r8KulbS95Cpm4m1EphUs605/CzC1cWYek82pI5TPjw8aXLrwoka7thH7s+p8BI/2Tu9TvM937xFv1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnk0ZZZFiRM08kIVeK6A9U3sSSGW+MVzq7zyMyXL47FEX9yjt
	zUjIk44XTrdriqqhuk127KW5jypRssmF2lEf5KnmGGL/oOfAFItGPYgb4JlB2vtHWWsfBYRZ0lp
	KuusR/YcvuLn1ix4nkesVqIKE/Bkglr07GXjmgPT5
X-Gm-Gg: ASbGncuqlJtl85vxInFyAz8Se32rWWuMFLC2Hf5KTHHavMLFgx9p02UDPsWOJbiUMg7
	nmlp18jWP838YD4Kd7i5VGWPYd8ZETOQjS+v6/J9Fmx4zs8o2wSum0LdR8YYdtW3bb1Zqi/WYxd
	VQhZ6l/jnVV2969MNWYBjGEW/i5xkku/mea44WlCGWWXizHy/W8BGvdIO4U83WTKagCr4nkNW2q
	rpcqKKnhjtUXNQyTUE5iNfo1d21hWa1dVCFkskC9J760v62KAD+h8+9BGQYMqMdD7+UWXJde0PS
	0m7QO64oyQsoA14/EiV+w1CC
X-Google-Smtp-Source: AGHT+IGEh7IhvQg+TrDD6zZjcWzRpXTsExEgfoQszOkKmBt1xXGm8ca7e3AYQMZfs4zZsYumxirBfUxPg23Zvt75ckw=
X-Received: by 2002:a05:6000:240a:b0:429:d6dc:ae2f with SMTP id
 ffacd0b85a97d-42ae5ac513dmr1043717f8f.31.1762486783011; Thu, 06 Nov 2025
 19:39:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com> <20251029214032.3175261-2-royluo@google.com>
In-Reply-To: <20251029214032.3175261-2-royluo@google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 6 Nov 2025 19:39:31 -0800
X-Gm-Features: AWmQ_bk0tg9nfbEFrAczn7gf3WHlPnE4d6lMh6R1gsb1gSV599Sr46OpKQ3eUsM
Message-ID: <CAD=FV=VYOD=33secA=2ozE8EO6Z_Wi_ZjiDMov5oP8Z42JytAg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 29, 2025 at 2:40=E2=80=AFPM Roy Luo <royluo@google.com> wrote:
>
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
>
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-=
phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..8a590036fbac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) USB PHY
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the USB PHY interfaces integrated with the DWC3 USB controll=
er on
> +  Google Tensor SoCs, starting with the G5 generation.
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 =
PHY IP
> +  and USB 3.2/DisplayPort combo PHY IP.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy

FWIW, we've had some rather heated bikeshedding at Google about the
use of "gs5" to refer to this processor.

* The processor is almost exclusively referred to as "lga" in code at Googl=
e.

* The processor's code name is "laguna".

* Nobody is aware of the processor being referred to as "gs5"
internally. Though this is the 5th Google Silicon ("GS") processor, so
it makes some sense, "gs5" is not really an official name for it. At
least one person pointed to the fact that it's a tad bit confusing
that the first generation Tensor processor is called "gs101" upstream
and the fifth generation is called "gs5".

* Some folks proposed "gs501" to match the "gs101, gs201, ..." trend.
The first two Tensor processors were definitely called "gs101" and
"gs201" and the next two were referred to as "gs301" and "gs401" in
some internal docs, though this was discouraged. The processor in
Pixel 10 was never called "gs501" internally as far as I can tell.


In any case, it's a bit of a mess. The straw poll I took seemed to
land on "lga" being the preferred name to continue to refer to this
processor in upstream code. Would it be possible to change from "gs5"
to "lga" here? The "laguna" code name for this processor is well known
publicly and it's generally quite common to refer to processors (and
boards) by their codenames, since codenames are often available sooner
than marketing names and also less likely to change. Indeed, I was
even CCed on a change recently where there were plans to move away
from a processor ID and back to a codename [1].


[1] http://lore.kernel.org/r/20251030-rename-dts-2-v1-2-80c0b81c4d77@oss.qu=
alcomm.com
