Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795640665;
	b=SK5Ho9cG6w4HwIJpAGjp0uV9p9UXL+2ID6Ftac7FzQmTQx/Gg2e5PIUxdEtGx8PzJ1Gv
	 y1WK99ykOgxGZFy63sWeEUqgZ9qbCnVL7ND2ZCnZE0sbAYlyU0UUiPNdYeNwTO23U6ZIG
	 WY7SN2VTY+yEGrRYf2Ylh6WWFXIwq++eL/advizypkQgrccz5woMqvKldSYoq+P2POHke
	 noFlZ+qNnMl1lbXzYPR2V8lWZwJWW9zwCc8RdVCv9+ruJ7jXHor8S6ttwnk22Bj/ral+C
	 Xe8C6PicB8UyPFGm+rRetniVXuxtTz7m8e7oAklRDv4GsG/pbQqkBLgaZqQsDDyC9eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
	b=l9tsw4zRpbBNSym7DGOc4a9gGwjnOKDIXbLNDAQNXa6rOzD4hPKqpfhH+qkpdOGlv6IB
	 WC7S9EouWoGvIU6L0mWZMHsBl9HhU3M51VWbV2rOqmITOG0162s+loP2Uavc4nm4fApdp
	 NfS+KrHPic8M1bWki7xu31xWaU1Ni5EHQkG0e9XY8gBlYug3lAVX9XDQuMW5IgmbPgENJ
	 4RPRBrglJXB9ROott/UVTWId7whL0cAro4lCtuzAGM/woyk7t3mZp63hsBHgW1dr+hTWg
	 iWEmFwUFni087FolbXCKpeFPJ6H4rMFIDNMazBrC3S6DCH/Z/830X2Q3Bdt3WtPm/Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tCCn15NC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E262606A31E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 21:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E262606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tCCn15NC
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso7406368a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795640664; cv=none;
        d=google.com; s=arc-20260327;
        b=o3RHRUX0aT99QyJUkJFzEFTrR/C02gEMIw7oUtLP6cIJ+OTu0mtmHvUTad36IoGriJ
         hwgKGDK+e8uojU2HmhB4i6uXvaXgpm1AMYQ2K+7dd0NmYJV9AyE40t8maLExdr1Pc0Zx
         ODqgwGtvR4v4RrLAUqKP/kk8xjKeLgBLKFk3Q/1+YUKozOPdKdsFKbsAxGEc3Co1zZGb
         WgcXHBLivlx4KkRatjaP6VEbCcr5uZlFzHnOxb0nA4wNlhUQrfj0Dk/8i+Cvzv27F495
         qF8liJRHCWzU3RQsp35tROWjZLD9+k5FQ3jBV0FLO6sMAL1HaJXWX420qHZJNxbq4JJL
         nHGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        fh=FL2EdrVDTPtT5OE/DljGe/s9+KmQKaVoVRkCmXoDfF0=;
        b=Xs+RCPgsR9egss86PPjTglz0jRkm8BaVXJmWszoUb0z853BQhKzx3pS24CqfDzcV7R
         l6CXIHD6SCz8ixLCNRMQ+bJryyuZdhG3OjPaFVvupjYm2oifx+HQ6ogmKPcqJbm3kUW1
         ll76Q7L/yro4nIWdASgbT+XASy8AbVLdizg/R7LcweHx/w2Sjy3nakxsLYIxLcCqkGNj
         iK9wkR5rZUU0s8NQrl52XZK7qoGpspSVY/YihZlTiDdtbtcNLVcBA5TWSgf97vuOyRs9
         RZLKdNukjIuPYakebTQFH6881RaNRI0ZSUPWDm/kmGeOnySTcgGqZmyDxa5yQqRHpLAd
         zGXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795640664; x=1796245464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=tCCn15NCr6B2s9h+dyEIhTKGSEflko+n1w04t5bIriAO1IiieN2gSHg4HV/WEl8n/n
         skh/ncZgrssBgOFYKeg6/d1gqPkQ+VBgVEG/t2TuVmvnrdFK80K40DCRzylsB0yBptCm
         V0MKB1Dme+IWbdkFs3CtcbbOj20PlcP3As7bsHwvAQD9goiLsN53yAcBR+OscqGBBrTj
         8qeE+Zqh/Nqhm1nMzruqVFpfGBAp5IBQLBIbqiV2731/Ihk1h93G0CVEpeVMmljB/1xX
         TYB0fIb5FrlJVeTKex+6oDGPwnRB9RWtA5t3Vs0ATeF0EMW0RKniAXkORt6y9Vz3uezV
         iYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640664; x=1796245464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAVSepPFXDVnDs0KIr6D847y94ZRdB5eQ9a+FnzieW4=;
        b=XPrpZvSQ1NooRrS1p22OAnyefP8+I1SMM5b3VSBvaNCi5XgXVnb+Q/s8r4CrTN4XXh
         L614wqV6PBpxTWJ6U0uVVkm3A+rfZt8wvVYG5RmGWfLDR4sFzfX627IrLFDawQK+nSiP
         EMF2xMUiIgAKwsD0Li9QqmOmP/8ObKkOvga/4RzQhnL6zw0EfzRgA4ZqNV3w1jDQzUD0
         eMFJacu3Pi5806seRsn/AdqexMJrsj8x8c3Wzc7A5OZRVRja1g5plbxm3Ll7p2uJ/YHD
         vXgIjroCt0bt/YXy9/9RNIYTGv6rwoOQUxqbQT7xDb5phCXchZBABy+8XNOpDdMPHiZO
         trlw==
X-Forwarded-Encrypted: i=1; AL+hErHKv0vwuBjL0zS7QJIqg3x0No/ThungWnzVIStW+dI3QFoPTA3cEREdwATbWZRewYqQqF3yvSyY6iVppDdJXkWxHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OkMZEH5/zkH0c/GQWaxUEILGDsya/eNXBoUSEdr8PU1ur7BFa
	rvzJQRYbMkTj71LqJEvoXZGmcgUDp8SMv0rY+MOuXeD6mGcR5qR4ztOtPBsiGHflk2UXZspmqXf
	biScVJboSuPsjEjVgjE2P+cSVUWf+gFQdjK/PLd/C2Q==
X-Gm-Gg: AZFdTZdLlIX9i6HbpGajbSAksUIKOtbPVODUyiE7WbonVIiEmYwJUvNqcfJr4Aox/2q
	Q/ptcK+6Rf9Q3Qs2aWshqyFwjqatqrHdEK1aXNrer8k3y/vul67BFnIy0NJT0HxDt43Inr8d3e4
	WLQbXPwM51U5pbxKAfib5EFOOuFD61tEz8s3WL05eDWADn9lqlLgUhPAss4U02Fq3oIAqwIPPU9
	wjVZ9EW3v9ZXycihyVl39imCATXSCsXgn+B8/M74Q6eH6hM9UVevJd5muGut4MxZW3058sG0JEh
	z0p8IqCn1w3DNRa3BMm8fJO6cVTY1t1G5FSX2bd29SS5sHjT/XbM8OZJCJgM1RETk0t0/jbIEWx
	WYoBoac1OYv7m9I4vni4NpRRMLTTKXQalbKbiet5zegd+jrbLs550lQdxeX/20jnggr8D/us=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr10360793a12.6.1795640663702; Wed, 25 Nov 2026
 13:04:23 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org> <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-2-3361fa5f7543@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 25 Nov 2026 21:04:11 +0000
X-Gm-Features: Aa3M54oVBZq5tOYyeoj6arLLradCyxNln2xhQ16gdyoLzIDJohPkD6NVk6Xh8SE
Message-ID: <CADrjBPpE+2n1Y=02Ayz8i8guJ58XBzdG5zVdLJW5ZhQQKiNmNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: exynos5-usbdrd: apply gs101 postlock tuning
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, RD Babiera <rdbabiera@google.com>, 
	Juan Yescas <jyescas@google.com>, kernel-team@android.com, phone-devel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 at 14:25, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Phy tunings to be applied after lock are never applied on gs101.
>
> On gs101, gs101_tunes_pipe3_postlock[] disables the high-speed squelch
> detector when in P3 / U3 to save some power. In U3 (USB3 suspend) there
> is no SuperSpeed data traffic to detect, and link wakeup uses LFPS
> through a separate low-frequency detector. Disabling the high-speed RX
> squelch detector in U3 avoids keeping it powered while the link is
> suspended.
>
> Apply PTS_PIPE3_POSTLOCK once the PLL and the CDR have locked.
>
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index ccaf0f27c4c8..f647688c3bfb 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1745,6 +1745,8 @@ static int exynos5_usbdrd_gs101_pipe3_init(struct e=
xynos5_usbdrd_phy *phy_drd)
>         if (ret)
>                 return ret;
>
> +       exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTLOCK);
> +
>         /*
>          * Set this while still holding phy_mutex, so that the orientatio=
n
>          * switch callback can't miss an orientation change.
>
> --
> 2.56.1.750.gf70dc682cf-goog
>
