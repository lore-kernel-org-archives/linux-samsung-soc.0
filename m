Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9093D9058
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593279; cv=none; b=XDS0r4PdtN485Wqt/nbiZOWzp4e+Wq5VWcH6tLTK1k2Zy51LEovZ7cJ6EjyuqmyUuRhhQJW2u94gZMvxD6ex/UbbE1cp/ONNG8tzNLKYNxvtgx2x2xUYNtekCVYqRWsPEVSHd+nDjEi3mbi7yxzNVJT3DFX0dlqLhUJ6Mvb8kK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593279; c=relaxed/simple;
	bh=rWDl9l88s5smH4oJB25R8ZD9EUfLZO6b7a2lfjBov+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AavXNGx+5KO5zGb7I0Q2tOJIsMq+FuW0pSwbZH/6RmOBCuRVAPi8n/cgDjImEAc1u0O8L/phMRHABM9SNsuyCZe/IkjB4Bv8WthmzA8InVa4E9McY82v4S8o6U85Bwo4bUIMlPwzOQt+1PaCH+RcGCTNtZOhuil/ERSDjaP2+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D8LqD0xn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D8LqD0xn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso2489325a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593276; x=1778198076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=D8LqD0xnc9crdKqkQYOGFVygUL74sS+0eYjJ8Rl7rskE5tSCfDRh8aofX/IL9lBGGD
         IGDR5PLUWqWaFcjC89BRsdx6X0DXPhkgk/6ILQ6PYkbg91hfvOte+OiLenxynJhk306x
         r/NjY1ikDQjDMpiope0K5ACNK6FsOCKgM7CYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593276; x=1778198076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=dVoOF8wwgDpjOh8p53TYSuSwRwfSqz7MHpK0j02RHTRv11l6fVpELqJQ5610Utoihu
         vUk7FYFlNo8TSm87ucciQkN4fymn+A0vzBZEbeLCK0hk2H7bdLNYifMZja44kpuPcBsb
         O4k8cOVIHvsdOo5yivKwlWuHD6IPbJfISyjYc5ag/SehqxK/eXrU7rnBgvLuSsLHLHiq
         4PZvmPVWqBAXtvqXFSMZa9BiCeHmwCbV9PlMJgKltKyq2DwnZ8sVWVKipeqAGlHExiaD
         BPreQ2jYEQnRaPBOAp2SFrvkJNQLvlhPPNeGaoIEiiHwk7R4Du7e2sXZjuOXrGk8Aawe
         UWRw==
X-Forwarded-Encrypted: i=1; AFNElJ/Dmp1N2llodFlsNhGuC2dRY9JtHbHLbG8j+MIv/XY7Z7x6IZLKiOLR2sjYEWXXnbY4xYPHeshBGk9csdnHI+qyMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/6KXJybbFmlrZ2tESDIonRJQgje8aPD9hyDqr3DKe/QQMVe0
	pTUnrvfkicm98tZimlwKPATdlDNEfdFloXAOyW/+voe96XRX8Puhxr12M106Z6WkgYUB6+Uolhk
	wXe1MzA==
X-Gm-Gg: AeBDietT33YW+fLhO+K1mA3L5xNjsAUQI8XT5P4GhmZiRqHvm0SigQ2i2PMEFcSdYq8
	AmUPyAQvStGSaCQY/HHAylry1LCbpLUGMFFXFp1/VqoJlqIwWyK9QvXKsUJ/5JZQsNkMSXjDWFV
	N0UgA8xX63AOv1w1QKaPKS7iJ2LFVM7D02sJ5H5WxTkCG1NskUhcse2c/MgXym9NJGmy8z2+Uuk
	GK0lJwB6fAqQlIQ05oZ224fj3LMoGA8j433zOGnbl1d2rMx9LsheUV15jWj94QYItO+s1Bdl/Fj
	8ZI6nHkjMP5qlHx4RaisLlApNUxWyHXGBTp0XIOg3+i3+kxO1z3LtdawpDsDnIZMm/jgz3pZcaR
	bPElj52cFX+eAppkrv2VLLrVC6+AYjPxQ0ruvJwmSkJGQ5y6Ji2bZiMvtOQMj60k87uy/6WfQEM
	JmAp0X+eKG95UqTMBrXn/AOXzKOte9gd4IxlkWNa3WNGEBAhgcl7pZ0k9+lpMoODogiIIafRsZ
X-Received: by 2002:a05:6402:360d:b0:671:dffb:f450 with SMTP id 4fb4d7f45d1cf-67b5d7e1dbemr2737173a12.11.1777593276608;
        Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b864f17c9sm435136a12.9.2026.04.30.16.54.36
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449e96a8a80so544015f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98SWJwtLDh/54YyKcaSaNltkp+HdKR/sAb1H9uV47W+GaxoSL3E4Ns+FcZNp027cw/GFECQKWoLNobS+lW31LhUw==@vger.kernel.org
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
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
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
