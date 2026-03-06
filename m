Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56439B4B7
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804693; cv=pass; b=Y9hs8DG0nqgKilh/l+qSzyXsdgxWboF6XqX7cxV+O6uOuXA8yAgWitU8TMJqsE+KvrC02lmgmH6nQb4huFYl+Oc9VeP8vd1ampO2xd2oCajS0knws9RPP3TUFh/dPzqTT1bpfxe3FXkHf8OYOMOGn6Bil1eXTmk4Cv8jYyukHww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804693; c=relaxed/simple;
	bh=i0WGYGTm8LqEUFseEa3URMmZTt1pdK7ZgIZfNZS4/U4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdgIY661o7vOQjpmyWjbm98d1V0Ab3TFcpO7BW+nU62uRQUZlAJeYH8Dy3bzLMuH/mir1ob3OgHK/JD6vhswPHHaKgh/etU3VtWymi7CuJUE/HRpHyMlOSbRyAKGdVye136vLPUc51vvjrFl7O+B5Mg1JlAkjciynz0HsfDqABQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WcWg+paN; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcWg+paN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so597356a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Mar 2026 05:44:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772804687; cv=none;
        d=google.com; s=arc-20240605;
        b=lHjF15A5J/s3yjI6tjTNhX2bB3MqcAJMUaxe+OV2pEJiWOESvun+8v2hFR7PE3Izrd
         THvZ4BNEK6TuGU3Q1jsPbOKXmW1U8gwwjGChLZZxVklTTajS+8mco5Ka4ibcRgh4kzWK
         nqZtQpx7nm2kME0fIknQTA7oVV1CSlHMRzjVBByRKeztHE1bwmgYtvjm51Z2zpUU4T9O
         oXuGEoJpsaAJsMpUacX8XzogNq2H1qiutexTbMuMusQ7DfWktOcRNERKQoPl/XFaC12L
         DzdMuduKUUMpePh88MTzIPppsRvGzBWe60/9tqaUWffnnzyaLUWzzVN4ash7YCAIsAMu
         ED/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        fh=eBYK593kUQyU7Q/x0F9n9GUK7qssg1xqDFcX411ZjUw=;
        b=YYSapYRdY96b1JreNDbkvcaOGnI/snBdhgQKKjsdTovvhmjI4lDzGCSOMMs+tZDyq3
         WgDi/Nqyz9Xbr0Na+h6a8YxTNp/wyM0Y7jZ6rbUQTIE7w+ekOiUoKVTL4YkDBOS7mVnx
         qbQToLKdee9WWrKea5dcPvpzuw3djr35F3Lj1zgBnLSBvg3Q+dr5+jLZGsD6X5FUiT2Q
         Vj/HxLY2IN+/JBSXPG5uP1vOB75zMZQ2HW8BTg3d7slxjEkdR/eXsNKLIT3eLwieebRh
         4RadLTwJ3fkL9rtWw1XviR36VOFvKBkgKbIZ+0cepbdEFaiw67H9ypH3ncoDTuzaH46J
         xsFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772804687; x=1773409487; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        b=WcWg+paNKn3XkydwMW23pU4DL3rC3tD8dkef6StvkSBm80KQFO+LY8NEHzQ2l+Jzkx
         RoKBsXI7ODtcfQfTEweQXwlYK0xtbMEXF/oq2uirxmfC0yQHpTvDWIjdfiR4USAAgCMf
         ZqjaB7r7xVQjGxEln3iLv3XbGtY/GbYVOuVp7iuct6pbYBJ3//+TbBJWZVDevccxkT40
         fEdexUAxvQ4mYL6WKD6waXtMMyqCWY0CcF89wdMGMSLPVHxqQfe2ynlT5o/moW7SQVgU
         e8V+npHxel94T4AXBMEgGgZ22gxKnnFk+8NSTdLujzN12g1NQ6iRTAKYEx6mDzDuznbE
         /jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804687; x=1773409487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9tE6SYwSgsJrr2u3o4fxvU0+ZPS0+ntS2T2Xm0Ak0I=;
        b=LYOcYWqxX7rpwd1JjpYlmvjxcSOvuiMqWlcGjuFSgsVonNdwVxFJ97vmf3eask5tnT
         8uXQ/eORxjqO5SjekcF2ti5kSPN7+SgUNh4Ja9WgXryauCVwItFripWvQoLzP1lGHAUv
         Y/wEMFUOk5Gfs006G3uOzEJa1r7J1L5FKD/20ye+y+WekUxvME99Z2g0GCmoSdjq4NUg
         bbs3FIUnd3w5OeH1JPhOwo2vi6XCV+kYPi7XIjHXNvY0VIhISu2Xmemouxeu4Q2hByjg
         5gBbpFecmsBiJ57OnTsVX+UCeXKsQmqwZwPbvr9YsK4sxoW4M397T4bVyvOs1eD146FA
         Gcjg==
X-Forwarded-Encrypted: i=1; AJvYcCXECGgwoXugLfDJ5LTEimldquPHt0UyULTTvvtZSY+wJFVSjK6Bp2MZhdHcvd4ifJ2WG6M7FJ5s5ZfVVH8uR+4Rcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpC2MCg/KoRMXFKuPzIrwTXMobt5ZNcAL+mdQue+baLsvTxJp6
	mB6Z8VZ8mM8awG+jpfTIXGz9GHVtqrbPC8N6Q3oIHV6+Xw3Oe1EfjHCfgfJoxUPNqiL3isfWnrG
	YJ6g0+h7tZhsdxlQdjijwm53GDlqNneXDXkMPhqRNXw==
X-Gm-Gg: ATEYQzwNtDkhT7qnI0zxMmzg7C9JA/NmEYP1Ue31So8w3xXv268Gl5E8QfQ+3d6cTaq
	kOENpXpksMwykQ8u8eFXjn6XtAd1WE1XEE9Ax968XLO88s3OgdKrikI/htTZyPQ6QwdbJhjkXWg
	RJuYYK8NqGpL/Bn366G1YGCTNVjxSj+KNc3YpNpBEUS7RfsYMa9PJzYg2DrwRt1SZd6pY0umarh
	zzx1ELlKkKbWpMK9SHIJqAcW6RtoUiNEAD1N0FoZb+buieF2QW5zpCCIEueCdfbm4vCjO26/Rma
	PQVGZ4PFm0/DM3Z9yb3sZIRNcsYrRML59wfwslzW/g==
X-Received: by 2002:a05:6402:270a:b0:661:3f3c:400d with SMTP id
 4fb4d7f45d1cf-6619d518a9amr1086790a12.26.1772804687337; Fri, 06 Mar 2026
 05:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 13:44:35 +0000
X-Gm-Features: AaiRm51h_tbggsegFnRWczT_UoE9IcJIFd8TaOFwY8gKX5lWJfUXchYtPyM6aB8
Message-ID: <CADrjBPrC43gaRZw8289a15PLBN8ideWvO9jJwPr5beRJ=x4Rbw@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index cb55015c8dce..e3f4fe6ee118 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
>                                                  IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };

This should be ordered by unit address (so in this case placed after
the pmu_system_controller node). Refer to
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Peter
