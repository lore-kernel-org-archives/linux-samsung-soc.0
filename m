Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07252F8EAB
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 21:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276222; cv=pass; b=APa8y6jOuMYQCuK1t57cuJFONtKHqPNsYpmbGUJmLgcXY7r8ZY8Ne7h0kY/9QezpryK657q1iq5K1Igc4DDrSnqBWFLId0TxBkk1AsqBZtxMUU2iuroIs7Z/sCiKlQ5nk3r/iAQk89Wk7ALKHenp4l3kVNviuElTf9/G4LUKiyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276222; c=relaxed/simple;
	bh=lN/bsiliA5s6gMUNLN8rptU2mdbXtmGNRGdUP9DfCfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC1t9BDg2xCjuAJv3MRswh4as3YJaPC5AStn3Jn8v/8LTdg4/8KZBEVRc2BrsPewiBcJNMFjjug5opD8K3XUuaTicjZv05Us0DXX34DLzK2e6UYZ1NPSEYuftSrwdsAGgFEG6VsmqvY8zAZKM8HODYBErXNZYBqwnjnJMwzg7pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZo+sGcF; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZo+sGcF"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bb91b426e40so420389066b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 May 2026 14:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778276219; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMJa3R/MFvuw6pC7KPFmYpMSiZeY7Z0LRotObhAh4CqkpR7/pOxU0iLK1YXS9+Y5zk
         416QPyOA3e1tt19f7gBjhNdYtiy/hj3GGnjvAimtJdf9NRMYfvoMBn2gl5F52B5QTah/
         5Z4GJZzDfXXjSFCE4dw5ZvDeAb96Z0HbQzm/oHqfMRnbvDtNDEQls3/aE3n0dwQMLzRG
         BzvkGHoeZfbPcTqi0nLYGPwXPDnQtWOP7oqdY0VKnY7zmLKK3Hj/VvSvQvvKIrtf+Dm8
         GK7IkaCxQ+eBj3i9xB3W6urI4WMvCL8J6lD6a4S2D1cSI9qtoiAkyW4O9Y6wv0OLqrm8
         Gz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        fh=NuWoyu0rfn3EHhcLz4gNwklrNqV4b9S9LliQW/uWKz8=;
        b=lRFjhS0+it6rqA8F6/4VLkAWaU5TRtFT0EQxX2XAhhuZRZAQwT2+5Qi7Qrwf/GCrxX
         /N+N2f73rAh+uBRqqI6AfRrI+6ogaScSeFtQF/uq512mRN3bTKnAmYv7G7SKbBCxCvX/
         FPfQH37X2ioR6dAvi4Zc4TquBIcC4TXCMcSqAo+HyK3lXbYh7TjC0Pq3K09BkqQLmuMy
         SSczACesqEpm3flltBzrtqf3gU8xK+xxHMaDIhEw2ElJd+SsoEngu1SfZCmETzEpBN0X
         EYki4jdC6TK7ETLIW70jMEADS68Y4UG16gXZXAih69vKxLojWJ0ygLqiKUnYb0s/WnSl
         tuCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778276219; x=1778881019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=uZo+sGcFdU3KxY2bTVK0EqJigfMOrBfXXS+iYmTJG0b1HIQwn4Jd2cDCPFkVFj1laL
         UIzNilVZXmOQgRRiXgEY85QLaf0iIK1Kt32vKP71BoiQLJE9iYvHS5S1GADyMW62bJv/
         I3NUDL9AuxCQR2MZ27ciqMmWDkwqATU8pSVYmMDYu8U84Lk2GjKNN1LfPWXN0hCr41/u
         6FVniJeBY327/Pl7MLk4eolEDEuPhqmsOLg1GtGTPACRf56G+/fscb0BuBeq+p9S4btg
         CZdgiGWOkIIXEEQacG4NuUb40Iuksg1utKYOVEshEy2Ngb1OFWzVvNYF7hA2WudW4AF2
         +YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276219; x=1778881019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8akv8laMlDPorJaM60exVXzt6UM6gDj1onk1kWGCvP0=;
        b=tTz38/d1HjPrx/HLJYcyDuyplVn9aYljAohA1czTOenBsT/YLWtquuXDsGtyUyDJ8p
         AxLEg4hmpOfMoI2gIkOg+t+KrmufZxTTh7xDNCPfyhetRywqbQvqkstCRtydfIUrSyFz
         PcvNEL7m7QBMCYfC/Jcj0J5Okxzw5yzkmfanlko831JVI/6jdg7x6kjfQFXtjcZqrcy2
         wTjp3PwAO+/DS9HcSeMmVhlVID1JrySCTzo62jA8zTJaqvkJZisVEfrAVdLIR41OPdWt
         hhQ67SCTGaAzPEUIIfltdUuSQmP4rOG5A60YVAKrUzstpPx79lHYy7pZ1gXvwy2YAXB1
         s/0w==
X-Forwarded-Encrypted: i=1; AFNElJ9SPmO8slrLFgZ+vNDZfIxbQ6/yZRFxboY0EMercf44wCuof3fPPVdvp9CPDfNjbaeW0ya1B8Fcu8Dn9Wvc61f/NA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkfwbEu2qRHTpgg1UHUqbV+OuFP8b2mRo4NR9xhZiqfwVe5cR
	Sov+is0R0Da8DhAPuWxTlBVniguL2CgqAwKoDy1L5wOcuLfG9CsSzjgLJp9/AFF29W1qoHlRR2q
	+FpNRM3BUpASfDWD5BnWJaZz/LlGH0FSXSmteavUJEA==
X-Gm-Gg: AeBDietXnpkwEpL4KXB24tinRFmV0cjWPowdULv7OA/+cUd1ntaieU6MKrCGcnQms/E
	g2vB7+5XeWmIaXIF7w6T2r4kfwtBv0rOYrOlASJGun0xQ83APSAcsBcEKfRq97h46GUn9PgbPqm
	pOLJdIg2TRI/VxBcsooVkZIctKS2bQjqHEB9iwzFqlwQFJSuGLCllGsreYvS1GEDwcj6IcU7zax
	tR+dVRf0XufpncFN9jRAxijyLfDCTFccZ2kg+GSQVda0M42N1Zn7rK1KwLgJQC/m/o7WmbF25Em
	NnzynXR7959D134p82p6T+F0WjIj4BmpEpmSJltkRtfruunkqZg6
X-Received: by 2002:a17:907:3c86:b0:bc4:b9d3:1013 with SMTP id
 a640c23a62f3a-bc56ae28594mr895321766b.15.1778276219194; Fri, 08 May 2026
 14:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-6-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:36:47 +0100
X-Gm-Features: AVHnY4LevScaePRxr8LSmmB5UEWK-uXM16Hv4m-ApBUuggC82x63FXuRaiJglDQ
Message-ID: <CADrjBPrgkugu_smjW=MH+iDEUTKLaonqkSQBzjUFyKms5p8W0w@mail.gmail.com>
Subject: Re: [PATCH 6/6] firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Introduce devm_acpm_get_by_phandle() to standardize how consumer
> drivers acquire a handle to the ACPM IPC interface. Enforce the
> use of the "samsung,acpm-ipc" property name across the SoC and
> simplify the boilerplate code in client drivers.
>
> The first consumer of this helper is the Exynos ACPM Thermal Management
> Unit (TMU) driver. The TMU utilizes a hybrid management approach: direct
> register access from the Application Processor (AP) is restricted to the
> interrupt pending (INTPEND) registers for event identification.
> High-level functional tasks, such as sensor initialization, threshold
> programming, and temperature reads, are delegated to the ACPM firmware
> via this IPC interface.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c             | 23 ++++++++++++++++++++++
>  .../linux/firmware/samsung/exynos-acpm-protocol.h  |  6 ++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 2cebc5456968..a663e15fbad6 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -857,6 +857,29 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
>
> +/**
> + * devm_acpm_get_by_phandle - Resource managed lookup of the standardized
> + * "samsung,acpm-ipc" handle.
> + * @dev: consumer device
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       struct acpm_handle *handle;
> +       struct device_node *np;
> +
> +       np = of_parse_phandle(dev->of_node, "samsung,acpm-ipc", 0);
> +       if (!np)
> +               return ERR_PTR(-ENODEV);
> +
> +       handle = devm_acpm_get_by_node(dev, np);
> +       of_node_put(np);
> +
> +       return handle;
> +}
> +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index 08d9f5c95701..83cbd425b652 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -71,6 +71,7 @@ struct device;
>  #if IS_ENABLED(CONFIG_EXYNOS_ACPM_PROTOCOL)
>  struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>                                           struct device_node *np);
> +struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev);
>  #else
>
>  static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
> @@ -78,6 +79,11 @@ static inline struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
>  {
>         return ERR_PTR(-ENODEV);
>  }
> +
> +static inline struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
>  #endif
>
>  #endif /* __EXYNOS_ACPM_PROTOCOL_H */
>
> --
> 2.54.0.545.g6539524ca2-goog
>
