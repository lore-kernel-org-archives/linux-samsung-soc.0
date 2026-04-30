Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03F3D8112
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593304; cv=none; b=c9GVH11CS37yNGUFm8xrhlmRQezwbeuKIF00hK5B0mTG17C0mMCcEayvZ5iiph/2lYsH3vYMnwo9i79hU9wm0MjUMjy3xqYsHD3bxRHvufEU1Jq8JN6MtaOTuoiIVrAYVIBQS4glP89EqJACfnA0J0TJtXGJcBosmzPuOSQA3U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593304; c=relaxed/simple;
	bh=1iYFrQZWmKEVWrScCekgHrk90TTezLU+zo9EhcJOGkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvhMoBd7j1g8UEPLvzGRlVxhFQK+YyEFkBE78j2sieCCRc9jM7EPblYmRGn620q/P27lKjS0hnSukRkSqXli+jMgze4c8gyXIyxQ4X+uoPZVFmr8WVj4WfT0ul3ONpgS9bJRlWopKq/tyYbu48GpInLQ6wdywqd1xgleP2XKSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NSO6IgPh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NSO6IgPh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so258568566b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593301; x=1778198101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=NSO6IgPhiDYhbuyBu0gx+tkzDhj1TZqIeuN+KGhq+F1vHIkadEiV7SMzaklhjCpbal
         vLYXY1qHDdkyeaydNePk8KzyY4S6uODkiawtqHqRjFjMzhfzx+a2mh7R7O2mD7/9q4U9
         feyT4J/KqT24Z0VV47x8ZWzr/PDZA/ISwp3yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593301; x=1778198101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=hisVCBM1y2uTPB2qxPdAabvD9viKqeKWQIUFF4/kOzzjRNwd/ZyyWAFsMapOMHoP32
         OWQuICQHd6QdUPTbU9vETHobfrQxtL3aCYxo58zwhZtHIYEio/k8iT1dS7RVTmT2psRm
         diag+U8YVV3XdvtmHEvqY3VUsKKJOLxIX/cp7a40WWa+5OvaVYRCUF6uU97SM4lFog1T
         mQ0VileifAKPMKWpUuHgTlZOd3mnZNsGFLBvSGdYqEqFB/nQjhnN9Q80VGcCscpkz3OM
         n6xqhGXVgSrSfNGJOd1uRaObGSFdKZyzk+n+1ZU8E6JM5b8nOh2WuoHsmkhXMqZ4IVzR
         76ww==
X-Forwarded-Encrypted: i=1; AFNElJ9LutzB0MQ3qcwVPhO1ztK3LqRAT5B0JfFVNgRUqJnh6VZ/4qce1kkoxG4vnSC6ltz0ug9SaOQpo0K5ZVNsg12nyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNW0DlV4xC4caoLkfM/iASnUDqPNSkmJQCpP0FvhGK/uMt6TO9
	budDbw8OkdIT9DDbC3f3/mD6Pn9ACQQ7zv6YyO9hFs0To0yx821D2Mp/XGc4Vz1YpIk/slXoODA
	UUPAWzg==
X-Gm-Gg: AeBDiev1DBDBLjSo9BPJMvB31tXmV63z4WBe7ON03feR9MzNaweC4EC2wqhfIVqnPcZ
	eY/0i6KHlLbaZc0zang9KQKIMMCQcRfh1vQGDZuf0K9x2ipLF3OR7hpUfJXo+6euvGBRprN3jGp
	BRLkTB6SkB4lCEFmv0ea1nTvbF+rMElmvveaYcK68+zgu2gJJFamyFG+i4ETT7pRxn7mv2Uynk6
	3oqgogywsXj/fKUzRyhkGRthp0qbKfHik6BIGvimwHKkJBdCo71dYCeU4gBJVGVee7X6JW2ayhQ
	sOolxxD/eeOCGbiu8GStjKVex9DjWX9u7xBdv9ButyoP8Xtxn4YQybG/KYGS/LO6yUh824ar1LY
	cUDERrfZiDmotec5LjYAuTYcaFpOCl37hXST6THdchKA43qtPX5xtuBCJ1vkxxhDiDHBi/CavF7
	hQ/XPmDiakOuTxQaZgRvyQp+GR0/C+yvwKgIOvreJBqA+mAKBXpPZAijElDr1un5fioa5G/BPz
X-Received: by 2002:a17:907:869e:b0:ba5:9407:92 with SMTP id a640c23a62f3a-bbac49d2422mr336677166b.4.1777593301413;
        Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6df5c492sm47302666b.61.2026.04.30.16.55.01
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so14128215e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pP25rxYxp5juxFs2gdGsz83PegtCSuUL8pUvhdwUwylEk6VtUN8VBqiAtDkcYPw9tFS7yuCy9DjJ4Mgs/XYMHpw==@vger.kernel.org
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
