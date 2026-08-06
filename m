Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1C3FE644;
	Thu,  6 Aug 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005486; cv=none; b=oLVDK+7mC6EBYzc72pLeDTft0+gnjMODFutP2FDh5Z6NsILjGJNiXFuHq3tjXYLMTAo4+hY6BFygwCvNLtv/dY2V8Y7DRXOa/u9cATXEPUQj0zSrebU+UbyIfrwlWH+hc1R56r0SZg9Qrv2QMk+om0yE2xbzxFf9IkdKdbRJ6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005486; c=relaxed/simple;
	bh=GSj2xjCNpU7RFp2n8qMzzLXG0wroYNW/RtrARjI/Fbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DLHsylx10oAT7yyv+7Ic44+voOBD9HUhDh+NPQnbn+sJ2/q+h1ujz9Gg93TgzSHuRkWOz6tpa9ZZjiUEURWpG0DXRQoUVGb8NrRKkQzRPaMvb1frNLghVWJ9whmnx10gFNsaDhPkqvfD+KhDtg1A4dbdCOc5frekfh2yaBfD3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HP/OxrQA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HP/OxrQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE1F1F000E9;
	Thu,  6 Aug 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005466;
	bh=xETcnXPG1rHGxnguRdsMvGynwcAnDPqDrOB2wbseaJg=;
	h=From:To:Cc:Subject:Date;
	b=HP/OxrQAalykCntp4r+1KruZvR3p6C6WhqGSUgH3taZeREm3f93a2hq5camHOcegb
	 db/opMZqVDWsOYduQUBHSg92ziRpc5QmJr1YwMgYe5d9VmPLRz5jlTLjyIyOkdYA0G
	 5KFfAdgcVBFByq6waiW88e3ClBT7TA23YOuMiGmz4AbreXMd/uClP5vDrnhYPJnJF/
	 bVK5nIq99cor8ZjvB2dcCP0K7IBp3Ld8vbw8UfGqwJYoRqq1Cx3Nf5/xT6sTQeyaJ2
	 M/3oZjIs+l1/qbYIQ1wwTxdo6jFLvVWBErSuyFmWeti0luJyWSQqMc1aZlv2PUfa68
	 lmXMFTfcYR6gw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: for v7.3 (second try)
Date: Thu,  6 Aug 2026 10:37:28 +0200
Message-ID: <20260806083728.351824-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=krzk@kernel.org; h=from:subject; bh=GSj2xjCNpU7RFp2n8qMzzLXG0wroYNW/RtrARjI/Fbc=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEfIxNEq366S5fS6pXcmoVMDK2gJknTAZtHKQ VJM4YZ00RWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRHyAAKCRDBN2bmhouD 18JsD/9c07VASvHRN2HNf4ywD3BnbucQmSS2Y4UvlUstOicR2scLW7oWTC8544MiC6nPd8bLp4v fL5w6+GwIfIwYROV3Xsy/rXPD6HbZfoiVB+yjgJIqWzPIvq6OAttmUjE17R2eq0YYLH/0+8ytRC 3OmJXzHXAmedTuuHhPufObIskewRhVjw4yTHwsaLCE/E1BCMoeqeD/Rh2USE7szne2+NqrzqQt6 99YZAj/bvVQX+nuDh2W7X1qHtoKjv8N6dOGG12mWgBkEd99OG9QxDGfcuVK82fbJ7O5aPgfi38k wL6mAOuCtGpLgFrwMsWMNSECmTsg7EddqvzE5Alnqr2LJKaQVWmLu0zv0Gb0YMIl7nfDZV7Z0ib Y+bWrE2hq3yNWw4NjspY5TF0C3A3KL+y//mpCZxjTzWnez6UnGNBJLR/YZeD8HoeFSU1rwCuZxf A3WczXYzL/nhAZMVNMZFAa0q1sUMvHvdSedz6r9fa9HlEmyNPISxXqTT/BCNnAOPJ33ZmMMlmV9 k7npJJencS2G2InJC5dx+NCpJu/H+0xoW6wZAfts7BXsJYk0xw2YNYnYf8u6aXeJgxysIgVUOBq O8HpfZmiQWYVSvIOOUKuSPhO0xEGyTbMMh0OUdAXLjqfy5LDGxbRPtpAVk3tZmwbk3ldFBBbDl6 4wecwnxt4g/e81w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Linus,

Second try - in the previous I had still the old email:
https://lore.kernel.org/all/20260806082831.350285-2-krzk@kernel.org/
Same contents.

Best regards,
Krzysztof


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-7.3

for you to fetch changes up to d441836c9d704d0f3db5dbf44df87af2ba7a9d26:

  pinctrl: samsung: Add Exynos8855 pinctrl configuration (2026-07-13 09:17:05 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v7.3

Add drivers for newly introduced Samsung Exynos8855 SoC.

----------------------------------------------------------------
Alim Akhtar (3):
      dt-bindings: pinctrl: samsung: Add exynos8855-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos8855-wakeup-eint compatible
      pinctrl: samsung: Add Exynos8855 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 132 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 137 insertions(+)
