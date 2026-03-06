Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA9365A02
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809160; cv=pass; b=lBx4iw84zE6nDR0d0vOEIEs+wrEZWShFoukacFO9HHOorlzJD7PdEQG0E9//m6CgaU2kYaLzqpMeKuNlHxj20RKm0cz6es67C3K86FfGCfTXdnqEbfVG/SnlvZiFGQkQc+mSUkHXN+DY2zVvKTKMepFwLMWK9RVzh3hZXz+tryA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809160; c=relaxed/simple;
	bh=RJCqE09FdvoagJuyOFAYOe69yDa97IaYrcydO3qUuks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2r/djNdQUEUh89CoJDLPvBhn+rDCLkH+a2xwb0TO7ryjYkh6LGeCLQQuqnoAeKptn6OwfTQdtKmBNmy3NGqhmsx3gNakHPgMOpnutaBHShVtSYkSkSjcnfhMzX2wlTl3yPZoeoLtnqwxGyRXdLFIRwHb/jVyCC6O5wPeOj4FtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uh3y/Q8j; arc=pass smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uh3y/Q8j"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56afff51694so677730e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 06:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772809157; cv=none;
        d=google.com; s=arc-20240605;
        b=H/BcBsqB/KbXvEb6wC0EEeqzkLz9kUqn+hRjOSKiTPWEZg4UGk0p0Gk4ogDeXuiU1H
         DMJcBOC9fVN0V8E14TKCLCzgAXWEgilGlbduqWs9kThCBvlRRJUbT0iD/YJsGOD0jusF
         q6RbxhGsOEaNCI1eQF0a+UVhbaDr7AwY3jtzCjimIsi1WJB7nrxuJo2kmeQynbh0kRgh
         AKeKaYUu3KMNXo2fUtSFRUNkxke9iAbBYPQNL0Vwo/vfKhUvavYpgwWzkmZEWYA7q+s1
         S46hOLjO5Xhyg0z6aBIKcy7SWI5NvKyT+y3uK8pbMW38/Ifzl3/BYMrs4taDBnW0886s
         5QdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        fh=qFjhzKM+dItPie7r9cgdcqM/sJxS5FZMCRh36sYvvz8=;
        b=VQirJ1sFnewgbCZvXNKhM+5LvOXBibVfkKRlg5HWovgbkvfhRTnJYz8kI1LrdssWe+
         H9uQ1pAdXocaGj257yAjE892YAuzQF6lenqy2xnccZWE5zSGoAi7PlUiDSCrEQHWnCpH
         0jyFW4hX99lA5C3ImIrfxFSEBIDWX3ibokXViesNsAOhOrfYHx6EGHYBtgW9thda+LE2
         fL+W/6F7sux23y57G860MLLCRobaeG3exITWcklouRIhA3bNPiGgiSGKcIKzAq6mPDW+
         ljUTqay+QXOFtPGeVeTlaKMb/lsYxbDyIxkIWTegYObkgk+UOu9nb6+yaTUjVwSAAPcN
         WfqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772809157; x=1773413957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        b=uh3y/Q8jKO716zXfm9TQpIODe5Qm8XBzdNfWXJMZCctouQOxtEEEsAu7jCJlCRVF5U
         6Kz8DN+5UE1jPL/xl5gnUWH1BOuZzy6KCVjxj/Eo3l+S7N6BWHvBA+kRbEl7DESvZfhj
         oM+5nUbC2Q3SEfD1vYNR/2kKda/GoHiOxNQK7lLqmxDfUY4mkS/LkxuPVo1WPFuQGSeV
         +piDXnshjH+ffTzrRm2Vn+7dS63tWWWQzlmhNrHMtybt297ffjAKt57MrGi5DHPY4L0l
         Pyy0RvvOn+5Y4nxcT9l2WPsD279Ry07MEPuY+Jvu2l8Ul6UAHoqxsV7sN4NkFDSuKkYW
         Mv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809157; x=1773413957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmZqESOyOnPfJv4IzChP40XeUhrwxP8UgJY0WEl1j3A=;
        b=KYvaOmr3Wmjbu6ic2Kpa+WetTR+UMDbx056IBTV6MjNMFkt5MezaWB6kiRg4ZMJEnA
         6AaHVcc6WTVD7mgUAQRPwSdqjbfQBw0gt8zAIuuG1RTCDkyWpEjN/YqyouK421qFCIrC
         mBsjkDrsNoGwG1yW9ZhIXFK3K+e339fnDNkoWVcrHifsuhSbVEg1MkT9PbmizohKDDsG
         pQgsLkkGuxxJvk0ZjIevvOQZwE51Lwj32Nm7TUG8w+1Aba9dzGLTU22RRHnGVsR5MUux
         tXXJezp4PF8j2eIF28RN2Ck8pmNvJEAKbu9/V+7XqdaJhMerfyhwGac7FgirY+q+Oiud
         0iOw==
X-Forwarded-Encrypted: i=1; AJvYcCVq5RMwbnIRNWcDmIrVCpYYLdYoW+emaaCipa3beRiGjvkp4Rcy3+t5fky9Fad8GOv0jglPg3ZcWbnxybDkDBDLpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRjhU8qAkQmrChHJ2uC/rJkNim2ZZD2D7Uga2o/oGBpcSAogye
	a4LgE1Z6gvvj2iOatbODAJXFK5iq7aLpj2ENbIJC52McZMnWU8HrZEMEy5mrk+J9X+UawGzbmPM
	FczrXshb/zYX8Y1biTInnTIWxHaxJ9LVDMOh3Z8R09A==
X-Gm-Gg: ATEYQzyr0L4ED9/HRsmEKTTke6D7uDId1beMZ3OVS+9jUN6vAhlvOtookPJJWYRG5/j
	EdOcwsgvjk+eGXzqpIB3HCE6UBO/yGwMTn2RgpHiV2khCDXqRYEs9vxFebzb89D8gl4G2pyTMcK
	R6leKPMBBa8F3qOCJRoo+EuXsLvKUe1ha/HOKa8LxMQlcE/Ja6hCFEsH8dxNa2LGcj2zV4BPdKB
	lqgwlAVFidtOtzMAoDCEoc+n6fciHX68LM/p5Ery0Er7NnfwpdLRcy7f1PFq0lfxERJ3dD4Y0LG
	nmZhiaf/d6MRqZfaibZxe03RzQpGHlF87w3mbn7zRH/BtB/P23zy
X-Received: by 2002:a05:6102:c53:b0:5ef:b5fc:dd48 with SMTP id
 ada2fe7eead31-5ffe5f56879mr715168137.9.1772809156599; Fri, 06 Mar 2026
 06:59:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org> <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
In-Reply-To: <20260306-gs101-pd-v7-1-03f7c7965ba5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:59:04 +0000
X-Gm-Features: AaiRm52b4ufIqeiRHiDfo_C1HRG2l1W5rj2t_mcLn5mu97dz8SMCboLZ3LDBNm4
Message-ID: <CADrjBPoceGbH7Jf7z=8icaM_6c2pyZBXDf7-uxr2gsuNSowSEw@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Mar 2026 at 10:29, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> an interface to the protection bits that are included in the TrustZone
> design in a secure system. It configures each area of the memory as
> secure or non-secure.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dt=
zpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.=
yaml
> new file mode 100644
> index 000000000000..a8c61ce069d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yam=
l
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Distributed TruztZone Protection Control.
> +
> +description:
> +  Distributed TrustZone Protection Control (D_TZPC) provides an interfac=
e to the
> +  protection bits that are included in the TrustZone design in a secure =
system.
> +  It configures each area of the memory as secure or non-secure.
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: google,gs101-dtzpc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    dtzpc_hsi0: dtzpc@11010000 {
> +      compatible =3D "google,gs101-dtzpc";
> +      reg =3D <0x11010000 0x10000>;
> +      clocks =3D <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0b879760b6e..611fa8fb9f8f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10883,6 +10883,7 @@ P:      Documentation/process/maintainer-soc-clea=
n-dts.rst
>  C:     irc://irc.oftc.net/pixel6-kernel-dev
>  F:     Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:     Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
> +F:     Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.y=
aml
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
>  F:     Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
