Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8971C07E3;
	Fri,  3 Jan 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735892472; cv=none; b=q9t5kkkpaB/ldT7uDkqtAVi/zofsUCxaSeHjt9+4p6mlfpwHYpJHtW9R7ykDOQqAGfwxQSkGV5yCGFHkifPLOm6pacpF6Eea6GbuUxI5lb7yu8D5GNNmAEDhFrtMxTsj2kG5O69MYkWq65atuUVPYjdlWQt/sjVSujBEuafldUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735892472; c=relaxed/simple;
	bh=S7tZ1yGNv5kuSQb7DcMrraBBMRu336qd5hi85TYcCRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+ssPtwLU2dDbIEG5BSbiKL4/xGzL/oXVCvLj1YTvHU3IocCIb1r3sBxhiFJ9XKhidcm7g/Q2QlypdoGziLof38hyQWLcbFyjViBLd85gXDlgW8OQCDfoGQac4XVQtiLKVjhQOLEJGqGmbPe/2FsUBFcwEjRJ9r9LJmaoJfQM2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCqEPRYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCqEPRYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30395C4CECE;
	Fri,  3 Jan 2025 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892472;
	bh=S7tZ1yGNv5kuSQb7DcMrraBBMRu336qd5hi85TYcCRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCqEPRYTjGjxkEp+VA4ku2kHTehaUYdEGQ7FaPelR1MqyRyteuN/K3nvMPOhiAiGC
	 hDn/8Ie4xacKUiVhoz3y2th242Pnl2m0wPfj4i3yrTXwD7Fh1h/aQC0kffNqsxJkpr
	 WbITtBWG/KnTwYpW9P+O+yItMO6OayjCTZz9nwCVICP4f7sflhkUQ2c2av2Q/+SyBi
	 S4OJJL6MZNXN9P8TVle5LsSEkUUYPjrBuKbLz1uPjNQVmuhlo1NCoRzXo9DBzcDqgh
	 LoWIopSf5PODYQ3pKEtmVChb8/abyGh0qlnid5oNEwSVj01W7KoBByplbFXeuLy9C+
	 GSJDGrpGg3eKw==
Date: Fri, 3 Jan 2025 09:21:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>

On Thu, Jan 02, 2025 at 10:40:14PM +0200, Ivaylo Ivanov wrote:
> Add constants for choosing USIv1 configuration mode in device tree.
> Those are further used in the USI driver to figure out which value to
> write into SW_CONF register. Modify the current USI IP-core
> bindings to include information about USIv1 and a compatible for
> exynos8895.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
>  include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc31..50db63a8a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -11,11 +11,21 @@ maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
>  description: |
> -  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
> -  USI shares almost all internal circuits within each protocol, so only one
> -  protocol can be chosen at a time. USI is modeled as a node with zero or more
> -  child nodes, each representing a serial sub-node device. The mode setting
> -  selects which particular function will be used.
> +  The USI IP-core provides configurable support for serial protocols, enabling
> +  different serial communication modes depending on the version.
> +
> +  In USIv1, configurations are available to enable either one or two protocols
> +  simultaneously in select combinations - High-Speed I2C0, High-Speed
> +  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
> +  I2C1 and UART.
> +
> +  In USIv2, only one protocol can be active at a time, either UART, SPI, or
> +  High-Speed I2C.
> +
> +  The USI core shares internal circuits across protocols, meaning only the
> +  selected configuration is active at any given time. USI is modeled as a node
> +  with zero or more child nodes, each representing a serial sub-node device. The
> +  mode setting selects which particular function will be used.
>  
>  properties:
>    $nodename:
> @@ -31,6 +41,7 @@ properties:
>            - const: samsung,exynos850-usi
>        - enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi
>  
>    reg:
>      maxItems: 1
> @@ -106,6 +117,7 @@ if:
>        contains:
>          enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi
>  
>  then:
>    properties:
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..5fbeb426b 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -9,6 +9,14 @@
>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  
> +#define USI_V1_NONE		0
> +#define USI_V1_I2C0		1
> +#define USI_V1_I2C1		2
> +#define USI_V1_I2C0_1		3
> +#define USI_V1_SPI		4
> +#define USI_V1_UART		5
> +#define USI_V1_UART_I2C1	6

Conflicting values with USI_v2. This is the same property and the same
driver, so I expect the values to be unified.

Rename (copy) USI_V2_ to USI_ and then just add yours at the end.
Binding then in allOf:if:then should restrict with enum which values
make sense for which model.

Best regards,
Krzysztof

