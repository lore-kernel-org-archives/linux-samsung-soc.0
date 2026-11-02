Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614430;
	b=F3IGW1Eup/h+ty5MQDsvzWEn+aiuAeM94OqxLVsJ7zeg/aD7piCgtacwpiJ7r5gRXfpc
	 b7ArG3mCxCCEhnYGg3U173+UK9DN0kIBvViU6uEvSSJL30nWoTh5TJCBYG7FFW3w5MGW1
	 SmMqn6f5Xj3mDvOjEdkBmhCop+z1Mw7TaFmS8bkByLZkbsIC7aynBu3Y7fQ2nneOq86Ji
	 gWM27lM5pdrvGM5t11R3DSCpPKeogEQkluaw29E1cfVlWPoyyp0aNOxIiIpIYSIzTKxdx
	 a5SV/gWx9wQk3hGgQFXaKxL/hkp/+j5wTYBATPM12lenGMyrMqNyzS0sHmjxb/il0PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614430;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/geg4fn5RzdAUH4lS/NHAgce/2jiQ9EPWoRaLv0NohE=;
	b=D67WpcOk2+GmjBTArVjdISLtUBG1tvosrNroiU1ynID5bqTXq7qbhb+qxUu2mTHkfMMR
	 01nr4M4pgjDt1v86jDGv6Duk+oGT3QssaQrGL4RY/xDk/EpebOon7l24CNOBXuSo6je7K
	 l9glVn19WRa1vBIzYlEJO3SECXCxL2dZnpdnjcLetD97G2o9Tn797L0zxyuuhyjZWZxAj
	 fHyW0B3/zV9+gOlblfn0Mr6bMWrqJSdV3B8TVGBswvp2EuYkKr/A2pvk4uh7BwKKIoqZN
	 9VuHDWIHP1NNYnjdlNQ3Zo0hXoQIgaUBbBHHEaj4fPkTqPmVEhk7l5ia3sESSlEVDhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqKvkUph;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5209C606A327;
	Mon,  2 Nov 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqKvkUph
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA191F00A17;
	Mon,  2 Nov 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614429;
	bh=/geg4fn5RzdAUH4lS/NHAgce/2jiQ9EPWoRaLv0NohE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqKvkUph1JMI+M3Quw787pbiUXVd4OsSacpUh7DBq1UMHojPYBWdwypfgOu8ApXDX
	 Oj0ziUigXpLbJb7ApnHlmo3GVQnwvyoKkQbT76WPr+QALqQgF6YtEanGFVVR0FFheY
	 NNKjV63p85ATE8OIcyp14Ng8KLHcqIa/1sEYmwDvNckCx6QOXfNu5FgNna7zkacIxB
	 t2dnD19uAqegTS9/3NM+pVFpVdhZxNjXv+YpSxYUUOsW7KO5vuVw3GZBLxS0PFdSOt
	 uN38sGBOMAfem+9bQ1J23Gi5nEc7+NlN+e5oVwisv12htcWVD22e/EfB20nT72NC2L
	 G4fW7k3cB26Wg==
Date: Mon, 2 Nov 2026 11:13:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: samsung: Add lucky7 board
 binding
Message-ID: <20261102-origami-shoebill-of-fortitude-ddf566@quoll>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org>
 <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-for-next-lucky7-v3-3-81e02272ce69@member.fsf.org>

On Fri, Oct 30, 2026 at 08:33:58PM +0000, Aiden Isik wrote:
> Add device tree binding for the Samsung Galaxy Watch FE (SM-R861/SM-R866)
> board, based on the Exynos5515 SoC.
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index db19a686f490..c80fac4fad7a 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -157,6 +157,12 @@ properties:
>            - const: samsung,exynos5420
>            - const: samsung,exynos5
>  
> +      - description: Exynos5515 based boards
> +        items:
> +          - enum:
> +              - samsung,lucky7                  # Samsung Galaxy Watch FE (SM-R861/SM-R866)
> +          - const: samsung,exynos5515

This looks misplaced. Entries are sorted by the fallback compatible.

Best regards,
Krzysztof

