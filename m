Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D9537C0FE
	for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436279; cv=pass; b=Xc89x2+JnvdcI/BDzu1YCP/+Qt5PVP6Tc+sVJmwgMycV3OtVK7i6YK8i9tnuaPlDUSK50jbPqw5vPnn48U2w/BfKz28L/XbhudB6zfBrb2dzlpJVhJRzeQAWgVBWEt3HShKeFQ17M8rDADtOD+Cfx3v/AMBZQojyYNJFk4m0rY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436279; c=relaxed/simple;
	bh=AzwVlyIqYxfmPExGHlhzDdBcn2kCaAcRsyV/IiibDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9eNh448iFY17Psav4pPZ1vmPF8VnrMTqmyjE/HCAbXap6WZkxQFNRxSgHB4j1KC4962iueoqaMF33RIEZ4IuNF+em7G9IdEe3VGqiEgrV9hMJty1Ug+PULERP1SOvHYufLk+gTsR1gvOwC49kGrpv+XYVdhe/HAh/+w+lQjj2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOYbthWP; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOYbthWP"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so10534083e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxDbvqs1jFoKltOLfNQ76D44kuRQs8wG8Rn6JAYyllGzcNIrzgltb5PbsVDxRCE1+Y
         4Iw4zx786nk5zThYMnrVGvE0bCxZB2dJf2eKax9gurJSPqrEjlUXn41Vj0lg9G+ecMTw
         y9LpZ4xayPtimXIdlgbfnZTwqpJDq5D5gT+dSs+v545FR8ohZ2vbl2FMgoetm0FOldfc
         5xufhhxV7L1ZjwfSJuDOE71fbJPq7C5FdUiExBE4R8B85HBVMpAOZ9OEvlSStY6W2VQj
         xd+cQq2XlMm5yaScqXW37G9Wc2N/6W7dl7XxX4ftx0JjlW2f95s8mwEiHDZQlcRdPmyP
         dTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=9aFcqGa685CKtTEYUfxGGU4Nhl0uiakm1QEWCFFJTVs=;
        b=es70Rj0jxS9hF4zNjLiSVQ3ySl3t3oQfptzMZNckZWH+1q7I2y1LO9HCSyAjplFhF3
         1wA/5opUFODehGGT7EAR2frz7HS2gTtSjEkt19UBnocYOvYXswWq+MdbjUhhGvwReSzm
         rL8+tpEyi/OqI9IYjy0DCTePdNqiH1EghgaxrPNjra1nIXJQs+DRrJ3yvvZJpGAsS3Q0
         7XZJe4Mdke4wJF5+XcoFCP2K53IVh0JcR6NtUfJCd3y5DKl5W0dssTrCSE9c3vXJUNCS
         yWkqEPrhQyW6Pwhq8qPo+AKfHKmARFZhZax+FsOFLS3Wn1PtxzkaqnvaHBBhT1nxsPE+
         EB8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=FOYbthWPP8lZx5mA4McOSfJeVR0BRGPHdmtlgr+cFqDyaIit578GgtZp31cw0VznxH
         wKUndv8E0Ym7rLT/XDgblyvzj9usFKBf1rj3kFh+mLXvelnaKsP7iTgtAULRzrmny72b
         FRk3AuvUtX08mGI610FMukA4zPRDmNgO5zMjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=Svrg/42CltcZpSyZcseMEgQWrDMoyZS5Qz1Y4aYk+PzPkxVVME5bG4yjWYpD0AQowQ
         +I4cVJPOG+LgO5VBjI1Vnvags5xD1T+4HSdazuSWJr9KKjQECcxhiYsGjINGVs8rYLAp
         +RQBwcRH1zzOPZ8KPAxosW+YT3sObnS1FDtGpFjU7wP3HuNbXxfEqu+CCNF4RkUIOYKv
         AYS6BNWPoe1oVRc6n5B+8Jq1CyZ8O8DtOwItKtf/KcGoWZsacB72HjUe7is1r1hozbKk
         xIlLkqHTYVScLBXhKwhHUhYxr7MBTb6x7WBNSCnHTJXQrCS33ciWm8sJ5/3E3kgtiAIs
         1RSg==
X-Forwarded-Encrypted: i=1; AFNElJ+Lttsd7fWnamNzj3bxLBioswShRUJPivOzeou250PjVcgx97MDmAel4+I+5sUst1GcKMmau8kitcrJy4Ur5hxZJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0hJAsYXYMsrEbBs8FOs4A8yoG5OAZVcfIiuCN7ZGGg/Y2FZpt
	rt482hat+mwqi32ln7BsREVZbZ2j2tH9WSDrv5e2S3lKByZCZi0oMTJZa2D6Fp1agCRN3JHS6o/
	bIY4Gx4xess59tUwELs4yBBa8yjkLVTMKa5LiL+9z
X-Gm-Gg: AeBDieswax0yJO2uSPRvtjw7S1KVSuubvWeTtMOw/Z9/UjyeU53FGa7yIhOL7JYna3Y
	SYRj/s8hyFk78ssVfD86ez5+F0JxQj5aEBX90pP4HyqSZ3cVgDMlxekY9IgNg+JwKjy9ceTtCNA
	84JTeXCu15jtW6DUcEHAInIHcHOZyz7zuHMtdmsco3Ve4WNV4wJg9sTEh290cLsPduzbyMrWfvt
	kNsTtJxpwJ1IMioSrnOmp3g7C/HDeMB1f+MdvFjb+hCd1vI3RdYVLsDKFpOXDebr3puLYRRKXrA
	ZukMkDWO4jzE4+FBCw==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
