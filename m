Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574883;
	b=Hls1cJvt/HVW9WdpA1Otrh1Ez8NlwUwuy1rHGAKWKKg5uvE2NUAQCaXIFG5CFdSlqi1P
	 XIsSoInJvGf45wpUvNOidR7iK4v2YNv8Se1WToOfWjMZrxDlmuYLFKRkWZ99r/oNHRs8a
	 h0GhIQId16sMcVP8gQPQE8QNU8s/tRFpPNNDxyIDL6vMynH7XFj7vlhf59Fh1wzoyf/fe
	 SDz5x5ZPHLzUIsTOjDJWEBEDIxriQML+Ka3FLEE+L2k9hxlikqZxCiUEQeonmL+MUU8na
	 z3+nOyWChAj09wEQ4jCH/hXpi6iTGuyEnfUl4CAFLew730hEVINlxcNLMK3+6zPflrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
	b=aTuPPMQlQ7vH2IXnflD+43lR4+9y4XK96ay2MboMoBjL8zG6TxHhgNhFyWBREYWoTn4Q
	 QcS1NfJsw6zhwE82XWeHXbIUamFurQGGCXsNae9nxMrnxMXJQPtrsVvq+dnW4x9+yr751
	 xkuSHUBUSSlRi2JzYezRAlNJRr9v6+ujWYDAPsUc23S9p1J78O+hWPV3IsBVmx+8ga9uD
	 HLHxp15IyoVg4eFOzYELTHSQrOBG4xhBX6MKJfafwIEPgvWHgMU9lMJgcdgn8wHeVd2gr
	 yAh1AB/bOj2XN5wxF21vsy959VB8FX+dmvU4FzXk6k1O8Crs3NqWLR5CeEtKMvunlDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MQJaXd6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83B1606A323
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E83B1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MQJaXd6Y
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2043783a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 05:01:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574881; cv=none;
        d=google.com; s=arc-20260327;
        b=rkMYIaSp56Jez33BFmJ8gYePkcJRZq1JOhi+qZlWpRFMellhKeS2N8qKaVnBahun7i
         50m9m8DwmdklNuS57KUyf3yUHW2Lss/qffJKRUtGlaUKlCqlU7QxvqtP6RjDek+RrxW7
         E2jfuDZH8tQ96BnjM5nvz5iWTGuAtHjdS5pFwK/BVXbostUculD6hiegpdTO3pmpRpiO
         uBY3HZZqmhLOBiw3KNnkqsNH56O3i1NGVpffc1PAVCF6jNwCy3tPfXl4+JCIS4acaI7x
         a3p6pHXC5684+7d4W5gly17nRDl8JkJGKzTKAR1x/A2Sk4S0Kgl8A60EAI4AHwkYlvz0
         1VVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        fh=RKPdqHNMgyG1s7m8pUWmWpkX66tPxWDpiLJfDu3WqkY=;
        b=lHyGoNGBKzVJon9FIF6HkDIT87eMEuUSiZfBH/3VkH9hoyRwK0a6f35H93uzoXz6jm
         K8tUT+IiDJ/kZgXB9TViIXG6Y+RPN/bcPiVh80jXV/jmnzcZ+Aa0Yy6VlaV7+Askr/K7
         pzYmjsvFUe4bUn6V49JUi3I1bqsMDfFH8zgeYLDJoYjz97QTXb2RPLLQrcSEZs40oGr7
         8Z7lIP8bwAvvGwRN0Iegtd1YFf9dFqKrqvR2KSgowP/POiUE213nYIrrNlL9GevM5HZa
         44bPqebKtSVh/Nxp2HD6l7LxRFwze2EGmWxXy2E3aXlvW8Ka4YoP/CogjUiE8fKCzYts
         1FmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574881; x=1795179681; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=MQJaXd6YKRL3+jL6Uj5NN96CNwxl3sZHlJScFPSK0J7BOSDoGA2vh5ElOAO11rI60h
         onBUy6vf2FZk/6Q2PYow/u/817Ui+QGZ+BVMKfxJ9Aw1j6o5mxRxw226PKd3ySoN5W4E
         A4tQHaCY8lJjN1NdLW/Qrv+Ux+kT11fIJ8x9QXwkiFgL1rxDC0fcevS/gtg++L6Bbgbi
         qaei+0mh8tnJCVQA5JS1OpYyKpgRTVsOSzaYIrLq9VgooIS5bpweBl/95jlN65c6qXdI
         RyJQ+nZLlXFFY5bqK/iytO+V2G8O52BAsQrRO/YqwvIg4lfU+ud3S0iLEzM7Tx0o+iVz
         AUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574881; x=1795179681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ywPc1l09QxhJDqxQfGcJwVMg9RdA5INvScw4QBFAubA=;
        b=gEb2rR7YOQPCqVzn57d1/6KIVb5BtE2NL18hLTB1KS0cMeK5sB5375NhdCeVvUlebw
         iRK5vkitSDeZQQU+gwFAq+2kc5O7yXoc1zzmPWcniXOob6QpcTApVqFA9w4KU7uC5sh2
         4Nz584SIrAWTtlEqumFMJBveIJDofrUKXadoba53UerTx/UlTnfHzjCcZwlh9yCLwbHd
         5bxOWaNt4SdfLH+H20CexS1pCgg3JRrUw2xWYvRwqkirY1bG5E6TFlYGVjYEv745SzXH
         STzNfuSRlHNMwlvEWjG1qQdHOAtTw/Xi0RCu6QX40aX49Re/w8R6eceEn/29D2kZo5jA
         OgrQ==
X-Forwarded-Encrypted: i=1; AL+hErGvBj1Kfq8L1IN68nq5gqq03oW8o6XpMJqZj11ygVMFVrnmBcL7vki+a/2pNZkrUYI1JKKsxNzriy8vXwLEi8lp5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z98764AtGuY0lV8sKHl8DtaggbQ0l4ZMHlbW4Z1HaUj6hSXyUsS
	6/YiFwRfQ4QLTH8GEv7nShLhMvsxDfxKu6Qr2touc9OCAE3Y2lTJbDPJc5P7q0jOudfi8NgskQ2
	HdR3QTjIWLj1ouI0OSgnONhcERNllAW+B+XqpxHop/Q==
X-Gm-Gg: AYBFou390cGFSI1Y3t6KAYSGYjxW9+XQtyLMpWE8E5sxnXCd3QHGa1e41tfhLIGcRSo
	qQwED47e4bIZMvQE1lkLHz9Ncxe0rU0UfC3REwUODj4aGJIwds8aSHWztKTrk7Z97QDVNwBftDi
	rKqBC3e9B77+OyCPj9C5ndito6iF2aoPkU54g1AIiuzfYnGjt59jkxcLF7rwsgp2qTJXLVK50he
	PtR3yhRpKg3AuWUb+dsaPWyYgc+bFw3kwvPVsVEX8tEAW8p/yAxa9OtALB8PXbA8kDrLlo77ooU
	Nt/ImVkAc1QP3rxQHGuyssV5D+4mysbZ+udsLMRXxDSlMA3rVgyfgdlGXj+wmNVO3lgIoeNoEeU
	oejG1EjyyLmmmWGl0OI4zOEYiu6anzAr0xeYACTSSTLeP/yEXM2xxStPu5LMsLxH2C8uGag==
X-Received: by 2002:a05:6402:4413:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b7c0d144a7mr2186142a12.43.1794574880970; Fri, 13 Nov 2026
 05:01:20 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104906epcas5p462308ef9eec80f8b7a5f81b64e72b24d@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-14-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-14-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:09 +0000
X-Gm-Features: AclHuK-DofCQ80IZzIK-whDWDx-7N4O3mu6ydJD4FcVZrdGUzptZd5Yy1pZ4bbc
Message-ID: <CADrjBPqormg=jcKYZh5q61MiwZaRB-ZqtV+R2CFNP7o6Jd-SKQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] arm64: dts: exynos8855: add cmu_hsi clock
 DT nodes
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add required dt node for cmu_hsi block, while at it add
> sysreg_hsi node which contians bits for DRCG and MEMCLK
> which are used by clock driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index b461de6a7548..3dd7a4c4c609 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>                         interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_hsi: clock-controller@17000000 {
> +                       compatible = "samsung,exynos8855-cmu-hsi";
> +                       reg = <0x17000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "ufs_embd";
> +                       samsung,sysreg = <&sysreg_hsi>;
> +               };
> +
> +               sysreg_hsi: syscon@17020000 {
> +                       compatible = "samsung,exynos8855-hsi-sysreg",
> +                                     "syscon";
> +                       reg = <0x17020000 0x10000>;
> +                       clocks = <&cmu_hsi CLK_GOUT_SYSREG_HSI>;
> +               };
> +
>                 pinctrl_hsi_ufs: pinctrl@17040000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x17040000 0x1000>;
> --
> 2.34.1
>
