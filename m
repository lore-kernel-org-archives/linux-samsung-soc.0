Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE86BEEAB;
	Mon,  7 Jul 2025 06:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751870173; cv=none; b=j2DsMuytO8Cwyuq8kNGdhHZuFR7bobsuF1AMTvlXGaOVmhzuNZ0nhooGQacjRjmjq0S3uA9UPWDPoXoRpweZ75xNpWu8arDrWJgganeXhD5HiptT1vi66ZCUN6vfAVECUNZeid7/vSfejoTcwRXD6qffmK2pMONen72Uzw8rrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751870173; c=relaxed/simple;
	bh=dc209bSSOMZyBL/UHG3HiH6AvU5ec3DCsBGBA0MD8OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/ObWtVjSv7acXfU/swaFJO2Pul8BPT9kN2PgfOfiA+D2plfxG6gIEMqSMJPVHQYNw9rd8JPhlZoRIjPgRTPn2vvg4v0QLSyQvkLtCyJhXTSlsDnsEkB3tD0eL58qC0mUJ/IO8tMM8nrMkRZsGOq2e9zIZkD1k6IHbKEmpT0mDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgDAmbZ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgDAmbZ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC70EC4CEE3;
	Mon,  7 Jul 2025 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870172;
	bh=dc209bSSOMZyBL/UHG3HiH6AvU5ec3DCsBGBA0MD8OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgDAmbZ3f9Aqqwkljq5jHe8OaKHd8qTEvKsZj/eNsQ/Wl/Bz1ykWcyzsrwomDXV6B
	 aYDH/g4K/oBR6eg4WVcYY7gnsb5YQ07RQBK0hxwXAluwwe8DwCCe8FU7bTsY+h1O8+
	 P4/NYZFy9Yi8j2zEdiiEIdOiq8SXV3t452Seh+/sOCH8sqJHDy/tcsiPaT6BOoTYh6
	 e9yYTtn1Pj5LAy6LvdfgPGv0bvYNhEVwedJSRNJ6+TWBRWWkh++2BatUpmG8zFmmRS
	 SYqKsvNHTE4+iwSiC4DGCEJQp7AWLB3pwvsMIE0FJ00gwPJ65nYQubayx5OziXcMeF
	 vgMmFHKDEmKaA==
Date: Mon, 7 Jul 2025 08:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: samsung,exynos7-decon:
 document iommus, memory-region, and ports
Message-ID: <20250707-silent-authentic-trogon-cca34d@krzk-bin>
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
 <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>

On Sun, Jul 06, 2025 at 10:59:45PM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - Outputs image data to another block, say an MIC or a DSI master.
> 
> If an IOMMU is present, it may also require to access the reserved
> framebuffer region.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/samsung/samsung,exynos7-decon.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

