Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574910;
	b=dtzge2IlgQhTwfuVBtWCZKPPcKMHdrQn02SC3M0fi/DvvMdZF/DwLUin+pG3cqj0pLHV
	 Dt9vJvV4age8xDJTDQC/XpNFo+h+bZ4EgBnlxC1P2TzX0FmzORV02VUYhplu0GH8psRh1
	 Eb54roXEbWpwHzNJsPICu3onDZXHf666j/D0fBTKZyHJ6UjP09JmYSebg9KWrwUC8dp3c
	 eBdcTQw266RrswnbdjXteD96dfwfoAnU6cSFnk3NTnsJUydL4rTToFBCzFbsN3o4lBxbp
	 8VaEPp7zecYGPfM+DJmTWtY7O+R4KEd9iF+eSK7fpL2sNTYRWRowIxqJMwb9I5iUz9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
	b=07QeKjuTmK3Z0gSCZKyL96oz7HpHdNmMWNVa/Dg3hl152Ppu5CrbEPCWsYtGlf7ohf7F
	 Nk0L4IgYN1HADP7kc+lZZquKNBBvrle+ou31zDoRjyzulWDvKua5yugFBPrzZ38aFdt/a
	 8vAuecORV0EPUeI+vf4CwN9jKSxZ1syuuoFqD2mBtze8HIFOyjwj/cNS2+L6ggjVN+//n
	 W/+B4jjJ5fMaTvUk/W6K4shARiRSLdCFgosOYYGdzZonVuR8CcZx8IrNj0o7yeUCFnQVQ
	 ARoekMWigMJidXFRRVUeyg+IllI9xwf/Xr0M76tBA8jph4LnveUBUs40mlu3t+hvePA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FC6606A334
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FC6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yg2aVHZM
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so2066958a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 05:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574908; cv=none;
        d=google.com; s=arc-20260327;
        b=GSqe9EMjKf7F9jUBe8Mg8bcsC+6Dm1EtUxUbNqQ6EaFoSS/mguAvif5zMcukcNXg1I
         5PoARVfjHnqRJzLZ40G0rHlgVwG4EgwAZIDdV/6mqcpYGsG7NM1gvz9FZvOQmhTbTXge
         9qBCkY+NmHX+jhzl0u7OqHtzZucMNwq4JnHOGWC4/jHxoZySR8wDu4n3fyriYjpepQJF
         +hTPRJ6Bf7mWPCCUYYJugbhDvmgpJiTO4l1393mIF9ihh4li83sjANgDPZQSKtzaRyIE
         UvjvE2L5YdMbQDBHj33m6Vs/GMV3Cd072YKuZJTOasaDcLPv3Lnc9kumdNP+xXojGym5
         qIew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        fh=5zmW22PPmw4reVRODbqIPkzjr+xlIdjV4L5J37ag60A=;
        b=YlWej/Maxn3/i22QBEI1TnrQ+b60cwoXQb8T69NFYDTyD1lE+7NSWOLW+HWuX38bFE
         Oz0Cg53Z794Bc03n5s+3TfgrjSuUz84Do/AwAtvHuKz6UuEuxYEaRmYV1dfB7vkyl+3+
         f1apiRrvjF/jU5ZYT3xIlWIuYVs+m2YDnTRUrwqrsLssF97Fiecq9OnfcWY1twspTSEk
         If6buH/owYezklkoEAs4kt9Mqqv8S6aMH0B5M2ex1Mg/37d2IW4nMsW8NDuQJ0yYj5m5
         Q+8gO33B9a+d3YoRl9LFGWPb7byeYmxYzKSjj0ZuZu/dLkzBTJOkZM+V7bDy09AlPjHX
         Uy3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574908; x=1795179708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=Yg2aVHZMqVneHiwckm8fshswVKEjDDg3fGYweaRCKQ1LB9kEeHc6ZUBTWrZ5zrajdJ
         J3NPx7N1IBwiFn3kf/z+OWrivkdXO3HXB3dfv5rj+U4TIcjbk6cYVuzy+P2MV5ekJJwu
         8mbKTjvtDFhdMaPe73boK5BYZG2vc1ztHGioC7fHt9PF4VWSHzLLJGHNtTIXK4kQHSE8
         G/Q1J5GPEhayhXwyaqWCVR6Br9Mr5QQ4Iym9DA2hCmJbB2UfCfdQ/gNlywTUKQJ3Dmw2
         1GFDfHlzu1UeX+VxcENlq/ApQPoKOzw4Nqa86TH8RiHalCLTxsl1w6jY7JREjRcZ6tCg
         HZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574908; x=1795179708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q8FGB4086VuPZeeikLpOs/k6Gqozfd2JXZ+7h0mLYa8=;
        b=dfui3lSBGDI8HBSDNmWlfUT3IHPYcLMvnkgLBVMugmxS0Z3joqh8wGJgk8YC/bbyte
         /KDAkSxg89leO81aPR0dQwfx+coXLuVLCCC5qxYDVK5tQ1H/I+PbwbEdNOXm8bLeyC+K
         QXC4SIFjDpCPy+/LMD5cNEmB50LP3yZRnKuMc/eZIDAXuwvX0Ob/rrSpWmiqKZQWUGEf
         IskKex6PFwOoee2y+AO+BeyUdtWHUmtXLfzz7P9t1grTB+eJcosNqOytdUZwf5iSbrc5
         CUJPfE695mn3DuKELMQ6GdCr6NTt1Z7qNh5Zw/KWx1UB8PoQLAUoydxJUKlH09KFMesM
         xIoA==
X-Forwarded-Encrypted: i=1; AL+hErGtjvqIYB3S7LMk/qclkGZUPuwiCJ/8rqmWLCORrh6VS1wzgLmhfwBRB8mq5Kdgh7vVxEHjLTHZcJH7TOZzQb8GXw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cUosJF4h2YLWaUWSCLP0mgIh28qkf7U7rANvnJn82UDBWSE00
	pdcbK+ltTcqdpzKO5xBu3S4rsQf0suVk9ZoQ8kOUQm0giiLQtHHqd2CBoVtMro5p5/ZUcZUK5YX
	iasxMScHJMfkny3STPrjI57+t5GjT4enmboz6cSOCPw==
X-Gm-Gg: AYBFou12E9jM3ebqZ4lLw6I0mEC8lZwrqq3Dv7AlttokqXULEHmWKFbw7deAR75eRs1
	gQnJJn2Abg/44ode8jVP880K46EE2Z96F+Y2J2zIwLZyoViaCfkTiW589ApMeTM/weSZcMaKJNe
	5plj//2u+JXQcqkZUV8La+sXE0tiZY4twxeD5u668ixAyZEGeAuQGCNWvrzhXFAOkLn5UTLPTcV
	AS2dImV3znxhechOgG/VSLpjqBCGveyh4aoLXISCkrgpC9Jx4N/Z49ozmw+xblRISTKY6MztYpH
	Q7CSJfb85TzaZrP8+KIio3VB7T2nsRADnOiKsgsJjcgGZ0cQYPyoD/qd3cv93Y/lX6R8j8b6uFM
	57UacqTgcQ/MTeelQdHMBQTkm3kpP05LA1s+whC8QBqX5PcNGOoAKPMW/jkOeQnHgDa/C4w==
X-Received: by 2002:aa7:df02:0:b0:6b1:e4cb:a23e with SMTP id
 4fb4d7f45d1cf-6b7c0953c22mr1651047a12.14.1794574908159; Fri, 13 Nov 2026
 05:01:48 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104909epcas5p1d1b81b4e800e8a1d1cf830f21e52499a@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-15-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-15-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:01:35 +0000
X-Gm-Features: AclHuK9jDSyMiIFILSiBUttwKXmQ1n1NCQzZgnrbYNenJcyQXOWeJVgUA5tGPQ0
Message-ID: <CADrjBPrA1WZO_7bjV4jbOGB6MRZMG6=8UTTAtf-v_ZRq06MxpQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14 RESEND] arm64: dts: exynos8855: add cmu_usb clock
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
> Add required dt node for cmu_usb block, while at this
> add sysreg_usb which contains bits for DRCG and MEMCLK
> which are used by clk driver
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 3dd7a4c4c609..dcf1e58c6367 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -192,6 +192,27 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_usb: clock-controller@13000000 {
> +                       compatible = "samsung,exynos8855-cmu-usb";
> +                       reg = <0x13000000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_USB_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_USB_USB20DRD>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "usb20drd";
> +                       samsung,sysreg = <&sysreg_usb>;
> +               };
> +
> +               sysreg_usb: syscon@13020000 {
> +                       compatible = "samsung,exynos8855-usb-sysreg",
> +                                     "syscon";
> +                       reg = <0x13020000 0x10000>;
> +                       clocks = <&cmu_usb CLK_GOUT_SYSREG_USB>;
> +               };
> +
>                 cmu_top: clock-controller@13900000 {
>                         compatible = "samsung,exynos8855-cmu-top";
>                         reg = <0x13900000 0x10000>;
> --
> 2.34.1
>
