Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBC02DF142
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2026 00:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334197; cv=pass; b=Deuc3g/nwV8uTfX2vktI3u1rv8Se9NhNrOZQUXTmI1CKWctz5m2FYX3go0BO9EQtd581ocQplX684OulxQjtukIbPWKblk8SfV0Mtm0MyLDCVqQ/bq+FBLudjVLM8PJRsEa+QFnFnmRc9k8gtXzaZB8Xzpk+mRtvLdMV+3AktQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334197; c=relaxed/simple;
	bh=jibWeNECBJ6nGuuVGpXMaJ411vpC41Hnyp5ZlPjaFrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sisbc+z5zA2w+UkUiA2KhEO6gHVUDaI1YrtQW2At6kXsG7zstm5P433MY7ZpNARoR0+3ppgsRO4Ye4M5jq6151TKgtrmUHhkx5YLKtCTHXww6PLer1nsHZ1y9wY7pwc9SnOUqFtSmeiHlHiDHP9NQl39brRs8FU22WXli0oPuGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjL8i6Tg; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjL8i6Tg"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ad98c3fb15so13066677b3.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Oct 2026 17:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334195; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ0ut26LPMCT4LoNETmfWsjBgEwjWupo3O1/YNJ9fKTonhJgll7tGocVOSG0ffN712
         7AwHigWoy+IFHLYrZAkstfHEacR/aP2ddipzzBn4lS0SQk09bklm5LHrCdmtUE3P2WlA
         oPP9gorHnJc71UG47B7AYN6A9Jxy0KyLCRsgu5lzYPJAehIN3eTUqO64LRw3YmvahQLN
         1l7/c6VUkh8jZLmZ0UlRyDj2HUgsCJC/7e8qwoWVrctayMRZMIo5849b2CshWHrH7n3n
         AoL0VYoJLgYZXRlqpPclumcxjfvlBLJVVRL49gL7fOno1vHtMlyqXJ68A+JKJUPLSNqK
         uZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        fh=vROM2qcf8Ftjfk5O+P/EcvsYsldmL5F+d/5H7+QKWb0=;
        b=Wsqx9YI1Nu046ZbAXRc4TBQRJw6/FQYLw5OyMNzkCC05s0PTnXDyqggxBMg3HNvReg
         GNYnB82tIrORDpVK2sxcfshSMBiNRfTkfCO1dnpxyrdqFa+Xns4gtjCEj1oFa3/o1eVF
         pa2E1397RxEmrD/ktsOJ/oUWtRMnxeGXwNqDsVdqWYn0mofOv5wtNKfERFuBjefG4Bip
         +mEqo0btx0SFKCxo/hNL5/1PPPFGi1Iygy9/o2fjK20zwueo7DPW7FNAPfh/ey1PO2mg
         XWqKQnpNKTY0ovTC9zHqjHGLLDUMPfg1LHdBf+x9NFNPC5sZFUIFaZMA8cFcia8s1k7G
         57fQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334195; x=1791938995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=QjL8i6TgtAjF4wRVO56FVrfHK0ABEELBNmCB0IwMtSycsCrADIs3aK5itKSXyK94CQ
         fAXkGoYnepDWarPf7Ey5mwLC5LdBWCH/WbEMIz1qtYfDsniFZLxJ4dEp89xhxNWML3E7
         1znmSyX/1VnIjWkBX+F6IswLM70b6ffqlK6/vQZtF4D5wdEPah/Oa41R9ZTnRR82iBRa
         oYMxDW4ARR5Z634FBE+/LWz/QG6viSIT5Ul/D3D0I3HBio9aa4IwuO1yIrDfvgUMLldz
         lfzqal7L0BBGnckD6CKlFpHqgg0hbYrxVr2JEAo7ySNoSmMHoSFn+z5fsMtyKQqzvxfs
         x2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334195; x=1791938995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j/HQqu4cy32s4K7jv4w7/Ec5CfjGEebGBJG85uzxYI=;
        b=TT1SN5U+HO7UdW5qiSFr9zaKR97dBi/cdjFmiVX466OqbjMf2BV/Ga7ZlZbvMlclSN
         bAVqF8aW0KE3NeYjABgo1q9/xA6QmMouKh2HFKGivXrR08FRWrRXfiLuMBoQjXWevm86
         OnSfJqC0WV3Oo2dn6/GjtrB/MWebSLg9rWe78aIZEgbUf3xGmOU5U1KPwuZtBPXiWTSO
         QBAeDlOXXZ9/k6tYJiSWzbQVrotuMFA3MtOTo4l4+6MRC+P9K8OnocsQH2Z1zsCTTaFj
         VccH3XxfGq/zz/U1c0iPp8HsgVe6RGaLKL6MsulOMYO92jXLgwC6mnNJSILWRVlf68kN
         affA==
X-Forwarded-Encrypted: i=1; AKwUvBzpZBiNAv8zz5geGXITm0O5H53LHoarHli/0KVI7Ykwd66CHa9FC14wu+DB7I4IlfWYiOEgY+0kr8t1q36Y4gGa5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcRtddLw7F7At/FXAV71Xte1xPROWFv0X/czJsVMGHk09T3hSn
	Qk2s7VllPL6+la/tJK9Q0w541G8LPNcrbThIy+Ribju9xGcCNL4ZTnqM65ICLJmMJc9ogcxQtWs
	5LSxgLh8eAJRNAaE7kbwcY/hfcaB4rrmXb9nysdxHdA==
X-Gm-Gg: AYBFou2PR2W6d0hrz1INxQWEfZNa4eAPsugWZAebjC0TUvQPDEaW8fFqNq1Ue9pQSIq
	ttyQYphh3G6uDdZfKbstNf/sf0x/3JB85L17icw8Ou8QLgvp6jddNKcFh2Rkv0XP8fmY/hp74jT
	T6LQMtY27Nk/VMgHD2wV1RdQyjSgJMAeli7NvPmnQeolMAA0mF7ZMLjARrYCY0MzvDwrZIT6a2p
	u6GVlMyzJXqbMkU9z0MqPowzMC/c5iea7Xx0boHkNk71ENFnvOSyqfv+cEAni3rOH9VCkaDQZpH
	HZKBSw42POpjXTEbJB3H0Tn/R3VvCBDPixlavwv1rdO0sUjPWLi6PGF0Xb7Xk2knG6r7rGbziNh
	8DQoO+LDo+A0/AaQ=
X-Received: by 2002:a05:690c:ec6:b0:861:a2ae:8c6b with SMTP id
 00721157ae682-8b05ac458e3mr9173847b3.2.1791334194577; Tue, 06 Oct 2026
 17:49:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 19:49:41 -0500
X-Gm-Features: AclHuK9KAi2YbRrGI4BgLSa88-aMtBCudk5hm_jOIiAtHKuwiCVmb4TkmJdVAQo
Message-ID: <CAPLW+4kQ2M11VbUBkr6ktjfRGRnbdUWRuOK=ek4-3MJxSwGPAw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/sa=
msung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct =
device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 =3D {
> +       .initdata_base =3D ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name =3D "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 =3D {
>         .initdata_base =3D ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name =3D "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] =3D {
>                 .compatible =3D "google,gs101-acpm-ipc",
>                 .data =3D &acpm_gs101,
>         },
> +       {
> +               .compatible =3D "samsung,exynos850-acpm-ipc",
> +               .data =3D &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>
