Received: from mail-ed2-f30.google.com (mail-ed2-f30.google.com [74.125.228.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1913A3C65FD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 14:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483685; cv=pass; b=kTrTjJnh+TtYZQF32QQsV2qJ09Zqzx1aXzHOZ0nDOA08Jg9IaaCE5yp8PoWp7bewsbuyJ8kqzUuSUIfLl+PQJA/mG4bcm89NifRg31kuAyGRx0ujKuez1cAWAPARaMiHYRPeuCKSJhbMPZHJVEpL4pC3N0YhhJOXs1z5sibBNaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483685; c=relaxed/simple;
	bh=JB4dzeW0yCT23fi0FjS+30+ACBaQQqxXbdSdVPolKf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCfT8AL4ngYwTnMmuaxbJdBZ8XMM+3DWBx/BqrJ5O1sp2gSk2RLVZwg4pYXgXHmpWV04lHY7q1FbYC3GnUtSLHpOx+TJohMnv3gYrFQhfm5lh0NZbFX8/6pAOCcWJQBBK0FiOCshoZ8AIguyVRdG1Mmhe6fiSJYHgJ9wf3WmRbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZKXz3cT; arc=pass smtp.client-ip=74.125.228.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZKXz3cT"
Received: by mail-ed2-f30.google.com with SMTP id 4fb4d7f45d1cf-6aa06e51bc3so1446061a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 07:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483681; cv=none;
        d=google.com; s=arc-20260327;
        b=XIoVttNdKT/jBFTwQNBn5CGD5HNHvQ61pjaQW7+xZGEhHVJLPThEmKT5VdDDBCWn/F
         T1nzJ2y0HXDmxYFO/eyG/AJvq2u2g+VSzUXcjdtbJ/gfvWQQ5tqeNrk8FL448nGGb9GE
         m1haR1/9rt2oXooTNUkDTVhTIlV3KQv6ecoiGPWwkDoyOEU4+bk5B80jUyenp7IcBAZT
         NRn67gbXIVUbe33PEhfmsNgaZGHFlZ5Q+Ee8mwgqpLEZ78VS+WBlFqRhk+Ofo6w0KmvD
         6cWVp4ZAYnEN3J2s3wAIy+9SeOuyuVXOOFsvGBo3UF3db0dBeCKWGA7ZlGrmG3igDAxo
         evew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        fh=jTKwF3J47QVLwkdUJSYeEIEStOpoLtfeUFOsGlOynaw=;
        b=os5DLcJGrCfwe/3n04vFaX2Q88Sui81commutMBWnkarvo2JjLrF5vS9N5vzNHbx/7
         nq5J4sYuSKG3N5kTQCImt/XpaoTuImK3XZN5C3eiqYCmZcFF4u41AqGU9qbdI3I1uiHz
         IMUPg1/dZtU5Z6P6RAUynXPxTjyXkxNouMqkrjh+fV7UoskUG+HFBQpLeloDuFJw1hBy
         5XYaLLbgPgZzEM9fd60Nzf9BuKwKxUdN1nv+g6EQrq8ntBfMmwuF9XoeMqYZ56m+U5g+
         QoEOmEr4ZOMM9xNfF2CqAZQT4tLReadC5fodhs7RcSqeSTxjehOSHIu/Ign/6ytHRQR1
         TXrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483681; x=1790088481; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=NZKXz3cTotnfq00AS34AmyHOBfyDkhsvaDZXsw6X96vIV68mn5K0vhHL5CQYc4/LDW
         YviLpKo0WS5QZiEc0LS/6oC7AR98DYTor5endBqbkObnRvwl0x0NIIzCmWXgMrBf4kBu
         Y/59uPVwYi6o7jl1C2EQUBpbXij/A0YxnukfY6iFPM8BVFFCgL80tfxCmYjZWYe/vb6w
         jOGII2D93BB0EneiKrx5l5jf02NIbjugqvCDlMV8u7V3iKBLmfntYYauJWtAhY9QvBtM
         oPAIA2xOTiRnLR0F7nOrDx6fzqV/yLFPjGW63iVoz8VfQ7hF1jVa8Pswogr/7JPj9b9k
         2ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483681; x=1790088481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N31h1AzvLTVLE4JkZfUHMakRC7JrcK8cme37Ix1dV/I=;
        b=qUXPFrXxEFtKErY+oaOedR/mCXSKlkIlWy5LUGWV/wKktWXeQFtuGJugL/QOhgtoaY
         96kjBvd1SBQha4o5UeFBrQT89GMhG30YSw0ghzyBV1tAnFP4e91nClf9okhlBQBqi1HM
         hYag/E/zBfcRZyK7sU3kRFwiPe2PSHGV0damVFV2KlnxINbZVi7HuMXlXALXaJRiFIjg
         w3BzWzwLqQDlP/Ut1bfMbsNzPBCyxxzdX43lIdGkobETzUCkFpMIeVfqwQfy2bwGEl61
         9MjAbz6NLqpEabrkKdAZbiuYT1ZYTxS8PyLoca77visMx/0zT96zZij+ZHRzcSH6qVrV
         PtvA==
X-Forwarded-Encrypted: i=1; AKwUvBxIXTo+sP9ib9vUpDtkJieb0rvSzzXITvsGb1ss8dgz+/Y0kh/MBI9/Iu4A4pJXFaZXXstEq98rN4fO16ZFGjaekA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpgsJAwfZe8p6AJq3++UAGETBwaGYr4ZMFzBmTSl5WkRbsY3jC
	IGOsLTzIIbK5uvQJJ0k35BRNjtkTG2Pq0F4suE683RxaYUrd6mxZcp2ytcOCs7TeXIPPgvKZ4hA
	+Bj9dCJKkbISBsY2RTJWSm3QLoQU10MtXCyxYdSGC1w==
X-Gm-Gg: AYBFou3bAoDa/ZqaKOnXlH8VPIlnf2F/zv622D5CM6v928IimDJds30FwXg2ShQsrUW
	WXJc6AW6r+NWWhtaoGjtXNQmpr6aRwighkAU/yDYljDMJmG8vr+lpXsMnpfF3nSdD8/e068Mzx3
	4SGy2Mdx90weRhxOFiJ5fu0ZPYmrbnUnlyWs5Z1A9QN5F+fLVyUs39ts+/uszBXYtkCjsV9LZ3K
	1eDCitpCSgQL0RyocrPK63w1R4y/fO1/IaazkdpJdQrsLT10sBRZp7AAujtGXUlrtRoOqyQTd4b
	w9umFlsl5Er6RnIA4MpyPgrqEAoZFraJ6riBt4jFMMsc6S3ZsW5t70ItNzJ4z4rU3lqPvgWV8jG
	foJPSxcsF0GyeXpclpBjRvxk1
X-Received: by 2002:a05:6402:4404:b0:6a9:98b1:6c36 with SMTP id
 4fb4d7f45d1cf-6a9f63e0d39mr5145656a12.31.1789483680985; Tue, 15 Sep 2026
 07:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org> <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:47:49 +0100
X-Gm-Features: AcwNN1WgvUO9gVcyHHtQQpCHP6veTmxEFNeRoziGdiQtPJVZo1SV7WyKK3oIExw
Message-ID: <CADrjBPr8EROpwaXsuqNBgyiJV5b041poTKzFRfrx-rCvH1CyRQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 17:58, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 911643008b9f..2128749d7647 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -176,6 +176,11 @@ soc: soc@0 {
>                 #size-cells = <1>;
>                 ranges = <0x0 0x0 0x0 0x20000000>;
>
> +               apm_sram: sram@2039000 {
> +                       compatible = "samsung,exynos850-acpm-sram";
> +                       reg = <0x2039000 0x30000>;
> +               };
> +
>                 chipid@10000000 {
>                         compatible = "samsung,exynos850-chipid";
>                         reg = <0x10000000 0x100>;
>
> --
> 2.51.0
>
