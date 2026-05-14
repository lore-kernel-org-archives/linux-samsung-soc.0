Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8A33033EC;
	Thu, 14 May 2026 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778777803; cv=none; b=NW6EW0l/1rzI+tCRTSa+zkzS4gsZE24tv17ORQzq/9wWf/TLEkykdCqx0+p7E2yo2+TPqQ84ocHpVISUFJxv41qIiCugnk8jDOxsL8Bw4zxc/M/82KBQGV9JCtORqJUSNtc8HiuPLteFJ8EPTTPMMHMCMjLH/g/iRPVdLhGXwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778777803; c=relaxed/simple;
	bh=fSw4doSddlVNTevBJY2Hme6/meXiI88IXww216rP9AA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Nqwq+dQuBNHXR32hQv0oAbGXvI1GhG0SsjpG88usXxLBDfiSorZQBEMyFLbcPLF4hDl/U/97M4JcOxY9GSlT8Ni9ktTc77XzeuFcT0CRAytrnb/gBEn7rbhkl1tz1qfdIbP5xz1opbZwnEWnUsZ8/QN81BadWAQuO6sSp3pNEzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKEXOEAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKEXOEAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53813C2BCC7;
	Thu, 14 May 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777803;
	bh=fSw4doSddlVNTevBJY2Hme6/meXiI88IXww216rP9AA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mKEXOEAVd0XsGZMtYiUuGw+z7G6v61Vbn5COBkyEvJf8FrwxvstQH9kW7NTKrxZOa
	 79waAB0kAXD+I5ylohsNSZDPivs0oNbh7vvAw2X85fVq7SyUiNTVOtcse8ruchnrYH
	 A6UANcHPJ9iUrGZI4JgOSY7isaK1at9WtyaTr5iCKzw7wEeRBDVrBgmt76ixqpZiYt
	 G5LYlvNsjwm18vlHy9BlWsrCcXsMy5i+mbWiErhgwETZ68AKY7BAZBB6or0CJLeqp/
	 v6fuM+BC4I5um8vQV4aM9riOyWxpQOedu9RldQiel+8Dw9e1q6Sacxm+2h9OGXDkh2
	 5w74XcuB6BzKw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: andre.draszik@linaro.org, tudor.ambarus@linaro.org, 
 alim.akhtar@samsung.com, semen.protsenko@linaro.org, wllee@google.com, 
 hsuanting@google.com, marscheng@google.com, jserv@ccns.ncku.edu.tw, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 visitorckw@google.com, Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
References: <20260505171457.1960837-1-visitorckw@gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in
 peric0_clk_regs
Message-Id: <177877779906.167822.16215877297807645211.b4-ty@b4>
Date: Thu, 14 May 2026 18:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 05 May 2026 17:14:57 +0000, Kuan-Wei Chiu wrote:
> In the peric0_clk_regs array, the divider register offset for USI6 was
> accidentally listed twice, while the divider for USI7 was omitted.
> 
> Missing this DIV register causes the USI7 clock divider setting to be
> lost and reset to its hardware default value during a suspend/resume
> cycle.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
      https://git.kernel.org/krzk/linux/c/78ee734b36284d82454e87a92094fdb926985b47

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

