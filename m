Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07C3AD501
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Aug 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845551; cv=pass; b=UM+sjsjdaCquioIZLcBWs3clqWafqkiDXEOjNQJDvVHN0iXH1cZXracd4WLbPV631JG8TnmaRogx+pTkXh4KzZ///uCECBnFDgnWkCC6mAvIktHMqLzPdTl3J4HCRE9Vn/eoE0U/GOqkA9oNVEM0bGqy9NcxzCYupQ3jB65OFzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845551; c=relaxed/simple;
	bh=mAKg5cSi9W/mdd39Dtr4w6gDmKqq2ZSUQO17r311Jh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8ITcO71r/c1OA/wc5LUsIXNgunqRpwqMe4fitIol1RaASfOniPuarSsVZTFszj5G3CgBCeBi7JYUQtM69qG7dWfH7w2tmqvj/QkGZKhk+/wS15qW6GgQMaMpsDPvaDOdIUeGdSGreOwCRPvjMeN0vaYui+koUK4pWjHfcGl79Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2CcgF/C; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2CcgF/C"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so4722712a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Aug 2026 05:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845547; cv=none;
        d=google.com; s=arc-20260327;
        b=AXTDtAkIt4gibKupQAdJPm95vzR2gKKZDmrIi7SIss1qtBTew1oGWcXEg/IANfJOnx
         JLl56KJff3ut1gRLWNOOkCk/ye5TmRHDm7Bh0Wewqc2JkiJH725NgJTCcZpSua8W9rCw
         NU1Wyo1zP0Ziw8Ajori0vHWzU5OU6HHrk7Lm0q+/xVtS8HYS0/9HIq+kJtkDkPmC7PK9
         2M9MaKV9rV3/MyJ/q6jMxV0AZv6F3iTOhxpZRckro++xiCVaV1SeCJS2nbbLO6Pl7vOu
         B+rnsn0PvsqsPrTQXAibAGpy+qxnh/V2E8E0HxE22TbChkE8VQzDNUjjpu0Ud0swXLNX
         FUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        fh=6Ef+hHqKwRck6KopfrYSFuNo437UIkaGCzVF13n0yLU=;
        b=tD4/4+It0oGVdEJ192i6CXpev5bgDcgBpbVSUQhmwPEqFgKT96vuFEFB4mGic+nkUg
         tkof5QfipoF3YEiYKwRjpb2l/NLiuWjU0eCXHzKvavL+jf1/YfZnzPzDL9ZOAXStpxZ7
         HiI0klVkVK466thqH86DaHi96qhJ9jxnd9nYPc3W7VXTGmNN+eA4hPKbUktIsg0V++pQ
         0/RuhPHNEceiaBJSu1frPZsjy9uUFmCUP3k1+t3F+1w84mMUq3OGJbuHPLnH1JyCL6/O
         IPoDJ1J6FfxtBLn34TPnb5yh3PnKRrcwTax4wMR9g/Dbj1k3Leef/VLfgsyFIDE0qeMG
         f1Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845547; x=1786450347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        b=S2CcgF/CcbzqTqtpPkShWt0Y3V0s1qlWqb9G4kWJdQ9yxuk9EwOtRyA50P3EzrhwOc
         3lQ04tqoxhU5AqR5qG57Y7rnGHW18VIR3t59CAaLM19nAPRBLNISJ+JuqRbxxAaTlxnE
         xypoc4u8w9we+ZqBAzYLKK3dfUlYkQBrPS9gq57WgJ+F+zs3u8jbU35BQdBcyzwk2OGw
         r6lhl738uAk24piJ3vJtz8kYv2BMbWAjq9duI9FcnlUzuolwgehJP7FuM9Pr9mMZqJOK
         Z9RsRjN4bqxrbF3ZOEXbpSCvIIPpIw2uF1r41Wjso9qRBhU6XMte1XO+hf21ReDyk5uz
         V3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845547; x=1786450347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ps1gHHJrXc9fjQgxn88Rwh5btQNAsYSwAkouqgeIro=;
        b=QBCJxNtW1JtWj7/AH4Bt+MXSqWtuRWaEAvLBHsXzaLtX052pCoK7jnY7zXZxD05def
         n4KifMQkr7xQeg4zg8+aHCTq/RqoXTcOoW81/uNNqeETToDZl2ZCjAdXs6zCH6271o4h
         VngIyqRZCUWdq9cfBLLmZy90pCIl0KQA9DTOl9UrnmjMB9gQKoBTkBA3g1iJwq8Q2LbB
         rt6Sl9//hUJpAaShcAyuEXE/6jGIh2GddGuXw4D+1IM5XSPc7vCA9fUj9Cchh95nO1Je
         YVhLookSxzF0lTbES8cIogU+g1WWYV7zAyqZHazmNrICT9Heuy/yQT3GmRD5PGRZl4fh
         vXBw==
X-Forwarded-Encrypted: i=1; AHgh+RpcX7tuGUf5G6vTX8P7p1tdjRPqAdQkUAcqQTFw74/3BQepui3rbecuUaMMpKkYruqn0Ax5FcYcga3u/IuJHQQ6kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzOGDYCqoiQr6tBiMMFcPdH3o0IOok4V8iMSrOEnPZoU7LI3gZ
	f2Lx3cdmVBCKnDpcJca60VfJPhl/Dr1VzLZQsgkRleaim19WqZ960SmVPuBxhqA6FfnEz/kivWz
	xH6la42m62my2oS/SK2DSm6zPFHHCPwxSoRXFbrgBzw==
X-Gm-Gg: AR+sD10VfIH3ZiN/nqoDfqrkQOajENhnHPlnB7KVaVaheOzBATw3jPwfuULc5MODBoe
	T5JlKhuurED5eeocX+8Oxr3HTmv3GaXTghAg8J36y8ubliApT0O2i1KbwJnS1OoLf4DXpMTs4O+
	xRhfOkIXNc7xpUsYOl1X3KKYjy6cf8M3UyHMsODZ238+CLZyqG/yGMP3sVYAiqB6JhynJL3JZvg
	5ET5/C0IIGKc7UjfUUomwR1zr2ReL9pGfUhrVIAil2yssMWHVZf1j1O37sYQFns/v2TE3Xe22Q/
	D419KZwVow8FpXCQ5edjkKp/imnnrEUIQdLLGNPrnmYYKJdJyimgfgPtn8Zbvl4syLhSnSRBegb
	MN9w=
X-Received: by 2002:a05:6402:5bc7:b0:6a0:f9b2:4d5e with SMTP id
 4fb4d7f45d1cf-6a0f9b24eb6mr4339426a12.18.1785845547188; Tue, 04 Aug 2026
 05:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:12:14 +0100
X-Gm-Features: AUfX_myz2rIr2To8pMiIrq3ny4dPMR2EiexQ93XXgjZCqitEJdVPlOyQLL_LX4E
Message-ID: <CADrjBPoaf7-tXMnvQFZ7fV25Lb8R=95PgDqbkjDBDT+XadBfHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>
>   [required-blank-lines] "status" must be preceded by a blank line
>   [property-order] property 'phy-mode' out of canonical order (should sor=
t before 'status')
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  6 ++++--
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/=
tesla/fsd-evb.dts
> index 9ff22e1c8723..73b6a25e0e4d 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -65,9 +65,10 @@ codec {
>  };
>
>  &ethernet0 {
> +       phy-mode =3D "rgmii-id";
> +
>         status =3D "okay";
>
> -       phy-mode =3D "rgmii-id";
>         fixed-link {
>                 speed =3D <1000>;
>                 full-duplex;
> @@ -75,9 +76,10 @@ fixed-link {
>  };
>
>  &ethernet1 {
> +       phy-mode =3D "rgmii-id";
> +
>         status =3D "okay";
>
> -       phy-mode =3D "rgmii-id";
>         fixed-link {
>                 speed =3D <1000>;
>                 full-duplex;
> diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tes=
la/fsd.dtsi
> index 5b06e2667b89..214d33ca7177 100644
> --- a/arch/arm64/boot/dts/tesla/fsd.dtsi
> +++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
> @@ -603,6 +603,7 @@ serial_0: serial@14180000 {
>                                  <&clock_peric PERIC_SCLK_UART0>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         samsung,uart-fifosize =3D <64>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -616,6 +617,7 @@ serial_1: serial@14190000 {
>                                  <&clock_peric PERIC_SCLK_UART1>;
>                         clock-names =3D "uart", "clk_uart_baud0";
>                         samsung,uart-fifosize =3D <64>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -658,6 +660,7 @@ pwm_0: pwm@14100000 {
>                         #pwm-cells =3D <3>;
>                         clocks =3D <&clock_peric PERIC_PWM0_IPCLKPORT_I_P=
CLK_S0>;
>                         clock-names =3D "timers";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -668,6 +671,7 @@ pwm_1: pwm@14110000 {
>                         #pwm-cells =3D <3>;
>                         clocks =3D <&clock_peric PERIC_PWM1_IPCLKPORT_I_P=
CLK_S0>;
>                         clock-names =3D "timers";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -681,6 +685,7 @@ hsi2c_0: i2c@14200000 {
>                         pinctrl-0 =3D <&hs_i2c0_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C0>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -694,6 +699,7 @@ hsi2c_1: i2c@14210000 {
>                         pinctrl-0 =3D <&hs_i2c1_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C1>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -707,6 +713,7 @@ hsi2c_2: i2c@14220000 {
>                         pinctrl-0 =3D <&hs_i2c2_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C2>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -720,6 +727,7 @@ hsi2c_3: i2c@14230000 {
>                         pinctrl-0 =3D <&hs_i2c3_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C3>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -733,6 +741,7 @@ hsi2c_4: i2c@14240000 {
>                         pinctrl-0 =3D <&hs_i2c4_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C4>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -746,6 +755,7 @@ hsi2c_5: i2c@14250000 {
>                         pinctrl-0 =3D <&hs_i2c5_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C5>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -759,6 +769,7 @@ hsi2c_6: i2c@14260000 {
>                         pinctrl-0 =3D <&hs_i2c6_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C6>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -772,6 +783,7 @@ hsi2c_7: i2c@14270000 {
>                         pinctrl-0 =3D <&hs_i2c7_bus>;
>                         clocks =3D <&clock_peric PERIC_PCLK_HSI2C7>;
>                         clock-names =3D "hsi2c";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -789,6 +801,7 @@ i2s_0: i2s@140e0000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&i2s0_bus>;
>                         #sound-dai-cells =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -806,6 +819,7 @@ i2s_1: i2s@140f0000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&i2s1_bus>;
>                         #sound-dai-cells =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -840,6 +854,7 @@ m_can0: can@14088000 {
>                                  <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -857,6 +872,7 @@ m_can1: can@14098000 {
>                                  <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -874,6 +890,7 @@ m_can2: can@140a8000 {
>                                  <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -891,6 +908,7 @@ m_can3: can@140b8000 {
>                                  <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK=
>;
>                         clock-names =3D "hclk", "cclk";
>                         bosch,mram-cfg =3D <0x0 128 64 64 64 64 32 32>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -909,6 +927,7 @@ spi_0: spi@14140000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi0_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -927,6 +946,7 @@ spi_1: spi@14150000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi1_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -945,6 +965,7 @@ spi_2: spi@14160000 {
>                         pinctrl-names =3D "default";
>                         pinctrl-0 =3D <&spi2_bus>;
>                         num-cs =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1007,6 +1028,7 @@ ethernet1: ethernet@14300000 {
>                                     <&eth1_rx_ctrl>, <&eth1_mdio>;
>                         local-mac-address =3D [00 00 00 00 00 00];
>                         iommus =3D <&smmu_peric 0x0 0x1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1026,6 +1048,7 @@ ufs: ufs@15120000 {
>                         pinctrl-0 =3D <&ufs_rst_n &ufs_refclk_out>;
>                         phys =3D <&ufs_phy>;
>                         phy-names =3D "ufs-phy";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1056,6 +1079,7 @@ ethernet0: ethernet@15300000 {
>                                     <&eth0_rx_ctrl>, <&eth0_mdio>;
>                         local-mac-address =3D [00 00 00 00 00 00];
>                         iommus =3D <&smmu_fsys0 0x0 0x1>;
> +
>                         status =3D "disabled";
>                 };
>         };
>
> --
> 2.53.0
>
