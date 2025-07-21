Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025D223302;
	Mon, 21 Jul 2025 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753080461; cv=none; b=N5ENwM65Md6yP1RSJsBTy4yAyXUq0glfVd4SnPUobOdHCM6pOaErXeJw7uI6rw2ukakkYHRrkhVeIjw4g2QR3q/w2OJpuAfili5rfjBNsT4YoVCp39mIx5U8GxHFnhpct/QqBAL+x/urAIcwUmPHV2ZZn1HK8rjgOpbAbyc8Rgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753080461; c=relaxed/simple;
	bh=ZjVTcKbsRevDk/Oaru45By4rM0QU89TkvkSHMwWvxxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVIALukgMjSkLLmGgdCoMueMjcA+T8j36AcO3c40KeGXvXhHVayf3yP8Tw6n9J58KkvqS5Yca7OMuWSb5hOEAhKDh0NKpTkLixmwQ/ITNyv/55804cV/6W/iU3dkV6yp+kW7iauqDCdw+2kldVWBRpP3fmD7FCQWC4drIFUB6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHD8hyGf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHD8hyGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94BBC4CEED;
	Mon, 21 Jul 2025 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753080460;
	bh=ZjVTcKbsRevDk/Oaru45By4rM0QU89TkvkSHMwWvxxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DHD8hyGfljx5ywckYjCud4sf1NSOvkJJzeSwoh63ofX0BinD6/Is+W3UNNQyT0IH6
	 J20S2JoL/VRTsKFF/kfrU9rn1B5NmVqiSm5FCush5ffiuUfr7kexOtIEG6Z1riU4n8
	 4jLmkIQCy+YAjEGCdsmxN9EmGKiPqwXWZetMMZpzhxkIHoRd3+2iBWQOF2WzF8seRg
	 Xf8reRoJOv4nMNmJhsh8CRi0RNzGKo4iBNdBNF+JNiWj356CCQsLw7fuzH60gTjktT
	 Xa+m0o/ogOiteifEirY7u3iWm2OmsVgmF0+E9OtH+iafG68f0AU5A92IF6pkvLNEeT
	 ot2NqjjqqMlsQ==
Message-ID: <2b6481e8-9a70-4676-bca4-da3ee00e73ba@kernel.org>
Date: Mon, 21 Jul 2025 08:47:35 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: sound: exynosauto: add PCM
 frontend nodes for ABOX generic
To: ew kim <ew.kim@samsung.com>, broonie@kernel.org, s.nawrocki@samsung.com,
 robh@kernel.org, krzk+dt@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250721023052.3586000-1-ew.kim@samsung.com>
 <CGME20250721024612epcas2p122d627cfb90eac508b6ed3667acd9b9b@epcas2p1.samsung.com>
 <20250721023052.3586000-10-ew.kim@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250721023052.3586000-10-ew.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2025 04:30, ew kim wrote:
> This patch extends the Exynos Automotive ABOX generic device tree bindings
> to support PCM playback and capture frontend nodes.
> 
> Each PCM device node describes an audio stream interface handled by the
> ABOX DSP. These nodes include properties for stream ID, IRQ, ADSP core
> assignment, buffer limits, and stream category (deep_buffer or compress).
> 
> The bindings use patternProperties to match playback and capture nodes
> as children of the abox_generic controller.

This split of one device into three makes no sense. Adding new binding
is one commit.

> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../bindings/sound/samsung,exynosauto.yaml    | 126 +++++++++++++++++-
>  1 file changed, 123 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> index 3a7b5be627ee..e477550afc7c 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,exynosauto.yaml
> @@ -28,6 +28,14 @@ properties:
>    compatible:
>      const: samsung,abox_generic
>  
> +  status:
> +    enum: [ okay, disabled ]
> +    description: DTS node enablement state


Sorry, but why are you writing something entirely different than every
other binding?


Best regards,
Krzysztof
