Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492229;
	b=oG4l2WKn5ypyXEp4wCgPUmXfhx0f8qu58aqZB0yU2jVLcL+3a6mzB/RoyMSuOnLG1uTB
	 uk6zBSDYdaAnbEcF2h7IjCJlVnuCl8KDWNAI7GTb9pLLQEfLizixBiaG3AlqOJjimiBN6
	 dAULwZ0IsWBzUdUkDAFM/ATEDFQmZyb4tczSTEWQEGsEGg8qKHcK0LwClN5BopOKMgR7R
	 SGrUbg3oYf4qk1GDZ4n75hE4AvW2M50LFHjVQMYfvbmtOkHqbaL2e8sgP7lpKK/GcTwCu
	 H//na6IW7Q1Wa5UfnumtKjj6umus+nlVVTMV9qdmoLSMayrSM7Lon/Se5NzS/P/Hz4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492229;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m4qjcb8gdZJwkaxEoXzAOBIqfyt8ugrUmG3Eiv5qTnQ=;
	b=mKeJDUu0riPuseDThNiigMcurjtF5t50ZtEQxtRoS8xre5b7MRrCsI0SwjAcLZnHWRDL
	 7jJiUfduU17h7PhrpE3eXfoHKCFfqtfgYSmTaz4heIZPTz/g9icILrqads1RdHuPMCU8W
	 gMJzWd7kS31+yEWcgTsnbbOgBGmiWlb+azfO0y+2Hm2qq3uyrpVxN1+mQ/IBz068V84+w
	 q4j5wJCpcL/VOfRK/6fiuAcKZoMAW1TG5aLevQOdM+1bR7WibcU07bDs9CfXlbDAM8Z/J
	 Ak2lt2c9W7tXguolAfWznMDCQN1pDA0UHXi0XyN+iUu50gbZiSxk1sETriE+UCef4ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g16WEPmL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C3260A261C;
	Thu, 12 Nov 2026 14:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g16WEPmL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495D01F00A05;
	Thu, 12 Nov 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492229;
	bh=m4qjcb8gdZJwkaxEoXzAOBIqfyt8ugrUmG3Eiv5qTnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g16WEPmLJh2qfr1y0FgQLLw3UDj+I8Xs57kLoCCMeud5BUl5MzWwBLwMzXZO3Dtrt
	 Kp5UWBp/duCls8fuuCh011u2HBXX6esYppxVKEt45L9eStIrRL7Rf0kpHTZeGEy/iS
	 SEy/JvO10r/qLQ6VvxOVNHjIpPMj2ttl+zR1zpykqEVjD0fo43ybVmC7fkRT/aS1pY
	 Au9dRXTw4Fexd+5rBiWz4zo7cHPOIqACnpdMVOYCeoZDxThBgHobl2L+9BbT1xNqgd
	 ZFaM/tUt6BBetfGfopq1EOkI9MPfHfLeUeWn3lXZsGwBkc0NyM0j+fVAyItEUiL4Qg
	 UOT4O6qRePA4A==
Date: Thu, 12 Nov 2026 19:33:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Aiden Isik <aidenisik@protonmail.com>
Cc: aidenisik@member.fsf.org, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: exynos5-usbdrd: Add support for the Exynos5515
 usbdrd phy
Message-ID: <avXHP-GPIRXqFkEv@parshuram>
References: <20261022-for-next-lucky7-usb-phy-v1-0-2e47f8484bf4@member.fsf.org>
 <20261022-for-next-lucky7-usb-phy-v1-2-2e47f8484bf4@member.fsf.org>
 <avWeJqbpbLcWgq_R@parshuram>
 <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Dhrinh2IqyBByHLyFp_SHX9igTjQgKk4G62C1vp6tHdO8QkM4kiFDLaExxnZeljVMXJ8YksFrLRDRT9voAj6LiJYqPvrUg3nFVNFzi7C9Bc=@protonmail.com>

On 12-11-26, 12:53, Aiden Isik wrote:
> Hi Vinod,
> 
> > .n_phy_cfg does not exist.. Please fix this
> 
> As stated in the cover letter, this is introduced by dependency [1]:
> 
> > This patchset also depends on [1], due to using an
> > exynos5_usbdrd_phy_drvdata member > (.n_phy_cfg) which was introduced to fix
> > an out-of-bounds access bug.
> 
> > [1] - https://lore.kernel.org/all/20261020063559.3530901-1-selvarasu.g@samsung.com/
> 
> Which has since been merged by yourself. I assume you just
> looked at these patches in a different order so saw mine first?

Yep, picked now

-- 
~Vinod
