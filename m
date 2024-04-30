Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF911E50A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475224; cv=none; b=WyH0OFfcYReUyQXd1v/yYi5Vs1bmnEtRajPo1AF92UTaSQ2cXwvzxN1IefIsiwPtsYbu9jxQU65qTNygF4kRVxY67QEHnzQ3GNCbPx0aaFKIYlU6eLu7UAJUShA/iy/RdToV+D1ccd4/HF7rcgkHO+AZC+hpsSzJo4uctOU3I7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475224; c=relaxed/simple;
	bh=+6cV7rhQy0tyqmlQOhmCF7WmeVnptWzEPHeS6lT3oBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mY6YYXVOQPsCEu5yiLxQXJxjEMqu2b8p99pP6q7B6OVkwceKo4JJIUDidqsNnwPRaczqbmTk8iIpO9/Rp0MROIOglJby1cAbxRjt1R7q6sL/z5mYAe1F0FAuUfcLy0esYvHAQnr6Kahzcpf5ZvZI0iXGs+kRhA8X0DP70RLmtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j5oqDNOQ; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j5oqDNOQ"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5aa400b917dso3683906eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714475222; x=1715080022; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlFLonT6AbxZce1grlaceJ+UmWNTD7jKyAmm8+eZz5A=;
        b=j5oqDNOQqQauMBOj/sZxhKQI62RwyUm8Zb9wcuXvP+wlTiuuDEq3rzLJezH3nL9KML
         WTKx4SJfCmnwDbF8x+ncK2/RIocgcPiV5/7ZQBoyPlylR+YL7Cnpz9hkJkKe82URr405
         iaErhH7KEpAV1kYDg2m8Lw+WcSwDcb5e18K1aOJpHT0zBUk5JoPhhNqoMFn58VwbZWTr
         lbmwfRTU6lis+Mgwia5l0iokmf8GfaT5bNftZoa7OrSimoKrjNDfAhsRHlploRnxSE8s
         zvA2y3L8zQ+5GzwxrbRnj6oiL/dDoFXRPKHzbT8VRdM/cSpjzY86hSqfNZxvCcgAkHT2
         44Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714475222; x=1715080022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlFLonT6AbxZce1grlaceJ+UmWNTD7jKyAmm8+eZz5A=;
        b=dmR/EYfvCjpRnprS3RktKYx5PzZ6gzQDbm9MvIzFWnxJSBf6N9Ihy7z5S0CvTGsBxn
         dgx0X4UWS3ZzJRWt0DWLA8RxHG6p9XTji9tftnDeHRYpFa9Np8kl0bbp3MNaGbSiB/KP
         EHbvwJUlWdDjc9UTQvZDmyVLYve4qk17rIsU2NWIktI8osQ4Q59V6I5fyQKPnGP/+EOk
         hHbDqZx1SMhFfIi6DDS9RX1/PRX61+JyRTkUwmH+dk8RWyQKYHvbcHlFwUSIwE8YFLEw
         deTW776Vgl40780kaLYe/ImmvsiHGc9HCRvm1hTHQVZddO39H36TxDfkf30MbO1KVNDB
         muKw==
X-Forwarded-Encrypted: i=1; AJvYcCUgQLYSgwSjOhkUFUCtQceUtsXtkRPOAjjgAXViEoYY2oHPxgNjRw5lQ2g6WWIutqlwZdi6qxa16PHN2uKHz1G6wKzyfkhKxdsJihw62tSw+IA=
X-Gm-Message-State: AOJu0YwfSYBst/9z6ohn3T408CvWp6K8tjkoLMnJf3Ic13EaG0h2Jmvh
	xdBvEVD14QgrGXqZG0HIrJMEiXaZXj9qDQqYOv/QRpTuvI8RgTklR4VtiA9qxvWSRYbHzD5NZzD
	tjKXYzrXywce2plDvVXQcos7qKWmNk2AMr05gig==
X-Google-Smtp-Source: AGHT+IFhPeJXeV1s//xKAbfSLFyLypE5EQb5yNM836B9rqVy61LRxN3Mxm8oY0UDLV94lhjAp+2c4sfuf0XgokC2zZQ=
X-Received: by 2002:a4a:d46:0:b0:5ac:c39b:3a7a with SMTP id
 67-20020a4a0d46000000b005acc39b3a7amr16090427oob.1.1714475222500; Tue, 30 Apr
 2024 04:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429111537.2369227-1-peter.griffin@linaro.org>
 <20240429111537.2369227-4-peter.griffin@linaro.org> <8b3c9d34-15d5-4aac-b725-4cc25e469a58@kernel.org>
In-Reply-To: <8b3c9d34-15d5-4aac-b725-4cc25e469a58@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Apr 2024 12:06:51 +0100
Message-ID: <CADrjBPrSLpjsgHBncYG5cfh6nnnFMv-vsk3Uq9PXsBa2JHRf7w@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 29 Apr 2024 at 18:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/04/2024 13:15, Peter Griffin wrote:
> > +             ufs_0: ufs@14700000 {
> > +                     compatible = "google,gs101-ufs";
> > +                     reg = <0x14700000 0x200>,
> > +                           <0x14701100 0x200>,
> > +                           <0x14780000 0xa000>,
> > +                           <0x14600000 0x100>;
> > +                     reg-names = "hci", "vs_hci", "unipro", "ufsp";
> > +                     interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                     clocks = <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_ACLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK>,
> > +                              <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
> > +                     clock-names = "core_clk", "sclk_unipro_main", "fmp",
> > +                                   "aclk", "pclk", "sysreg";
> > +                     freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
> > +                     pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
> > +                     pinctrl-names = "default";
> > +                     phys = <&ufs_0_phy>;
> > +                     phy-names = "ufs-phy";
> > +                     samsung,sysreg = <&sysreg_hsi2 0x710>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ufs_0_phy: phy@0x14704000 {
>
> Drop 0x from unit address.

Thanks for the review,  will fix.

Peter
