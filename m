Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D003C3C0B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678112; cv=pass; b=g+S0HcA/V0dUc2xe9/84EhVDfur8mJGNGN3DEIRVM+P4mtGCp6l2OdD8Y2HOv+pJpDQioad7cInA+Qei/4fZrZVILfjQCMtufntQrTexslDI5ERbI1nGgFkPmZPixpM+AR2isHYk8Tk03MEv/FAdZtK4QTmapa6zdR9wDK5XlQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678112; c=relaxed/simple;
	bh=pRM2rNgd9MBRVIU9n/6jP1Ntus4fUi+4/1OzQi5Hjs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfQJOW5lYfz4s0w8fzxcrDbq4tp6f1bpczX0khcGQC3q2BV2fPhAForM311DHbsnvKwGa+rQW4NsWjzQIPKVYJ4cP8FCvbUIvBpm1bYLSOMOzEcBGOpbM4qh3bN1WtEI7ejLQWwu1I7hjrXlyzqhgAKZOGdLKpK/yFmF2hQhdKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItQXTRZb; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItQXTRZb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so1013214a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jul 2026 03:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678109; cv=none;
        d=google.com; s=arc-20260327;
        b=rcRYTTLf2vKJbMwNsG6SjuyyOfVC7hW7HPr6j3rEJHHUkGZ+dw1zLg6XoKsAal+Ntl
         q4R9Z8FcLlv10wWYQ8oFASgIuFlO5VaQPTLxzaW4cb75SKSFnsQ+FkYQ1zfJ1ct8R2Xj
         NidRu5/hgk+CUQ586XFyFdQcbWwEguyU9mFumcLqYtrBnOUjYRWkmv8khZd+QMr2vVHN
         /Sv1EjCBbs41z9Od7M65QOb9gBydVx/klpcWeFmDTEkt+RPdcR/Jp79T0ulsC37vnAui
         PxFw24Hl9CheWwEBihrowxPANVeIh6Oh+y5TQHZClcW6btFkTwPNV4v9jfrc+bkAKE5e
         Qnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        fh=Bls3Ig53JT7dL/0Jwc8IobypV6q2NwmDohshO9Fv3FU=;
        b=S3aASo9mgOfE881vGoH8RRXpaydQ7N1eWu79qPtbZirwXSYQSGA6GUXdDzi74a8fXd
         jgOxMxC6BEO3jtiF8BPts6saBB5bjiW7ob70/hIyO03vmYgcHVOewSYCp2AbRNM6pbBz
         YBHq6GmMqwEdQXVQk7SGHl+qS7tiuFnc9KjQnizPfn44ykxRJlLalRsaa0FtX2U08Dc2
         mnscAF+s8M95s8TqZYBLAW5Atlq0I2VmVbIVaeBdcJZ4OYxO9aplmAbUYwYTjLzd5gkO
         1e2QuDpywV138PnFGP2HixdwJH/n6uoQM9XMCQF7IlleIAiiaIgdoaxjEtRTzaz3CzUj
         X5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783678109; x=1784282909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=ItQXTRZbsEq+Y4Iv2yFAOj62T9Cq1YaKqMlbce2lP6q7WO3e0YiRDdP+KePeMwhqMO
         +fEvbYmMeh09kOTWtVdRc9se4h62qM0u+PzZRRqT/Ei/I+swGGpPVa+0Ji/UQFQ8AYMA
         Gd3sG8rukUgnIWYfb1TmukZ2Mbt2wMzU6LC8xn4U3IcqOFe8wY9dlvuV2vJKjnikz3rS
         wh+f4jaZRo4IbgQtWJsLJG/HccqwDY4SAB+GUuL0SOD8z07LxFocdKDs41qwePIf58eb
         ZUEcfPN4uaM/nSn0eebe1ZJyo5sG0K+m4gd9Amam7qXr+wm1yJlZNrGug7gZsyjPLKH7
         Iuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678109; x=1784282909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=hhMrtR5lTNi4iQGPGpZCgoHzMuCwi9bbDLEXUSzhvHuoowQ6/MRUxr1uBJ07EpaK8X
         32rJHy1chd46eVH+iLRnNXwYsaANwyim3LWrsH13n74TUtfn7xqqPQF2okpGYgxDj/OT
         qgslI6L7/r/Tc2dvRrhpflF06jIwYmqADu0Wi5ue2xPjSxMJfdFYFbkrn/ZSKgxpYD7x
         qY9//gWfFK5+DD0Ej6+T79gpsBxALi/Yi4pxbNJy/EB0sZs5u+EBk3wwCUPnP0VxRb+x
         EBZmat8jf0c/ejnECd3t3G48pKi7+DiLTc6Sb16mQlODVaLK6b+VIwMTACcSjBGrS6VT
         Fw9A==
X-Forwarded-Encrypted: i=1; AHgh+RqoNKz1/d77NAv+CDc6sGT3s+rImCJXhaKaprmH66lmzfWFmulaubrXJFK3ouDmuPwm058KOiH76pEzITsB+qUjhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR0KzJB+BMfYoPqQrL11XgLiBOgL1Y44fa9wDbtaIHyrP26fWj
	0jLpNlbbkj0DFr2LlUiITHZ4z2vI+UZcDukGY1IFMIzjK1RTqemQbVX4dOcdnxHwc3eiB9xEPLH
	o0UBIpdvonMpokusbD2hTmt9pxTTfRhrKmB+3fM9zYQ==
X-Gm-Gg: AfdE7cn7syGt9pibY+qKaCojuN96HxSSDXWx7Hr9FQlBQ11UkAhx8slmn9wm/ha2yu+
	/UPcb8v7VnRBfyXDWbGwVRTkma2nxjTjt9Go22qEhY+7etXioqcAhMxkPcfbL6oR26CzWkrG/iq
	K10IlixddkM9uimmDx+iU43jMEY9ICMzgRCmNfBT0G6ke+nwKTUsWZDWD76wH6lmpBc9RK+aiC5
	SDXxJZ1GEJoNWUP8sWzsCPwLKxkFFexD6GQCnkLz5lYNKxn8QCmhDTZKyhfiqq6rDdrU2T2haPL
	6WmPKpu3JJwl9b+RT24Xfk4/TNt64W8=
X-Received: by 2002:a05:6402:1f0d:b0:698:52b4:c2c9 with SMTP id
 4fb4d7f45d1cf-69ab449f56bmr3763583a12.31.1783678109402; Fri, 10 Jul 2026
 03:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-6-alim.akhtar@samsung.com>
 <CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
 <14cf01dd1052$4de88670$e9b99350$@samsung.com> <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
In-Reply-To: <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 10 Jul 2026 11:08:17 +0100
X-Gm-Features: AUfX_mw_MQovWgLm-SNbZiYq6L-o37seq6gSN5GX96bbQr3I8gkT7hwklMnJXyA
Message-ID: <CADrjBPp54oxAfJ9i7VTqCVuCJLq3X5mZPh9wMOMgoa-N1e1Ghw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, robh@kernel.org, conor+dt@kernel.org, 
	linusw@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof,

On Fri, 10 Jul 2026 at 11:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>> ---
> >>>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
> >>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
> >>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
> >>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
> >>>  4 files changed, 811 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>> +       };
> > [snip]
> >>> +
> >>> +       oscclk: clock-oscclk {
> >>> +               compatible = "fixed-clock";
> >>> +               clock-output-names = "oscclk";
> >>> +               #clock-cells = <0>;
> >>> +       };
> >>
> >> Small nit, but I believe oscclk node should be ordered alpha-numerically by the
> >> node name. See https://docs.kernel.org/devicetree/bindings/dts-coding-
> >> style.html
> >>
> > Thanks, will update in v4
>
>
> The node feels ordered, no? clock before cpu?

Yes, good point. I was looking at the label not the node name.

Peter
