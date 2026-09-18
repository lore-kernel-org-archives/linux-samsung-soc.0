Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDB4FE2EA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744176; cv=pass; b=iVrOWF0N/sFuCWPSICq3UhoRxVlLDS+DSuTHxdzBwUMVtnxd3WFIYBJyGNLPNGoCpdetuVLPsi4aS8idroJKV41NK78ZTiYLEDtdKrs6ZWSVkd/gBgocNII07iAuo+lVlATgbYmcBRNtm6SToIWi3c94IDjwwDwY8eh7B+igzoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744176; c=relaxed/simple;
	bh=Zy64POVp3cHToa/Y34iX2wiBVKCmqoeRskHAltBrV9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrlBgNatO23fih4u8w7Xf6UvGPuZXmst7WoyrkwtMq9x7QKQV1YsUFvjFDK3SnkdTOlcJXoSoX9lNR54SuSjO09syWzu9RKilTNL2n25nsDHOmReHfOyj8xMK8x23T7uO55MI9lOoDFb/DjrfoDw8dknu2e+4kASZFESBhl/DPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSXchQP4; arc=pass smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSXchQP4"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e33b917so616745e0c.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Sep 2026 08:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744168; cv=none;
        d=google.com; s=arc-20260327;
        b=hyvTVCJmIfGVn3xHdK9+0ZcSeNFiPqDwx+MydGaTynddoBbz573yKQF4vaXqBloENm
         /YpaZ4vxb5vsSKHABn8TUWC5LlKWWM0UxjqCwcQMVXfKVrAKxT3PY+PRiSDbG9NQFMG0
         ieEzMxqRIe5v3i+lIwYYXQYtHlX6is4R4USeGaqsfnThSSmvrcpp/ME6h6DRlFPCMMjG
         ubkvEJ1MQn0dftEYLorl7JYbpckASgFLt+M3/NOdi4FcFjBjn45QG2gJLomnvb1LUFZa
         hcsueq8uACozMRTny6ADvCzUYHto2v9gcLqdN5NmZGQ4M0Br1GHm+/iQKTrHkkI4G9Ig
         cwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        fh=I9ZmV29B3KKH4FpZE43HQC5nCfSu1KEsP58uQvoXULQ=;
        b=JxwmXbh1Sp+0SS+izJ/cPd2hXCs21py0ZlhAdsXzPOWYwCgdMPIjfQ9earMJfNJglp
         0wvYEMQdYLce9M288Dj3sgrifObdsOgGRINgQf/grlAwWiO78HQ5FlTS0keue4F2tcwy
         Na9rOKFWeuWbNWpCKXLm3hyHNDvXJQrPPN+airIdlcn1cC5ew/EUYJowkqC0aIieQ9x0
         45h71I05K4Vg5GswqhBU8cs4x+2aOujg5xGeb5RnrYdjI0DffDFAySRqIT+H8UAmsrJ0
         L50rWRYbnyG7QGzAcwH/E1Z9LcA1WlTNa+2iW/enPP7JOxurgmOt8381sjszoYJdylLm
         9e2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789744168; x=1790348968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=vSXchQP4kSDNl1xzfV7H8dpr9ng4g/JBcRXwjGNQ5zst+1xWLMkGX1HJdharDV698B
         mM7iKVrFaZJg4qO4ajJHvsVmADHPdFjUCRpczL0XO4vzCTrfba7vkyZ+y4aUUl88ZbUi
         bRAjUUxc31R9glBztAvmfuW+3AyzqUcFNjkOwg845c+//f4CeNwUhyZhqrCBPKoUjuvE
         AeznNSjiloxhU84OfHYKw2tJxWF+6Jf1SHaSl8Ra/vmq7at+FVfC2msrlCpPbICRKAdX
         uSfzlN8cIaqH3GiEOdhaaCkyg1L6F2XG/jXvr98ZGzfHMvR5xwxNwtpU5/TxL+tJRBvR
         +U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744168; x=1790348968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=EZ4T2ZzDkmbi4siuD1PgiiU7NrklTf2clMYgC/xgsHopFy6xLtXEi8XW+K9WJsZ+3f
         KCCvuqgbiQsJRW4ogki83UQeIYKXop8pMHmLZbNUV704SAYNzZvFYd29CCiK/noW+lBf
         ZluPBosxfoBOhEoa/zsEW8mKNF0Gowm+ww1Z1C0JMXF2iLW5aodUiWYDfBRvISBquLIE
         vj/yGjbhy5uIOz8CS4hkiEt8aDhxv9Sq4UsUKe+/I6VKsoEhK32kpw0CdgcGAKpvU6MM
         m/Lh8oUnHT85+cACMvLztD5uVLKkGECXwBx94jfPBLlladMDwKp4yKbovA4NyhjzA4KO
         nZEQ==
X-Forwarded-Encrypted: i=1; AKwUvByTtzh//tsiwovM0Y14J+McExl92mPd0euB5Pxmh2X5+QFG/SpVIZygdxfcQkTkuTo3HquaE/Gi0xSlmCYWM3MIVQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lrdixX5RsOIFQC/qTGREthuIGdIgQu82/F4XXmOj9TkbD0XoAB
	G8mvUHuqa1ZL53XgN/BODJYwkQfHV3vbSR/ZecUvPNZk2kCMwU/jQ1s6qhH9sewfqIBzVAzA4ko
	RTRz6HdeyzIiCTPdIcUjoVQCQeqBOQmrMgK2/vxXtyQ==
X-Gm-Gg: AYBFou1Pb2ZrI2ho8O+HOBjDhN5XZwO0v/HGfakYgG/i0CrziK8s23BUXnzutLI2yAv
	YuWsztblpox6WQY4PwlXAXNn/qjXLcbk8meDZmdfzEMwZygXuROae9i/vgeE78CuFuWOPm/FH9x
	CySb6NDlI1L7dUXg5ZMSVAq9M1J6U9rAeuFhQH2FxOFh8JhcA5UyIifMl6jaeKxbxvMSNbiYUE5
	p48YfNCJcjiPplQklXX2sylz/ZL5BGwOyfXXeRCXD5CBNZcitWbHOO1XWy3A3VDGMu8AiBZ2Ba3
	Ty8Z2b3Mk6eBQIFKevPSu8peo4TbrxCCg3v3Py5GA2IceZJotoDcoAfOLQX4M7TSpFCD00h51I4
	yWE4dhrYFyYKnC9F5TgNwDkfH
X-Received: by 2002:a05:6122:d89:b0:5c9:a60b:e5af with SMTP id
 71dfb90a1353d-5c9b59d5fedmr1460675e0c.17.1789744168196; Fri, 18 Sep 2026
 08:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
In-Reply-To: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 16:09:15 +0100
X-Gm-Features: AcwNN1WbCgmZ6KBoleiDGX2IyJqTG4BFE69tG3w6kSQzgb-TPyozGD3DKfdtb2Y
Message-ID: <CADrjBPosa6tyVCrEh9vsUoba9tWBbqa-kG2emcu+L1t48QmjSw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 11:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - All other patches in the series have been applied,
>
> v2:
>   - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
>     EL2 virtual timer interrupt") in soc/for-next.
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index bfceea5486f46686..9e17f36e1fbb7ce2 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts =
> -                  <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +                  <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>         };
>  };
>
> --
> 2.43.0
>
