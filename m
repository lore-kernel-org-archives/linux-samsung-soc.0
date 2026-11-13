Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574794;
	b=Zm8pFREC+Af0+GbqO7HapRNN0zaLbIqBM7k9cShZEzRHGsq9bE7Fah4VmBGHu1gSVUKv
	 wEj/ZUXqiW332vEYiSB/m2mcsv40lhc2olmZ4gixRY98LmFX/CtY0UG2DqPpFyIiguFpg
	 1+yUC+g4z6jO6yr7Y3fbmjRGsoHJj7r9rRmXGmar2eCjdIRrRwTX5/Esl9paXeb0IyMuY
	 Vyyb6xcrwMRcNKfnXfX5cw2KiUsXQxCC158wb/Fdn9NCEn2Y+2p0xqcG0Nq62u0pofsiu
	 JHZluh1lcwhWCFayiQiENhU4q7ZK7asgO4DCHKbZef2U3quoBG0/nD5R3tLfdVmlZOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
	b=D3Kx2N8ElYZANn1AUInioB7RycMqHRVGXHnwsCv+DYNe/KIuj0lY4wZlR9wLbadDf1i3
	 ++0gkm/jUQZfl08uAtv70Bz4NFNhzXtauYucs8eXbN3nwS4LHZv/c6uaPfJk30SDDt6fH
	 yO9atq9Y998yVJymY4FAh4exKDXJRqxgZ3wHXKtflq9xspU7nhjKDnI+Blhk3YlgtFzpA
	 4X7e9K7F74OyBf+84WCORltNvroMJn5AdTEkmifwbIkUKkZpLWfk/XhtnpMyLDlgvby10
	 xP+k9PUBb/Ca/DsGagMWG+0ARk8r9YB21mI+S8pbyRgDN5w1l8wc+cboj1QrDDruizw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7B606A327
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 12:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D7B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AkroMdRT
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso247098466b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 04:59:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574792; cv=none;
        d=google.com; s=arc-20260327;
        b=jXZPkPDD+Bn2EpvMZfYgwB7bm50zX+198fnATQxspXrVH0HfiusuSWYGZ2Tdfisk/T
         NGfp6xCZowlMvXZWeYEpIC7nnkm1vFJaUo4iCzEus4QwHa2xoqc42WkvdUYKShVj7NMS
         W7eXwBHJNIDoQXR4MUPQeYMJuEzW1lX7PXw3tlTH0HeUW9nmsJZUSN/ywaP3FMe9kauG
         wByP1xG1YKvC4Jmj3BOhXip1hu8QhLHeQy1w3Xl/eVy+nzA2l+fOxqpiAl0i309IOv03
         HmUjvpsH0LunFJgKZ4dcNRKfDlcWwqXxrGsvV28mYy0yVVLcX393s8JNJoUp54eQ8+L8
         PgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        fh=1NvBlbM1ZMn30U7SS5JR7jc9uPrXDTztaU8W1pQSyIQ=;
        b=NjSRxGJs3+7P5h2sfT2PTo/dF8xNbV+zOmR3Vep3vccrLjm4c8FHLjp5T6A2AfOlq8
         jS3IskkyQMVnv7C60+a1FYS/spcv77eTXJv9fNkJz7e94ul8z64x6NRsJXvxmO1CPLDa
         hMKEZzuQUokSxycZtbtvRAB86UGiq11u6yLjzzYfcGuyUGjDHtBGk2dV9B0O+flCZHlh
         zgLo0OhAkPY4SwDCNEOSZqbvl/jT4mkmka1ozdWUrFRbyfsfuOiIULomKPtYfErOfs2L
         zXleHCEam4UaiAy2hpZR1BQt2dO07f/1Omrs8valtmpITXEXpHxIh/BUnwp/pDkkmcVF
         9fkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574792; x=1795179592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=AkroMdRTCJEU56zCl5mRMi6rrvafd2Mh879g64RVhOfD34YxgOzOtrBsT8yx4NkQl8
         gSv1yRzVbhdBh7graboeUHyOjVxnWYWXqTxrq5bwqTXLdODgtOJ2GOfvja1i9wZBs4H9
         fcb9zmhVDOC+WUd7SGVWyfxFQP93w/xQqb2FnisylYb2rXsRhjc4CRnja+NBnS2rKhXF
         cLontnuKm89vJ8lgs810EU0/SMd4hbxtRDKKGG1T7m/yNzjT4qqUkxsmm7hHJo35Whfx
         tDrQsm7X93e0qnvrkO6hPhp7RxKzDVtK1uhz9g5bxTs3CjlOANpOM/WN/oFPwtcbJAz3
         hkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574792; x=1795179592;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bTBnO03FVproqb/6aEaVwSKFkOKpvQT6/xIPPhFQktM=;
        b=L8c1nylvmU6a9QUZ7P/HMF8rraXUBuyMWuRSA0uPvqAaK8GcEe3Cr9HUO4f95BFkjU
         ILExNaaSbiTO6r49GvlothJLXKkdBt9YbSPPlVK1YHiQRVkxBtPyti6rRGz0KAWLagbt
         OXtpOOclCjh5f/3Cx+YKgZckLTxHfaO4o+oyHNkHIO1vnmPNTHLgngrdbC2f296pRNed
         N4DmChMr1u+WD8HmHjYY7nIN7HcBGvCf3Hsy1WeL37UzrsDr3VwXIPlONGBvJ/9qr8NO
         oEhxAYLF1Elwn1WYuQ2/mXUbqvV2l4Cpmu5KwFQoy/GyffR42nNeEjePC5Q+S2Wjg8Qb
         YwKw==
X-Forwarded-Encrypted: i=1; AL+hErGmUx31w7d7MPFHtTyB2CR1oNLKzOAtcQsXBmKpCpSJaePPDPJKdWLCLHEvSk1BEyXvPE89zK6Q9kdqMPud7TxvRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cKZq31bNFdnpfw8oahfqSAd8Gcd0XCc/3Kc4uWy38sy9EGMHT
	RPSGRHLdZXRsb4vvzd4+riZEqKMZY7y35EI98z1K5Fwic+d9aef2lZ0oSjwZbWHTATBZ0BQ1DK8
	0gTb28B1ZRlLvWX0iDYyyVPrwV7PZp4Tnh8WNJdMdxA==
X-Gm-Gg: AYBFou1nTM0IKX99gb9Wa4T8AT3Pp8jafUFXTuBGk4bEg4reoK9Ue9X/QD6lZD7v6m4
	En563EjWCY0qvx+wGBqSjq5em/s+vD4G7gmvPNR9kzlFAVkHp81p53RZxkjF/iovyNe43XApZiT
	aj1tB2RXbr4ZPDTlp6SXkNNURu+SM69lK4Cteq4mqWk1lNGE/OMKTjib2LyPelJhmL2HMXFwl3i
	fO+Fv8N1xDYhL6ShaKlYRdbsN+QPaqgfLx5IoH1z6nuKdQh3mzlqBdyRtQRPQrpuph8cPD+va0d
	9shNpFBtxWjNIGSXw0RlUsiymIKYWbrTilizfgg2r57QSR1Xb9/1as+lK5LK6BDW3jyxV7rw8lX
	N4OpLWmiHIjT/9jowjVMbwPX5kb5mKBPgnCGAdKe3FEpj5iXmHZgOrLZATKeynoAvtdqnELk1Bi
	Ko00wbzyFwrs4yEaA=
X-Received: by 2002:a17:907:3f9e:b0:c46:ca2b:84ab with SMTP id
 a640c23a62f3a-c507bca4549mr587358566b.13.1794574792499; Fri, 13 Nov 2026
 04:59:52 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104901epcas5p26c1b8e9a324f133216b7980ac7ded44a@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-12-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-12-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:59:40 +0000
X-Gm-Features: AclHuK9cm82mhKCf1OM8U8MOAQmGsMU4pcM69WzWfUaEMzCzm0cQud7ofsYoc9E
Message-ID: <CADrjBPpf_-pnzQRYrpqpzWUewgF_U5EbOA1CJprnH1XzQoDuLg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14 RESEND] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
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
> Add required dt node for cmu_top & cmu_peric block.
> This also add sysreg_peric node. sysreg_peric contains
> DRCG and MEMCLK SFRs bits which are used in clock driver.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos8855.dtsi | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> index 0333b80eba84..2e5dc79d66bc 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -10,6 +10,7 @@
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/samsung,exynos8855.h>
>
>  / {
>         compatible = "samsung,exynos8855";
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
>                         interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_top: clock-controller@13900000 {
> +                       compatible = "samsung,exynos8855-cmu-top";
> +                       reg = <0x13900000 0x10000>;
> +                       #clock-cells = <1>;
> +                       clocks = <&oscclk>;
> +                       clock-names = "oscclk";
> +               };
> +
>                 pinctrl_usi: pinctrl@15030000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15030000 0x1000>;
>                         interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
>                 };
>
> +               cmu_peric: clock-controller@15400000 {
> +                       compatible = "samsung,exynos8855-cmu-peric";
> +                       reg = <0x15400000 0x10000>;
> +                       #clock-cells = <1>;
> +
> +                       clocks = <&oscclk>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +                                <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +                       clock-names = "oscclk",
> +                                     "bus",
> +                                     "mmc_card",
> +                                     "ip";
> +                       samsung,sysreg = <&sysreg_peric>;
> +               };
> +
> +               sysreg_peric: syscon@15420000 {
> +                       compatible = "samsung,exynos8855-peric-sysreg",
> +                                     "syscon";
> +                       reg = <0x15420000 0x10000>;
> +                       clocks = <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +               };
> +
>                 pinctrl_peric: pinctrl@15440000 {
>                         compatible = "samsung,exynos8855-pinctrl";
>                         reg = <0x15440000 0x1000>;
> --
> 2.34.1
>
