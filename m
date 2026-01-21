Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA3D31B83B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jan 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034119; cv=none; b=e47KgSt10tK2sXX1d69oBSW1IhCwkSCw3gF+p4fRFhRFMrxavFWv8MHCzDbBjfHSilCo9a8ICKrTrtJBrowaFFZUdIjWn42svh6GLeuASbjyEwvEPqbbCrH4njOY1EypasZ9bG8SBF+CgrmEaUX20dHxuLao/Jx66ggMQ6bTyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034119; c=relaxed/simple;
	bh=F06bzrwrKY1rSDEzs1cPBYIVqqftHmJQ7diTsid8rvM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=b/tCGam3ofq9jjNW9ArQBO2z6bINyvmPMudIJiMxqLNt+4Q4DTUB19AZMZCyvK1xoR/seAoNfvJZ8VNyIM7r8AB3e3VBWZ4u9MwrYxUTIZyH++dTG53eSXTxtTuO9O3OvhFiIqz5vJxmQCp2NrN6L+JgMS2kxJNIXpubTBTwTt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yx5Nsfz3; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yx5Nsfz3"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b70c92f404so531346eec.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jan 2026 14:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769034116; x=1769638916; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rtnDcpt83urSnEkoGJAnSaHfcKiF5w4G5JkFsSE44zM=;
        b=yx5Nsfz3uhebEUGVAp5UzUQzsrCJb9jh92avK6R46qiQTnw78KjGC8inAXgYO2wsu2
         Eoi4sZL9DyRF0odkGKoctsMW0emBkAATbFE37GkdaTZylOSsI8Fde9hXDCqmuYCmdC74
         uqQRX10L7i3CRzNVowQxDLTFz2P1O4y5fYCikBEct6iQxH9RB1esLCUkTm6zE3nOYkxb
         il8MhoNVIDYLrg+hoZ92anjiOr5ZGYW1HrA25nsQNl1R1qVzthSru4mLfcR4oAvNtsgq
         zReXP3ktPMZgT8XqVacHHTl4CHHBRvsQ0b/wM5tTYf9GvdteYYyINGBOocqqQLLia2qv
         rGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769034116; x=1769638916;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtnDcpt83urSnEkoGJAnSaHfcKiF5w4G5JkFsSE44zM=;
        b=oRni4w9QadIT0WyQ64R5c5XZy5U++w3T/CsJUQ02mnrd2dLXrfOa6zo7DxfQHI+ijR
         yy9+wr6JxiIjc6QWxvMghFF2IudeGbXYos2IMogIiUxSQ8bY0v9FOo4D20puhshua8ni
         ZXrfFFzFF1TsQJ6pCmFOr2EcFBJMPtxqjtVlSM6jWTzh3m9IIcboe9xnh3q3DF3AqPmU
         qcKdUGTxAb8dL/6GH3Yqj3l+R1+EVVgaQ8Yz3g0HvJNkfwWDiwyW8lY+qsPDa8s8AzDb
         YCOoN7snuJhalzEsRW5cRZPlCnoqX3zgMphG3e62GJsd3k00+5TPFxq4N7N0QGD9nbqn
         WsqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjMj/mRcfdyWa1DLB1UfJYmSUrVhC/RIUexArXEqx+f26BocmBL0i2Pfv/TWRrn4eBvZNRd0NeaiIoi39usLia1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1HBnkdsho9PVOFeEPzVcelpGzmMCV25qHPd1ubgkg7s5hS4W
	cHmiF3vVNwPh2H0S81SUjs3xN1HEs3sDtjZVvoIy9f87iXo4R1fSx/nu9oJLjPtO7rrbLzflhrU
	hzbbkvQ==
X-Received: from dycoz10.prod.google.com ([2002:a05:7301:fc8a:b0:2b7:2358:5b16])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:df4c:b0:2ae:5db9:f32c
 with SMTP id 5a478bee46e88-2b6b40f34cdmr12582763eec.26.1769034116342; Wed, 21
 Jan 2026 14:21:56 -0800 (PST)
Date: Wed, 21 Jan 2026 22:21:34 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG1RcWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3bzUihLdJEsTS0MLy+TE5DQTJaDSgqLUtMwKsDHRSiAVSrG1tQA 37UCWXAAAAA==
X-Change-Id: 20260121-next-b949189cacf4
X-Developer-Key: i=royluo@google.com; a=ed25519; pk=nTq1n8WcJActRWe1s8jdcy+TzpTK4a+IYRCIWvQfq5k=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769034114; l=1355;
 i=royluo@google.com; s=20251120; h=from:subject:message-id;
 bh=F06bzrwrKY1rSDEzs1cPBYIVqqftHmJQ7diTsid8rvM=; b=ikH3G/1gJWuSsn1ES9rUIQWPKBJIvgAS08dh4f0vn+tdcYO2Ps2/dtYWDFK1qXN2Ng1NP+g2A
 lSWhYVr/JBqDxzvA7x7Zn6t/4BJ2IcCcEcaorPdQyviKCwvn2CnJeai
X-Mailer: b4 0.14.2
Message-ID: <20260121-next-v1-1-c18068b091b9@google.com>
Subject: [PATCH next] phy: google: fix build dependency for Google Tensor USB PHY
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?utf-8?q?Andr=C3=A9_Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="utf-8"

The Google Tensor USB PHY driver uses the Type-C switch framework to
handle orientation changes. However, the Kconfig did not specify a
dependency on the TYPEC framework, leading to undefined reference
errors when building for architectures or configurations where
CONFIG_TYPEC is disabled or configured as a module.

Add 'depends on TYPEC' to the PHY_GOOGLE_USB entry to ensure all
required symbols are available during linking.

Fixes: cbce66669c82 ("phy: Add Google Tensor SoC USB PHY driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601210825.ELrpQeED-lkp@intel.com/
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 142e7b0ef2efb9209781800ee47b820a91b115ae..5531ff31d8156cb164c32e3e52d4a57b26a62d8d 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -49,6 +49,7 @@ config GENERIC_PHY_MIPI_DPHY
 
 config PHY_GOOGLE_USB
 	tristate "Google Tensor SoC USB PHY driver"
+	depends on TYPEC
 	select GENERIC_PHY
 	help
 	  Enable support for the USB PHY on Google Tensor SoCs, starting with

---
base-commit: 8bb92fd7a04077925c8330f46a6ab44c80ca59f4
change-id: 20260121-next-b949189cacf4

Best regards,
-- 
Roy Luo <royluo@google.com>

