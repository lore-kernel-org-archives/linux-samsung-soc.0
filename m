Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282872D638;
	Mon,  6 Jan 2025 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146979; cv=none; b=Vu15NOYyYefEVnRuCPMHbwpFKf7qFf8QrbKvqaBn2rpTvYGbF84j1aBSBwjRM0YmIhzmu/L6vw6z181bxWcxP4ls2FdiPKZeyE9/PWN+7AV2ooUkEo3T2/z/5xuJw9fObmP41hp8yG9WQmDeBpCqY+ToXCGNOZHvh6FtbeQmdDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146979; c=relaxed/simple;
	bh=sbbH6cRjWBZxw3cDoRJkv8UFdjiY/oIHJd+32MRs2E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQyeygyP15Bv50QT5Dvlwfq/A3ybVagWnGq5vbwlsJbRlW65opOcZlsQy0i/sYjO6Xw0ijxZMd9T5bpM9bq02gknZ5urBJdAHAw9wPnCDEhr5+oDJsIGoAMsxJ7OaFL7pv+HUdPsdHVmMe1U02oPlm+iWyZk3jqi461XN3JSCOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdhFbf0Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdhFbf0Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E259C4CED2;
	Mon,  6 Jan 2025 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736146978;
	bh=sbbH6cRjWBZxw3cDoRJkv8UFdjiY/oIHJd+32MRs2E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdhFbf0YXxOzsM2Bkeq+ig2GGXG0XFZnRIX5NKJjmYGeEU9GHBzaKKE19e2zXfWny
	 flf7Trnpu6kE9lMXu1D8EXfLtDkdlJgmzclvWZQuZuaqqscm6VmLOnF/hM7D/gYwF5
	 uKUG1f9Pi16nF4VVSjIa46scXBi9V5eVl97IyOu5ZC0creGgMKMMRUJZ5JklPzlgld
	 PQtDtlNslkhg89b2khK7ARyPGxvt6Ph/BUFQ+MxOS6ArmSK1KJXwx0808BXMKJ/N3N
	 775TJYs35GKOTt7r/NQGrfWeZOS5dIGg46Plp2HdXYXUO1l+7Y/hdP3n7XBXm6og4o
	 zacP4/wgdip2w==
Date: Mon, 6 Jan 2025 08:02:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] soc: samsung: usi: implement support for USIv1
 and exynos8895
Message-ID: <4ddzqybi2umjsstg7olmtjlrtfbqxnpcrcfflly7snfzcez6r7@yrkxp3sclfad>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105160346.418829-4-ivo.ivanov.ivanov1@gmail.com>

On Sun, Jan 05, 2025 at 06:03:45PM +0200, Ivaylo Ivanov wrote:
> @@ -169,9 +207,12 @@ static int exynos_usi_configure(struct exynos_usi *usi)
>  		return ret;
>  
>  	if (usi->data->ver == USI_VER2)
> -		return exynos_usi_enable(usi);
> +		ret = exynos_usi_enable(usi);
> +	else
> +		ret = clk_bulk_prepare_enable(usi->data->num_clks,
> +					      usi->clks);

You need now exynos_usi_remove() callback and also error path after
populate at end of probe.

Best regards,
Krzysztof

