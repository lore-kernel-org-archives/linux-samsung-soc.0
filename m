Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41353D904E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593328; cv=none; b=E60rrOHju3XOeb971aWAIIRTiIZoPJJvb6kX9+sADHiRpG3mf7Nn7rHo3wSGpqEovGEiTwYb92WHVYACbsPMs5PdtZuahkF9xTVzM2wyCTuMQEbAfJvYRy3Lj5poEXeWGtoQh2f8L2tltWav2bJoRG88ExWwpnCvAi3WW0FtLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593328; c=relaxed/simple;
	bh=Po793qEB14FDeszlUgfCZzMNPlO0hdsx5m4i9+Am1UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxDfk3/kyT9sdFkODjflwuJ7IxcazD/9vpJj1OyE0bgztMbQwDpwIk1fl9PnjRGTsdLlp++GfaBCIf5X0uudU1Nh7NjEaJ7X3Qe6cFOCHSR0flNQSzeZARTcciNZYkvu2WHxN9cmw3K4qcYBzULCIO+SD47dCiywTH7he12ADr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fxc8L1vJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fxc8L1vJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bbe539fc355so74378366b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593321; x=1778198121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=Fxc8L1vJCdJ+LRGBO4f1Bbe2rWFWknWsNwOd4lXGbBy7dglOxdZweuyfxykRAIzHBs
         2KfkSfIVfe1belwzx4YvHSPEumrz0TAhzKzeItSiRxJXVs2tUC3CY12P1eijl567ah9w
         22R7zEPWSoQz4BXVD40JGI31wbtxKE88Mxq/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593321; x=1778198121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=ZXr7mnS875ym9e1cs0JehJ1m0V/WlaGvMa8QIfX+Qex4AY7BWelcHBCaS+7w8ZXgW4
         kM1LZCNamfHi/O/5ZnK6ekk+glbGA7Nus427Oa0iNIb1lRnxgi6DQ+sakWQAFhmnDhYP
         BQ+ynGnBCNCGVZQfDDtc505xXBhRG52ZCOVresboykcSpc91Nvh+HxxKElrm+q29IgBv
         aOSfE3qhQuGdAUUqIHf0PIWhJAo4N2NcraUi6MOaMdDNyQkEynrB50ApAAYPXavSR5+G
         0h3LyAF1gebZvqgJPeC+Kn06PSOT66+/8Aos+z74CRmvNH8rn2r0vpAJQOgNWNC3Zwxd
         TGRA==
X-Forwarded-Encrypted: i=1; AFNElJ/jLLWz4VHedmWJCMDcxN2f+lr/m/6/hbH5BJGujwjXZZ+nE4St9z3m68FvPDJBJOoz5P7XAbWN07Srxq6c22aytw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTM2m13mEVoy6wqGq+GgYiNtSwKgXfelYajOxJe4tfeGJ440rY
	hqTwgXujRVX6Ejdv7f/1q1hQlbHb6i+YFgTLfkiYaPjWmW6MsYI3X2iyj6B5khq3WoLvBAmQb0w
	Q8HxLTA==
X-Gm-Gg: AeBDiesGnKyWhniSDCW5fjDiNHMCGm3bhTTidG289mNOq1VDskyjkfbc5vu9O5MznY9
	LtSDwBt8bM4REoPHEo/3aUFNuM0D/5h91H87R+q5fkUZNY8byho0a0+/JexsXcPgCRkAzXU6lfX
	Ibmb7jKJmxGsZJfZrbAS9cryI3NdNPNbvf/vX0FrZxZ/NHYidO1J5DVDNiBfyyer5324owFaT/w
	TJICtGnILn8X1MyO9W3Xta14qJcfOyjfZVUFNVYSa9GZiiRXdGzLZCffex86nwJFTYeapUeoK62
	p9bf++Y7yK2pO3UgEQKx4lAzKG5YUSDTr0iZMWxWIbJBD33nKUX3wqGgk5T0FpDKfAweEZ2Mo3V
	dnA4dPorQXiC1vnKRvHFjiPJsjcnFOxUgemI4mwRbspgO3Q84n6SwKRf5yBMxBFyCkgeBQcXaTS
	R8QMEp2JZZoM4Vb/FPr2izCTj73X1aSdRGpwmsMnLGlYYRteupDtD4etx0ZTPZno7oPb9Gwiudv
	GfgQsKruLI=
X-Received: by 2002:a17:907:86a0:b0:ba9:559:10c8 with SMTP id a640c23a62f3a-bbec16ccdeamr33539366b.41.1777593321082;
        Thu, 30 Apr 2026 16:55:21 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d070053sm48613666b.39.2026.04.30.16.55.19
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:55:20 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so793457f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tBqm20J8jNgfl1EJWGRJxo+YkhADomBbLXefkBsCFinnxBEovYnF1X1UAhioiGPmBnBPWrmoFxO6I5reQy4Gm2g==@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
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
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
