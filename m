Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513AB30BF6D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514027; cv=pass; b=jOfq/UaZpxgVajnAfgXEVQF410J0r0LltWy76nUdXGQkWh7WGmprYa0bDK/gDBdQNYchK/zRXzf7HTyqJCOpuqW5Bo6LOWAmF4JBe36X+0st4/f205MC5i3e9CQAWPax+MXws3LldhkneNFdYXHRnKyLmIbNAzvjp0mRDe9d1NM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514027; c=relaxed/simple;
	bh=f3BrIm74DQVGuO3zphgLn5vVBmkdeemGJ9kbeQQE9Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpxAmY4JXq6EakrG7T0lipIUqmc28v3hXx+s6hZo1MU30tOFt+u6D9VyQtekv+Ex60qkP7UJPZRdwy2ilCJZ5Rol+VCg6lWc+wXvqB49t/FCsqB6W/3oLjcRIbPYVgdjBdppUVovvP/sPRc9DUAoZV+u8UcVSHeevJLs65iHN7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRUG5q5t; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRUG5q5t"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8891f0c88so2597603e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 May 2026 08:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514023; cv=none;
        d=google.com; s=arc-20240605;
        b=gXy/ho8SK0DKbETRdja4k9QVdpXL3shWV65O0tmKE5hEm8dvy7xeaYXMv7WBIJZK4S
         kmA0dgybPREmsHiEGdPT/MpOdnynpcLuTE8RU0bbAakFe9M/WvtF+pcaRebXKSxGjofp
         oyerN4fgHx1Qc2L1u/HGBDqAduc51IgC/segaxMlD82r0LxSEVTk86qqxXmKoXcPfdpg
         smk7rXV0a+lLVgUWokQMeYXTi1mmDClRwTWMCnq6GXY8uxd+6ebs8GDEO3G1AE/9f2pc
         DsYp55joex7p8UWy2XklePNSImLtqsShafER9kkZ9+hc/whfoKcSwMjcoOqjjS6gj8OS
         4Ptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        fh=VuGzPIrZwebb4fd/4tyni8QyyyOWgeETxINJsFqAkn8=;
        b=Z3kOKKl61OsGRH/kLz6iTBjkb+ug7xJeKH6aBLmATddh4YbHcGKtgLCA0ekdRXlM0K
         w9ZZ4gDeowDs9ygPQBfhGCn2YSt/uhDbhw2upTtrToMpqWJDfKHPCoqwaYK0w6TLoX2O
         OIZ2Z7uvZwdS2fwxPAZq16LK8s6NXSG83pSdY6c0R9+rGxtKhfcpOCuQzBWz4JaLEy46
         mNLPWc/b7qQSG3KOuf5p3tliWunzepRPGM+pOHn0NWl8E7NJRgdKh9cNzjPof7X+bWOP
         0o/mHCkbrDGvzDDYoWx/zvlZc80IxIJvrmiOYJycUpCMqAlgu5HJsVQj39tztp3iPlGY
         sI4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514023; x=1779118823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=mRUG5q5txhUbj0WsNzy93v2yOqJx77hwNhgOBoBkJREuYYkPAo4IUkMXAUk1Ns0xRN
         07FuTbItsN4JEI0CGRFDb0h0tbEJTQkBqvNy22vppC/Ypqf6Mg3fmYzcA/JfJxSry9Vx
         Kw4a8AvksVy0KXajEPgkMs70/+sGhO1GmggVneTOgv7CSDiidwSdUEDu5rDO4Xpm4qPq
         nnGkIuw8k3c5Ipy+3km8H2h5bYPNlfblEq+u2P6zeUY/W0eWvTdbiT+oB2iJ1aBPoxCP
         X1tW+E9ufVPSWPYocqESuPqurr9C0VCsHcrXEA8RPPkHRU9YlhxKnBMV9BnThuW2t+KZ
         /JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514023; x=1779118823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAa827a6Or7i38QsE/PyyngNqVpUBROEfK8gwXTbCIU=;
        b=U32nTR4n7iYTfET1GlnoLc/fV9HssD5lHzcHdSM3nHsFGF1wtdwxNT8pv1KGBwa9X4
         Ht3iPs5jgknUTqeofMCbBbWJ7iIWhCuaoDMuOfyw8UjVYwa8AX+KW6Zi+NU+W0IaJ/VD
         Nsxardz3ZRjvwF8TJH+PxMrSH6Tqu2XyQ38zfp5Wa8WIB1eWGXyE9B9LgOrTb4T0zQeM
         BDcAWfd7brHW3j5o1EXp0ai2F5RV7aT83bbNzAbyOi7WBrCPYkfgG3FMtubhwz304nj0
         lPZyesuRlkwX3WVPz4MlfQ/JVq4A8mN+x0B0SmY2fH/FJgdxfgsMwZ0QXbKpA+KoGzej
         b2JQ==
X-Forwarded-Encrypted: i=1; AFNElJ++ezbXTlARUFHYDE1i453TMGvP1tTN2ZaS8NRE0KR8Id+CgBfEQ7Isdm8HS+pRTM4A1n4DlhPW8lJgOneXYMC/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnev3QBmqDN+WgwCrOp+codcJTIvD+ADjVfZxhPiqrGHWzI1TI
	ANmVaHYGqqvNnq9bO1GLl6Df1y8V3rbDIqBT05HC/6MfsuIWaFbJUORkW8Z/T8hjN1Jf8QnIxKP
	iDgSqqtrJWy+OS97lx+V+kCBlaqk3cht/s5hxmJpCKA==
X-Gm-Gg: Acq92OF9X0bMWoHzo0PJdUkN5SQVmTfY68JG/q7MpUFkqrloJRmcYLZzDHMAkEfRqnE
	4RECUHHmkx1NBI4zuxHMOW+fhh43h5SjYAHQ8z0ATL6928xefKe5AGoYx40WYoTHZ86jsD+1AN/
	5hkILSW8vqJg6m1HLteEtaFfpn0Oov+TcI8wHYrf07zRI37QrhAn6Lx4jSPGTlnBM5S2mLRcgnY
	pYMnanrQkNXNxSVFax5NB3PhZZreLrWAyPFWMF3I5L9kgFS7u+MGIoxu8IHKZwa9E7ByAYfc3m/
	00YBOuJO
X-Received: by 2002:a05:6512:128d:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a887ce5e99mr7616406e87.30.1778514023164; Mon, 11 May 2026
 08:40:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:43 +0200
X-Gm-Features: AVHnY4LuNFcZPtz7Q0DEjkMyUey5MSZn1HyvgA05S9j4k4K79dMxvsAAv2GCHYk
Message-ID: <CAPDyKFrKd9PouecmpLBy3NEas8dpzyVAk9qD6=pFvwbHNyg2NQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Configuring DMA threshold value for DW-MMC controllers
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 17:03, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> In Samsung Exynos 7870 devices with Broadcom Wi-Fi, it has been observed
> that small sized DMA transfers are unreliable and are not written
> properly, which renders the cache incoherent.
>
> Experimental observations say that DMA transfer sizes of somewhere
> around 64 to 512 are intolerable. We must thus implement a mechanism to
> fall back to PIO transfer in this case. One such approach, which this
> series implements is allowing the DMA transfer threshold, which is
> already defined in the driver, to be configurable.
>
> Note that this patch is likely to be labelled as a workaround. These
> smaller transfers seem to be successful from downstream kernels,
> however efforts to figure out how so went in vain. It is also very
> possible that the downstream Broadcom Wi-Fi SDIO driver uses PIO
> transfers as well.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - Move host->dma_threshold default to dw_mci_alloc_host() (Shawn Lin)
> - Move comment to document struct dw_mci::dma_threshold (Shawn Lin)
> - Link to v2: https://lore.kernel.org/r/20260414-dwmmc-dma-thr-v2-0-4058078f5361@disroot.org

The v3 series applied for next, thanks!

Kind regards
Uffe


>
> Changes in v2:
> - Remove dt-binding to set DMA threshold (Krzysztof Kozlowski)
> - Add comment to describe struct dw_mci::dma_threshold (Shawn Lin)
> - Set DMA threshold in Exynos 7870 DW-MMC driver (Krzysztof Kozlowski)
> - Link to v1: https://lore.kernel.org/r/20260412-dwmmc-dma-thr-v1-0-75a2f658eee3@disroot.org
>
> ---
> Kaustabh Chakraborty (2):
>       mmc: dw_mmc: implement option for configuring DMA threshold
>       mmc: dw_mmc: exynos: increase DMA threshold value for exynos7870
>
>  drivers/mmc/host/dw_mmc-exynos.c | 1 +
>  drivers/mmc/host/dw_mmc.c        | 4 ++--
>  drivers/mmc/host/dw_mmc.h        | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
> ---
> base-commit: 1c7cc4904160c6fc6377564140062d68a3dc93a0
> change-id: 20260412-dwmmc-dma-thr-1090d8285ea7
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
