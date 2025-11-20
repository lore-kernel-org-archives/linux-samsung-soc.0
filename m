Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71D32D59F7;
	Thu, 20 Nov 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656710; cv=none; b=F9SNgVrKrf4rRECbe/EhQX7JgPlJr1kaUP/2ZiLPMwAYlZRLjZ3TAEWE9Xv1f7ks/rE8PpT+UQmMe5zdUflZECjZniL3qwZXIXdkMYOyB3u3WrftiuXpeR4SXgewLied4FAJl7DI5/o8jPUFZ9/XY3KD9qpHimmthmt8O2hFR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656710; c=relaxed/simple;
	bh=U5v+Xdb6isW2T2yhaiZW6oLZADrqcJmiFKaIUQrAziQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qd6053uMRoGW9fO0hK0tJzOS0F6gmQd7FN7skN+6nVCxv231Rnmttm5J6LsmMd9eNIlscVrjhzWwlyi4BbjdoUFRkEOs9dHuMcAIxQSkdNepzXaYRiNCxp47hKqQrBY21wgwGOq0j2/M9I8/8Sb1FAnmE2znjnTZFGUtDzHyO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQsF+f4U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQsF+f4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A184DC4CEF1;
	Thu, 20 Nov 2025 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656710;
	bh=U5v+Xdb6isW2T2yhaiZW6oLZADrqcJmiFKaIUQrAziQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQsF+f4UQkx2EydK0A+yiV+xkUdnzq9e2j+gWXRw3hFe0dOxIB/ZdrYgbynALGEQR
	 tbYuvORrrO+6t/2QHjxeV3Tkbl9D0EwrPDYJqcZN6WDd+D9lCT/QldzV5fym7YmJe9
	 U3poS2sL6zEQQodGlhcv3nXkZR1YNtwLn6U6hdgSGcwWF4s0jZA8XPpMrhR098UcWA
	 aICFRSqzg4DUszENG988Ur8pNtS0HjNRydEwlSMmE1i4ZkmL1tURB4d/g6neG2kuN8
	 2fT/44yEs5PPDNov6WS4D3ne1LPexa+LzaEVw1vhNsOtVTak0MjZPtw0ik/a2kNxgZ
	 PCmzTlSzTqPTA==
Date: Thu, 20 Nov 2025 22:08:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, johan@kernel.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v9 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aR9EAj82IiLWFQ-t@vaman>
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
 <CGME20251010070106epcas5p2a7e051ce5edc0768e5a5d3b3c267f984@epcas5p2.samsung.com>
 <20251010070912.3758334-7-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010070912.3758334-7-pritam.sutar@samsung.com>

On 10-10-25, 12:39, Pritam Manohar Sutar wrote:
> Add required change in phy driver to support combo SS phy for this SoC.

what is the 'required change', would be good to describe.

-- 
~Vinod
