Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7E730E0EF;
	Thu, 26 Feb 2026 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140447; cv=none; b=SB3vSm3ItfSGW5pKt5JRgJ6Iiz+8J5w1XTbY84gLKeq0PGNondoOTbOAxjlcJq8y8IwRGPxl9XbNMQVFIoR0VXw4bGbKgbj1DnmiJY7Nz2QssEzmZ9pNXqp74GDE+KaDU2ynLb+sYz0gjG8vOKCVUc/W+FwcLpsWdMS2pjId/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140447; c=relaxed/simple;
	bh=p+nQrqubGpHurZZtPn/aeXXk5EP9EA2Ye/VBiS7O1B4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HiSLlvW5uYx6VksiAmplWXGliOIJ7izInxDqd45lOdShJlI7noWCYwjpVYaiT5SHJ19tMc7yCMaZlCt7CyLqf58vfEjg/rZx941BQgToCcc52Hvox4pVr0MjR/OAh1DhF2wjDpYC0/qMqcyCkjHg8YZcoBTGPUVrvAiIkgCSbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiBoyLAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiBoyLAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD30DC116C6;
	Thu, 26 Feb 2026 21:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140447;
	bh=p+nQrqubGpHurZZtPn/aeXXk5EP9EA2Ye/VBiS7O1B4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IiBoyLAJL/7A6Efk4sZ/y12JwNyLCShAKaVtiZgkMf5gBJ9vWuKVuTXsS1ZF5xvi3
	 saumJkI6E4CstJQiu+gEeOw6DA3YiXHUfXui3fKuX9qi6iG7yt3Z/S1poo0bJXrnXs
	 /LaBC2rWj+xdMrHKVBLbfV6ZNU5UzjSOAAWSPX+OHPhlB7Z1glEkEMDEaaaRJNA2Gc
	 2b4J8Q1FdICKtea8990pQk4OwfojD0OKO+ol0uWLUNKR9z3ImwrsX3ZCFwc8Wv0klx
	 xWd8BaTPqd4p/JqwtQN/WfvMw7wbcqlYsDGSQYOZNIwy3pdGD1tMFWXK56TmKAt+5l
	 ln+Ch/diVv5eg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Lukas Timmermann <linux@timmermann.space>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20260127-lat3st-staging-v4-3-797469aaaf9d@timmermann.space>
References: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
 <20260127-lat3st-staging-v4-3-797469aaaf9d@timmermann.space>
Subject: Re: (subset) [PATCH v4 3/3] ARM: samsung: exynos5250: Allow CPU1
 to boot
Message-Id: <177214044450.341643.10542668846868518849.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 22:14:04 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 27 Jan 2026 21:40:58 +0100, Lukas Timmermann wrote:
> The firmware trustzone needs a special call to bring up the secondary
> cpu core on the Manta board. This seems to be not needed on other
> exynos5 boards and comes down to the available firmware on
> a particular board.
> 
> 

Applied, thanks!

[3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
      https://git.kernel.org/krzk/linux/c/32d4b991f25eeffac7568ef51367f924394fbdc5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

