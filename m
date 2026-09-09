Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987047FB18;
	Wed,  9 Sep 2026 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941375; cv=none; b=M1pELNFJr9xAJt0q9v0tTF4GMRhd82KDK6GbZRD5mvuL8sBWDWc2JdFXVnsDBQ4Lh2z3rf9FAP39BeZFBXj12PKrdBy3oGnQQDXETqRzIUXCc4No6L06erW3Wbxo8tvB0k8iLeJ1uuZddSkO1PghpRHy9MFQm2kjvokRjlJZmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941375; c=relaxed/simple;
	bh=aI7kV343+FY6w04t+ft4JW9t/r1SIb/qpZCQsWY/NW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGdxvZAb9SPrZaC5rTBLLvPMrqLMLKrCoc34SiA6M0RHli8IvxRk7k6r4R8JrEw66/oFyZOhRIzwFY8COK7OS10NwazavZJUa7EhL7BKeva/Yp+pQfAEDcn1ofAlXGcKWpoXR1Zq8Z0D7mxVBDCCwzRtfy5GpGm97Ioyol8FJ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhsnwWMJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhsnwWMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 950721F00A3A;
	Wed,  9 Sep 2026 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788941374;
	bh=Sm+VRBme+F4AuNb+2Kn1vUGzPGQfC4nUbsqtHhdSZ/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QhsnwWMJCrZct8Q2pdFFjenhpYM7e6e9TH976YqW3/MOEg74s0ZVEsG5yHxNY5Uqr
	 fgnU3An42MDdrqfIpp20LvljYyzaX92a81GuHhY32pMCR9j+2Cc3/EZwWElpXDBZXC
	 LHW7//sFoGziJMYR/tfrnRZHtYczuOG+c4qAHVD/aWdaFlHf50DaVTKdth3dNYHZsH
	 1nRlagNSRHCxRGK3pja+9McUw4n+p3NccxfYHcVoUmOciAw9zvi70ohaVZ849jn5XB
	 muM/kMDc7d9B7nFYzHZa9Mx/fPoDr3DgBqoyn5cY5rtCJBpW2afGhiScstwAht4yzN
	 n+dI15ddVTlrA==
Date: Wed, 9 Sep 2026 10:09:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Pritam Manohar Sutar <pritam.sutar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
Message-ID: <jgkyhjlex746xmqgr6vwxihfkzjmtvhsvrzk5ovud7zrc2bqo5@xwdlrrmdrkx6>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>

On Tue, Jun 23, 2026 at 09:53:49PM +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
> 
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
> 
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 combo phy (HS & SS)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
