Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469712C465;
	Fri, 16 Aug 2024 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723795067; cv=none; b=ErhzussS7r+vLMK5p87HcIN4F1FEL6/2Xnk9kgXr3prCA9sYcRHu15te+6L2nP/IIoakajh8wiw+gs+09xjQZ57v8JOfVfR0pFGXk9bJhi8P0BNEgfcuSp+dgvx2F8DQr/qTd0Uxgd41EgG01Mu+ccb2zLHbTVWmREj3HjqhtaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723795067; c=relaxed/simple;
	bh=G2jlt/Zahw0uvrixwlEmuFXlOjRYk/7lnomRN/YsPXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGC3JivvGIP49rv0+L/+mcWCaLlezD9kF/KawlvP2z3L7WMPfOMwv6EutTkwbNICmhzH6Hce9INF3TUgbcBGMZn8b7danMC/pl/1MOJiKueAAT+EblNfEqoYHxjyViVcm+nMsDhB7WdAQfLNRlXkzzT8GKrG2wPbBIP8zU/BhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1XR5SrA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1XR5SrA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so12131835e9.2;
        Fri, 16 Aug 2024 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723795064; x=1724399864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hpKq9oPj8Y9788s3d9UlaZGkOn+HemVqrY+6SPwvT8=;
        b=f1XR5SrAARb0vevCMsfMTiYW3uAcFQ+tOUx0vh4JMe1ia+SJKQaVf4kMCzc1MKMysv
         WgwJDhr+KA4qQKnGRfGchC9E4gm+fU5giRCZiF8nLgFDh/T7T1t2O5y1BcfXWNG0vljD
         FlBlRwJd9Eoubey6rTScGI4LmZk/Z8h4bCmjP+GSG6QrBaOUlyIOJd4EYEcs+8Y/3v1x
         zGcWl3l5KFJHSFq2oXmGN/+PYQHGa0O43sQ+q58FhIDnQUp3T8E3pMoaE5QcYPqTcKjP
         +Ypd6tpzjP75d7a3awng93gS3pnBI1cIiwOoClrvfaksc5vppf7czKNZF/unQpLujUy/
         VZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723795064; x=1724399864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hpKq9oPj8Y9788s3d9UlaZGkOn+HemVqrY+6SPwvT8=;
        b=XVRIHJgGa1Wa7sND2ViKfB7N4N9JTMiSnddpR9LAs+iXTpUK1cNWNEx0z/Krvl80Xc
         wGgo1mUuixMRYNHkGMto+LqdS1I3LVjEoxSrjwTjpfow2DOCb4vgcqIlgdXCFntpH4D5
         Rn+HcG8Io1WyjUHBzlrpWHkMsXLQWAQ/4MJoepGmR2ZLTHeJ36sLoWXzIfNfXs7S5C4y
         sctx064YDeZCwTVl6TFRYqx8j8lBDPbOEJxIzsD5CUW0DQfhov+btgQXpa0p6ONMWiij
         mORXARD324kWGIw6/tgvc75Cq5ypHWIi98GA2lsDLcaUEIxAbfx3jvdMWcTllGIXw11M
         6zFA==
X-Forwarded-Encrypted: i=1; AJvYcCVsB9+MemBkUa00JjuJjg5tMOvfPoG7DAxCPMvDmsii00/Cf/3r1FKEdOALXZ6uWffrByPgUWsm+2zKx1FXurrHwJdSpr5QOZHKnTrZeZFYUSK6QkbswMTuwquXDx77DwsV5DoyGGzAtJWWbfySs7mTXOdYZIDssKaFOiExKlkiF44jiDHzlmhaNH2WyA==
X-Gm-Message-State: AOJu0YwvDphb9pgP+BaT+NARhU8eVVDIZ3XUptrID79ikwkHQKYUXMzG
	KHkJ3Kaiu33ptoNLxXCZrLBZIXyFzi8a2RCsFLcEqW6LMA7DbAKG
X-Google-Smtp-Source: AGHT+IFkYuIDGhTHJIU5UPzFH2tdVmRDBc3T9L7x3l6nhQIU5VxzrBn2oDAa71sjqZDhgmvmU0RlLw==
X-Received: by 2002:a05:600c:1e0c:b0:426:6f17:531 with SMTP id 5b1f17b1804b1-429ed79dda1mr13171385e9.13.1723795063630;
        Fri, 16 Aug 2024 00:57:43 -0700 (PDT)
Received: from [192.168.252.55] ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898abf2csm3022392f8f.107.2024.08.16.00.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 00:57:43 -0700 (PDT)
Message-ID: <8513b07f-ed64-497e-9881-3666983154ae@gmail.com>
Date: Fri, 16 Aug 2024 09:57:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/6] ASoC: dt-bindings: midas-audio: Declare
 required properties for GPIO jack det
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
 <20240816-midas-audio-tab3-v2-1-48ee7f2293b3@gmail.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20240816-midas-audio-tab3-v2-1-48ee7f2293b3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.08.2024 09:50, Artur Weber wrote:
> GPIO jack detection requires an IIO channel and the detection threshold
> to work. Explicitly declare the requirement in DT schema.
> 
> Fixes: 0a590ecc672a ("ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection")

Sorry, looks like the Reviewed-by tag from Rob Herring[1] didn't apply:

 > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Best regards
Artur

[1] 
https://lore.kernel.org/all/172235554875.1349313.9208770866983277057.robh@kernel.org/

> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v2:
> - Use anyOf instead of oneOf in headset-detect-gpios/headset-key-gpios
>    if: statement
> ---
>   .../bindings/sound/samsung,midas-audio.yaml        | 29 +++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> index 69ddfd4afdcd..5483421a6fd3 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> @@ -9,9 +9,6 @@ title: Samsung Midas audio complex with WM1811 codec
>   maintainers:
>     - Sylwester Nawrocki <s.nawrocki@samsung.com>
>   
> -allOf:
> -  - $ref: sound-card-common.yaml#
> -
>   properties:
>     compatible:
>       const: samsung,midas-audio
> @@ -102,6 +99,32 @@ required:
>     - mic-bias-supply
>     - submic-bias-supply
>   
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +  - if:
> +      anyOf:
> +        - required: [ headset-detect-gpios ]
> +        - required: [ headset-key-gpios ]
> +    then:
> +      required:
> +        - io-channels
> +        - io-channel-names
> +
> +  - if:
> +      required:
> +        - headset-detect-gpios
> +    then:
> +      required:
> +        - samsung,headset-4pole-threshold-microvolt
> +
> +  - if:
> +      required:
> +        - headset-key-gpios
> +    then:
> +      required:
> +        - samsung,headset-button-threshold-microvolt
> +
>   unevaluatedProperties: false
>   
>   examples:
> 

