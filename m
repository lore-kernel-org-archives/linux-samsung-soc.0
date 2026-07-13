Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D95369208;
	Mon, 13 Jul 2026 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927267; cv=none; b=J026giuZV8ag1XjyasCJiRFtZu+E8rIWGdWYbGcfuidntBePkHWbRWIlX9Q6H4GEfj99xPhqn+7FG6a5qZHUL3NJxfvfZAN2hFNqiWxxJJFBizueaNfHULwQvUbuwaVSajnW++AR9Vakj0lICscutPW57ELJVoyUw56nYlNd8g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927267; c=relaxed/simple;
	bh=bh+yWpaolJOY4sNtQpKR1RIVMCXF1XcI2rvHN1xdAFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F0S6+6rwao0cX2WAngDMw/21WYDF4AxvWH8FxtxRisKxusSIchO0ECNnSLYCJ5vQ0bItCZukJD6mC5QKLxS0NftVFYao9BJOcPaLKY+jgClf46Du81MJ6JxqPCND0M/osXenkggkEEeUA4qoELISV+O8/tafNBZYhrIUuwT+Yyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDUzqBkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDUzqBkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DFA1F00A3A;
	Mon, 13 Jul 2026 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783927265;
	bh=9kh43brSP66vzmTm95XDdhXt8cQARCKIA1zAbg8pOVM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WDUzqBkrtCpK6dx62PadWwp7PdY5wC7lf0VjbjmJK4tvqJx75MzyAy0mZqQOcOjdI
	 aCn7dPFajLxErrr+E9spI5pjB4T8pE8nNrqjP0c/Bwv4Ky3f37mhUu/rikPQ6tzWKM
	 WDU0JAU4t4AJSzjSGFEm/y5uekRIs5mwyGhPQFqUivv1ED97uD8VaJeRlZzTR6/mv3
	 yFy2oBa9iB/ufr+aGIplCjWMumy6f1qHDS7EySrxExjixdVCABjq0+Y/OOc2pmkfXQ
	 mazTF43ahrtGVU5DJA3YnNii5uCWbgi8ZhrcRchZY/HUqXbpzq04atSsniG9pkl6oi
	 q7VTkZyLPCX+g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 linusw@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 hajun.sung@samsung.com
In-Reply-To: <20260627171228.2687857-1-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH v3 0/6] Add minimal Exynos8855 SoC support
Message-Id: <178392726162.27536.18104050175290327938.b4-ty@b4>
Date: Mon, 13 Jul 2026 09:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 27 Jun 2026 22:42:22 +0530, Alim Akhtar wrote:
> This series adds initial support for the Exynos8855 SoC and also
> initial SMDK board support.
> 
> Exynos8855 is octa-core CPUs, a combination of Cortex-A720 and Cortex-A520,
> arranged in 3 clusters. And other peripheral for mobile application.
> 
> This initial support consists of CPUs, pinctrl and related nodes
> needed for initial kernel boot.
> 
> [...]

Applied, thanks!

[1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
      https://git.kernel.org/krzk/linux/c/4b4a2ce19af5badef165c109d0d6d9f7c102914a
[5/6] arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk
      https://git.kernel.org/krzk/linux/c/f03058d3768c3ec4af0fab7a36d0631423cb3cf5
[6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
      https://git.kernel.org/krzk/linux/c/a87d503a0ab077b0d9892290ab7dbec29f922eb1

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

