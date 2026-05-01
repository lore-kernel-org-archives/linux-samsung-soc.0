Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C04526CE32
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 May 2026 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777641192; cv=none; b=hWNsPsz1Z8Iz4GjGTINhX1MeN4sXiXb1TGYzOZk+LyjX1+SEDKrNeiKYV9tHvRMiD4qLiKs9BkY9t0e7l6rKM/PbSb/un4kIys4TSQhluptePO0YvSRfKZDrtbkIYN3Omuzbvw6ziBQWrY8xGcgtDjCuhs4T9AOxZyozAH7uq2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777641192; c=relaxed/simple;
	bh=rd97/uXPxqn6H288Jjs0bKv8wRFMIpNUEz/u8OXZoDA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ncwYo0FPgXBoWXfQJjf1NlHLQAvRGfqpJe/A56I7jDD53JL9qqFgh3lnzH8rB7m2QOrNkM6dk7WKoa4QBkmBgBIKfM3PZn7pCg9VC+Tm/sXuQ1Bhy1mBV6rJ35gg1wpCHovp2KcD/4TUOhW85RU8PhQWteZssbXD4YznfHwkopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UusdDTsN; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UusdDTsN"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44261378651so1922280f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 May 2026 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777641190; x=1778245990; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkMubkfdTMo3EqsOQjlsb5eV0ALKcf2vjXa+TTJKq1E=;
        b=UusdDTsNNv4b1wOapkIQ49PIxRSYv5MAUP09w3z3f9e1idROGT5PShzf7A2F7dXGpG
         OTRIw6Pz2OtFKJweVe7EDJJjG0W1vExPURNhLGGdZ7kaXqL1DIQTectci97Rm3C3IKYY
         mF7rRQ5c9H2Uv0YJ5Hzz/O4KjIssOLGIu9xe22Hy3Bfuwa3xYj95FrAZJUPLAr0B7+pq
         DDRidqOHkogejXHTEzajnssKw4TIa7/4t0QFutvEF8AibgaG1OcpK8i22O1t1r0Cie1+
         D+4VuqUnR8U/GwQUqgXNx/Rc1+gVOsFmI5Bovd+PtLwmrUFBwKvNt6JgkdPOKI7TKtdv
         FddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777641190; x=1778245990;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkMubkfdTMo3EqsOQjlsb5eV0ALKcf2vjXa+TTJKq1E=;
        b=pZXawaeePqIEZ1wssdioC4uMmd4e/xRzLtCKaFv16rOinB24HL5kvOomd2Doowkc4e
         QQN+vM6gk/OczERkhwYaM2GxWpTv/YB5F9KGieqQNMXgC3X1G61hOCeLE5WTnZntIrgV
         Ae4x7sLgTC8kRetvpOsJiyKbAN4/fMiOBC0mrV6yps/BaRq5A4Trz+Cq3uhzFrlAR1xY
         MoPXNJRUhIaw1lBCmGey7HHmDpw7R89BHZ33oGxfRvgK7A0sJX/xxfCHpB1jG5VZ/KNq
         +CYbdO2OXsfcTkLEYJ4k2UJxwsicAvWKkQQXuCiJIxb0va4aMV4KLj/jMR0UnxZ8oG8h
         +83Q==
X-Forwarded-Encrypted: i=1; AFNElJ/t67a4DFs3EGg7RTEhXX/caTbymFZr3ek7g3vNfGEytKAPZ3KgOhovhk/beU4CEdJqNyyfPsRJo6lDSxO67+0adQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdT2/9JHskc9EZf7KW8TxfLfQzCJzy7r6lmBktwtl/v59cAzml
	XaIknghZgqgr3sIgdfwBFGYOHNWNkZQB4XeTevCEGDRmpRoM4e5rX+Z+oZpKv8NieMU=
X-Gm-Gg: AeBDiet+lh+75xYeYNvnLTtaw1G5RIszyG+ICBd6rJQs8lrVbUL3doNl5FgNkE9ZwK2
	zyuf7S8Y0nKDKoK2vQFmxgtCApQEn1hIQQgeaEOCv6mp/pGV/i3MJo2XiP2tcZ/mSZpskxEHVel
	2hSYaUaT7wVLlTo+NhbwQdVvm8Bgl6kMoCP7zlZp4jq4mdsXsFKgYvVA6A6WrJBlhgE5W41T7Kl
	ixyi/rjym9W7rWW/3KUYQap5ShYxnIwXTogYn1SnCHMvF4uHWHN2EtghOHYQgxJPV/7aYOBrK2v
	KXDbv3uULELxkRiAyZq10E2tdTm5Cvz/YrEG1RRs4K4f7drH02XmlwOSWaB9VfMD2rzMXvAiKmn
	IhPieg0Q59F2O9qNmYQrDSPEfGnuzF/ieKPZm0+hj3gbjtyoVCvmLNibhC40A7RX4VytINcJAxb
	tS04cXtmLNwHV0VqlPykNh2jZkGzmJwTG0b0QEynqZsihUVNJkAy0X2f1WeWkVANjHNUjBObaqJ
	woZGFziGIqf+zESrStZsUPo
X-Received: by 2002:a05:600c:6291:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48a85e75173mr108865535e9.7.1777641189806;
        Fri, 01 May 2026 06:13:09 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6fffcsm56790225e9.4.2026.05.01.06.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 06:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 14:13:07 +0100
Message-Id: <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Bartlomiej Zolnierkiewicz"
 <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Daniel Lezcano"
 <daniel.lezcano@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>

On Thu Apr 23, 2026 at 4:22 PM BST, Tudor Ambarus wrote:
> Add support for the Thermal Management Unit (TMU) on the Google GS101
> SoC.
>
> The GS101 TMU implementation utilizes a hybrid architecture where
> management is shared between the kernel and the Alive Clock and
> Power Manager (ACPM) firmware. This hybrid ACPM TMU architecture is=20
> also present on other Samsung Exynos SoCs (e.g., AutoV920, Exynos850).
>
> Dependencies
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - context dependency on the ACPM fixes sent at:
>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-sas=
hiko-reports-v1-0-2217b790925e@linaro.org/T/#t
> - cleanup and prep firmware patches 2, 3, 4, 5, 6, 7: required by the
>   thermal driver (patch 8).
> - bindings (patch 1): required for DTS validation.
> - thermal driver patch 8: required by defconfig (patch 11) - logical
> dependency.=20

I've took series locally using b4 and result doesn't compile:

  CC [M]  drivers/firmware/samsung/exynos-acpm.o
drivers/firmware/samsung/exynos-acpm.c:485:13: error: static declaration of=
 =E2=80=98acpm_set_xfer=E2=80=99 follows non-static declaration
  485 | static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t =
cmdcnt,
      |             ^~~~~~~~~~~~~
In file included from drivers/firmware/samsung/exynos-acpm.c:31:
drivers/firmware/samsung/exynos-acpm.h:20:6: note: previous declaration of =
=E2=80=98acpm_set_xfer=E2=80=99 with type =E2=80=98void(struct acpm_xfer *,=
 u32 *, size_t,  unsigned int,  bool)=E2=80=99 {aka =E2=80=98void(struct ac=
pm_xfer *, unsigned int *, long unsigned int,  unsigned int,  _Bool)=E2=80=
=99}
   20 | void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdcnt,
      |      ^~~~~~~~~~~~~
drivers/firmware/samsung/exynos-acpm.c:485:13: warning: =E2=80=98acpm_set_x=
fer=E2=80=99 defined but not used [-Wunused-function]
  485 | static void acpm_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t =
cmdcnt,
      |             ^~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:289: drivers/firmware/samsung/exynos-a=
cpm.o] Error 1

(applies cleanly though).

Could be related to "[PATCH v4 02/11] firmware: samsung: acpm: Consolidate
transfer initialization helper".

Anything missing from dependencies/prerequisites?

[..]

> Tudor Ambarus (11):
>       dt-bindings: thermal: Add Google GS101 TMU
>       firmware: samsung: acpm: Consolidate transfer initialization helper
>       firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_pt=
r
>       firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops mem=
bers
>       firmware: samsung: acpm: Make acpm_ops const and access via pointer
>       firmware: samsung: acpm: Add TMU protocol support
>       firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
>       thermal: samsung: Add Exynos ACPM TMU driver GS101
>       MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
>       arm64: dts: exynos: gs101: Add thermal management unit
>       arm64: defconfig: enable Exynos ACPM thermal support
>
>  .../bindings/thermal/google,gs101-tmu-top.yaml     |  68 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/exynos/google/gs101-tmu.dtsi   | 136 +++++
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  18 +
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/clk/samsung/clk-acpm.c                     |   8 +-
>  drivers/firmware/samsung/Makefile                  |   1 +
>  drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
>  drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
>  drivers/firmware/samsung/exynos-acpm-tmu.c         | 240 +++++++++
>  drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 ++
>  drivers/firmware/samsung/exynos-acpm.c             | 113 +++--
>  drivers/firmware/samsung/exynos-acpm.h             |   2 +
>  drivers/mfd/sec-acpm.c                             |   6 +-
>  drivers/thermal/samsung/Kconfig                    |  17 +
>  drivers/thermal/samsung/Makefile                   |   2 +
>  drivers/thermal/samsung/acpm-tmu.c                 | 547 +++++++++++++++=
++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 +-
>  18 files changed, 1195 insertions(+), 72 deletions(-)
> ---
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> change-id: 20260113-acpm-tmu-27e21f0e2c3b
> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:=
v1
> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
> prerequisite-patch-id: eb4f90add371877a1930c442c5464c4da7242889
> prerequisite-patch-id: 021cd1ee6d2b93f554dd5098cd1158977294dc41
> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa

Best regards,
Alexey

