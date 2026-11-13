Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579583;
	b=zMFsKR09ygh2++RBrfks2nCdOSahX0a8mH/UtRlJe044+I1GloKTtWusJMqIJWZUtowR
	 D7IsxMXo7iTWKfGHCbWLMM4IzE46pgSp2IYoLaAqOIL/zTDKh0UMIqXigmzADJ+OHENCL
	 C8gDiSm/8cUQ/4lkUMtvdgAZe8vXtGqPbx4jXhyX8jTDX5bov27Zbi/jogPxNBVPIeBRE
	 +pEXN79+AUiqMITkVWC6/QLNp5/u9hFuZMIfHNIxQdMZwaWwj0dU7+lOLq5Wox2CuMBUa
	 Fk0YDgsuBO2zd/zjezO3WHk1aULFMGfcCJs/KhyhDzxvMEoYdlnG4acku91AKOaReAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
	b=1Z8HjeJHrGhTGJQc91GPiSJiGDfvR8UANA6JTXt76METf3eT3RC+xde9GG6KTt3NQPAI
	 xuzI4iCBWrfSR3OiEXG+1iL5YN8qrcKQdsDxMfZx7E61NGtFbw0VEMKFgFfg7GpA1A3ix
	 bFAA33ncw1fnpyzyU5DubnCnp91EPDjTgGAitFdHOaTtQjg4/X5ar4Ahr/7fGwoMEAvFk
	 hvA1QZGXhWlycTYYz7ADOT9bP8vAAPfhecMgA69d2j/wrGlcWY8wnkxjOtYJPlbzBPMLc
	 0fzUffhTLBiaX2fouyc+1crgyUVLjLxb+PMyukbJViBuX8wW/JKqdmJ1778OjQQTl2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2522606A331
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2522606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso2687911a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 06:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579581; cv=none;
        d=google.com; s=arc-20260327;
        b=QKA9UQSW3S0v9eJ4EjDq+Ty08EUvpAyY8JSvq8/0zI++PvUGf9VtZjiIjMAp2eT3Lf
         K0cd2WIKMQpcPweO1CPfKkaHGx8F0FO66CjCq1aptraqt1ra61II6udITAEG7RHLq3CY
         sqi0kVq8OpYffuJycsXmNDtw5IvADE1vngLbD0HZItIsIpClG7b28+NinpjAkMxMM9Ki
         ewK8bQ+1n3hGI3FATKgs8NLKZITxv14NQxbyhbdmPn1GF5Ja7Yf3XftyiYtaTF19HVyE
         t75BQkUc62DjY8pVCvPOtc4UjVzrnHP9FfPAUe/1aH3LR7RDP6YfGtTWaIX8dtcgvzve
         uu1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        fh=hOY+F5Adh3Dje6slgsEnSPTSK9wIX4WZiJQi3Q72SUw=;
        b=ZKc00iEgEmpFOpr5eCgRwMkFSp2M2An4ci77rhbT7Hiboqkey56tUTIU2mhKuJaUwa
         zEqvte4QhebEXT4hk1AO1MFQStAJLXFxJYiOPVy/KRBcMlZAfo3CdQCeXlunjqk10gdr
         TorpNEvEhH1yFi69Pi7IDqH+6Pk4OQJGqaroxxkV4qa2JNApaPRmN8BZQ4Te1t25gUSU
         iviKQeTy/0fM6ix784M1uOu2m8yTWxk8e5Fy/waLm2T7+CVm66VGsPyXc0E6Fy/JDJGO
         YW2F5nM3zxOnlwv0l3ADG1q8G+DFezzlMICPxHhOr3f5j372M6y803O7ttb4E5Gnd1u9
         miyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794579581; x=1795184381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=CuGpuG2KrPPwcJdQD8Mt4QLipSoESTVXmGWzGuhZt8UmoCgk+cMoOBoU5i9VRwNi4w
         rh2Zg3s0Qlf8jDtUgOWkJovpMlnNGIKgGnRxk15hcW02DhYIdQd7kHVNzO4nP2kmBYuY
         JO5na0F2kV6uQXP1SDKHOaTGx8kevs75jbmgy7joxXBX0QNEok1leCrTJA8Nu7gZ255a
         7CBFWO2oXC4Q8ggcij+pFbu5AYxoSXoDL73541MhIxQko8FsqYlhTe4A3Ma59QcjXblC
         qu0eJh3jxnWjLKplHD9g2cxma+qPJBK817xqdFV81tftlroFD3zKtakJjJNPfITIznsI
         Gx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579581; x=1795184381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=EoYAx4BnKDYaP8tibGPIGwo4dLeNDAx1CsS9IzJdPHhPaSdLVwFwFfVQ40r0650qrG
         UB4+dRS15UKTOTfTQgCBXUp70jaEb45Luj3FvyOvvDCUu20vUkZqtzqV7peuGlwB0Yu3
         2+AUG3PQatiMmMgAHhI9PBKKyyQchTyR9m/JfGAbfvFHYnzyQBuSTu7yFOqZm9Tq6n4f
         jPZAjsoAWmV4MS7tbhfMs6NkdDWz012lQT1GdpF6r806wInm4DWtxVf1GaTZRCRDj5MG
         1MpNq0VDuu7qXJpnC2A1RJvAt8cXTsPvozUS1QBkOHTwxquc61DDf0faqrr7hQ5aX2t3
         mAQA==
X-Forwarded-Encrypted: i=1; AL+hErFZbN0TBp10Vx3YjXbbbmpQw+/1MhwpiMWLOjkSU2LP+EU/zZtUMNO8jS2hP689qJ49OXhVTJbr3IaK1i8Zdpsj4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HuAw3LcrXy2LwviKxgAfyKJokGlpVfb9YG9EZ2A6OhXbjpTQa
	q2ilW6lHBfCUqvc5PHuo0w6riEUpr+XpKHefRy89XHyGB0JrlUpu/9DNyLMPfNI3nUfH8ijmZ/L
	z0TGF28Kmh9rRW+rS0ppvXWf0R3e3Ap3GIHwgbr2+5g==
X-Gm-Gg: AYBFou3J/aBmzhZ3ffJcOl8UcCU+MWBlqWr2TJM3yzukT3GMiH3aQ6PWrbxFKtTzhF/
	Z2r6f5rlXAk8IUZqgdJMZXPCP1JwKzg0fdv+PUm1fkLXzlHWfX4aFWk9Tx7Ojjd93a6P96A5N9E
	UD3QXmHX350dkd35fdpqTwoVP3ao47CvlP7ZrD0SXd9hE2iZEtENMrQD1Ac1U6Yov0RcbQtz81P
	rEgltCeC9lyw5pwp19GZ4RA33wAwRUJDVOnwdhNT5/CSab4NsGGeNSF1TbBfF4hq54k1msSUTmC
	teC9q/ARDQC5w0OQ5yGhFA87jxtopUNrJd2+BPtj86IC9pLE3PCj3OQ+HiucGOTHUc5hi4zg4uq
	iLzq0OF6xsM5+thHCsU1x/nbY9oaoc6hW9XFptd4jcjIU53XqYmqwY8YDCTVwTPRZBRqlWg==
X-Received: by 2002:a05:6402:a6cb:20b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6b7c0be4e2amr1723925a12.9.1794579581264; Fri, 13 Nov 2026
 06:19:41 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-1-selvarasu.g@samsung.com> <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 14:19:29 +0000
X-Gm-Features: AclHuK9BtJmzcgRQKlrlAtXVpG8_cOgWPWRM5bnocNCGOV2wnBohhrKZoowVukc
Message-ID: <CADrjBPruky8SZYpX=MgsMjiKGUJhOhVu9j3Z+9JgJbizmcxSjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform driver
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 12:14, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..069b265c9808 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>         { .compatible = "spacemit,k3-dwc3", },
>         { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>         { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +       { .compatible = "samsung,exynos8855-dwc3", },
>         { .compatible = "starfive,jhb100-dwc3", },
>         { /* sentinel */ }
>  };
> --
> 2.17.1
>
