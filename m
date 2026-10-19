Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A9F491B2F;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420894; cv=none; b=HFhOGtgETGEbV4WkpK4V5UAxBfmrAqzLS9i0aZ+PWKG4tcsGVLcMkrLOP+4zp/HICr/V2QbzrDHt7/aHoUWgeI7zpU60GOzxjIrQwbnlP+GzB+cpBqWE+moePMsNGao/CbDT27qYRWRtHcnR+za7gVMyajKDQxWkrI86+aPNFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420894; c=relaxed/simple;
	bh=6kpynfd1XwdzrYVYTdeaXZTq3IwSFC6OGWqTXpdz3k8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cM6rMZhnyhvljzZhQjz4pb75G2Fr1eDdblVTWFGWkXCkaV5VGDZdb19iT4xNTeOYkpuDaxLkqXl3VTaB47KEdUt4QSezaDmLe/h2qcB4W42OotF7L7D8hocPjCrNTqtIu7qacrgidElcE4iD93qTeeRnpkYU5FrHerOlHphy30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJE0Q9G7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJE0Q9G7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF0F8C2BCF4;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792420893;
	bh=6kpynfd1XwdzrYVYTdeaXZTq3IwSFC6OGWqTXpdz3k8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WJE0Q9G7w0hMWGQMzJxsiKROTcEEHWRcgf4S66ndzj1SeF5AM5VIxFCCUMNzJ9EFy
	 NP+uyr/JBoI8yHHY21K76GcCUjI2gYIBU3DmNRjmcKPTXp8FtlVVlIbXSXaRXhPvs6
	 18IEK9Xr3OHzn6iGJsbRE/J1nPfb2BW6ySWbShiKu4habCh2q7169xIeP6ILN+HmZd
	 GKbrINwag3FBWe0+05NzRtUB7QZaFAL8tWtVDKwvYobSVYaImtNZrzDyXpQJqfqGw9
	 th+CHQsXwkW6H3XJ39Uvy2J544P9fHGrduS1OO3Mvqmfd1h51K/4kCb5T2tU0ozA75
	 ETiXGI9aeCjBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD694CCF2DE;
	Mon, 19 Oct 2026 14:41:33 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/3] Introduce Exynos5515 pinctrl support
Date: Mon, 19 Oct 2026 15:41:29 +0100
Message-Id: <20261019-for-next-lucky7-pinctrl-v1-0-0f77e94c70bc@member.fsf.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABks1moC/yXMQQqDMBBA0avIrB0wwVj1KuKixkk7VaJMYrGId
 29sl2/x/wGBhClAmx0g9ObAi09QeQb2efcPQh6TQRe6UoVq0C2CnvaI82anzw1X9jbKjFU5OFO
 aum60gVSvQo7337nr/w7b8CIbrx2c5xcZmt0LewAAAA==
X-Change-ID: 20261019-for-next-lucky7-pinctrl-64bf54588925
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=6kpynfd1XwdzrYVYTdeaXZTq3IwSFC6OGWqTXpdz3k8=;
 b=owEBiQJ2/ZANAwAIAUknAbLEetfrAcsmYgBq1iwavoG8bk1Ptimk9zQV0SQe2ytajaJBH/G2P
 ibOACjdA/uJAk8EAAEIADkWIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCatYsGhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQSScBssR61+th1w//Ro7tCNpouTquWY0eo4khNMPeKlmjBWX
 djR4Lt+9Dn8nepSQFtyeoVeBJ0kAjaLVllt11cXsPGXGBrJx0UAGorrlLiAKv1bkNtE0gJqQch4
 StnVw/3eGkjKyWKJy+LW3UgaRwV8xJdVt27559IR/mlPYzZRfE6BElnM5fEyrGIrTECGHstNsL7
 Cs2PVzUqdtDuhFdLvLICJcXLV6CHXMd3JC67yb4POh28LXxs5cfhFe13ILHTh4NKVg7Kh71kZe5
 I4Wzqm6u0RzgEEZjcv0w9vSoPVLbp6st05ywdTW1XtLNHpUSNwF3EEScUV3eLjipEN7dY5GwM7x
 LEiAV4aLFX2r7s2oSfOrpO0cwztGE4c56tCs+pXmbzFkRsHMb3dztSY9flHd3K++3KMwUy8ypl6
 3jEzMLyygJJqxSIA1r88GUyXccavN98fW3rsz9XZnZxLF6jmamsOula2mc3vxcm8BxHLaS6xzXc
 P7y4utUQYbsgJ7VpfVEQiMgJxTeK9UmC0mUd6lHpSKppGd3XZpqDrbcoJSQwHyiJv1jgW9CFgwq
 u4KwJsl8Mh9KdQHrfPFQQJFH7txOKN7QLqpGy1UGf5FKRAR5NchpyWl4Rr37qE0GJu4veBTwBUY
 MRV+CZxH5BDYCYZFSV8RzXiKoUKEXQ8TrcMgPeegQhJ8BQIkQaFM=
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
Reply-To: aidenisik@member.fsf.org

Hi there,

This patchset introduces pinctrl support for the Exynos5515 SoC.

It is very similar to the other Exynos SoCs, therefore we reuse the driver
and for the most part the pinctrl bank macros. A couple
Exynos5515-specific macros are also added.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Aiden Isik (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos5515
      dt-bindings: pinctrl: samsung: add exynos5515-wakeup-eint compatible
      pinctrl: samsung: Add Exynos5515 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 123 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  20 ++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 148 insertions(+)
---
base-commit: 993e1bec85faedf90c5d27480793084e54357c09
change-id: 20261019-for-next-lucky7-pinctrl-64bf54588925

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>


