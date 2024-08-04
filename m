Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AE213C66A;
	Sun,  4 Aug 2024 17:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722793930; cv=none; b=RxIuqCkLm579Y7FOFWkObrE0rSQhv+TD0/YRH076DjIERPbqhIFZFsaRHliiH0HZLSzBZQ8f2se2JxDSXqRuQ926WCKPy8R48k2nd62+HQ++YnIiIOa+SsUrUXoG6JkUpz1LG5Xi836uXSSeFK+0gDsBJY8lc1omGzkWuZYAIGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722793930; c=relaxed/simple;
	bh=Us0lXeHWzyR7k9ugOLi0cBmrKAZznLPVB/DSKGK+xlY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lI7lF3G3V5Fr7WifgDtg+rSl06jOOv1TV6SuIU+DqqZl305BVZOXhl2yTc0USyfS90+1yFX16mMlXGJnlqB3MH11u7Zd15AGbnDi9z6ioCDmePtQaI2FNcuAGqVBt42hUsxdZRwk8uRdkiKR40Y3uMfuMY4UfZiamLc0/Bftj5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjKSPxcJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjKSPxcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F001C4AF1D;
	Sun,  4 Aug 2024 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722793930;
	bh=Us0lXeHWzyR7k9ugOLi0cBmrKAZznLPVB/DSKGK+xlY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GjKSPxcJCs71o677BS6gX5usbzQ4C6Bu4IuTBO0snjW3uFuCli48wzWShb2eAfm+x
	 pjMW4mZSdyZWJGszs5blrOcGJXXzFbFT82tFH1hg2OHlq4igguH10oiQBwOa5TivXo
	 E1sF6IM0Athg3VoSNpvvZibf/us0Mt4t87zT2QB3/CSTHDjP+vFC3jJh8VGEAQuN6M
	 5yrHib9uPrZ0j7CtENPTl5r4CltEb3hCnmbomhlCalOIMlgHEizTygXcUqx15mLNJk
	 eNSyhbywwKaHYy8g1tmZ+A7WuaoIHhi1smPVP6xY6MqYuQji/7+d4wbWlMgofXRX4E
	 frstCGG0HyonA==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
References: <a956a3e2-c6ce-4f07-ad80-ec8a96e00d16@stanley.mountain>
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix error code in probe()
Message-Id: <172279392602.406224.4966447752583319349.b4-ty@kernel.org>
Date: Sun, 04 Aug 2024 23:22:06 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 08 Jul 2024 12:04:33 -0500, Dan Carpenter wrote:
> Return negative -ENOMEM instead of positive ENOMEM.
> 
> 

Applied, thanks!

[1/1] phy: exynos5-usbdrd: fix error code in probe()
      commit: 3a07703a523045cbdb0a5fa5e0902a9145ee43e9

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

