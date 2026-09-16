Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D5F4137AD;
	Wed, 16 Sep 2026 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591979; cv=none; b=EB+db5su6yoJOQUiUwbW8PFjmA8w6uJ+Pvty7LeWSTpbFqJG8kog5W1+OYDqTdGbv6Q9SHK2Cd8x2kKcCn50V/AsahB0f0M48hkAM4XhEihdqKU8EeS3ZJYEOxblTJ0xFkM3QbgldX7NwDw3oH7Ie0RvgBlhnVFWQHbTlZB2VXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591979; c=relaxed/simple;
	bh=GDTfEHCEYdoIiSxSM0zHJqljeJs2e/1qoXwchI9YfPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQ9V6NMFXfEO/evrYwJLSxb3Jwky3phE26AWOGO4Xhwb2ymrbbYtHHN/pzmlCIIBi8FU5+oV9F9RwxKTflNWw1natwPlzOP8WrWFOKsLx6STIOPySBQVtmQCI9gY3G3CumDAE0SsEsfsPxKG5MOjG3KV27+oqLbLDAosltAaZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ouMR13hu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ouMR13hu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EE21F000FF;
	Wed, 16 Sep 2026 20:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591962;
	bh=Ey3W3pKciCj569G+4LgYiLWMcVQFEIDuHCi49VskP+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ouMR13huu5OQMXLIi9ax5ZG63fAyvLf1MQXdqu3/bBaQNT1VysEngDLv5oAqXB6At
	 T0kSNphFFGskAnHPTw50obhHLKuke4PAPLgm6neF2yLepzVEALpHq4Bzu07SPBVuGj
	 Jb++QA0MpeievYbtMMlx4PDRXX1S/Z6PB0ZIbDLRrw9ZNX+kDgxy9K/ZM0BdMUvJvV
	 oFqJ45zrHoCXOq5UD7ZL8m7BN5HcnGA4TnmrOP4WypR/zXSmen8okZCGYGo5runEix
	 oo29j2+Iey/ty97LpRVPy3td13KxN6bXktmKFme/NhcLceD44vWRfUXvDnwsvGFPn2
	 Nxm3He0YcAfNg==
Message-ID: <c2dca0c1-6dd3-4601-be2f-e5409518bedd@kernel.org>
Date: Wed, 16 Sep 2026 22:52:35 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Suppress a few intentional
 redundant whitespaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
 <20260916-b4-dts-style-checker-suppress-v1-2-81b86685d068@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-2-81b86685d068@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2026 22:46, Krzysztof Kozlowski wrote:
> Ignore redundant whitespaces in a few places to suppress warnings from
> `dt-check-style --mode relaxed` like:
> 
>   sc7280-herobrine.dtsi:357: [redundant-whitespace] extra whitespace after :
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi           | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 58ea0532c0fb..21179ca1219b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -354,11 +354,13 @@ keyboard_backlight: led-0 {
>  pp1256_s8b: &vreg_s8b_1p256 {};
>  
>  pp1800_l18b_s0: &vreg_l18b_1p8 {};
> +/* dt-check-style disable=redundant-whitespace */
>  pp1800_l18b:    &vreg_l18b_1p8 {};
>  
>  vreg_l19b_s0: &vreg_l19b_1p8 {};
>  
>  pp1800_alc5682: &vreg_l2c_1p8 {};
> +/* dt-check-style disable=redundant-whitespace */
>  pp1800_l2c:     &vreg_l2c_1p8 {};
>  
>  vreg_l4c: &vreg_l4c_1p8_3p0 {};
> @@ -368,14 +370,17 @@ keyboard_backlight: led-0 {
>  pp3000_l7c: &vreg_l7c_3p0 {};
>  
>  pp1800_prox: &vreg_l8c_1p8 {};
> +/* dt-check-style disable=redundant-whitespace */
>  pp1800_l8c:  &vreg_l8c_1p8 {};
>  
>  pp2950_l9c: &vreg_l9c_2p96 {};
>  
> +/* dt-check-style disable=redundant-whitespace */
>  pp1800_lcm:  &vreg_l12c_1p8 {};
>  pp1800_mipi: &vreg_l12c_1p8 {};
>  pp1800_l12c: &vreg_l12c_1p8 {};
>  
> +/* dt-check-style disable=redundant-whitespace */
>  pp3300_lcm:  &vreg_l13c_3p0 {};
>  pp3300_mipi: &vreg_l13c_3p0 {};
>  pp3300_l13c: &vreg_l13c_3p0 {};
> @@ -384,6 +389,7 @@ keyboard_backlight: led-0 {
>  
>  vreg_edp_bl: &ppvar_sys {};
>  
> +/* dt-check-style disable=redundant-whitespace */
>  ts_avdd:      &pp3300_left_in_mlb {};
>  vreg_edp_3p3: &pp3300_left_in_mlb {};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index ed3d29e13021..afeb6e57e0aa 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2480,6 +2480,7 @@ swr3: soundwire@6ab0000 {
>  			qcom,din-ports = <4>;
>  			qcom,dout-ports = <9>;
>  
> +			/* dt-check-style disable=redundant-whitespace-strict */
>  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;

The comment should be placed before node and is not really important
here, because it is from 'strict' ruleset, unlike the herobrine ones.

I should have called this RFC to show intentions and whether this is the
code we would like to maintain.

>  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
>  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;


Best regards,
Krzysztof
