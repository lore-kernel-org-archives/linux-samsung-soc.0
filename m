Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F54280309
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 03:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772682534; cv=none; b=r4UAcYU5CS9Nzpwb4XPLdyQ9CTEDWMJe0PrMBZOp6L+zXMc0SHKo1qurY7+oD8A5qmlQYi5QP6Xx5N4x4O4RX17EOfHOEQP3r6LyUr3LmXfqEeZ50oZccmNJ7Wdk38h7W/0Pn7sEWRHfqMPYMIiYqp86fL7JfkxEr/+a6vrhxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772682534; c=relaxed/simple;
	bh=jx3lwOAjNIKx1JbYIv0BtRGFivcMlAcPGHDzLTlQtjI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SCgMOryzPdeX2uavFQg20bZ7oxYybpEvRLrWz+KnKsojd46r2fbg0f3saBRMdr0PZoiw0fIwQak6VAz6m1vYyW1c6X2sff2EfuYnBgiCzGIolkFMhS1qbm0MFPAo1pJFVD7y27JdA36yDpKnZE5UjTAhz9+4nuWOPq6EbrD6ulI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjkivRK4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjkivRK4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso78171895e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Mar 2026 19:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772682532; x=1773287332; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/oY6Lj6y92CrkHBsRn24dqJ3yooac2+GrQjHYegtCQ=;
        b=gjkivRK45AnC9Igxx9p4UKj/JvRH2NABuOGwO1JRqKryKPTFUtSe3GgBRfcXfto3xz
         vtV9e/gYP+mfUsoxeRJHCHinrSINtxgicTgnExJLvP74okQV22U3K3HQETHR/nT7F2xc
         5Wfm+Nj+DMFqTAzAY1qgRwunnQOJKwPeaJ3K60xRu5bqIEodp5P8hLfuYsoYJP98PhA/
         eSxevyb6su59LR9lQtRKwH2OpTVNREfzXDo9sPI2qBbNLXITFFxEl5m+3FfMqMPiA/3C
         InYubynMqSHsoiDH7lti6q9DvCX0yg5VLOkvf9nLQQCI0kJhW72GVzgpwCEldzW4DwJI
         QX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772682532; x=1773287332;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/oY6Lj6y92CrkHBsRn24dqJ3yooac2+GrQjHYegtCQ=;
        b=h2e2m1orDZFOtKq8CHXz4w+Fnz8vIIXforTLTpFI2kFfToo449KafKetcYg3VnAhQ4
         aVc79EbaKAhrB174HfmAW5t+U2V1+5iXhP/JaonvNENq6wjrZnto8WmT/tuadPaiFnvD
         hetN+BYKpg/LeFVxxHdrSQXuW0VDEvvqbFTyI9EbJuhUtlNBX/bNZ3IpYi1BmYGxelVA
         I/BK0fSyTDicddNScsHUnpEWAfVrJHsItCbKTGKtZZ+3sEAGea/gp7+dy3VmDKse4vgh
         myhxbUvqB9UIHkqSTa/ssi7/LBXVSDP96Nz3Ngfx6TI3fOT1etFFwA48C4LDY5kmBjb/
         /1/w==
X-Forwarded-Encrypted: i=1; AJvYcCWSDG2fhRCIk7NIBN1p2QnDieSrFjDz9jTQBJfzN4j2v6hO7YpQxHlGjGBsNWfAzS31Qan/Pqg28AD/ZXNes2D+qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHinQhjNEDo+Ja9a4wOmAHQPkaRtq6IC6XCTUNWTANUAol0ll0
	/lnnIGBVxx1hMTNCe5GdW4GlRgIrChHnSu38DloM+cEyn+J7Fl5Qj9Cc7KqcxIXte4U=
X-Gm-Gg: ATEYQzyXl3Vaj9t8k390u7uYqE3RCQ3jikHHskQIoS3VGiUtGB01vVkLwggw+buaz1J
	5Ewerd98KB6LOJUYPFuoMsXwLI8vQT6aS/j1YRtUbgd32MrTQQ5op9H2fLRrsaw6uHa6Dh3P48X
	4gFNYKytSe6UPGIOSPKLRDsMcHxvvZeBaiv+rindW6uUvDr0xFZx872TTDn7t/EYRRtA63nxuQI
	r/n5cl4L6I0bkfn5PP405QGoJxs3eAuCl9Uzlv+GnYmns9E9GA0d9XAorY/M3pH0F8vLcA8fXz6
	Lgm3klvjGzxBOyjpeL0trTzj4cauz4XXcuntbzfW7jDMYbpMiq4VQwuPtRI16j9/sbBw2HTGEwz
	51wTKPMZlrIVIBo94iDAJVOSQRwnj/SihlmllDcf/OcBJagySvJYduDAsODE5pf+rhVDi24zI3H
	IrIdgItL32g3+OZZbbL0878nyTYrWDjzKiUvzADdMCrV+c36TV15GBAKgm0EZqr0wTfTTQVJ+JE
	nUs76p4lzp91b8CNg==
X-Received: by 2002:a05:600c:a08b:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4851eea3fd6mr10898135e9.15.1772682531768;
        Wed, 04 Mar 2026 19:48:51 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:7406:79df:b00c:2c64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae02a8sm16711195e9.5.2026.03.04.19.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 19:48:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 03:48:49 +0000
Message-Id: <DGUJIFLIOK7Y.1Q4PZQU3MOWTT@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: thermal: Add Google GS101 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
 <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-1-e02a834f04c6@linaro.org>

Hi Tudor,

On Mon Jan 19, 2026 at 12:08 PM GMT, Tudor Ambarus wrote:
> Document the Thermal Management Unit (TMU) found on the Google GS101 SoC.
>
> The GS101 TMU utilizes a hybrid control model shared between the
> Application Processor (AP) and the ACPM (Alive Clock and Power Manager)
> firmware.
>
> While the TMU is a standard memory-mapped IP block, on this platform

this ^^

> the AP's direct register access is restricted to the interrupt pending
> (INTPEND) registers for event identification. High-level functional
> tasks, such as sensor initialization, threshold programming, and
> temperature reads, are delegated to the ACPM firmware.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../bindings/thermal/google,gs101-tmu-top.yaml     | 67 ++++++++++++++++=
++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/thermal/google,gs101-tmu-t=
op.yaml b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.ya=
ml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b09e1ff5d89194b570810a042=
c75836ca2e53950
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/google,gs101-tmu-top.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/google,gs101-tmu-top.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 Thermal Management Unit (TMU)
> +
> +maintainers:
> +  - Tudor Ambarus <tudor.ambarus@linaro.org>
> +
> +description:
> +  The Google GS101 TMU is a thermal sensor block that supports both dire=
ct
> +  register-level access and firmware-mediated management via the ACPM
> +  (Alive Clock and Power Manager) firmware.
> +
> +  On this platform, the hardware is managed in a hybrid fashion. The
> +  Application Processor (AP) maintains direct memory-mapped access
> +  exclusively to the interrupt pending registers to identify thermal
> +  events. All other functional aspects - including sensor
> +  initialization, threshold configuration, and temperature acquisition
> +  - are handled by the ACPM firmware. The AP coordinates these
> +  operations through the ACPM IPC protocol.

Is it Google TMU hardware block or Exynos/Samsung TMU block?

My understanding at this point is that ACPM interface, ACPM protocols, etc
appeared on Samsung SoCs before gs101 (maybe even before initial SCMI
prototyping). It looks like ACPM firmware, communication via mailboxes,
TMU channel, dealing with TMU behing ACPM, etc are actually a standard
Samsung Exynos architectural feature, rather than a Google-specific
implementation. I can't say though what was the first chipset where it
was implemented.

Given that this is a Samsung design that predates the gs101, would it
make sense to use more generic name for this binding to reflect that
it is Exynos-derived? That would save us from generalizing things later
(if it happens, and I hope it happens).
I was thinking that name for this schema could be smth like:
samsung,acpm-tmu.yaml or samsung,exynos-acpm-tmu.yaml or whatever works.

Thanks,
Alexey

