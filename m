Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E337396B6B;
	Thu, 26 Feb 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095587; cv=none; b=vDdCullSVdwlBMKkIIzoPNcRVG10pir5o+bRbJng0OTpZZRaQml9fBrKybQIX6660n3lhPaltRobyjr3K7ds/21DOFdilaucdPfqs4fc7jwyRwMmveMG2p8at7JOg1Dhxqicxkx8TdWWdzrjuQY11CvUvAO8tI9f8eHUyJRssbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095587; c=relaxed/simple;
	bh=vT4YZ8d8+umMLaENQR7603vntqtl8mUCTTz31FhwWJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vE14J69MyxS4kMUBW3qQeUq2BcXUgSRKQQ6KQ9u3PIX687pEmUwkk1bY6IaZDAOORxjblp9kAT1TEVpg4PtrhVlJYyjVHqGAnsKVxhRxrT9MOeyCGKXDiCCzO0HEVwm4GE3V5DU7j5D+mcWuruX3ZMGKCq/3xpX2TU3YcwsoR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN9LZrH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN9LZrH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D389AC19424;
	Thu, 26 Feb 2026 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095586;
	bh=vT4YZ8d8+umMLaENQR7603vntqtl8mUCTTz31FhwWJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZN9LZrH5lNH+uZ05yLMfBjmrU3hV9lzIb/FdgWw2O9GZ+LDzrW05X5X63TcOrLhGP
	 7NKKxnZ1yxM4OVCZL48FnubLVyTtvfyr+zGaKir1vvZZtn+v5oQqyqzcSWPKjVmP0y
	 w2sMZA4twrqW/NHFJ9B4SLaLYQtM08leZyTlGFLc44JLRNIrRuMN3gOiNjNSmgeTbO
	 ogySlpxvm62c9pmWBZhOI1AAbu0bm/48eXiMhjXN3zPIld5hnUdK4iNumlhO14TwBO
	 aWV3GUBWHeeWH7bpVVMwUoe+r7AI32aoEDCRhHUs7Q6aU1VM/uVSAqwXYBZ7n047Mk
	 lSMBWkunqaNwg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
References: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: harmonise symbol names (clock
 arrays)
Message-Id: <177209558359.28320.7275620505231772879.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:46:23 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3


On Thu, 05 Feb 2026 22:01:57 +0000, André Draszik wrote:
> Most symbols for the clock descriptions (arrays) don't have a cmu_
> prefix and all symbols have a _clks suffix where appropriate.
> 
> Update the few outliers to also fall into this same scheme for
> consistency.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: harmonise symbol names (clock arrays)
      https://git.kernel.org/krzk/linux/c/cdd94147fd72974eb1d118b1ba3b79e8df0ea716

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

