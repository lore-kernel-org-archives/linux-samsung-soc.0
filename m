Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE823DA5AD
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593285; cv=none; b=fXsLGNQYN2cdo2nBysr+68HuSY5EEynQ3V5GYdn6B85PUfXQZXDtzbPSh1FDN+9592tC96KkTJj4fGiSAZqIY+/q4TMxrW3On9B6IOyFHtziQwJMmZG4QWCe0KuRvquLU+hhZaZcNpikJvrzq+vjv5JJmCcZ1otZbmG1ue+3zeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593285; c=relaxed/simple;
	bh=E5GkC4G7rtGBz2MILCU8/hEbtGwGymi8oc5Ct4p7lLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDa1s/m4moaWjf0pYhbUkJ92PwFcIaARaWmGxnSNqDvfEWcA+IHDSftbWokf/kwtvyG+xPplClFAGvvn+r31Vh31zYpOImgtadpkeI6ZXafo6Dim5iSjbLfP667evfrRTWUoe0cVdqXL+17bT1295PSR2RDg3HUt1I3+TCiafFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JbBRMoK8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbBRMoK8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9358dd7f79so243756266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593282; x=1778198082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=JbBRMoK82UA6lkh1qIVCEcIyzIL5yv6sqJQvgB8tGR+pm6zNvREotpEuwvh5/8RwN/
         uKk5/okyippAVJEpn5PU4YgQ3vXtLXRFwbfLogm9DTP94A5v/8QUbtsJq74xaRbfYqfA
         7RtfQfESg0r8s0/dyNDe/GvsGQDjfBatJYsrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593282; x=1778198082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=TyJKrriaIWH+d4qzYR+R6Nis5t4ifXjpD6SBtULf1wwO+pdTHHsaFAN3iChQR5W4k/
         cekRAvT52P2ulVE3vWe/6gJGyKQCYOPlWeUjbJqLVWDnPwETvGYTxUDmfgqOvk9hoNax
         vYe44Td6fmM5l4QjydoERAN+HBQFsgMvUoeUmMAR3XWXQJNWIEE37OtYK09cCSsogybO
         TW3R0bTqEjp8XGqD/wZW66gBPmimnpxdyK0zQBPdwQccN+QIg1J00yyEc587Ud+4+PuU
         LzASev5OGajqEhskNfc3moqmFydxh4Nd/YAB2IU7BWZIw2T2n6GurPiy7A15SZ8U/JIa
         GmUg==
X-Forwarded-Encrypted: i=1; AFNElJ+7eukGicz0rS6/blR0hA7P6ZRqpeErBTpkTHNp57YeYJVl/U9VMO2CZocS3f7LfBUkn0Ens3CZ4bXr6RxZQ29tKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW08GO03IdKKMAd8TLD2hGdlGLbCUMDwgXy7jlwTgshR+mODLz
	SMygyzIdB9fpJkgXK6SH8lVaQ7zUa35+ZgSVwTtk9UebgY4qycsJCNrZZpDtJd5C5j6zA08QjH3
	fwRHLcw==
X-Gm-Gg: AeBDiev2tn7yC9YM1+kKAD01zrg4SBJBME42SvwHyvSCRj+zt7hAJLD4EGQh0sxbwSV
	YCjDy1F6aGictpakigdjjUffNRc+b32uYCkZv6G8MP+IKPJxDkjsTid2RImkr+mVkElViVFzk4n
	c1eF8xedJWHBTT87Jm7AR8gSZjyT4IwxxWwCNQ1oQSrhl7bKd1gD9dANzsMy3oeJ7Y6jkwZKRhq
	9gVURED3uub0iqoWKCsv8GOyJRRfd/zOYMHo8jwNJIqH+ic5pmq1C5jZRzCH+lsWLg96GMI8HAn
	WYZF0nCD4Ldcny7A6ob8SuAZZvW5z0A52cL5b8AVbmjqW523V3wrSSvNrO+tWjDChQCanBLEqWb
	MvTnveAND+zYUSXGjj2NkjhY5oq3KJ/VzABXYb0nmiN3mW1WGLSlpwWyq2ppTfJ+AYtPeaiP7qk
	clGVl1J09da4yvmRfo3rw6TsgsMsy9AD6AzF4DaBXRIVKhqzuGo0KFKMSxBCLY2rWOJlUJkFlN
X-Received: by 2002:a17:907:9304:b0:bb4:8f76:3c67 with SMTP id a640c23a62f3a-bbac4bd5777mr320871766b.12.1777593282039;
        Thu, 30 Apr 2026 16:54:42 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d6b67sm393813a12.18.2026.04.30.16.54.41
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43fe62837baso847324f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+NwthixOipZXGrAAbRabON37/TKfdjemSYLf3eU581sdpqIlPfVrbsfmi0rrcpi/XrtMYUqXEDNfXj25EHCB+SLA==@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
