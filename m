Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0363B7B76
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441627; cv=pass; b=f1RiGem5RUyvYupHgDaToQcJEHvxyWpuFfRRSBmDkODgXsGvYEdIGAWCIGftHL5+w7WRArEXElXjtFUrxhb4uxbvphTJBxh7ZfSvnsxYLzK/+7WxPsnSsRdrQSuqTOTRVQiaOBhH1UtLqFnRQ8ln456fzynH84rvdxH2N7YHKcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441627; c=relaxed/simple;
	bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DW95vyke4SCajit/NP5JD56MfciENERPxAmK22cJ9c4T3QG9DRkuNqp7isnykfJjuRigvvuK10b/8BAYOwKowQifBb1+ZE918+fakOeliC+MuADv54A8J30URtCB32F/oB3zL0usTYjReSEPzt2RMfgLVQZqM9A7uxayJraE2VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkO7X7AG; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkO7X7AG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so2611369a12.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 May 2026 02:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779441624; cv=none;
        d=google.com; s=arc-20240605;
        b=ji+t57/26R5Wh46Sy8MfCF+GZNJTeHh+V9J60a8xAv3PtGPTBwCUsI5hjWP0Fi6jL5
         4nUPHizS1nYnQzmjkmLG9/CQdKDk5ACc0RVRvv80OIl3xxwol6Ef6IAOq4g+gF2oES8f
         AU4dO6aMuN1hqQ0y14DG0GFAhtv1RbQtbHEzi00/64Vt1y/V3SUo7HsPi6sfEXe25QGU
         awnlMI2itFW8IIzeaL0bfEs5q0sDsvgroD0sw3mJyTcj0VmcjcU+Ksss6QbPPD2oiyRt
         rW6t7TnDg6JLAYTT3v7Hf1oNhAFiVLTFiRaJCskjGuSqQsAnt2pThVWRPaVNljcv3Puc
         41nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        fh=4y1DgIY3dN9qVc4DumFq18iZWp7LgCJZOxd6bZjXax4=;
        b=WOUW/rwYarVHyWCWyy9zzV5MzQZUNEEbRYXaDrI1QBQwMnKx8MIKV15MPl0x3akced
         W/TTyojKDFEwpwCLNcObsOS3p8TvBkdDsIxkyCRe01xOjyIjaKN9SV62bn4K97aWcaqa
         XIM+ngKeE+wJh1TclGZ8qs3q6JvAR8hwNx5OSClVNYPKo+fwIKN1YipxSEyqK8Xx1aXR
         4qxN9IJIAFI1VBcPwRJKXu2aC037np7wktdaAoah2uVQKPfV/dEFmJOsrDHUhBn+sCJ9
         t1yJkSDyn12g2KvveqQOQvxIXTrDDYQ0M4ALnbBQ6LMhkTI05d7qTirSEfTB0mvocCzz
         UPkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779441624; x=1780046424; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        b=DkO7X7AGc5UKN5MbAii8YYgDZjEBmJIOPZ0wV/UOQ4suqXcU6NADg+xz38gcVSHuoX
         v9kviPyTM3aD/o+finss4lqNBmDPiHAM1ftb8MbMS/xZ8ftkI8C2o9sq6DvehIbIw0Tu
         QOdGJ+uIVRn5emcyoyqIJFfYjbQX63slkUnhGoiIuXNoX8z2pui+LcE3DQmjBAiMfiuK
         VuPQxRYnp1xLG4kAZgjY5YFTNvDJIhg0CnwNYZaAKLnkHC8oeWDs2mN57yz8HKv1Chaq
         6bbGhLR8duUgH/iXN8p8cFeLuXMDbE1mgsJpqdPrOdnhVSnKDaVCwiLABjGnnGakipBL
         bIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441624; x=1780046424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEirToh+MwCYb1DaYfmows1iO3IlCn32okdonWMlk1w=;
        b=mkKB1J5cVAGzp8H9b5KTvQGc4ZxKM6T9eGAC/Lwn9+4Jd44daOIn9vTRIXcaPxS485
         fCTuHdseGvBU1MyMXtItx0Mp6V6WvnVbZg8CP04dLYsQrroeDMxZaUb/0WW9bUcP4BvA
         nWt0t2Hs1t0f9q79vwPvMbeffVUMn4XjJUKm5Frz0gBGPMBJ3Qm31KWljjhjGlAPIPtn
         d3Q99VSGFMYnoQLhStqWaYi5/DqlBk5xmEEcRjx/jf4szW6bJKTaAmcs2lrLNkTviD5N
         zCWCvo9MKTbElTcLyTiZZd2cNgH7Znpzm7YdqchKjy8x3FsSh8vUoSaCySV4nt8VGfIM
         DVlg==
X-Forwarded-Encrypted: i=1; AFNElJ/qsMQ8t9oxDf/aF9Frmxb1R4gjckBiWroqbvn90k0ENxeSCjKclI05VPDEBRyjkzlygPEux/n4JDNrMB8nbdUB8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxsqEHxkloFkBK+GP1tSg3vLe9T8VNq0FnFcRYpFK0sE57OQ0t
	eew6umiRGieKsjkEkVWRu2WL7muhj5W3LMeEoEMc/2/Ys76CEcfiKLrm6W2nnOYlA9IPkqqTKgw
	sDJDynHPcpkuJIpZTLBqTj1YYgXoCwzBhC8MVE1T5uQ==
X-Gm-Gg: Acq92OGGpDcS0iwWsa25X4T9zeKYSNNus5ur8+KYmVu9VlQMhSQOTE+VoqyY3oyySdV
	zeE3Hj2sA47TDuks54ayts81QYbVhpuA9GZsn2tbynMFnIwMyD9M3YdUQ57Oj4MRbFpg4HDXkl0
	eR1EeL8pKA+O/fh861RbdAhufhrZeJunGovLB/MpYM7alAruUE4qgpDSAO/vO541Lmsc8Wh8o1x
	+a4feEnzVmpyLBUnlrofvmeV2qxIKrFMMBC/TPBWUb9UrfbtE36LNoOfPrpRgvgo8cYnBzSAxhg
	gUJfrsfW8VKhVsVC3VZ0rWL3EfwSz4m15yxW0Ho=
X-Received: by 2002:a05:6402:358e:b0:687:cfde:ddb3 with SMTP id
 4fb4d7f45d1cf-6889c420cc6mr1356687a12.5.1779441624077; Fri, 22 May 2026
 02:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260522061030eucas1p15f61b7bc01f77a3d34d41472210ea662@eucas1p1.samsung.com>
 <20260522061012.2687122-1-m.szyprowski@samsung.com>
In-Reply-To: <20260522061012.2687122-1-m.szyprowski@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 22 May 2026 10:20:12 +0100
X-Gm-Features: AVHnY4KmsYofVZ6OtbI0hlOv_2b1wBOu2Rzf0xG7uc2W1dzbk8tXLU_FZLOZnh4
Message-ID: <CADrjBPqaVVCYzeG6OVtB1VqnQCLAAvefuZHv3=v86bRcaAv4Cg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/exynos-combiner: remove useless spinlock
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 07:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> irq_controller_lock doesn't protect anything, it must be some leftover
> from early development or copy/paste. Remove it completely.
>
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Link: https://lore.kernel.org/all/20260520220422.3522908-1-m.szyprowski@samsung.com/
> Fixes: 96031b31a4b3 ("irqchip/exynos-combiner: Switch to raw_spinlock")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
