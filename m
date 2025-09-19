Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C662BE051;
	Fri, 19 Sep 2025 20:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758315568; cv=none; b=ndh8e64Y57SufH3YtwysR/RC6xneKj7LvJvwvsiPEy3CAwIDHM7D0GmJNcEMgn9va5ewIVBA5hJ3WZ7PwuB0MBhukpQxhYz2L7k8hBXaj5lJNI1m9DZnWf0UmmQ0B9fZZ72eyy4PQ1LmGenyOAnf9DsAfaCGo7rJkdwKdDPD70Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758315568; c=relaxed/simple;
	bh=uteLm+itM6aPSzuHbgGxoLBzphSODRacdFA+7i7D2jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVOXzp0gJ8Fpn9A4+t1wU6T4QsF7rYZZaYsP5VHMnM7uV5Q3l3Ru/fg7f7Kixf2KP9BkyOcDlwF/WfyCxCq2SijPvdT1OwNQemN4MVcGRbWVwo0QUYXFKrZLOeDB365XUNzuxy7E2H4smFul2xcjrr1tAXCJsKDFaqjWl9Qbngw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRn2LFv7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRn2LFv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB99C4CEF0;
	Fri, 19 Sep 2025 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315567;
	bh=uteLm+itM6aPSzuHbgGxoLBzphSODRacdFA+7i7D2jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRn2LFv7zHv+smS07HcgbyvLeak9MOgO4+HzdfgZwSbkOVN+2ElcGHShjxOSK2zah
	 eE/+nkeHAkbluqPUztdDbcGX6+XU9KyotyPDZFPtkZzaWOnptoCFdsPonF54g9LJIr
	 8PX4kZRnYbQhR8gMzhLEahlukVueF1fNe5XZ2HX1L6YSCVefEGcHMH2KzJLLY74KIq
	 JQUzmj/YHtbaKSrXviRElpwx6AiSUwy1ysOX1WkmejlZ2ymkRvD59ZiDAtte4Ju+G6
	 y/1i9B8f+mWc17vHec43tEB54aEiTh4KD/Wf41fVmqWio78EZlni+lcFJRtMbLUDQT
	 bRsRaS1fBNV9w==
Date: Fri, 19 Sep 2025 15:59:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-pmu: add
 exynos8890 compatible
Message-ID: <175831556066.2206958.9125329836754645521.robh@kernel.org>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914112942.2604194-2-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 14:29:40 +0300, Ivaylo Ivanov wrote:
> Add exynos8890-pmu compatible to the bindings documentation. Since
> Samsung, as usual, reuses devices from older designs, use the
> samsung,exynos7-pmu compatible.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

