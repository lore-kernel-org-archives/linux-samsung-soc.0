Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419313E4106
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677010; cv=pass; b=gUSJ3+sgmadf3tFMHQoTdSelopzmFpg+ng5WoQMxaWoXyuY5LLdUp9KCUKaQBZ1DbflcDim1rKy1rzfw9EM7oagDhyBSy/nfTjFat74w9ZWfSLFZ/xBgNE1q/HFgzX/FeOLiYa42gAmmRvWLEt7DFIERMc8Q9JziciqX36e7wlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677010; c=relaxed/simple;
	bh=/pURnOfPd01iygyLUjpNk9X+T4L0SeXg5/g8Qb1SX8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4Y0e7fVjjb7hvoNwKg8ouoNb7l/G4elW9+5dRpEaZWIDkVmyn+tINRQhXIEEsyFi5iNhNiJtkwq8JVL8PlumNKhInX7tWl4tET8s7EEreRQg9H9Ju9oq4EFYjSMjso33oHwhwLess13LR6pg5NMIsqh6hjVW2ce2P7cn2vfrYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpepKC9i; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpepKC9i"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6407808a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Sep 2026 03:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676999; cv=none;
        d=google.com; s=arc-20260327;
        b=XOzDTtMpgfkUbPMyUnQeP8hPISj+RuSk/6aIDA6r/DDGc5yRaoSo85i1dU87ugiq8e
         sAvDupRspgEjrp+A+zL9onnMJnud3w/8vEhS8gDGOZFEKFvBKwrXzMwbI03EYocawu23
         9OBLd3LHzr6Q+pvcLoh8FLG+bzoJ218TXfZ4dLDzkFt1vRIts/DiZhO0jc8EfkOEloY8
         R1aROCP2vcpO1vlHDHDHuaPLZ/3/RbPAgnvNJi9U20LNIx1dW5uVi2LGZlADX60v/wVB
         P9MxbGUbi/PvCB9VJ674ufejx07YqWTg+Pd60pC+t1n/at/NQm1PC6MCJ+tFSmqMFjwV
         1vFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        fh=/P6sLIQrFTOpZJv3QfyHf1u8FqEoGzrDY9fHz50/zp0=;
        b=bEkw0/RMvUwd+fXVE082t+u7gAjXCFq7uOtjbNgFWcGG01BfeUlm6vITB5KEwbK6k4
         jfWs9Xu/93Uzo/rXgMQzK2MoRJYKMVfy9W9rmMDEX3noRx0klKpC/zDTQr2AONWIIeS9
         R5q0/1wi4MMLge+MOQDFaQlP/LbVAhf2TdMRMXVfX9qeINBC7Hr1WAe+1393TdLsjHJ0
         VPVbGgC6eLc8w7JHG2Iw6FMvdu428rWxfWlw7YAHhv9rtnxMOC8Hr71Rxsyd9kLdXbA4
         Awh7oGvD17kmF08eoL0tJ5K1mx1ualjXMzzTiRMvSDRKWBA+9HT/zwWkq+3yecG7MoiN
         fBsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676999; x=1791281799; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=wpepKC9ikfKPC9p4CqWROnwComFJNLSxxEXrD7zPrVfvREDbmv3nlsz74LOc9vR6sx
         HgbesHRr1pF2xm3sZQbVhNX7NPp1QdwIJDe78id4bX212RhMbFkP+dX6Io/kLHSMct2M
         50wcgkFmIirIqSUQtWfLjK2/X8NGPjPcU59gc55ztm4vH2ty7WS9CKkIPnTUp8k6y7VT
         F5ozxPCBXrfwvIr+jMS1b2CSWto+90GHhuvzIpUCif8r+p4SE14qkDXtYHvAylxNLu0V
         vZjITdskf6Z7GLtW5V+9bFhDCmlpo4u7DQygL2u8XbUEGj3NACCd73nCKB1oLsYSC+UD
         hhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676999; x=1791281799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=PuTYoSOTgY1QUcZMQS4Mzv1iW1KsNRyo1EEo09+mN7AlwF/NuH7izqMaoc6NK+1W7C
         kr/J/wpgXa41QDkj3xlKVTKskx8hTAOlMVshPrQ33qixxdHgJMN8u9obO0E1gbVoiJqX
         iJBjjuVso9ls81tnIFS00v0etaoAuVG60xMypIAYbugJCkCWMqUgve1ShVL0C9at6ROX
         uGyGdiEIMf0ZnR5P0ar3BCpdAPhmlPyD1Re5yznN84XiI6zaewMV3XdAh3SHdd3t5Wyf
         X7O99ULnrEj9I6WPnyR8sunqAYT2AVuVU2LdzHu07S1jGYAuC1u40YPyoG5uwnI7zoIk
         IkJw==
X-Forwarded-Encrypted: i=1; AKwUvBxdqjWn5zzcyaQnUzHHMGqItt0hzKr+hU9Mt7GcK+zLUPdHY34gCBCiPReq+uwrjvRi3ZdkoBTh/Vg/+KdGRl5BtQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJv4v1oBSHg/skmouMmVuPh4Lgin2GiVnvClEVPjHHfLsL3OP6
	MzmOuMxzh/ChwP1OzuEFVuCjTIPjGaj/h6zQdCO6zz+eW2XXHmxTilBdqdezXXY4NY3mBf2W5u4
	GE2OQ59/jolciGg4m79XJHMQs5WYAsEQWXwSvBQBn2w==
X-Gm-Gg: AYBFou1EUf/RVxm4Coy5kTzFzacMOj9RtnfapZyJ01yeQ+x6zXEsnwSi2ui54QgeT/X
	aoPA9f4IjArHmarLmPNIanD8eHxM78NBnq21IEjp34pbCI0/p8o2fG0ivCI+OATxZ3zWEI2orMt
	MKqJDmBtlKIViMOlZPGuleRK++IEDM+0wfx2ASzqwXs9u2ukM+YihiJYy2GZQSWfrSmPSBXzxrP
	JvR9YLM3PUk6pBR+mt5xyurxuxy3vRbdeNq/bZlDLJui9hwx6rdhrFY9EUHOzofxFWlCCeEPJmk
	7ab2jJyKjb20hAu9z4VX33V8ksOK4pWZ1fsunQm4DPIKNPxdE5zAb1MqXYYGeB9Hj8B8ai9fHtN
	fY6HLwPSJxMYszsI4ahNghR0=
X-Received: by 2002:a05:6402:c212:b0:6aa:e589:87de with SMTP id
 4fb4d7f45d1cf-6aae5898986mr6832193a12.20.1790676998743; Tue, 29 Sep 2026
 03:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
 <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
In-Reply-To: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:16:27 +0100
X-Gm-Features: AclHuK9G694Ra3CWigev-SgKIG1dKrfnmFi4vSCyiq_Xo-NTi_Nls6PiXAbko7k
Message-ID: <CADrjBPrErWJR_01+Qhuw6mu0Kpe8-tvBMjci=rBO13RaSqnfZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Tue, 29 Sept 2026 at 11:09, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krysztof,
>
> On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> > >
> > > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> > >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> > >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > >> 10 Pro XL) phones.
> > >>
> > >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> > >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> > >> entirely in-house Google designed SoC.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> > >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> > >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> > >
> >
> > This introduces new warnings:
> >
> > /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> > Warning (avoid_unnecessary_addr_size):
> > /soc@0/interrupt-controller@5880000: unnecessary
> > #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> > or "ranges" property
> >
> > https://krzk.eu/#/builders/28/builds/845
> >
> > Probably you wanted address-cells=0?

Yes, it should be:

#address-cells = <0>;

and no size-cells line

How would you like to handle it? Shall I send a v5, or would you
prefer to fix it up locally since you already applied it?

Peter.
