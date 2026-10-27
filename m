Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095555;
	b=olGEgi79ShOKb9KgqDjsOXNkeHyWq84FBnLfbyrnrrgUbxv+jj6MRZFpE4jmHbJ/xCU6
	 6yCfi/6BMivY1E4LsEdSU3Rjt7J88QhCLBxHzVnxPl8F19i91/fs43idWEvc7TJY69ljI
	 Bt+8G5feUttpG9nI+jlUi307FqMV4i/Wp2/fEOXjoHfzl5sVSNqe1VTo1Bo2S3XYNr7NJ
	 NK96BugDbl3GYGAlsmLvsEWorB+u58H1/jthRyv0cnUN2PzuqIViO2sajbxwy54OSIxf/
	 eE1QmTPPXb+NvtZUD8OD4PGhQhD2nRCwR6lb+B9rTKw1bethzdDM6l+m0FrqV2Lr1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095555;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oyUjBB6oJFyp1IO71ofZ8tStrZCd29m9RWKeAe2qToI=;
	b=BBoi/psGCfOvTTd1ohw0zaIrh69fSAj/TP26aUiubxFvk7GblnhGdopMNPEx/dkK7ugH
	 6alqh6tmhYwIGVg2utdL8Ju4B4x3Iy7siQoAN8PxN3LPUBfM2NVhGqeqbeUtG1isOMsKj
	 DgDS6JVb37rjEl35KFYiFSYduf5pYnLS6NOD2bUHedftEdlNOmi9/dRX9A5NmRNMjYSLo
	 w1R3FlvKcfk5DJVwZLPgEL6GiaJ4i2F4EcD9zcHF/nPmRFHlYdVrhvlEmwvuBJ34QO65f
	 VLT9IyljfMlGlLqdGkBKmNlEo5zQmXI7W+jc21vQoNy+hyqNWcGzwVkoSw0Noyyy1FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5KlNVyN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751AC606A31A;
	Tue, 27 Oct 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5KlNVyN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851671F01825;
	Tue, 27 Oct 2026 10:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095555;
	bh=oyUjBB6oJFyp1IO71ofZ8tStrZCd29m9RWKeAe2qToI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5KlNVyNVIUIyqglh5jwznCe1GB/mi3Q1fSFhPw1xEfS5ffznBWc6GIX29nJ0zBl7
	 XX//Nk3878WurTyps5rLbf486eiL+ryBJdtJfuv0dtBhyhoRAt1sYqqjPp+13DNiLA
	 fPn9kOhaKltxWOJmQgYGMGRUp1f6qxTarhpJVWM5heRTcwHUL+MdZbhIHmueZWSrG0
	 HRah2A3/1iqCL/Igf2L10Vt+VcbMggXVzYhEk+HQWjM8/lLZx/WsibPZKVdyk4l75r
	 /ugGkjS81XZ3fekHUmpGCNGKqUorwVLWpUMGCv/zXvOFk7cYw2P29Vrpw21S+hU9+z
	 pcPPW2dfmzyZw==
Date: Tue, 27 Oct 2026 11:05:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Message-ID: <20261027-puzzling-didactic-polecat-ae02af@quoll>
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
 <CGME20261026135751epcas5p42c28c8315cd25554a11032714b85bbed@epcas5p4.samsung.com>
 <20261026135715.33071-2-selvarasu.g@samsung.com>
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
In-Reply-To: <20261026135715.33071-2-selvarasu.g@samsung.com>

On Mon, Oct 26, 2026 at 07:27:14PM +0530, Selvarasu Ganesan wrote:
> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
> 
> This is the first Samsung Exynos binding using the flattened
> representation.
> 
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
>  .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

